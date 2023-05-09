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
    public class EpisodeConfiguration : IEntityTypeConfiguration<Episode>
    {
        public void Configure(EntityTypeBuilder<Episode> builder)
        {
            builder.Property(e=>e.EpisodeTitle).IsRequired().HasMaxLength(50);
            builder.Property(e => e.EpisodeNumber).IsRequired();
            builder.Property(e=> e.isDeleted).HasDefaultValue(false);
            builder.Property(e => e.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}
