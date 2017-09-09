using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shoes.Areas.Admin.Models;
using PagedList;
using System.IO;

namespace Shoes.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private SHOESEntities db = new SHOESEntities();

        // GET: Admin/Products
        //public ActionResult Index()
        //{
        //    var product = db.Product.Include(p => p.Category).OrderBy(p => p.id);
        //    return View(product.ToList());
        //}
        public ActionResult Index(int? page, string description)
        {
            var product = db.Products.Include(p => p.Category);
            if (!string.IsNullOrWhiteSpace(description))
                product = product.Where(p => p.description.Contains(description)).OrderBy(p=>p.id);
            else
                product = db.Products.Include(p => p.Category).OrderBy(p => p.id);

            ViewBag.description = description;
            int pageSize = 10;//Kich thuoc trang
            int pageNumber = (page ?? 1);//(page==null)?1:page;
            return View(product.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Products/Details/5
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

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.category_id = new SelectList(db.Categories, "id", "name");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,description,price,discount,category_id,image,sort_id,status")] Product product, ImageProduct imageproduct, IEnumerable<HttpPostedFileBase> files)
        {
            string images = "";
            if (ModelState.IsValid)
            {
                foreach (var file in files)
                {
                    if (file.ContentLength >= 0)
                    {
                        images += file.FileName + ",";
                    }
                }
                product.date = DateTime.Now;
                product.image = images.Split(',')[0];
                imageproduct.product_id = product.id;
                imageproduct.image = images.Substring(0, images.Length - 1);
                db.ImageProducts.Add(imageproduct);
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,description,price,discount,category_id,image,sort_id,status")] Product product, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                if (file != null && file.ContentLength > 0)
                {
                    string path = Path.Combine(Server.MapPath("~/Content/Images/"), product.image);
                    file.SaveAs(path);
                }
                return RedirectToAction("Index");
            }
            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            product.Status = "Disable";
            //db.Product.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
