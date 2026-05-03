using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class AppointmentsController : BaseCrudController<AppointmentModel, BaseSearchObject, AppointmentInsertRequest, AppointmentUpdateRequest>
    {

        public AppointmentsController(IAppointmentsService service, ILogger<BaseController<AppointmentModel, BaseSearchObject>> logger) : base(logger, service)
        { }
    }
}
