using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.ProizvodiStateMachine
{
    public class BaseState
    {
        protected EDentistDbContext _context;
        protected IMapper _mapper { get; set; }
        protected IServiceProvider _serviceProvider;
        public BaseState(IServiceProvider serviceProvider,EDentistDbContext context,IMapper mapper)
        {
            _serviceProvider = serviceProvider;
            _context = context;
            _mapper = mapper;
        }

        public virtual Task<ProductModel> Insert(ProductInsertRequest request)
        {
            throw new UserException("Not allowed");
        }

        public virtual Task<ProductModel> Update(int id, ProductUpdateRequest request)
        {
            throw new UserException("Not allowed");
        }

        public virtual Task<ProductModel> Activate(int id)
        {
            throw new UserException("Not allowed");
        }

        public virtual Task<ProductModel> Hide(int id)
        {
            throw new UserException("Not allowed");
        }

        public virtual Task<ProductModel> Delete(int id)
        {
            throw new UserException("Not allowed");
        }


        public BaseState CreateState(string stateName)
        {
            
            switch (stateName)
            {
                case "initial":
                case null:
                    return _serviceProvider.GetService<InitialProductState>();
                    break;
                case "draft":
                    return _serviceProvider.GetService<DraftProductState>();
                    break;
                case "active":
                    return _serviceProvider.GetService<ActiveProductState>();
                    break;

                default:
                    throw new UserException("Not allowed");
            }
        }

        public virtual async Task<List<string>> AllowedActions()
        {
            return new List<string>();
        }
    }
}
