using AutoMapper;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.SerieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class SerieService : ISerieService
    {
        private readonly IFaqRepository _repo;
        private readonly IMapper _mapper;

        public SerieService(IMapper mapper, IFaqRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public Task Create(SerieCreateDto serie)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<SerieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, SerieUpdateDto serie)
        {
            throw new NotImplementedException();
        }
    }
}
