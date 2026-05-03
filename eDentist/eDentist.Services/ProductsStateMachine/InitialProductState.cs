using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.ProizvodiStateMachine
{
    public class InitialProductState:BaseState
    {
        public InitialProductState(IServiceProvider serviceProvider, EDentistDbContext context, IMapper mapper) : base(serviceProvider, context, mapper)
        {
        }

        public override async Task<ProductModel> Insert(ProductInsertRequest request)
        {
            //TODO: EF CALL
            var set = _context.Set<Product>();

            var entity = _mapper.Map<Product>(request);

            entity.StateMachine = "draft";

            set.Add(entity);

            await _context.SaveChangesAsync();
            return _mapper.Map<ProductModel>(entity);
            
        }

        public override async Task<List<string>> AllowedActions()
        {
            var list = await base.AllowedActions();

            list.Add("Insert");

            return list;
        }

    }
}
