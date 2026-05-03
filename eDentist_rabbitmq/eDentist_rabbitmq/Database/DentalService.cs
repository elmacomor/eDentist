using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class DentalService
{
    public int DentalServiceId { get; set; }

    public string? ServiceName { get; set; }

    public string? ServiceDescription { get; set; }

    public int? ServicePrice { get; set; }

    public virtual ICollection<MedicalCard> MedicalCards { get; set; } = new List<MedicalCard>();
}
