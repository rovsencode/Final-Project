using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class GenreService : IGenreService
    {
        private readonly IGenreRepository _repo;
        private readonly IMapper _mapper;

        public GenreService(IMapper mapper, IGenreRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task<ApiResponse> Create(GenreCreateDto genre)
        {
            if (genre == null) return new ApiResponse { StatusCode = StatusCodes.Status400BadRequest, Errors = { "name must not null" } };
            var mappedData = _mapper.Map<Genre>(genre);
            await _repo.Create(mappedData);

            return new ApiResponse { StatusCode = 200, Errors = null };
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<GenreListDto>> GetAll()
        {
            var genres = await _repo.GetAll();
            return _mapper.Map < List<GenreListDto>>(genres);
        }
     

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, GenreUpdateDto genre)
        {
            throw new NotImplementedException();
        }
    }
}
