using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [ApiController]
    public class CityController : BaseCrudController<CityModel,CitySearch,CityInsertRequest,CityUpdateRequest>
    {
        public CityController(ICityService service, ILogger<BaseController<CityModel,CitySearch>> logger) : base(logger,service)
        {
        }
    }
}
