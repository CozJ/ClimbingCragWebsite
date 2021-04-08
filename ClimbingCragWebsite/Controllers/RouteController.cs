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
    public class RouteController : Controller
    {
        private readonly ukcdbContext _ukcdbContext;

        public RouteController(ukcdbContext ukcdbContext)
        {
            _ukcdbContext = ukcdbContext;
        }

        public async Task<IActionResult> Index()
        {
            var ukcragdbContext = _ukcdbContext.Routes.Include(r => r.Image).Include(c => c.Crag);
            return View(await ukcragdbContext.ToListAsync());
        }

        public IActionResult NewRoute()
        {
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> NewRoute(Route route)
        {
            if (ModelState.IsValid)
            {
                route.DateAdded = DateTime.UtcNow;

                Route newRoute = new Route
                {
                    RouteId = route.RouteId,
                    CragId = route.CragId,
                    RouteName = route.RouteName,
                    RouteGrade = route.RouteGrade,
                    RouteHeight = route.RouteHeight,
                    RouteDescription = route.RouteDescription,
                    RoutePitches = route.RoutePitches,
                    ImageId = route.ImageId,
                    DateAdded = route.DateAdded,
                };
                _ukcdbContext.Add(newRoute);
                await _ukcdbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Image"] = new SelectList(_ukcdbContext.Images, "ImageId", "ImageDescription");
            ViewData["Crag"] = new SelectList(_ukcdbContext.Crags, "CragId", "CragName");
            return View(route);
        }

    }
}
