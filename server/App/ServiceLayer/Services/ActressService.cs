using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.ActressDto;
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
        private readonly IActressRepository _repo;
        private readonly IMapper _mapper;

        public ActressService(IMapper mapper, IActressRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(ActressCreateDto actress)
        {
            var mappedData = _mapper.Map<Actress>(actress);
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

        public async Task<ApiResponse> Update(int id, ActressUpdateDto actress)
        {
            var dbActress = await _repo.Get(id);
            var result= _repo.GetAllT().Where(d=>d.FullName==actress.FullName);
            if(dbActress.Id!=id && result!=null ){
                return new ApiResponse
                {
                    StatusCode = StatusCodes.Status400BadRequest,
                    Errors = { "Bele bir fullname var" }
                };
            }
            _mapper.Map(actress, dbActress);
            await _repo.Update(dbActress);
            return new ApiResponse { StatusCode = StatusCodes.Status200OK };
        }

      
    }
}
