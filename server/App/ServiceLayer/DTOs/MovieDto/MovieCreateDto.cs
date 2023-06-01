using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MovieCreateDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string VideoUrl { get; set; }
        public string AgeRestriction { get; set; }
        public DateTime Year { get; set; }
        public float Raiting { get; set; }
        public double Price { get; set; }
        public int[] actressIds { get; set; }
        public int[] qualityIds { get; set; }
        public int GenreId { get; set; }
    
    }
}
