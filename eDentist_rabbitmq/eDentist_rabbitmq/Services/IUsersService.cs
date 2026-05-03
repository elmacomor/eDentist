using eDentist.Model;
using eDentist.Model.Requests;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Interfaces
{
    public interface IUsersService
    {
        public Task<UserModel> Login(string username, string password);
    }
}
