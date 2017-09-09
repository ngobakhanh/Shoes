using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shoes.Areas.Admin.Models;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using Shoes.Models;
using Microsoft.AspNet.Identity;

namespace Shoes.Controllers
{
    public class CustomerController : Controller
    {
        private SHOESEntities db = new SHOESEntities();

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: Customer
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]//tranh hacker xam nhap
        public async Task<ActionResult> Register(CustomerRegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    //Luu thong tin dang ky vao table customer
                    Customer cus = new Customer
                    {
                        name = model.Name,
                        address = model.Address,
                        phone = model.Phone,
                        email = model.Email,
                        user_id = user.Id
                    };
                    db.Customers.Add(cus);
                    db.SaveChanges();
                    //gan vai tro customer cho user vua dang ky
                    await UserManager.AddToRoleAsync(user.Id, "customer");
                    //Login
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    //Redict về Homepage
                    return RedirectToAction("Index", "Store");
                }
                AddErrors(result);
            }
            return View(model);
        }
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
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