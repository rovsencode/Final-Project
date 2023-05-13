using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Actress
{
    public class ActressListDto
    {
        public string FullName { get; set; }
        public List<SerieActress> SerieActress { get; set; }
        public List<Movie> MovieActress { get; set; }

    }
}
