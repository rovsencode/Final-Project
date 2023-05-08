using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class Epizode:BaseEntity
    {
        public int EpisodeNumber { get; set; }
        public string EpisodeTitle { get; set; }
        public DateTime AirDate { get; set; }
    }
}
