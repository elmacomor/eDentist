using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class AppointmentInsertRequest
    {
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        public string Vrijeme { get; set; }
        public bool TerminZatvoren { get; set; }
        public int? UserIdDentist { get; set; }
    }
}
