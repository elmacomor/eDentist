using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class City
{
    public int CityId { get; set; }

    public string? CityName { get; set; }


    public string? ZipCode { get; set; }

    public int? CountryId { get; set; }

    public virtual Country? Country { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
