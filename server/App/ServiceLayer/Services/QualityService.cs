using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class QualityService : IQualityService
    {
        private readonly IQualityRepository _repo;
        private readonly IMapper _mapper;

        public QualityService(IQualityRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        public async Task<ApiResponse> Create(QualityCreateDto quality)
        {
            if (quality == null) return new ApiResponse {StatusCode=400};
            Quality result = _repo.GetAllT().Where(d => d.Name == quality.Name).FirstOrDefault();
            if (result != null)
            {
                ApiResponse response = new();
                response.StatusCode = 400;
                response.Errors = new()
                {
                    "bele bir quality  var"
                };
                return response;
            }
            var mappedData= _mapper.Map<Quality>(quality);
           await _repo.Create(mappedData);
            return new ApiResponse { StatusCode = 200 };
        }

        public async Task Delete(int id)
        {
           Quality quality=await _repo.Get(id);
           await _repo.Delete(quality);
        }

        public async Task<QualityListDto> GetOne(int id)
        {
           Quality quality= await _repo.Get(id);
                var mappedData = _mapper.Map<QualityListDto>(quality); 
            return mappedData;
        }

        public async Task<List<QualityListDto>> GetAll()
        {
            var qualitys = await _repo.GetAll();
            return _mapper.Map<List<QualityListDto>>(qualitys);
        }
       
        public async Task SoftDelete(int id)
        {
          Quality quality=  await _repo.Get(id);
           await  _repo.SoftDelete(quality);
        }

        public async Task<ApiResponse> Update(int id, QualityUpdateDto quality)
        {
            var dbQuality = await _repo.Get(id);
            Quality result = _repo.GetAllT().Where(d => d.Name == quality.Name && d.Id != id).FirstOrDefault();
            if (result != null)
            {
                ApiResponse response = new();
                response.StatusCode = 400;
                response.Errors = new()
                {
                    "bele bir quality  var"
                };
                return response;
            }
            var mappedData = _mapper.Map(quality, dbQuality);
            mappedData.Id = id;
            await _repo.Update(dbQuality);
            return new ApiResponse { StatusCode = StatusCodes.Status200OK };
        }
    }
}
