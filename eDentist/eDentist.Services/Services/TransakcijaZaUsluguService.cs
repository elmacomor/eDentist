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

namespace eDentist.Services.Services
{
    public class TransakcijaZaUsluguService : BaseCrudService<TransakcijaZaUsluguModel, TransakcijaZaUslugu, Model.SearchObjects.BaseSearchObject, TransakcijaZaUsluguUpsertRequest, TransakcijaZaUsluguUpsertRequest>, ITransakcijaZaUsluguService
    {
        public TransakcijaZaUsluguService(EDentistDbContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
