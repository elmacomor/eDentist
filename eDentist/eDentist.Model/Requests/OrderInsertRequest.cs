using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class OrderInsertRequest
    {
        public int? OrderHeaderId { get; set; }

        public int? ProductId { get; set; }

        public int? Quantity { get; set; }

        

    }
}
