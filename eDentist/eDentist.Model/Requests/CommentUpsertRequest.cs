using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class CommentUpsertRequest
    {
        public int CommentID { get; set; }
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        public int BlogId { get; set; }
        public string Content { get; set; }
    }
}
