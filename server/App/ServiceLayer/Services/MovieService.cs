using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class MovieService : IMovieService
    {
        public Task Create(MovieCreateDto movie)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<MovieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, MovieUpdateDto movie)
        {
            throw new NotImplementedException();
        }
    }
}
