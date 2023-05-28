using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MovieFilterDto
    {
        public string ?genre { get; set; }
        public string ?quality { get; set; }

        public int[] ?year { get; set; }
        public int[] ?raiting { get; set; }
    }
}
