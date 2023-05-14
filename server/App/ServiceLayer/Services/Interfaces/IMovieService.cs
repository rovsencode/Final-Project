using ServiceLayer.DTOs.Genre;
using ServiceLayer.DTOs.MovieDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IMovieService
    {
        Task Create(MovieCreateDto movie);

        Task Update(int id, MovieUpdateDto movie);

        Task<List<MovieListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
