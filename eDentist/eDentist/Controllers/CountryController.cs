using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [ApiController]
    [Route("[controller]")]
 
    public class CountryController: BaseCrudController<CountryModel, BaseSearchObject, CountryInsertRequest, CountryUpdateRequest>
    {

        public CountryController(ICountryService service, ILogger<BaseController<CountryModel, BaseSearchObject>> logger) : base(logger,service)
        {
        }
    }
}
