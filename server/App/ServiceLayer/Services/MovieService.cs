using AutoMapper;
using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Logging.Abstractions;
using RepositoryLayer.Repostories;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using System.Threading.Tasks;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.QualityDto;
using Newtonsoft.Json.Schema;
using Microsoft.AspNetCore.Http;
using Google.Cloud.Storage.V1;
using Google.Apis.Auth.OAuth2;

namespace ServiceLayer.Services
{
    public class MovieService : IMovieService
    {
        private readonly IMovieRepository _repo;
    
        private readonly IMapper _mapper;
        private const string BucketName = "my-films-1207";


        public MovieService(IMapper mapper, IMovieRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        
        }

  

        public async Task Create(MovieCreateDto movie)
        {
            string imageUrl = await Upload(movie.file);
            Movie mappedData = new()
            {
               Name=movie.Name,
               AgeRestriction=movie.AgeRestriction,
               Description=movie.Description,
               ImageUrl=imageUrl,
               Raiting=movie.Raiting,
               Year=movie.Year,
               GenreId=movie.GenreId,
               
            };
            await _repo.Create(mappedData);
           await _repo.CreateMany(mappedData,movie.qualityIds);


        }
        public async Task<List<MovieVideoDto>> MovieVideos()
        {
            var movies =await _repo.GetAll();
            return _mapper.Map<List<MovieVideoDto>>(movies);
        }
        public async Task<List<MovieListDto>> Search(string searchText)
        {

            var searchDatas = await _repo.FindAllByExpression(m => m.Name.StartsWith(searchText));
            return _mapper.Map<List<MovieListDto>>(searchDatas);
        }


        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<MoviePageDto>> GetAll()
        {


            var movies = await _repo.GetAllT().Include(m => m.Genre).Include(m => m.MovieActresses)
            .ThenInclude(m => m.Actress).Include(m => m.MovieQualities)
            .ThenInclude(m => m.Quality).Where(e => !e.isDeleted).ToListAsync();

            return movies.Select(m => new MoviePageDto
            {
                Name = m.Name,
                Id=m.Id,
                Description = m.Description,
                AgeRestriction = m.AgeRestriction,
                Raiting = m.Raiting,
                Year = m.Year.Year,
                Genre = m.Genre.Name,
                BackgroundImage=m.BackgroundImage,
                Price = m.Price,
                ImageUrl = m.ImageUrl,
                VideoUrl=m.VideoUrl,
                GenreId = m.Genre.Id,
                Qualities = m.MovieQualities.Select(ma => new QualityListDto
                {
                    Name = ma.Quality.Name,


                }).ToList(),
            }).ToList();
        }
        


        public async Task<List<MoviePageDto>> MoviePage(int skip)
        {


            var movies = await _repo.GetAllT().Include(m => m.Genre).Include(m => m.MovieActresses)
            .ThenInclude(m => m.Actress).Include(m => m.MovieQualities)
            .ThenInclude(m => m.Quality).Where(e => !e.isDeleted).Skip((skip - 1) * 10).Take(10).ToListAsync();
            return movies.Select(m => new MoviePageDto
            {
                Name = m.Name,
                Id=m.Id,
                Description = m.Description,
                AgeRestriction = m.AgeRestriction,
                Raiting = m.Raiting,
                Year = m.Year.Year,
                Genre = m.Genre.Name,
                Price = m.Price,
                ImageUrl = m.ImageUrl,
                GenreId = m.Genre.Id,
                Qualities = m.MovieQualities.Select(ma => new QualityListDto
                {
                    Name = ma.Quality.Name,


                }).ToList(),
            }).ToList();
        }
        public async Task<float>Count()
        {
            var movies = await _repo.GetAll();
            float length = movies.Count();
            float movieCount =length/10;
            return movieCount;
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, MovieUpdateDto movie)
        {
            throw new NotImplementedException();
        }

        public async Task<(int,int)> FilterData()
        {
            List<Movie> movies = await _repo.GetAll();
            int minYear = movies.Min(m => m.Year.Year);
            int maxYear = movies.Max(m => m.Year.Year);

            return (minYear, maxYear);
        }
 
        public async Task<List<MoviePageDto>> MovieFilter(MovieFilterDto movieFilter, int skip)
        {
            IQueryable<Movie> query = _repo.GetAllT().Include(m=>m.MovieActresses)
                .ThenInclude(m=>m.Actress).Include(m=>m.MovieQualities)
                .ThenInclude(m=>m.Quality).Include(m=>m.Genre);


            if (movieFilter.raiting!=null)
            {
                
                query = query.Where(movie => movie.Raiting >= movieFilter.raiting[0] && movie.Raiting <= movieFilter.raiting[1]);
            }

            if (movieFilter.year!=null)
            {
                query = query.Where(movie => movie.Year.Year >= movieFilter.year[0] && movie.Year.Year <= movieFilter.year[1]);
            }

            if (!string.IsNullOrEmpty(movieFilter.quality))
            {
                query = query.Where(movie => movie.MovieQualities.FirstOrDefault().Quality.Name == movieFilter.quality);
            }

            if (!string.IsNullOrEmpty(movieFilter.genre))
            {
                query = query.Where(movie => movie.Genre.Name == movieFilter.genre);
            }
           var movies= await query.Where(m => !m.isDeleted).Take(10).Skip((skip - 1) * 10).ToListAsync();
            return movies.Select(m => new MoviePageDto
            {
                Name = m.Name,
                Id=m.Id,
                Description = m.Description,
                AgeRestriction = m.AgeRestriction,
                Raiting = m.Raiting,
                Year = m.Year.Year,
                Genre = m.Genre.Name,
                Price = m.Price,
                ImageUrl = m.ImageUrl,
                GenreId = m.Genre.Id,
                Qualities = m.MovieQualities.Select(ma => new QualityListDto
                {
                    Name = ma.Quality.Name,


                }).ToList(),
            }).ToList();

         
        }

        public async Task<MoviePageDto> Get(int id)
        {
            IQueryable<Movie> query = _repo.GetAllT().Include(m => m.MovieActresses)
                    .ThenInclude(m => m.Actress).Include(m => m.MovieQualities)
                    .ThenInclude(m => m.Quality).Include(m => m.Genre);
           Movie movie=await query.Where(m => !m.isDeleted).FirstOrDefaultAsync(m => m.Id == id);
            MoviePageDto moviePage = new()
            {
                AgeRestriction = movie.AgeRestriction,
                ImageUrl = movie.ImageUrl,
                Description = movie.Description,
                Name = movie.Name,
                Raiting = movie.Raiting,
                VideoUrl = movie.VideoUrl,
                Year = movie.Year.Year,
                Id = movie.Id,
                BackgroundImage = movie.BackgroundImage,
                Price = movie.Price,
                Qualities = movie.MovieQualities.Select(ma => new QualityListDto
                {
                    Name = ma.Quality.Name,


                }).ToList(),
                Genre=movie.Genre.Name,
                GenreId=movie.GenreId
            };
           
            return moviePage;
        }
 
        public async Task<string> Upload(IFormFile file)
        {
            if (file == null || file.Length <= 0)
            {
                return null;
            }

            string uniqueFileName = $"{Guid.NewGuid()}_{file.FileName}";


            GoogleCredential credential = GoogleCredential.FromFile(@"C:\Users\HP\Desktop\Final Project\server\App\App\myfilmproject-6df0eb86f541.json");
            var storageClient = await StorageClient.CreateAsync(credential);


            await storageClient.UploadObjectAsync(BucketName, uniqueFileName, null, file.OpenReadStream());

            var url = $"https://storage.googleapis.com/{BucketName}/{uniqueFileName}";
            return url;
        }

    }
}
