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
    public class FaqConfiguration : IEntityTypeConfiguration<Faq>
    {
        public void Configure(EntityTypeBuilder<Faq> builder)
        {
            builder.Property(f => f.Name).IsRequired().HasMaxLength(50);
            builder.Property(f => f.Description).IsRequired().HasMaxLength(50);
            builder.Property(f => f.isDeleted).HasDefaultValue(false);
            builder.Property(f => f.CreatedTime).HasDefaultValue(DateTime.UtcNow);


        }
    }
}
