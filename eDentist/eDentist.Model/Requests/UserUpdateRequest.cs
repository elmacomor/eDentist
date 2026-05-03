using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class UserUpdateRequest
    {

        public string? Name { get; set; }

        public string? Surname { get; set; }
        public int RoleID { get; set; }
        public byte[]? Slika { get; set; }

        public string? Email { get; set; }

        public string? Username { get; set; }

        public string? Adress { get; set; }

    }
}
