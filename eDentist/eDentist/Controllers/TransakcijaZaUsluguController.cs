using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class TransakcijaZaUsluguController : BaseCrudController<TransakcijaZaUsluguModel, BaseSearchObject, TransakcijaZaUsluguUpsertRequest, TransakcijaZaUsluguUpsertRequest>
    {
        public TransakcijaZaUsluguController(ILogger<BaseController<TransakcijaZaUsluguModel, BaseSearchObject>> logger, ITransakcijaZaUsluguService service)
            : base(logger, service)
        {
        }
    }
}
