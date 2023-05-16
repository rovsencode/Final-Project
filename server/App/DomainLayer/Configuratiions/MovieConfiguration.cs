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
    public class MovieConfiguration : IEntityTypeConfiguration<Movie>
    {
        public void Configure(EntityTypeBuilder<Movie> builder)
        {
            builder.Property(m => m.Name).IsRequired().HasMaxLength(50);
            builder.Property(m => m.Description).IsRequired().HasMaxLength(100);
            builder.Property(m => m.Year).IsRequired();
            builder.Property(m => m.AgeRestriction).IsRequired();
            builder.Property(m => m.ImageUrl).IsRequired();
            builder.Property(m => m.Raiting).IsRequired();
            builder.Property(m => m.isDeleted).HasDefaultValue(false);
            builder.Property(m => m.CreatedTime).HasDefaultValue(DateTime.UtcNow);


        }
    }
}
