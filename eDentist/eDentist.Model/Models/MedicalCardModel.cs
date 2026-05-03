namespace eDentist.Model.Models
{
    public class MedicalCardModel
    {
        public int MedicalCardId { get; set; }

        public int? UserId { get; set; }

        public int? DentalServiceId { get; set; }
        public DateTime datumDijagnoze { get; set; }
        public string? DoctorsOppinion { get; set; }
    }
}
