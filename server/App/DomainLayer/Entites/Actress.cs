using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Actress:BaseEntity
    {
        public string FullName { get; set; }
        public List<SerieActress> SerieActress { get; set; }
        public List<MovieActress> MovieActress { get; set; }
    }
}
