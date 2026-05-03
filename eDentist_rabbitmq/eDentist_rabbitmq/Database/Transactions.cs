using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Database
{
    public class Transactions
    {
        [Key]
        public int TranskcijaId { get; set; }

        [ForeignKey("OrderHeaderId")]
        public int? OrderHeaderId { get; set; }
        public OrderHeader? OrderHeader { get; set; }

        public double? Amount { get; set; }

        public string? TransactionStatus { get; set; }

        public string? TransId { get; set; }
    }
}
