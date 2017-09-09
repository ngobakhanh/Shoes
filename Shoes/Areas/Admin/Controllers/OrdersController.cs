using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shoes.Areas.Admin.Models;

namespace Shoes.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {
        private SHOESEntities db = new SHOESEntities();

        // GET: Admin/Orders
        // GET: Orders
        public ActionResult Index(string filter)
        {
            ViewBag.filter = new SelectList(new List<string> { "new", "confirmed", "packaged", "delivered", "paid", "canceled" }, filter);
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.Employee);
            if (!string.IsNullOrWhiteSpace(filter))
            {
                orders = orders.Where(o => o.status == filter);
            }
            return View(orders.ToList());
        }
        public ActionResult Task(int id, string status, string filter, string op)
        {
            switch (op)
            {
                case "Update":
                    return RedirectToAction("Update", new { id, status, filter });
                case "Details":
                    return RedirectToAction("Details", new { id });
            }
            return Content("Please check your action!");
        }

        // GET: Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }
        public ActionResult Update(int id, string status, string filter)
        {
            Order order = db.Orders.Find(id);
            order.status = status;
            db.SaveChanges();
            return RedirectToAction("Index", new { filter });
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
