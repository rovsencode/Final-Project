using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Genre:BaseEntity
    {
        public string Name { get; set; }
        public List<Movie> Movies { get; set; }
        public List<Serie> Series { get; set; }

    }
}
