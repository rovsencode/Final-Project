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
    public class PropertyConfiguration : IEntityTypeConfiguration<Property>
    {
        public void Configure(EntityTypeBuilder<Property> builder)
        {
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p=>p.isDeleted).HasDefaultValue(false);
            builder.Property(p=>p.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}
