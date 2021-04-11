using ClimbingCragWebsite.Models;
using ClimbingCragWebsite.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
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
    public class RouteController : Controller
    {
        private readonly ukcdbContext _ukcdbContext;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly UserManager<AppIdentityUser> _userManager;

        public RouteController(ukcdbContext ukcdbContext, IWebHostEnvironment env, UserManager<AppIdentityUser> userManager)
        {
            _ukcdbContext = ukcdbContext;
            _webHostEnvironment = env;
            _userManager = userManager;
        }

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

            var routes = from r in _ukcdbContext.Routes.Include(i => i.Image).Include(c => c.Crag) select r;

            if (!String.IsNullOrEmpty(searchString))
            {
                routes = routes.Where(c => c.RouteName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    routes = routes.OrderByDescending(r => r.RouteName);
                    break;
                case "Date":
                    routes = routes.OrderBy(r => r.DateAdded);
                    break;
                case "date_desc":
                    routes = routes.OrderByDescending(r => r.DateAdded);
                    break;
                default:
                    routes = routes.OrderBy(r => r.RouteName);
                    break;
            }
            int pageSize = 5;
            return View(await PaginatedList<Route>.CreateAsync(routes.AsNoTracking(), pageNumber ?? 1, pageSize));
        }

        public async Task<IActionResult> RouteDetails(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Route route = await _ukcdbContext.Routes.FindAsync(id);

            var routeImage = _ukcdbContext.Images.Where(i => i.ImageId == route.ImageId).FirstOrDefault<Image>();
            ViewData["routeImage"] = routeImage;

            if (route == null)
            {
                return NotFound();
            }
            return View(route);
        }

        [Authorize(Roles = "Admin")]
        public IActionResult NewRoute()
        {
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> NewRoute(RouteImage routeImage)
        {
            if (ModelState.IsValid)
            {

                Image newImage = new Image
                {
                    ImageId = routeImage.Image.ImageId,
                    ImageUrl = routeImage.Image.imageFile.FileName,
                    ImageDescription = routeImage.Image.ImageDescription,
                    imageFile = routeImage.Image.imageFile,
                };

                saveImage(newImage);
                _ukcdbContext.Add(newImage);
                await _ukcdbContext.SaveChangesAsync();

                Route newRoute = new Route
                {
                    RouteId = routeImage.Route.RouteId,
                    CragId = routeImage.Route.CragId,
                    RouteName = routeImage.Route.RouteName,
                    RouteGrade = routeImage.Route.RouteGrade,
                    RouteHeight = routeImage.Route.RouteHeight,
                    RouteDescription = routeImage.Route.RouteDescription,
                    RoutePitches = routeImage.Route.RoutePitches,
                    ImageId = newImage.ImageId,
                    DateAdded = DateTime.UtcNow,
                };
                _ukcdbContext.Add(newRoute);
                await _ukcdbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View(routeImage);
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ModifyRoute(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var route = await _ukcdbContext.Routes.FindAsync(id);

            if (route == null)
            {
                return NotFound();
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", route.ImageId);
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View(route);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ModifyRoute(int id, Route route)
        {
            if (id != route.RouteId)
            {
                return NotFound();
            }


            if (ModelState.IsValid)
            {
                try
                {
                    _ukcdbContext.Update(route);
                    await _ukcdbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RouteExists(route.RouteId))
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
            ViewData["ImageId"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", route.ImageId);
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View(route);
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteRoute(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var route = await _ukcdbContext.Routes.FindAsync(id);

            if (route == null)
            {
                return NotFound();
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription", route.ImageId);
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View(route);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public IActionResult ConfirmDeleteRoute(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            else
            {
                Route route = _ukcdbContext.Routes.Find(id);
                Image image = _ukcdbContext.Images.Find(route.ImageId);
                deleteImage(image);
                _ukcdbContext.Routes.Remove(route);
                _ukcdbContext.Images.Remove(image);
                _ukcdbContext.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        [Authorize]
        public IActionResult FavouriteRoute(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Route route = _ukcdbContext.Routes.Find(id);
            var UserID = _userManager.GetUserId(User);

            if (route == null)
            {
                return NotFound();
            }

            var favourite = (from f in _ukcdbContext.Favourites where (f.UserId == UserID && f.RouteId == route.RouteId) select f).FirstOrDefault();

            if (favourite == null)
            {
                ViewData["followStatus"] = false;
            }
            else
            {
                ViewData["followStatus"] = true;
            }
            return View(route);
        }

        [HttpPost]
        [Authorize]
        public IActionResult FavouriteRoute(int? id, bool followStatus)
        {
            if (id == null)
            {
                return NotFound();
            }

            Route route = _ukcdbContext.Routes.Find(id);
            var UserID = _userManager.GetUserId(User);

            if (route == null || UserID == null)
            {
                return NotFound();
            }

            if (followStatus == false)
            {
                _ukcdbContext.Favourites.Add(new Favourite { RouteId = route.RouteId, UserId = UserID });
                _ukcdbContext.SaveChanges();
            }
            if (followStatus == true)
            {
                var favourite = (from f in _ukcdbContext.Favourites where (f.UserId == UserID && f.RouteId == route.RouteId) select f).FirstOrDefault();
                _ukcdbContext.Favourites.Remove(favourite);
                _ukcdbContext.SaveChanges();
            }


            return RedirectToAction("Index");
        }

        private bool RouteExists(int id)
        {
            return _ukcdbContext.Routes.Any(e => e.RouteId == id);
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
