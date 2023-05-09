using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Partners: BaseEntity
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl  { get; set; }
    }
}
