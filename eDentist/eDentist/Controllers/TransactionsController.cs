using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class TransactionsController : BaseCrudController<TransactionModel, BaseSearchObject, TransactionUpsertRequest, TransactionUpsertRequest>
    {
        public TransactionsController(ILogger<BaseController<TransactionModel, BaseSearchObject>> logger, ITransactionService service)
            : base(logger, service)
        {
        }
    }
}
