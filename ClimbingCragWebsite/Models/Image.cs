using System;
using System.Collections.Generic;

#nullable disable

namespace ClimbingCragWebsite.Models
{
    public partial class Image
    {
        public Image()
        {
            Crags = new HashSet<Crag>();
            Routes = new HashSet<Route>();
        }

        public int ImageId { get; set; }
        public string ImageDescription { get; set; }
        public string ImageUrl { get; set; }

        public virtual ICollection<Crag> Crags { get; set; }
        public virtual ICollection<Route> Routes { get; set; }
    }
}
