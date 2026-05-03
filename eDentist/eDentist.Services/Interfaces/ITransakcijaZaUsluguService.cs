using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;

namespace eDentist.Services.Interfaces
{
    public interface ITransakcijaZaUsluguService : IBaseCrudService<TransakcijaZaUsluguModel, BaseSearchObject, TransakcijaZaUsluguUpsertRequest, TransakcijaZaUsluguUpsertRequest>
    {

    }
}
