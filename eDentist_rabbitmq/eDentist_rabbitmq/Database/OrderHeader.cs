using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class OrderHeader
{
    public int OrderHeaderId { get; set; }

    public DateTime? OrderDate { get; set; }

    public int? UserId { get; set; }

    public int? TotalPrice { get; set; }
    public string? Status { get; set; }

    public virtual ICollection<Order> OrderOrderHeaders { get; set; } = new List<Order>();

    public virtual ICollection<Order> OrderProducts { get; set; } = new List<Order>();

    public virtual User? User { get; set; }
}
