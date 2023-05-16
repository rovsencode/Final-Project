using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class SerieQuality:BaseEntity
    {
        public int SerieId { get; set; }
        public int QualityId { get; set; }
        public Quality Quality { get; set; }
        public Serie Serie { get; set; }
    }
}
