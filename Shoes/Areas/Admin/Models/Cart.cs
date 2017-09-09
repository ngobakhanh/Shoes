using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shoes.Areas.Admin.Models
{
    public class Cart
    {
        //Chua danh sach cac san pham trong gio hang
        public static SortedList<int, Item> List
        {
            get
            {
                HttpSessionStateBase session = new HttpSessionStateWrapper(HttpContext.Current.Session);
                if (session["list"] == null)//Neu trong session chua co list thi se tao list
                    session["list"] = new SortedList<int, Item>();
                return session["list"] as SortedList<int, Item>;
            }
        }

        //Chua danh sach cac san pham
        public static IList<Item> Items
        {
            get
            {
                return List.Values;
            }
        }

        public static double TotalAmount
        {
            get
            {
                return List.Values.Sum(item => item.Amount);
            }
        }
        public static int CountItem
        {
            get
            {
                return List.Values.Sum(item => item.Quantity);
            }
        }
        public static void Add(Item item)
        {
            //Neu trong gio hang da co item thi chi tang so luong
            if (List.ContainsKey(item.ID))
            {
                Item currentItem = List[item.ID];
                currentItem.Quantity += item.Quantity;
            }
            else
            {
                List.Add(item.ID, item);
            }
        }
        public static void Empty()
        {
            List.Clear();
        }

        public static void Remove(int id)
        {
            List.Remove(id);
        }
        public static void Update(int id, int quantity)
        {
            Item item = List[id];

            if (item != null)
            {
                if (quantity <= 0) Remove(id);
                else
                    item.Quantity = quantity;
            }
        }
    }
  
}