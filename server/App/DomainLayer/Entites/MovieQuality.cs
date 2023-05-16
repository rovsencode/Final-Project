using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class MovieQuality:BaseEntity
    {
        public int MovieId { get; set; }
        public int QualityId { get; set; }
        public Movie Movie { get; set; }
        public Quality Quality { get; set; }
    }
}
