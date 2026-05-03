namespace eDentist.Model.Requests
{
    public class AppointmentUpdateRequest
    {
        public int AppointmentID { get; set; }
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        public string Vrijeme { get; set; }
        public bool TerminZatvoren { get; set; }
        public int? UserIdDentist { get; set; }
    }
}
