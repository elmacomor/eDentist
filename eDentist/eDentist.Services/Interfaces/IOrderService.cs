using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Interfaces
{
    public interface IOrderService:IBaseCrudService<OrderModel,BaseSearchObject,OrderInsertRequest,OrderUpdateRequest>
    {
    }
}
