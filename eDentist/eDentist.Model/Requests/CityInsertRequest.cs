using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class CityInsertRequest
    {
        public string? CityName { get; set; }
        public int? CountryId { get; set; }
        public string? ZipCode { get; set; }
    }
}
