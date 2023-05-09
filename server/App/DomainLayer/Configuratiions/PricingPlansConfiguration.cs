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
    public class PricingPlansConfiguration : IEntityTypeConfiguration<PricingPlans>
    {
        public void Configure(EntityTypeBuilder<PricingPlans> builder)
        {
            builder.Property(p => p.PlanName).IsRequired().HasMaxLength(50);
            builder.Property(p => p.Price).IsRequired();
            builder.Property(p=>p.Property).IsRequired().HasMaxLength(100);
            builder.Property(p => p.isDeleted).HasDefaultValue(false);
            builder.Property(p => p.CreatedTime).HasDefaultValue(DateTime.UtcNow);

        }
    }
}
