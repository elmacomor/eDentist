using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Interfaces
{
    public interface IBlogPostService : IBaseCrudService<BlogPostModel, BaseSearchObject, BlogPostUpsertRequest, BlogPostUpsertRequest>
    {

    }
}
