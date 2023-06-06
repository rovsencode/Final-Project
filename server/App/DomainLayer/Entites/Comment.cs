using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Comment:BaseEntity
    {
        public string Message { get; set; }
        public string AppUserId { get; set; }
        public AppUser AppUser { get; set; }
        public int MovieId { get; set; }
        public Movie Movie { get; set; }


    }
}
