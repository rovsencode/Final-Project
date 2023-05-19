using AutoMapper;
using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Repostories;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
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



        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<MovieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<List<MoviePageDto>> MoviePage(int skip)
        {
            throw new NotImplementedException();
        }

        //public async Task<List<MoviePageDto>> MoviePage(int skip)
        //{
        //    var movies = await _repo.GetAll();
        //    int movieCount = movies.Count / 10;
        //    List<MoviePageDto> moviePageDtos = new();
        //    //var movieSort=await _repo.
        //    foreach (var item in movies)
        //    {
        //    MoviePageDto moviePageDto = new();

        //    }
        //    //var contacts = await _repo.GetAll();

        //    //return _mapper.Map<List<ContactListDto>>(contacts);
        //}

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, MovieUpdateDto movie)
        {
            throw new NotImplementedException();
        }
    }
}
