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

        private readonly IGenreRepository _genreRepository;
        private readonly AppDbContext _appDbContext;
       
        public MovieRepository(AppDbContext appDbContext, IGenreRepository genreRepository) : base(appDbContext)
        {

            _appDbContext = appDbContext;
            _genreRepository = genreRepository;
       
        }



        public async Task CreateMany(Movie movie, int[] qualityIds)
        {

            var genres = await _genreRepository.GetAll();

         
                movie.MovieQualities = new();
                foreach (var qualtyId in qualityIds)
                {
                    movie.MovieQualities.Add(new MovieQuality
                    {
                        QualityId = qualtyId,
                        MovieId = movie.Id,
                        isDeleted = false,
                        CreatedTime = DateTime.UtcNow,
                    });

                }
            await _appDbContext.SaveChangesAsync();
            }








        }


    }
