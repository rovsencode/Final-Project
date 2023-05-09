﻿using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Configuratiions
{
    public class SocialConfiguration : IEntityTypeConfiguration<Social>
    {
        public void Configure(EntityTypeBuilder<Social> builder)
        {
            builder.Property(s => s.Name).IsRequired().HasMaxLength(100);
            builder.Property(s => s.ImageUrl).IsRequired();
            builder.Property(s=>s.isDeleted).HasDefaultValue(false);
            builder.Property(s=>s.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}
