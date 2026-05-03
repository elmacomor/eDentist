using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace eDentist.Services.Database
{
    public class TransakcijaZaUslugu
    {
        [Key]
        public int TranskcijaId { get; set; }

        [ForeignKey("DentalServiceId")]
        public int? DentalServiceId { get; set; }
        public DentalService? DentalService { get; set; }

        public double? Amount { get; set; }

        public string? TransactionStatus { get; set; }

        public string? TransId { get; set; }

        [ForeignKey("UserId")]
        public User? User { get; set; }
        public int? UserId { get; set; }

        public DateTime? Datum { get; set; }

        public string? SvrhaUplate { get; set; }
    }
}
