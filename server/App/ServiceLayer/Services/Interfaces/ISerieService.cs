using DomainLayer.Entites;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.SerieDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface ISerieService
    {

        Task Create(SerieCreateDto serie);
        Task Update(int id, SerieUpdateDto serie);
        Task<List<SerieListDto>> GetAll();
        Task <List<Serie>>Filter(int genreId, string qualty, int imdbStart, int imdbEnd, DateTime starYear, DateTime endYear);
        Task Delete(int id);
        Task SoftDelete(int id);
   
    }
}
