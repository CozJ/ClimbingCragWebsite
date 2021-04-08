using ClimbingCragWebsite.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClimbingCragWebsite.Controllers
{
    public class CragsController : Controller
    {

        private readonly ukcdbContext _ukcdbContext;

        public CragsController(ukcdbContext ukcdbContext)
        {
            _ukcdbContext = ukcdbContext;
        }

        public async Task<IActionResult> Index()
        {
            var ukcragdbContext = _ukcdbContext.Crags.Include(c => c.Image);

            return View(await ukcragdbContext.ToListAsync());
        }

        public async Task<IActionResult> Maps()
        {
            var ukcragdbContext = _ukcdbContext.Crags.Include(c => c.Image);

            return View(await ukcragdbContext.ToListAsync());
        }

        public IActionResult NewCrag()
        {
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> NewCrag(Crag crag)
        {
            if (ModelState.IsValid)
            {
                crag.DateAdded = DateTime.UtcNow;

                Crag newCrag = new Crag
                {
                    CragId = crag.CragId,
                    CragName = crag.CragName,
                    Longitude = crag.Longitude,
                    Latitude = crag.Latitude,
                    CragDescription = crag.CragDescription,
                    ImageId = crag.ImageId,
                    Country = crag.Country,
                    Region = crag.Region,
                    County = crag.County,
                    DateAdded = crag.DateAdded,
                };
                _ukcdbContext.Add(newCrag);
                await _ukcdbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", crag.ImageId);
            return View(crag);
        }

        [HttpGet]
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
            return View(crag);
        }

        [HttpPost]
        public IActionResult ConfirmDeleteCrag(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            else
            {
                Crag crag = _ukcdbContext.Crags.Find(id);
                _ukcdbContext.Crags.Remove(crag);
                _ukcdbContext.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        private bool CragExists(int id)
        {
            return _ukcdbContext.Crags.Any(e => e.CragId == id);
        }

    }
}
