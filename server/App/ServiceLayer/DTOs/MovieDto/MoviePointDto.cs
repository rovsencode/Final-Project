using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MoviePointDto
    {
        public float Raiting { get; set; }
        public bool LikeActive { get; set; }
        public bool DisLikeActive { get; set; }
    }
}
