using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Episode:BaseEntity
    {
        public int EpisodeNumber { get; set; }
        public string EpisodeTitle { get; set; }
        public DateTime AirDate { get; set; }
        public Season Season { get; set; }
        public int SeasonId { get; set; }
    }
}
