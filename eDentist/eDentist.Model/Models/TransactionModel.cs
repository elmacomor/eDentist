using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class TransactionModel
    {
        public int TranskcijaId { get; set; }

        public int? OrderHeaderId { get; set; }

        public double? Amount { get; set; }

        public string? TransactionStatus { get; set; }

        public string? TransId { get; set; }
        public int? UserId { get; set; }

        public DateTime? Datum { get; set; }
    }
}
