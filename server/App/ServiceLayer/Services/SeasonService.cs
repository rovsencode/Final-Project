using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.SeasonDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class SeasonService : ISeasonService
    {
        private readonly ISeasonRepository _repo;
        private readonly IMapper _mapper;

        public SeasonService(IMapper mapper, ISeasonRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(SeasonCreateDto season)
        {
            var mappedData = _mapper.Map<Season>(season);
            await _repo.Create(mappedData);
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<GenreListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, SeasonUpdateDto season)
        {
            throw new NotImplementedException();
        }
    }
}
