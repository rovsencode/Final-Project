using AutoMapper;
using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Repostories;
using RepositoryLayer.Repostories.Interfaces;
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

        public async Task Create(MovieCreateDto movie, List<int> actressIds)
        {
            var mappedData = _mapper.Map<Movie>(movie);
            
            await _repo.Create(await _repo.CreateMany(mappedData, actressIds));

        }



        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<MovieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

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
