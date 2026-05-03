using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
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
    public class OrderHeaderService : BaseCrudService<OrderHeaderModel, OrderHeader, BaseSearchObject, OrderHeaderInsertRequest, OrderHeaderUpdateRequest>, IOrderHeaderService
    {

        public OrderHeaderService(EDentistDbContext c, IMapper mapper) : base(c, mapper) { }
    }
}
