namespace eDentist.Model.Requests
{
    public class TransactionUpsertRequest
    {
        public int? OrderHeaderId { get; set; }
       
        public double? Amount { get; set; }

        public string? TransactionStatus { get; set; }

        public string? TransId { get; set; }

        public int? UserId { get; set; }

        public DateTime? Datum { get; set; }
    }
}
