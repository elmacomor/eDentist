using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Database
{
    public class Roles
    {

        [Key] public int RoleID { get; set; }
      public string RoleName { get; set; }

    }
}
