using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class OrderHeaderController:BaseCrudController<OrderHeaderModel, BaseSearchObject, OrderHeaderInsertRequest, OrderHeaderUpdateRequest>
    {

        public OrderHeaderController(IOrderHeaderService service, ILogger<BaseController<OrderHeaderModel, BaseSearchObject>> logger) : base(logger, service)
        { }
    }

}
