using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;

namespace eDentist.Controllers
{
    [AllowAnonymous]
    public class BlogPostController : BaseCrudController<BlogPostModel, BaseSearchObject, BlogPostUpsertRequest, BlogPostUpsertRequest>
    {

        public BlogPostController(IBlogPostService service, ILogger<BaseController<BlogPostModel, BaseSearchObject>> logger) : base(logger, service)
        { }
    }
}

