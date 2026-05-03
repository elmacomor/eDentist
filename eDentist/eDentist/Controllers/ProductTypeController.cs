using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [ApiController]
    public class ProductTypeController : BaseCrudController<ProductTypeModel, BaseSearchObject, ProductTypeInsertRequest, ProductTypeUpdateRequest>
    {
        public ProductTypeController(IProductTypeService service, ILogger<BaseController<ProductTypeModel, BaseSearchObject>> logger) : base(logger, service)
        {
        }
    }
}
