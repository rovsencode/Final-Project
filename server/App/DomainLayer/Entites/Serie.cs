﻿using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Serie:BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string AgeRestriction { get; set; }
        public DateTime Year { get; set; }
        public double Price { get; set; }
        public int Raiting { get; set; }
        public List<Season> Seasons { get; set; }
        public List<SerieActress> SerieActress{ get; set; }
        public List<SerieQuality> SerieQualities { get; set; }
        public Genre Genre { get; set; }
        public int GenreId { get; set; }

    }
}
