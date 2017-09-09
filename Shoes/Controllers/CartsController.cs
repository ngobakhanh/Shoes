using Microsoft.AspNet.Identity;
using Shoes.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shoes.Controllers
{
    public class CartsController : Controller
    {
        private SHOESEntities db = new SHOESEntities();
        // GET: Carts
        public ActionResult Index()
        {
            return View(Cart.Items);
        }
        public ActionResult Delete(int id)
        {
            Cart.Remove(id);
            //return RedirectToAction("Index");
            return Json(new { Status = "OK", TotalAmount = Cart.TotalAmount.ToString("C0"), TotalItems = Cart.CountItem }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(int id, int quantity)
        {
            //return RedirectToAction("Index");
            Cart.Update(id, quantity);
            return Json(new { Status = "OK", Amount = Cart.List[id].Amount.ToString("C0"), TotalAmount = Cart.TotalAmount.ToString("C0"), TotalItems = Cart.CountItem }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Empty()
        {
            Cart.Empty();
            return RedirectToAction("Index", "Store");

        }
        public ActionResult Add(int id, int quantity)
        {
            try
            {
                if (Cart.List.ContainsKey(id))
                {
                    Cart.List[id].Quantity += quantity;
                    //return RedirectToAction("Index");
                    return Json(new { Status = "OK", Amount = Cart.List[id].Amount.ToString("C0"), TotalAmount = Cart.TotalAmount.ToString("C0"), TotalItems = Cart.CountItem }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    Product p = db.Products.Find(id);
                    Item item = new Item
                    {
                        Image = p.image,
                        ID = p.id,
                        Description = p.description,
                        Category = p.Category.name,
                        Discount = p.discount,
                        Price = p.price,
                        Quantity = quantity
                    };
                    Cart.Add(item);
                    return Json(new { Status = "OK", TotalAmount = Cart.TotalAmount.ToString("C0") }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {
                return Json(new { Status = "ER", Message = "Error processing your request. Please try again!" }, JsonRequestBehavior.AllowGet);
            }
        }
        [Authorize(Roles = "customer")]
        public ActionResult CheckOut()
        {
            Order order = null;
            SHOESEntities db = new SHOESEntities();
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    string user_id = User.Identity.GetUserId();
                    Customer customer = db.Customers.Where(c => c.user_id == user_id).First();
                    Employee employee = db.Employees.Find(1);
                    order = new Order
                    {
                        date = DateTime.Now,
                        status = "New",
                        Customer = customer,
                        Employee = employee
                    };
                    db.Orders.Add(order);
                    IList<Item> items = Cart.Items;
                    foreach (var item in items)
                    {
                        Product product = db.Products.Find(item.ID);
                        OrderDetail orderdetail = new OrderDetail
                        {
                            order_id = order.id,
                            Product = product,
                            quantity = item.Quantity,
                            price = item.Price,
                            discount = item.Discount
                        };
                        db.OrderDetails.Add(orderdetail);
                    }
                    db.SaveChanges();
                    Cart.Empty();
                    tran.Commit();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
            return View(order);
        }
    }
}