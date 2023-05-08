using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class MovieActress:BaseEntity
    {
        public int MovieId { get; set; }
        public int ActressId { get; set; }
        public Actress Actress { get; set; }
        public Movie Movie { get; set; }
    }
}
