using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [Route("[controller]")]
    [Authorize]
    public class BaseController<T,TSearch>:ControllerBase where T : class where TSearch: BaseSearchObject
    {
        protected readonly IService<T,TSearch> _service;
        protected readonly ILogger<BaseController<T,TSearch>> _logger;

       public BaseController(IService<T,TSearch> service, ILogger<BaseController<T,TSearch>> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<PagedResult<T>> Get([FromQuery]TSearch? search=null)
        {
            return await _service.Get(search);
        }

        [HttpGet("{id}")]
        public async Task<T> GetById(int id)
        {
            return await _service.GetById(id);
        }
    }
}
