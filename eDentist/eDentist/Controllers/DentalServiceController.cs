using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class DentalServiceController: BaseCrudController<DentalServiceModel, BaseSearchObject, DentalServiceInsertRequest, DentalServiceUpdateRequest>
    {

        public DentalServiceController(IDentalService service, ILogger<BaseController<DentalServiceModel, BaseSearchObject>> logger) : base(logger, service)
        { }
}
}
