using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class Movie
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string Quality { get; set; }
        public string AgeRestriction { get; set; }
        public DateTime Year { get; set;}
        public double  Price { get; set;}
        public int Raiting { get; set;}
        public List<MovieActress> MovieActress { get; set; }

    }
}
