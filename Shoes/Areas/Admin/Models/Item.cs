using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shoes.Areas.Admin.Models
{
    public class Item
    {
        public string Image { get; set; }
        public int ID { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double Discount { get; set; }
        public double NewPrice
        {
            get
            {
                return (Price * (100 - Discount)) / 100;
            }
        }
        public double Amount
        {
            get
            {
                return Quantity * NewPrice;
            }
        }
    }
}