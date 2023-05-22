using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MovieFilterDto
    {
        public DateTime Year { get; set; }
        public int Raiting { get; set; }
    }
}
