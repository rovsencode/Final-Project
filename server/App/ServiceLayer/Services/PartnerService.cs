using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class PartnerService:IPartnerService
    {
        private readonly IPartnerRepository _repo;
        private readonly IMapper _mapper;

        public PartnerService(IPartnerRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        public async Task Create(PartnersCreateDto partner)
        {
            var mappedData = _mapper.Map<Partners>(partner);
            await _repo.Create(mappedData);
        }

        public async Task Delete(int id)
        {
            var partner = await _repo.Get(id);
            if (partner == null) throw new ArgumentNullException();
            await _repo.Delete(partner);
        }
        public async Task SoftDelete(int id)
        {
            var partner = await _repo.Get(id);
            if (partner == null) throw new ArgumentNullException();
            await _repo.SoftDelete(partner);
        }

        public async Task<List<PartnersListDto>> GetAll()
        {
            var partners = await _repo.GetAll();
            return _mapper.Map<List<PartnersListDto>>(partners);
        }

        public async Task Update(int id, PartnersUpdateDto partner)
        {

            var dbPartner = await _repo.Get(id);
            _mapper.Map(partner, dbPartner);
            await _repo.Update(dbPartner);

        }

    }
}
