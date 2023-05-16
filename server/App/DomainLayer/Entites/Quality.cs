using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Quality:BaseEntity
    {
        public string Name { get; set; }
        public List<SerieQuality> SerieQualities { get; set; }
        public List<MovieQuality> MovieQualities { get; set; }
    }
}
