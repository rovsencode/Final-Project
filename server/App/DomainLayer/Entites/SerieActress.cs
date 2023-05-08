using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class SerieActress:BaseEntity
    {
        public int SerieId { get; set; }
        public int ActressId { get; set; }
        public Serie Serie { get; set; }
        public Actress Actress { get; set; }
    }
}
