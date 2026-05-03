using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Database
{
    public class Appointment
    {
        [Key]
        public int AppointmentID { get; set; }
        [ForeignKey("UserId")]
        public User User { get; set; }
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        public string Vrijeme { get; set; }
        public bool TerminZatvoren { get; set; }

        [ForeignKey("UserIdDentist")]
        public User? UserDentist { get; set; }
        public int? UserIdDentist { get; set; }

    }
}
