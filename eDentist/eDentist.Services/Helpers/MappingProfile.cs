using AutoMapper;
using eDentist.Model;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Helpers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //CreateMap<User, Models.UserModel>();
            CreateMap<User, UserModel>();
            CreateMap<City, CityModel>();
            CreateMap<CityInsertRequest, City>();
            CreateMap<Country, CountryModel>();
            CreateMap<CountryInsertRequest, Country>();
            CreateMap<Roles, RolesModel>();
            CreateMap<CountryUpdateRequest, Country>();
            CreateMap<CityUpdateRequest, City>();
            CreateMap<ProductInsertRequest, Product>();
            CreateMap<ProductUpdateRequest, Product>();
            CreateMap<Product, ProductModel>();
            CreateMap<ProductType, ProductTypeModel>();
            CreateMap<ProductTypeInsertRequest, ProductType>();
            CreateMap<ProductTypeUpdateRequest, ProductType>();
            //CreateMap<ProductUpdateRequest, Product>().ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
            CreateMap<UsersInsertRequest, User>();
            CreateMap<UserUpdateRequest, User>();
            CreateMap<DentalService, DentalServiceModel>();
            CreateMap<DentalServiceInsertRequest,DentalService>();
            CreateMap<DentalServiceUpdateRequest, DentalService>();
            CreateMap<MedicalCard, MedicalCardModel>();
            CreateMap<MedicalCardInsertRequest, MedicalCard>();
            CreateMap<MedicalCardUpdateRequest, MedicalCard>();
            CreateMap<Appointment, AppointmentModel>();
            CreateMap<AppointmentInsertRequest, Appointment>();
            CreateMap<AppointmentUpdateRequest, Appointment>();
            CreateMap<Order, OrderModel>();
            CreateMap<OrderInsertRequest, Order>();
            CreateMap<OrderUpdateRequest, Order>();
            CreateMap<OrderHeader, OrderHeaderModel>();
            CreateMap<OrderHeaderInsertRequest, OrderHeader>();
            CreateMap<OrderHeaderUpdateRequest, OrderHeader>();
            CreateMap<Favorite, FavoriteModel>();
            CreateMap<FavoriteInsertRequest, Favorite>();
            CreateMap<FavoriteUpdateRequest, Favorite>();
            CreateMap<Database.RecommendResult, RecommendResultModel>();
            CreateMap<Model.Requests.RecommendResultUpsertRequest, Database.RecommendResult>();
            CreateMap<Transactions, TransactionModel>();
            CreateMap<TransactionUpsertRequest,Transactions>();
            CreateMap<BlogPost, BlogPostModel>();
            CreateMap<BlogPostUpsertRequest, BlogPost>();
            CreateMap<TransakcijaZaUslugu, TransakcijaZaUsluguModel>();
            CreateMap<TransakcijaZaUsluguUpsertRequest, TransakcijaZaUslugu>();
            CreateMap<Comment,CommentModel>();
            CreateMap<CommentUpsertRequest,Comment>();
        }
    }
}
