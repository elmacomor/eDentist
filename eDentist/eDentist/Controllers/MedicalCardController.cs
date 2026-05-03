using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class MedicalCardController : BaseCrudController<MedicalCardModel, BaseSearchObject, MedicalCardInsertRequest, MedicalCardUpdateRequest>
    {

        public MedicalCardController(IMedicalCardService service, ILogger<BaseController<MedicalCardModel, BaseSearchObject>> logger) : base(logger, service)
        { }
    }
}
