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
        


        public async Task<ApiResponse> Update(int id, GenreUpdateDto genre)
        {
            var dbGenre = await _repo.Get(id);
            Genre result = _repo.GetAllT().Where(d => d.Name == genre.Name && d.Id!=id).FirstOrDefault();
            if (result!=null)
            {
                ApiResponse response = new();
                response.StatusCode = 400;
                response.Errors = new()
                {
                    "bele bir genre name var"
                };
                return response;
            }
          var mappedData= _mapper.Map(genre, dbGenre);
            mappedData.Id = id;
            await _repo.Update(dbGenre);
            return new ApiResponse { StatusCode = StatusCodes.Status200OK };
        }
        public async Task<GenreListDto> GetOne(int id)
        { 
            Genre genre= await _repo.Get(id);
           var mappedData= _mapper.Map<GenreListDto>(genre);
            return (mappedData);
        }
        public async Task SoftDelete(int id)
        {
            Genre genre= await _repo.Get(id);
            await _repo.SoftDelete(genre);
        }


    }
}
