using AutoMapper;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public class BaseCrudService<T, TDB, TSearch, Tinsert, Tupdate> : BaseService<T, TDB,TSearch> where T : class where TDB : class where TSearch : BaseSearchObject
    {
        

        public BaseCrudService(EDentistDbContext context, IMapper mapper):base(context,mapper)
        {
          
        }

        public virtual async Task BeforeInsert(TDB entity, Tinsert insert)
        {

        }
        public virtual async Task<T> Insert(Tinsert obj)
        {
            var table=_context.Set<TDB>();
            TDB entity = _mapper.Map<TDB>(obj);
            table.Add(entity);
            await BeforeInsert(entity, obj);

            await _context.SaveChangesAsync();
            return _mapper.Map<T>(entity);
        }

        public virtual async Task<T> Update(Tupdate obj,int id)
        {
            var table=_context.Set<TDB>();
            TDB entity = await table.FindAsync(id);
            _mapper.Map(obj, entity);
            await _context.SaveChangesAsync();
            return _mapper.Map<T>(entity);

        }

        public virtual async Task<T> Delete(int id)
        {
            var table = _context.Set<TDB>();
            TDB entity = await table.FindAsync(id);

            if (entity == null)
            {
                return null;
            }

            table.Remove(entity);
            await _context.SaveChangesAsync();

            return _mapper.Map<T>(entity);
        }

    }
}
