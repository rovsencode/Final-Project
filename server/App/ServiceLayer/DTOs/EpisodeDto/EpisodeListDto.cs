using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.EpisodeDto
{
    public class EpisodeListDto
    {
        public int EpisodeNumber { get; set; }
        public string EpisodeTitle { get; set; }
        public DateTime AirDate { get; set; }
    }
}
