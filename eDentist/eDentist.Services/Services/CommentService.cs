using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;

namespace eDentist.Services.Services
{
    public class CommentService : BaseCrudService<CommentModel, Comment, BaseSearchObject, CommentUpsertRequest, CommentUpsertRequest>, ICommentService
    {

        public CommentService(EDentistDbContext c, IMapper mapper) : base(c, mapper) { }


    }
}
