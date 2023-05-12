using ServiceLayer.DTOs.Genre;
using ServiceLayer.DTOs.SeasonDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface ISeasonService
    {
        Task Create(SeasonCreateDto season);
        Task Update(int id, SeasonUpdateDto season);

        Task<List<GenreListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
