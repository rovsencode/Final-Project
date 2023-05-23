using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories.Interfaces
{
    public interface IMovieRepository: IRepository<Movie>
    {


        public Task CreateMany(Movie movie, List<int> actressIds,List<int> qualityIds);
        public Task<List<Movie>> FilterMovie(int startRating, int endRaiting, int startYear, int endYear, string quality, string genreName, int skip);

    }
}
