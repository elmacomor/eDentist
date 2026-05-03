using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class BlogPostModel
    {
        public int BlogId { get; set; }
        public string Headline { get; set; }
        public string Content { get; set; }
        public byte[]? Slika { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
