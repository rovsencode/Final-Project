using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Genre
{
    public class GenreUpdateDto
    {
        public string Name { get; set; }
        public List<Movie> Movies { get; set; }
        public List<Serie> Series { get; set; }
    }
}
