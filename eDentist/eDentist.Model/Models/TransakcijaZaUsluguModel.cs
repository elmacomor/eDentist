using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class TransakcijaZaUsluguModel
    {
        public int TranskcijaId { get; set; }

        public int? DentalServiceId { get; set; }

        public double? Amount { get; set; }

        public string? TransactionStatus { get; set; }

        public string? TransId { get; set; }
        public int? UserId { get; set; }

        public DateTime? Datum { get; set; }
        public string? SvrhaUplate { get; set; }
    }
}
