using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using eDentist.Services.ProizvodiStateMachine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public class ProductService : BaseCrudService<ProductModel,Product,ProductSearchObject,ProductInsertRequest,ProductUpdateRequest>,IProductService
    {
        public BaseState _baseState { get; set; }   
        public ProductService(BaseState baseState,EDentistDbContext context,IMapper mapper) : base(context,mapper) {
        _baseState= baseState;
        }

        public override Task<ProductModel> Insert(ProductInsertRequest obj)
        {
            var state = _baseState.CreateState("initial");
            return state.Insert(obj);
        }
       
        public override async Task<ProductModel> Update(ProductUpdateRequest obj, int id)
        {
            var entity = await _context.Products.FindAsync(id);
            var state = _baseState.CreateState(entity.StateMachine);
            return await state.Update(id,obj);
        }
        public async Task<ProductModel> Activate(int id)
        {
            var entity = await _context.Products.FindAsync(id);

            var state = _baseState.CreateState(entity.StateMachine);

            return await state.Activate(id);
        }
        public async Task<ProductModel> Hide(int id)
        {
            var entity = await _context.Products.FindAsync(id);

            var state = _baseState.CreateState(entity.StateMachine);

            return await state.Hide(id);
        }

        public async Task<List<string>> AllowedActions(int id)
        {
            var entity = await _context.Products.FindAsync(id);
            var state = _baseState.CreateState(entity?.StateMachine);
            return await state.AllowedActions();
        }

        public override IQueryable<Database.Product> AddFilter(IQueryable<Database.Product> query, ProductSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.FTS))
            {
                filteredQuery = filteredQuery.Where(x => x.ProductName.Contains(search.FTS));
            }

            return filteredQuery;
        }
    }
}
