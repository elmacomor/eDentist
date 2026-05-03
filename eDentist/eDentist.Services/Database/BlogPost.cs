using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Database
{
    public class BlogPost
    {
        [Key]
        public int BlogId { get; set; }
        public string Headline { get; set; }
        public string Content { get; set; }
        public byte[]? Slika { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
