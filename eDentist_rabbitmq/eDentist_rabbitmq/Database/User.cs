using eDentist.Model.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace eDentist.Services.Database;

public partial class User
{
    public int UserId { get; set; }

    public string? Name { get; set; }

    public string? Surname { get; set; }

    public string? Email { get; set; }

    public string? Username { get; set; }
    public string PasswordHash { get;set; }
    public string PasswordSalt { get; set; }

    public string? Adress { get; set; }

    public int? CityId { get; set; }

    public byte[]? Slika { get; set; }
    public virtual City? City { get; set; }
    [ForeignKey("RoleID")]
    public Roles Role { get; set; }
    public int RoleID { get; set; }

    public virtual ICollection<Favorite> Favorites { get; set; } = new List<Favorite>();

    public virtual ICollection<MedicalCard> MedicalCards { get; set; } = new List<MedicalCard>();

    public virtual ICollection<OrderHeader> OrderHeaders { get; set; } = new List<OrderHeader>();

}
