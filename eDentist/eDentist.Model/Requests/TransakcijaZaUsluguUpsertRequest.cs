namespace eDentist.Model.Requests
{
    public class TransakcijaZaUsluguUpsertRequest
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
