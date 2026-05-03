using System;
using System.Collections.Generic;

namespace eDentist.Services.Database;

public partial class MedicalCard
{
    public int MedicalCardId { get; set; }

    public int? UserId { get; set; }

    public int? DentalServiceId { get; set; }

    public string? DoctorsOppinion { get; set; }
    public DateTime datumDijagnoze { get; set; }
    public virtual DentalService? DentalService { get; set; }

    public virtual User? User { get; set; }
}
