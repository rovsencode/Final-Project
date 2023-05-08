using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class Feature:BaseEntity
    {
        public string Name { get; set; }
        public string ImageUrL { get; set; }
        public string Description { get; set; }
    }
}
