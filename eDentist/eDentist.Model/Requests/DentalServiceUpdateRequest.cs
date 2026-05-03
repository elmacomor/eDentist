using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class DentalServiceUpdateRequest
    {

        public string? ServiceName { get; set; }

        public string? ServiceDescription { get; set; }

        public int? ServicePrice { get; set; }
    }
}
