using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Model.SearchObjects
{
    public class CitySearch:BaseSearchObject
    {
        public string? Name { get; set; } 
        public string? Contains { get; set; }   
    }
}
