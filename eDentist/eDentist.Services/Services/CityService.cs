using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public class CityService : BaseCrudService<CityModel, City, CitySearch, CityInsertRequest, CityUpdateRequest>,ICityService
    {
      

        public CityService(EDentistDbContext c, IMapper mapper):base(c,mapper) { }


        public override IQueryable<City> AddFilter(IQueryable<City> query, CitySearch? search = null)
        {
            if (!string.IsNullOrWhiteSpace(search?.Name))
            {
                query = query.Where(x => x.CityName.StartsWith(search.Name));
            }
            if (!string.IsNullOrWhiteSpace(search?.Contains))
            {
                query = query.Where(x => x.CityName.Contains(search.Contains));
            }
            return base.AddFilter(query,search);
        }
    }
}
