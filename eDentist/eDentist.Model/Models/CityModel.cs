using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class CityModel
    {
        public int CityId { get; set; }

        public string? CityName { get; set; }
        public string? ZipCode { get; set; }

        public int? CountryId { get; set; }
    }
}
