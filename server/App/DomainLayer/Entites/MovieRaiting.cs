using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class MovieRaiting
    {
        public int Id { get; set; }
        public Movie Movie { get; set; }
        public AppUser User { get; set; }
        public string UserId { get; set; }
        public int MovieId { get; set; }
        public bool LikeActive { get; set; }
        public bool DisLikeActive { get; set; }
    }
}
