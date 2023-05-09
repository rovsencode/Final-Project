﻿using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DomainLayer.Configuratiions
{
    public class ActressConfiguration : IEntityTypeConfiguration<Actress>
    {
        public void Configure(EntityTypeBuilder<Actress> builder)
        {
            builder.Property(a => a.FullName).IsRequired();
            builder.Property(a => a.isDeleted).HasDefaultValue(false);
            builder.Property(a => a.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }


}
