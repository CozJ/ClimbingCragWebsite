using System;
using System.Collections.Generic;

#nullable disable

namespace ClimbingCragWebsite.Models
{
    public partial class Crag
    {
        public Crag()
        {
            Routes = new HashSet<Route>();
        }

        public int CragId { get; set; }
        public string CragName { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }
        public string CragDescription { get; set; }
        public int ImageId { get; set; }
        public string Country { get; set; }
        public string Region { get; set; }
        public string County { get; set; }
        public DateTime? DateAdded { get; set; }

        public virtual Image Image { get; set; }
        public virtual ICollection<Route> Routes { get; set; }
    }
}
