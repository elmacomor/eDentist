using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace eDentist.Services.Database;

public partial class Product
{
    public int ProductId { get; set; }

    public string? ProductName { get; set; }
    public string? Barcode { get; set; }

    public string? ProductDescription { get; set; }

    public int? ProductPrice { get; set; }

    public byte[]? Slika { get; set; }

    public int? ProductTypeId { get; set; }

    public string StateMachine { get; set; }

    public virtual ICollection<Favorite> Favorites { get; set; } = new List<Favorite>();

    public virtual ProductType? ProductType { get; set; }
}
