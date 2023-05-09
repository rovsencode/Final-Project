using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Season:BaseEntity
    {
        public int SeasonNumber { get; set; }
        public List<Episode> Episodes { get; set; }
    }
}
