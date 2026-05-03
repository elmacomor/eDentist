using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [ApiController]
    public class RecommendResultController : BaseCrudController<RecommendResultModel, BaseSearchObject, RecommendResultUpsertRequest, RecommendResultUpsertRequest>
    {
        public RecommendResultController(ILogger<BaseController<RecommendResultModel, BaseSearchObject>> logger, IRecommendResultService service)
            : base(logger, service)
        {
        }

        [HttpPost("TrainModel")]
        public virtual async Task<IActionResult> TrainModel()
        {
            try
            {
                var dto = await (_service as IRecommendResultService).TrainProductsModel();
                return Ok(dto);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpDelete("ClearRecommendation")]
        public virtual async Task<IActionResult> ClearRecommendation()
        {
            await (_service as IRecommendResultService).DeleteAllRecommendation();
            return Ok();
        }

    }
}
