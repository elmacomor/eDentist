using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Models
{
    public class FavoriteModel
    {
        public int FavoriteId { get; set; }

        public int? UserId { get; set; }

        public int? ProductId { get; set; }
    }
}
