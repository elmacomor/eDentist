using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route("[controller]")]
    public class BaseCrudController<T, TSearch, TInsert, TUpdate> : BaseController<T, TSearch> where TSearch:BaseSearchObject where T:class
    {
        protected new readonly IBaseCrudService<T, TSearch, TInsert, TUpdate> _service;
        protected readonly ILogger<BaseController<T, TSearch>> _logger;

        public BaseCrudController(ILogger<BaseController<T, TSearch>> logger, IBaseCrudService<T, TSearch, TInsert, TUpdate> service)
            : base(service,logger)
        {
            _logger = logger;
            _service = service;
        }
        [HttpPost]
        public virtual async Task<T> Insert([FromBody] TInsert insert)
        {
            return await _service.Insert(insert);
        }

        [HttpPut("{id}")]
        public virtual async Task<T> Update(int id, [FromBody] TUpdate update)
        {
            return await _service.Update(update,id);
        }
        [HttpDelete("{id}")]
        public virtual async Task<T> Delete(int id)
        {
            return await _service.Delete(id);
        }
    }
}
