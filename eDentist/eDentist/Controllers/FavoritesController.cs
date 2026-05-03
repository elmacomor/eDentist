using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;

namespace eDentist.Controllers
{
    public class FavoritesController : BaseCrudController<FavoriteModel, BaseSearchObject, FavoriteInsertRequest, FavoriteUpdateRequest>
    {

        public FavoritesController(IFavoriteService service, ILogger<BaseController<FavoriteModel, BaseSearchObject>> logger) : base(logger, service)
        { }
    }
}
