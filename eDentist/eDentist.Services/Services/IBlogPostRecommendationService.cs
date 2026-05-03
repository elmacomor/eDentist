using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public interface IBlogPostRecommendationService : IBaseCrudService<RecommendResultModel, BaseSearchObject, RecommendResultUpsertRequest, RecommendResultUpsertRequest>
    {
        List<BlogPostModel> Recommend(int? userId);
    }
}
