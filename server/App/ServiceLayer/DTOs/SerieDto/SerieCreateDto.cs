using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.SerieDto
{
    public class SerieCreateDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string Quality { get; set; }
        public string AgeRestriction { get; set; }
        public DateTime Year { get; set; }
        public double Price { get; set; }
        public int Raiting { get; set; }
        public List<int> Seasons { get; set; }
        public List<int> Episodes { get; set; }
        public List<int> actressIds { get; set; }
        public List<int> qualityIds { get; set; }
        public string EpisodeTitle { get; set; }
        public DateTime AirDate { get; set; }
        public int GenreId { get; set; }
    }
}
