using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model;
using eDentist.Services.Database;

namespace eDentist_rabbitmq.Helpers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserModel>();
            CreateMap<Roles, RolesModel>();
        }
    }
}
