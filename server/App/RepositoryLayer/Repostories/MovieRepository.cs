using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories
{
    public class MovieRepository : Repository<Movie>, IMovieRepository
    {

        //private readonly IActressRepository _repo;
        //private readonly IGenreRepository _genreRepository;
        private readonly AppDbContext _appDbContext;
        private readonly IMovieRepository _movieRepository;

        public MovieRepository(AppDbContext appDbContext, IMovieRepository movieRepository,IActressRepository repo, IGenreRepository genreRepository) : base(appDbContext)
        {

            //_repo = repo;
            _appDbContext = appDbContext;
            //_genreRepository = genreRepository;
            _movieRepository = movieRepository;
        }

        public Task CreateMany(Movie movie, List<int> actressIds, List<int> qualityIds)
        {
            throw new NotImplementedException();
        }



        //public async Task CreateMany(Movie movie, List<int> actressIds, List<int> qualityIds)
        //{


        //    var actresses = await _repo.FindAllByExpression(a => actressIds.Contains(a.Id));

        //    movie.MovieActresses = new();
        //    foreach (var actress in actresses)
        //    {
        //        movie.MovieActresses.Add(new MovieActress
        //        {
        //            ActressId = actress.Id,
        //            MovieId = movie.Id,
        //            isDeleted = false,
        //            CreatedTime = DateTime.UtcNow,
        //        });
        //        movie.MovieQualities = new();
        //        foreach (var qualtyId in qualityIds)
        //        {
        //            movie.MovieQualities.Add(new MovieQuality
        //            {
        //                QualityId = qualtyId,
        //                MovieId = movie.Id,
        //                isDeleted = false,
        //                CreatedTime = DateTime.UtcNow,
        //            });

        //        }




        //    }


        //    await _appDbContext.SaveChangesAsync();


        //}


        public async Task<List<Movie>> FilterMovie(int startRating,int endRaiting, int startYear,int endYear, string quality, string genreName, int skip)
        {
            IQueryable<Movie> query = _movieRepository.GetAllT();

            if (startRating!=null && endRaiting!=null) 
            {
                query = query.Where(movie => movie.Raiting >= startRating && movie.Raiting<=endRaiting);
            }

            if (startYear!=null && endYear!=null)
            {
                query = query.Where(movie => movie.Year.Year >=startYear && movie.Year.Year<=endYear );
            }

            if (!string.IsNullOrEmpty(quality))
            {
                query = query.Where(movie => movie.MovieQualities.FirstOrDefault().Quality.Name == quality);
            }

            if (!string.IsNullOrEmpty(genreName))
            {
                query = query.Where(movie => movie.Genre.Name == genreName);
            }

            return await query.Where(m => !m.isDeleted).Take(10).Skip((skip - 1) * 10).ToListAsync();
        }
    }
}