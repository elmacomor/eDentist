using AutoMapper;
using eDentist.Model;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public class UsersService : BaseCrudService<UserModel,User,UsersSearchObject,UsersInsertRequest,UserUpdateRequest>,IUsersService
    {
       

        public UsersService(EDentistDbContext c, IMapper mapper):base(c,mapper)
        {
        }

        //public List<UserModel> Get()
        //{
        //    var data = _context.Users.ToList();

        //    return _mapper.Map<List<UserModel>>(data);
        //}
        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);


            return Convert.ToBase64String(byteArray);
        }
        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }
        public override async Task BeforeInsert(User entity, UsersInsertRequest insert)
        {
            entity.PasswordSalt = GenerateSalt();
            entity.PasswordHash = GenerateHash(entity.PasswordSalt, insert.Password);
        }

        public override IQueryable<User> AddInclude(IQueryable<User> query, UsersSearchObject? search=null)
        {
            if (search.isUlogeIncluded == true)
            {
                query = query.Include("UserRoles.Role");
            }
            return base.AddInclude(query, search);
        }

        public async Task<UserModel> Login(string username, string password)
        {
            var entity = await _context.Users.Include(u => u.Role).FirstOrDefaultAsync(x => x.Username == username);

            if (entity == null)
            {
                return null;
            }

            var hash = GenerateHash(entity.PasswordSalt, password);

            if (hash != entity.PasswordHash)
            {
                return null;
            }

            return _mapper.Map<UserModel>(entity);
        }

    }
}
