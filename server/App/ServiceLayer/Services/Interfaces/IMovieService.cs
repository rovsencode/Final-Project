using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.GenreDto;
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
        Task<ApiResponse> Create(MovieCreateDto movie);

        Task Update(int id, MovieUpdateDto movie);
        Task<List<MoviePageDto>> GetAll();
        Task<List<MoviePageDto>> MovieFilter(MovieFilterDto movieFilter, int skip);
        Task<List<MoviePageDto>> MoviePage(int skip);
        Task<float> Count();
        Task<MoviePageDto> Get(MovieGetOneDto movieDto);
        Task<(int,int)> FilterData();
        Task<MoviePointDto> Like(MovieRaitingDto movieRaitingDto);
        Task<List<Movie>> Random();
        Task<MoviePointDto> DisLike(MovieRaitingDto movieRaitingDto); 
        Task<List<MovieListDto>> Search(string searchText);
        Task <List<MovieVideoDto>> MovieVideos();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
