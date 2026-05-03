using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class OrderController:BaseCrudController<OrderModel, BaseSearchObject, OrderInsertRequest, OrderUpdateRequest>
    {

        public OrderController(IOrderService service, ILogger<BaseController<OrderModel, BaseSearchObject>> logger) : base(logger, service)
          { }
    }
}
