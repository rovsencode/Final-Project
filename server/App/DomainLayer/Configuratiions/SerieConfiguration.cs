using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Configuratiions
{
    public class SerieConfiguration : IEntityTypeConfiguration<Serie>
    {
        public void Configure(EntityTypeBuilder<Serie> builder)
        {
            builder.Property(s => s.Name).IsRequired().HasMaxLength(50);
            builder.Property(s => s.Description).IsRequired().HasMaxLength(100);
            builder.Property(s => s.Year).IsRequired();
            builder.Property(s => s.Quality).IsRequired();
            builder.Property(s => s.AgeRestriction).IsRequired();
            builder.Property(s => s.ImageUrl).IsRequired();
            builder.Property(s => s.Raiting).IsRequired();
            builder.Property(s => s.isDeleted).HasDefaultValue(false);
            builder.Property(s => s.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}
