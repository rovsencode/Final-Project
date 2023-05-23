using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MovieFilterDto
    {

        public int startYear { get; set; }
        public int endYear { get; set; }
        public int startRaiting { get; set; }
        public int endRaiting { get; set; }
        public string quality { get; set; }
        public string genre { get; set; }
    }
}
