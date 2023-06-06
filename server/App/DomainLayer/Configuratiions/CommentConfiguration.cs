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
    public class CommentConfiguration:IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(c => c.Message).IsRequired();
            builder.Property(c => c.isDeleted).HasDefaultValue(false);
            builder.Property(c => c.CreatedTime).HasDefaultValue(DateTime.UtcNow);
        }
    }
}
