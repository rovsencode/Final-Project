using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.DTOs.Social;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class SocialService:ISocialService
    {
        private readonly ISocialRepository _repo;
        private readonly IMapper _mapper;

        public SocialService(ISocialRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        public async Task Create(SocialCreateDto social)
        {
            var mappedData = _mapper.Map<Social>(social);
            await _repo.Create(mappedData);
        }

        public async Task Delete(int id)
        {
            var social = await _repo.Get(id);
            if (social == null) throw new ArgumentNullException();
            await _repo.Delete(social);
        }
        public async Task SoftDelete(int id)
        {
            var social = await _repo.Get(id);
            if (social == null) throw new ArgumentNullException();
            await _repo.SoftDelete(social);
        }

        public async Task<List<SocialListDto>> GetAll()
        {
            var socials = await _repo.GetAll();
            return _mapper.Map<List<SocialListDto>>(socials);
        }

        public async Task Update(int id, SocialUpdateDto social)
        {

            var dbSocial = await _repo.Get(id);
            _mapper.Map(social, dbSocial);
            await _repo.Update(dbSocial);

        }
    }
}
