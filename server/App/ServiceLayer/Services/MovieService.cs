using AutoMapper;
using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Logging.Abstractions;
using RepositoryLayer.Repostories;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class MovieService : IMovieService
    {
        private readonly IMovieRepository _repo;
    
        private readonly IMapper _mapper;

        public MovieService(IMapper mapper, IMovieRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        
        }

        public async Task Create(MovieCreateDto movie)
        {      

            var mappedData = _mapper.Map<Movie>(movie);
            await _repo.Create(mappedData);
           await _repo.CreateMany(mappedData, movie.actressIds,movie.qualityIds);


        }
        public async Task<List<MovieListDto>> Search(string searchText)
        {

            var searchDatas = await _repo.FindAllByExpression(m => m.Name.StartsWith(searchText));
            return _mapper.Map<List<MovieListDto>>(searchDatas);
        }


        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<MovieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }


        public async Task<List<MoviePageDto>> MoviePage(int skip)
        {
         
            List<MoviePageDto> moviePageDtos = new();
            var movieSort = await _repo.PageList(skip);
            foreach (var movie in movieSort)
            {
                MoviePageDto moviePageDto = new() {
                    Name = movie.Name,
                    AgeRestriction = movie.AgeRestriction,
                    Description = movie.Description,
                    Price = movie.Price,
                    Raiting = movie.Raiting,
                    Year = movie.Year,
                };
                moviePageDtos.Add(moviePageDto);

            }
           
            return moviePageDtos;
        }
        public async Task<float>Count()
        {
            var movies = await _repo.GetAll();
            float length = movies.Count();
            float movieCount =length/10;
            return movieCount;
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, MovieUpdateDto movie)
        {
            throw new NotImplementedException();
        }

        public async Task<(int,int)> FilterData()
        {
            List<Movie> movies = await _repo.GetAll();
            int minYear = movies.Min(m => m.Year.Year);
            int maxYear = movies.Max(m => m.Year.Year);

            return (minYear, maxYear);
        }
 
        public async Task<List<Movie>> MovieFilter(MovieFilterDto movieFilter, int skip)
        {
            IQueryable<Movie> query = _repo.GetAllT();


            if (movieFilter.raiting!=null)
            {
                query = query.Where(movie => movie.Raiting >= movieFilter.raiting[0] && movie.Raiting <= movieFilter.raiting[1]);
            }

            if (movieFilter.year!=null)
            {
                query = query.Where(movie => movie.Year.Year >= movieFilter.year[0] && movie.Year.Year <= movieFilter.year[1]);
            }

            if (!string.IsNullOrEmpty(movieFilter.quality))
            {
                query = query.Where(movie => movie.MovieQualities.FirstOrDefault().Quality.Name == movieFilter.quality);
            }

            if (!string.IsNullOrEmpty(movieFilter.genre))
            {
                query = query.Where(movie => movie.Genre.Name == movieFilter.genre);
            }

            return await query.Where(m => !m.isDeleted).Take(10).Skip((skip - 1) * 10).ToListAsync();
        }

   
    }
}
