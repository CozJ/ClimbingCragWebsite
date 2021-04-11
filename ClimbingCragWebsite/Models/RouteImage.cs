using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ClimbingCragWebsite.Models
{
    public class RouteImage
    {
        [NotMapped]
        public Route Route { get; set; }
        [NotMapped]
        public Image Image { get; set; }
    }
}
