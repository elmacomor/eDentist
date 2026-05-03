using AutoMapper;
using eDentist.Model.Models;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.ProizvodiStateMachine
{
    public class ActiveProductState : BaseState
    {
        public ActiveProductState(IServiceProvider serviceProvider, EDentistDbContext context, IMapper mapper) : base(serviceProvider, context, mapper)
        {
        }

        public override async Task<ProductModel> Hide(int id)
        {
            var table = _context.Set<Product>();
            Product entity = await table.FindAsync(id);
            entity.StateMachine = "draft";
            await _context.SaveChangesAsync();
            return _mapper.Map<ProductModel>(entity);
        }
        public override async Task<List<string>> AllowedActions()
        {
            var list = await base.AllowedActions();

            list.Add("Hide");
            return list;
        }

    }
}
