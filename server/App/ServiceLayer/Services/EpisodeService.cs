using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.EpisodeDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class EpisodeService : IEpisodeService
    {
        private readonly IEpisodeRepository _repo;
        private readonly IMapper _mapper;

        public EpisodeService(IMapper mapper, IEpisodeRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(EpisodeCreateDto episode)
        {
            var mappedData = _mapper.Map<Episode>(episode);
            await _repo.Create(mappedData);
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<EpisodeListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, EpisodeUpdateDto episode)
        {
            throw new NotImplementedException();
        }
    }
}
