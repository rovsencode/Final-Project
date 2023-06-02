using DomainLayer.Entites;
using ServiceLayer.DTOs.ActressDto;
using ServiceLayer.DTOs.QualityDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MovieListDto
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? ImageUrl { get; set; }
        public string? AgeRestriction { get; set; }
        public string VideoUrl { get; set; }
        public DateTime? Year { get; set; }
        public double? Price { get; set; }
        public float Raiting { get; set; }
        public List<ActressListDto>? Actresses { get; set; }
        public List<QualityListDto>? Qualities { get; set; }
        public string? Genre { get; set; }
        public int? GenreId { get; set; }
    }
}
