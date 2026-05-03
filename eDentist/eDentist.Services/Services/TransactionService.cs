using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eDentist.Services.Database;

namespace eDentist.Services.Services
{
    public class TransactionService : BaseCrudService<TransactionModel, Transactions, Model.SearchObjects.BaseSearchObject, TransactionUpsertRequest, TransactionUpsertRequest>, ITransactionService
    {
        public TransactionService(EDentistDbContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
