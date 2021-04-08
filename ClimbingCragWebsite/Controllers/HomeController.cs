using ClimbingCragWebsite.Models;
using ClimbingCragWebsite.Security;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace ClimbingCragWebsite.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ukcdbContext _ukcdbContext;
        private readonly UserManager<AppIdentityUser> _userManager;

        public HomeController(ILogger<HomeController> logger, ukcdbContext ukcdbContext, UserManager<AppIdentityUser> userManager)
        {
            _logger = logger;
            _ukcdbContext = ukcdbContext;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                var UserID = _userManager.GetUserId(User);

                var userFavourites = from fav in _ukcdbContext.Favourites where fav.UserId == UserID select fav;

                List<Favourite> model = userFavourites.ToList();
                
                return View(model);
            }
            else
            {
                return View();
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
