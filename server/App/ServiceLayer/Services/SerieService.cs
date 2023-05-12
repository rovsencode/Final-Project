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
