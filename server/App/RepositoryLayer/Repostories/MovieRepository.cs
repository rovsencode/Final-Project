using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories
{
    public class MovieRepository : Repository<Movie>, IMovieRepository
    {

        private readonly IActressRepository _repo;


        public MovieRepository(AppDbContext appDbContext, IActressRepository repo) : base(appDbContext)
        {

            _repo = repo;

        }

      

        public async Task<Movie> CreateMany(Movie movie, List<int> actressIds)
        {


            var actresses = await _repo.FindAllByExpression(a => actressIds.Contains(a.Id));


            foreach (var actress in actresses)
            {
                movie.MovieActress.Add(new MovieActress { Actress = actress });
            }



            return movie;
        }
    }
}
