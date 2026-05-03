using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class AppointmentModel
    {
        public int AppointmentID { get; set; }
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        public string Vrijeme { get; set; }
        public bool TerminZatvoren { get; set; }
        public int? UserIdDentist { get; set; }
    }
}
