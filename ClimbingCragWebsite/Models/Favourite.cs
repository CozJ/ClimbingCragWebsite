using System;
using System.Collections.Generic;

#nullable disable

namespace ClimbingCragWebsite.Models
{
    public partial class Favourite
    {
        public string UserId { get; set; }
        public int RouteId { get; set; }
        public int RelationId { get; set; }

        public virtual AspNetUser User { get; set; }
    }
}
