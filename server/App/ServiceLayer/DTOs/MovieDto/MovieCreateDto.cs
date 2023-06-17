using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
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
        public IFormFile? ImageUrl { get; set; }
        public IFormFile? BackgroundImage { get; set; }
        public IFormFile? VideoUrl { get; set; }
        public string AgeRestriction { get; set; }
        public float Raiting { get; set; }
        public DateTime Year { get; set; }
        public int[] qualityIds { get; set; }
        public int GenreId { get; set; }
    
    }
}
