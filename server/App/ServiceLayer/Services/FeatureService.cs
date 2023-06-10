using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.FeatureDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class FeatureService:IFeatureService
    {
        private readonly IFeatureRepository _repo;
        private readonly IMapper _mapper;

        public FeatureService(IMapper mapper, IFeatureRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(FeatureCreateDto feature)
        {
            var mappedData = _mapper.Map<Feature>(feature);
            await _repo.Create(mappedData);
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<FeatureListDto>> GetAll()
        {
            var features = await _repo.GetAll();
            return  _mapper.Map<List<FeatureListDto>>(features);
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }


        public Task Update(int id, FeatureUpdateDto feature)
        {
            throw new NotImplementedException();
        }
    }
}
