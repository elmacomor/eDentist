using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class FavoriteInsertRequest
    {
        public int? UserId { get; set; }

        public int? ProductId { get; set; }
    }
}
