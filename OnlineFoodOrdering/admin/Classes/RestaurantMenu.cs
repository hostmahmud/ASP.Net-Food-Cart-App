using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineFoodOrdering.admin.Classes
{
    public class RestaurantMenu
    {
        public int Id { get; set; }
        public int RestaurantId { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string ShortDesc { get; set; }
        public string Image { get; set; }

    }
}