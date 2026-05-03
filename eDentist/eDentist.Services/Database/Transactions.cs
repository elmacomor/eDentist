using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

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

        [ForeignKey("UserId")]
        public User? User { get; set; }
        public int? UserId { get; set; }

        public DateTime? Datum { get; set; }
    }
}
