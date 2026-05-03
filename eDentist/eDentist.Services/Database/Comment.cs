using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eDentist.Services.Database
{
    public class Comment
    {
        [Key]
        public int CommentID { get; set; }
        [ForeignKey("UserId")]
        public User User { get; set; }
        public int UserId { get; set; }
        public DateTime Datum { get; set; }
        [ForeignKey("BlogId")]
        public BlogPost Blog { get; set; }
        public int BlogId { get; set; }

        public string Content { get; set; }
    }
}
