using AutoMapper;
using RepositoryLayer.Repostories.Interfaces;
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

        public Task Create(QualityCreateDto quality)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<QualityListDto>> GetAll()
        {
            var qualitys = await _repo.GetAll();
            return _mapper.Map<List<QualityListDto>>(qualitys);
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, QualityUpdateDto quality)
        {
            throw new NotImplementedException();
        }
    }
}
