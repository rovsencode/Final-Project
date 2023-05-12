using ServiceLayer.DTOs.Genre;
using ServiceLayer.DTOs.SeasonDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class SeasonService : ISeasonService
    {
        public Task Create(SeasonCreateDto season)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<GenreListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, SeasonUpdateDto season)
        {
            throw new NotImplementedException();
        }
    }
}
