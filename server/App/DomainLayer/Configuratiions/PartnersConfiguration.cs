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
    public class PartnersConfiguration : IEntityTypeConfiguration<Partners>
    {
        public void Configure(EntityTypeBuilder<Partners> builder)
        {
            builder.Property(b => b.ImageUrl).IsRequired();
            builder.Property(b => b.Description).IsRequired().HasMaxLength(100);
        }
    }
}
