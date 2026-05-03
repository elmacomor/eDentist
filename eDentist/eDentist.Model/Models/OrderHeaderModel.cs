using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class OrderHeaderModel
    {
        public int OrderHeaderId { get; set; }

        public DateTime? OrderDate { get; set; }

        public int? UserId { get; set; }

        public int? TotalPrice { get; set; }
        public string? Status { get; set; }
    }
}
