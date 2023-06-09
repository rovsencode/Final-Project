using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.GenreDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IGenreService
    {
        Task<ApiResponse> Create(GenreCreateDto genre);
        Task <ApiResponse>Update(int id, GenreUpdateDto genre);
        Task<GenreListDto> GetOne(int id);
        Task<List<GenreListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
