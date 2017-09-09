using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shoes.Areas.Admin.Models;
using System.IO;
using PagedList;
using System.Collections.Generic;
using System;
using System.Linq.Dynamic;

namespace Shoes.Controllers
{
    public class StoreController : Controller
    {
        private SHOESEntities db = new SHOESEntities();
        // GET: Store
        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult Index(int? category, string description, int? page, string orderby, string asc)
        {
            var products = db.Products.Include(p => p.Category);

            if (category != null)
                products = products.Where(p => p.category_id == category);
            if (!string.IsNullOrWhiteSpace(description))
            {
                try
                {
                    products = products.Where(p => p.description.Contains(description));
                }
                catch (Exception)
                {
                }
            }


            //Tao Selectlist tu Dictionnary<string,string>
            Dictionary<string, string> fieldList = new Dictionary<string, string>(StringComparer.InvariantCultureIgnoreCase)
            {
                {"id","Id" },
                {"description","Description" },
                {"discount","Discount" },
                {"price*(100-discount)/100","Price" },
                {"Category.name","Category" }
            };
            ViewBag.orderby = new SelectList(fieldList, "Key", "Value", orderby);

            //Sap thu tu
            orderby = string.IsNullOrWhiteSpace(orderby) ? "id" : orderby;
            ViewBag.asc = asc = string.IsNullOrWhiteSpace(asc) ? "asc" : asc;

            //install System.Linq.Dynamic
            if (!string.IsNullOrWhiteSpace(orderby))
                products = products.OrderBy(string.Format("{0} {1}", orderby, asc));

            ViewBag.category = new SelectList(db.Categories, "id", "name", category);
            ViewBag.description = description;

            int pageSize = 12;//Kich thuoc trang
            int pageNumber = (page ?? 1);//(page==null)?1:page;
            return View(products.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Home()
        {
            ViewBag.Listcategory = db.Categories.ToList();
            ViewBag.Listproduct = db.Products.ToList();
            return View();
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
        public ActionResult Dosizegiay()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Muahang()
        {
            return View();
        }
        public ActionResult Charge()
        {
            return View();
        }
    }
}
