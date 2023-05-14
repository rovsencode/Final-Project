using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
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
        private readonly AppDbContext _appDbContext;

        public MovieRepository(AppDbContext appDbContext, IActressRepository repo) : base(appDbContext)
        {

            _repo = repo;
            _appDbContext = appDbContext;
        }

      

        public async Task CreateMany(Movie movie,List<int> actressIds)
        {

            
            var actresses = await _repo.FindAllByExpression(a => actressIds.Contains(a.Id));

            movie.MovieActresses = new();
            foreach (var actress in actresses)
            {
                movie.MovieActresses.Add(new MovieActress {
                    ActressId=actress.Id,
                    MovieId=movie.Id,
                      isDeleted = false,
                    CreatedTime = DateTime.UtcNow,
                });
              
             
               

            }
           
           
            await _appDbContext.SaveChangesAsync();
           
           
        }
    }
}
