using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class ProductUpdateRequest
    {
        public string? ProductName { get; set; }
        public string? Barcode { get; set; }

        public string? ProductDescription { get; set; }

        public int? ProductPrice { get; set; }

        public int? ProductTypeId { get; set; }

        public byte[]? Slika { get; set; }
    }
}
