using eDentist.Model;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Interfaces
{
    public interface IUsersService:IBaseCrudService<UserModel,UsersSearchObject,UsersInsertRequest,UserUpdateRequest>
    {
        //List<UserModel> Get();
        //UsersInsertRequest Insert(UsersInsertRequest r);
        public Task<UserModel> Login(string username, string password);
    }
}
