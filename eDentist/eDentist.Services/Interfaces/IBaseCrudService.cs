using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Interfaces
{
    public interface IBaseCrudService<T,TSearch,Tinsert,Tupdate>:IService<T,TSearch> where TSearch:class
    {
        Task<T> Insert(Tinsert obj);
        Task<T> Update(Tupdate obj,int id);
        Task<T> Delete(int id);
    }
}
