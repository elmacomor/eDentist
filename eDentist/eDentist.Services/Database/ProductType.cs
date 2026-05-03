using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class ProductType
{
    public int TypeId { get; set; }

    public string? TypeName { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
