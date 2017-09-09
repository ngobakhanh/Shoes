//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Shoes.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public int id { get; set; }
        public DateTime date { get; set; }
        public string status { get; set; }
        public int customer_id { get; set; }
        public int employee_id { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Employee Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual double TotalAmount
        {
            get
            {
                return OrderDetails.Sum(orderDetail => orderDetail.Amount);
            }
        }
        public virtual SelectList StatusSelectList
        {
            get
            {
                return new SelectList(new List<string> { "new", "confirmed", "packaged", "delivered", "paid", "canceled" }, status);
            }
        }
    }
}