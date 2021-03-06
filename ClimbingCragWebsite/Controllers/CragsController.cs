using ClimbingCragWebsite.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ClimbingCragWebsite.Controllers
{
    public class CragsController : Controller
    {

        private readonly ukcdbContext _ukcdbContext;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public CragsController(ukcdbContext ukcdbContext, IWebHostEnvironment env)
        {
            _ukcdbContext = ukcdbContext;
            _webHostEnvironment = env;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index(string sortOrder, string searchString, string currentFilter, int? pageNumber)
        {
            ViewData["CurrentSort"] = sortOrder;
            ViewData["NameSortParam"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewData["DateSortParam"] = sortOrder == "Date" ? "date_desc" : "Date";

            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var crags = from c in _ukcdbContext.Crags.Include(c => c.Image) select c;

            if (!String.IsNullOrEmpty(searchString))
            {
                crags = crags.Where(c => c.CragName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    crags = crags.OrderByDescending(c => c.CragName);
                    break;
                case "Date":
                    crags = crags.OrderBy(c => c.DateAdded);
                    break;
                case "date_desc":
                    crags = crags.OrderByDescending(c => c.DateAdded);
                    break;
                default:
                    crags = crags.OrderBy(c => c.CragName);
                    break;
            }

            int pageSize = 5;
            return View(await PaginatedList<Crag>.CreateAsync(crags.AsNoTracking(), pageNumber ?? 1, pageSize));
        }

        [AllowAnonymous]
        public IActionResult Maps()
        {
            return View();
        }

        [AllowAnonymous]
        public JsonResult GetLocations()
        {
            List<Crag> crags = _ukcdbContext.Crags.ToList();
            return Json(crags);
        }

        [AllowAnonymous]
        public async Task<IActionResult> CragDetails(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var crag = await _ukcdbContext.Crags.FindAsync(id);

            if (crag == null)
            {
                return NotFound();
            }

            var cragImage = _ukcdbContext.Images.Where(i => i.ImageId == crag.ImageId).FirstOrDefault<Image>();
            var cragsRoutes = _ukcdbContext.Routes.Where(r => r.CragId == crag.CragId).Include(c => c.Image).ToList();
            ViewData["cragImage"] = cragImage;
            ViewData["cragRoutes"] = cragsRoutes;
            return View(crag);
        }

        [Authorize(Roles = "Admin")]
        public IActionResult NewCrag()
        {
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> NewCrag(CragImage cragImage)
        {
            if (ModelState.IsValid)
            {

                Image newImage = new Image
                {
                    ImageId = cragImage.Image.ImageId,
                    ImageUrl = cragImage.Image.imageFile.FileName,
                    ImageDescription = cragImage.Image.ImageDescription,
                    imageFile = cragImage.Image.imageFile,
                };

                saveImage(newImage);
                _ukcdbContext.Add(newImage);
                await _ukcdbContext.SaveChangesAsync();

                Crag newCrag = new Crag
                {
                    CragId = cragImage.Crag.CragId,
                    CragName = cragImage.Crag.CragName,
                    Longitude = cragImage.Crag.Longitude,
                    Latitude = cragImage.Crag.Latitude,
                    CragDescription = cragImage.Crag.CragDescription,
                    ImageId = newImage.ImageId,
                    Country = cragImage.Crag.Country,
                    Region = cragImage.Crag.Region,
                    County = cragImage.Crag.County,
                    DateAdded = DateTime.UtcNow,
            };

                _ukcdbContext.Add(newCrag);
                await _ukcdbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", cragImage.Crag.ImageId);
            return View(cragImage);
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ModifyCrag(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var crag = await _ukcdbContext.Crags.FindAsync(id);

            if (crag == null)
            {
                return NotFound();
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", crag.ImageId);
            return View(crag);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ModifyCrag(int id, Crag crag)
        {
            if (id != crag.CragId)
            {
                return NotFound();
            }


            if (ModelState.IsValid)
            {
                try
                {
                    _ukcdbContext.Update(crag);
                    await _ukcdbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CragExists(crag.CragId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            ViewData["ImageId"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", crag.ImageId);
            return View(crag);
        }


        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteCrag(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var crag = await _ukcdbContext.Crags.FindAsync(id);

            if (crag == null)
            {
                return NotFound();
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", crag.ImageId);
            var routes = _ukcdbContext.Routes.Where(c => c.CragId == crag.CragId).Count();
            if (routes == 0)
            {
                ViewData["Empty"] = true;
            }
            else
            {
                ViewData["Empty"] = false;
            }
            return View(crag);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public IActionResult ConfirmDeleteCrag(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            else
            {
                Crag crag = _ukcdbContext.Crags.Find(id);
                Image image = _ukcdbContext.Images.Find(crag.ImageId);
                _ukcdbContext.Crags.Remove(crag);
                _ukcdbContext.Images.Remove(image);
                _ukcdbContext.SaveChanges();
                deleteImage(image);
                return RedirectToAction("Index");
            }
        }

        private bool CragExists(int id)
        {
            return _ukcdbContext.Crags.Any(e => e.CragId == id);
        }

        private void saveImage(Image image)
        {
            if (image != null)
            {
                string filepath = Path.Combine(_webHostEnvironment.WebRootPath, "Images", image.imageFile.FileName);
                using (var filestream = new FileStream(filepath, FileMode.Create))
                {
                    image.imageFile.CopyTo(filestream);
                }
            }
        }

        private void deleteImage(Image image)
        {
            if (System.IO.File.Exists(Path.Combine(_webHostEnvironment.WebRootPath, "Images", image.ImageUrl)))
            {
                System.IO.File.Delete(Path.Combine(_webHostEnvironment.WebRootPath, "Images", image.ImageUrl));
            }
        }

    }
}
