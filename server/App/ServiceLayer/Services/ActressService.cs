using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Actress;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class ActressService : IActressService
    {
        private readonly IContactRepository _repo;
        private readonly IMapper _mapper;

        public ActressService(IMapper mapper, IContactRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(ActressCreateDto actress)
        {
            var mappedData = _mapper.Map<Contact>(actress);
            await _repo.Create(mappedData);
        }

        public async Task Delete(int id)
        {
            var actress = await _repo.Get(id);
            if (actress == null) throw new ArgumentNullException();
            await _repo.Delete(actress);
        }
        public async Task SoftDelete(int id)
        {
            var actress = await _repo.Get(id);
            if (actress == null) throw new ArgumentNullException();
            await _repo.SoftDelete(actress);
        }

        public async Task<List<ActressListDto>> GetAll()
        {
            var actreses = await _repo.GetAll();
            return _mapper.Map<List<ActressListDto>>(actreses);
        }

        public async Task Update(int id, ActressUpdateDto actress)
        {

            var dbActress = await _repo.Get(id);
            _mapper.Map(actress, dbActress);
            await _repo.Update(dbActress);




        }

      
    }
}
