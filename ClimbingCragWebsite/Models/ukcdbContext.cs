using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ClimbingCragWebsite.Models
{
    public partial class ukcdbContext : DbContext
    {
        public ukcdbContext()
        {
        }

        public ukcdbContext(DbContextOptions<ukcdbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserRole> AspNetUserRoles { get; set; }
        public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }
        public virtual DbSet<Crag> Crags { get; set; }
        public virtual DbSet<Favourite> Favourites { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Route> Routes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("DefaultConnection");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<AspNetRole>(entity =>
            {
                entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedName] IS NOT NULL)");

                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetRoleClaim>(entity =>
            {
                entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

                entity.Property(e => e.RoleId).IsRequired();

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetRoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetUser>(entity =>
            {
                entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

                entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedUserName] IS NOT NULL)");

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.UserName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetUserClaim>(entity =>
            {
                entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogin>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserRole>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId });

                entity.HasIndex(e => e.RoleId, "IX_AspNetUserRoles_RoleId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.RoleId);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserTokens)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<Crag>(entity =>
            {
                entity.ToTable("Crag");

                entity.Property(e => e.CragId).HasColumnName("CragID");

                entity.Property(e => e.Country)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.County)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.CragDescription)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CragName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ImageId).HasColumnName("ImageID");

                entity.Property(e => e.Region)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.Crags)
                    .HasForeignKey(d => d.ImageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CragImage");
            });

            modelBuilder.Entity<Favourite>(entity =>
            {
                entity.HasKey(e => e.RelationId);

                entity.Property(e => e.RelationId).HasColumnName("RelationID");

                entity.Property(e => e.RouteId).HasColumnName("RouteID");

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(450)
                    .HasColumnName("UserID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Favourites)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserFavourites");
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.Property(e => e.ImageId).HasColumnName("ImageID");

                entity.Property(e => e.ImageDescription)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ImageUrl)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("ImageURL");
            });

            modelBuilder.Entity<Route>(entity =>
            {
                entity.ToTable("Route");

                entity.Property(e => e.RouteId).HasColumnName("RouteID");

                entity.Property(e => e.CragId).HasColumnName("CragID");

                entity.Property(e => e.ImageId).HasColumnName("ImageID");

                entity.Property(e => e.RouteDescription)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RouteGrade)
                    .IsRequired()
                    .HasMaxLength(4)
                    .IsUnicode(false);

                entity.Property(e => e.RouteName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Crag)
                    .WithMany(p => p.Routes)
                    .HasForeignKey(d => d.CragId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CragRoute");

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.Routes)
                    .HasForeignKey(d => d.ImageId)
                    .HasConstraintName("FK_RouteImage");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
