using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Configuratiions
{
    public class QualityConfiguration : IEntityTypeConfiguration<Quality>
    {
        public void Configure(EntityTypeBuilder<Quality> builder)
        {
           builder.Property(q=>q.Name).IsRequired();
            builder.Property(q=>q.isDeleted).HasDefaultValue(false);
            builder.Property(q=>q.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}

