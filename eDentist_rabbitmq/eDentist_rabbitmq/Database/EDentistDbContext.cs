using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace eDentist.Services.Database;

public partial class EDentistDbContext : DbContext
{
    public EDentistDbContext()
    {
    }

    public EDentistDbContext(DbContextOptions<EDentistDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<DentalService> DentalServices { get; set; }

    public virtual DbSet<Favorite> Favorites { get; set; }

    public virtual DbSet<MedicalCard> MedicalCards { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderHeader> OrderHeaders { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductType> ProductTypes { get; set; }

    public virtual DbSet<User> Users { get; set; }
    public virtual DbSet<Roles> Roles { get; set; }
    public virtual DbSet<Appointment> Appointments { get; set; }
    public virtual DbSet<RecommendResult> RecommendResult { get; set; }
    public virtual DbSet<Transactions> Transactions { get; set; }
    public virtual DbSet<BlogPost> BlogPosts { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.CityId).HasName("PK__City__F2D21A960A01C0F5");

            entity.ToTable("City");

            entity.Property(e => e.CityId).HasColumnName("CityID");
  
            entity.Property(e => e.CountryId).HasColumnName("CountryID");

            entity.HasOne(d => d.Country).WithMany(p => p.Cities)
                .HasForeignKey(d => d.CountryId)
                .HasConstraintName("fk_country_city");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.CountryId).HasName("PK__Country__10D160BFBDD7D3F9");

            entity.ToTable("Country");

            entity.Property(e => e.CountryId).HasColumnName("CountryID");
        });

        modelBuilder.Entity<DentalService>(entity =>
        {
            entity.HasKey(e => e.DentalServiceId).HasName("PK__DentalSe__51B93F22BFED9684");

            entity.ToTable("DentalService");

            entity.Property(e => e.DentalServiceId).HasColumnName("DentalServiceID");
            entity.Property(e => e.ServiceDescription)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.ServiceName)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Favorite>(entity =>
        {
            entity.HasKey(e => e.FavoriteId).HasName("PK__Favorite__CE74FAF579E6D7C9");

            entity.Property(e => e.FavoriteId).HasColumnName("FavoriteID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Product).WithMany(p => p.Favorites)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("fk_favorites_products");

            entity.HasOne(d => d.User).WithMany(p => p.Favorites)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_favorites_users");
        });

        modelBuilder.Entity<MedicalCard>(entity =>
        {
            entity.HasKey(e => e.MedicalCardId).HasName("PK__MedicalC__931EC236004DC9A6");

            entity.ToTable("MedicalCard");

            entity.Property(e => e.MedicalCardId).HasColumnName("MedicalCardID");
            entity.Property(e => e.DentalServiceId).HasColumnName("DentalServiceID");
            entity.Property(e => e.DoctorsOppinion).HasColumnType("text");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.DentalService).WithMany(p => p.MedicalCards)
                .HasForeignKey(d => d.DentalServiceId)
                .HasConstraintName("fk_service_card");

            entity.HasOne(d => d.User).WithMany(p => p.MedicalCards)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_user_medicalCard");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__Orders__C3905BAF66B02537");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.OrderHeaderId).HasColumnName("OrderHeaderID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");

            entity.HasOne(d => d.OrderHeader).WithMany(p => p.OrderOrderHeaders)
                .HasForeignKey(d => d.OrderHeaderId)
                .HasConstraintName("fk_order_orderheader");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderProducts)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("fk_order_product");
        });

        modelBuilder.Entity<OrderHeader>(entity =>
        {
            entity.HasKey(e => e.OrderHeaderId).HasName("PK__OrderHea__4BEA0BF490A2A873");

            entity.ToTable("OrderHeader");

            entity.Property(e => e.OrderHeaderId).HasColumnName("OrderHeaderID");
            entity.Property(e => e.OrderDate).HasColumnType("date");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.OrderHeaders)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_user_order");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("PK__Products__B40CC6ED012064AE");

            entity.Property(e => e.ProductId).HasColumnName("ProductID");
     
            entity.Property(e => e.ProductDescription).HasColumnType("text");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ProductTypeId).HasColumnName("ProductTypeID");

          

            entity.HasOne(d => d.ProductType).WithMany(p => p.Products)
                .HasForeignKey(d => d.ProductTypeId)
                .HasConstraintName("fk_product_type");
        });

        modelBuilder.Entity<ProductType>(entity =>
        {
            entity.HasKey(e => e.TypeId).HasName("PK__ProductT__516F0395CFF2B1F5");

            entity.ToTable("ProductType");

            entity.Property(e => e.TypeId).HasColumnName("TypeID");
            entity.Property(e => e.TypeName)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC6A8E000D");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            
            entity.Property(e => e.CityId).HasColumnName("CityID");
          
         
           
          
            

            entity.HasOne(d => d.City).WithMany(p => p.Users)
                .HasForeignKey(d => d.CityId)
                .HasConstraintName("pk_user_city");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
