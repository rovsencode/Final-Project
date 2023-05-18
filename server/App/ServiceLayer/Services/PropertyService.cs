using AutoMapper;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class PropertyService : IPropertyService
    {
        private readonly IPropertyRepository _repo;
        private readonly IMapper _mapper;

        public PropertyService(IMapper mapper, IPropertyRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public Task Create(PropertyCreateDto property)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<PropertyListDto>> GetAll()
        {
            var properties = await _repo.GetAll();
            return _mapper.Map<List<PropertyListDto>>(properties);
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, PropertyUpdateDto property)
        {
            throw new NotImplementedException();
        }
    }
}
