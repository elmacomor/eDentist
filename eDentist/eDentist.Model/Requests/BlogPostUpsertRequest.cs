using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;  

namespace eDentist.Model.Requests
{
    public class BlogPostUpsertRequest
    {
        public string Headline { get; set; }
        public string Content { get; set; }
        public byte[]? Slika { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
