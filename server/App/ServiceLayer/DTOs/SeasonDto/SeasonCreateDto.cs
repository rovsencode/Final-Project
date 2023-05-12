using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.SeasonDto
{
    public class SeasonCreateDto
    {
        public int SeasonNumber { get; set; }
        public List<Episode> Episodes { get; set; }
    }
}
