using eDentist.Model;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace eDentist.Services.Interfaces
{
    public interface IProductService:IBaseCrudService<ProductModel,ProductSearchObject,ProductInsertRequest,ProductUpdateRequest>
    {
        Task<ProductModel> Activate(int id);
        Task<ProductModel> Hide(int id);
        Task<List<string>> AllowedActions(int id);
    }
}
