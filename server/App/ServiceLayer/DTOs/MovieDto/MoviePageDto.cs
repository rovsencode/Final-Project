using DomainLayer.Entites;
using ServiceLayer.DTOs.ActressDto;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.MovieDto
{
    public class MoviePageDto
    {
        public string? Name { get; set; }
        public string ?Description { get; set; }
        public string ?ImageUrl { get; set; }
        public string ?AgeRestriction { get; set; }
        public int? Year { get; set; }
        public double ?Price { get; set; }
        public int Raiting { get; set; }
        public List<ActressListDto>? Actresses { get; set; }
        public List<QualityListDto>? Qualities { get; set; }
        public  string? Genre { get; set; }
        public int? GenreId { get; set; }

    }
}
