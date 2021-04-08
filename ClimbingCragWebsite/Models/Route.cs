using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ClimbingCragWebsite.Models
{
    public partial class Route
    {
        public int RouteId { get; set; }
        public int CragId { get; set; }
        public string RouteName { get; set; }
        public string RouteGrade { get; set; }
        public int RouteHeight { get; set; }
        public string RouteDescription { get; set; }
        public int? RoutePitches { get; set; }
        public int? ImageId { get; set; }
        public DateTime DateAdded { get; set; }

        public virtual Crag Crag { get; set; }
        public virtual Image Image { get; set; }
    }
}
