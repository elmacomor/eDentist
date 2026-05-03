using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class OrderModel
    {
        public int OrderId { get; set; }

        public int? OrderHeaderId { get; set; }

        public int? ProductId { get; set; }

       
        public int? Quantity { get; set; }

    }
}
