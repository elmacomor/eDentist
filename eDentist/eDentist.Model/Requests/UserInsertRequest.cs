using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.Requests
{
    public class UsersInsertRequest
    {

        public string? Name { get; set; }

        public string? Surname { get; set; }
        public int RoleID { get; set; }
        public string? Email { get; set; }

        public string? Username { get; set; }


        public byte[]? Slika { get; set; }
        [Compare("RepeatPassword", ErrorMessage = "Passwords do not match.")]
        public string? Password { get; set; }
        [Compare("Password", ErrorMessage = "Passwords do not match.")]
        public string? RepeatPassword { get; set; }

        public string? Adress { get; set; }

       

        public int? CityId { get; set; }
    }
}
