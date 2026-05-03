using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class Order
{
    public int OrderId { get; set; }

    public int? OrderHeaderId { get; set; }

    public int? ProductId { get; set; }

    public int? Quantity { get; set; }

    public virtual OrderHeader? OrderHeader { get; set; }

    public virtual OrderHeader? Product { get; set; }
}
