using AutoMapper;
using DomainLayer.Entites;
using MimeKit.Cryptography;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
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

        public async Task<ApiResponse> Create(PropertyCreateDto property)
        {
            if (property == null) return new ApiResponse { Errors = {"it is null"},StatusCode = 400 };
            var mappedData = _mapper.Map<Property>(property);
            await _repo.Create(mappedData);
            return new ApiResponse { Errors = null, StatusCode = 200 };

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

        public async Task SoftDelete(int id)
        {
           var property=await _repo.Get(id);
            await _repo.Delete(property);
        }

        public Task Update(int id, PropertyUpdateDto property)
        {
            throw new NotImplementedException();
        }
    }
}
