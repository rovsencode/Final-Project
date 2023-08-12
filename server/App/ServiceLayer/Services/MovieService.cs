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
using ServiceLayer.DTOs.Account;
using Microsoft.AspNetCore.Identity;
using RepositoryLayer.Data;

namespace ServiceLayer.Services
{
    public class MovieService : IMovieService
    {
        private readonly IMovieRepository _repo;
        private readonly UserManager<AppUser> _userManager;
        private readonly IMapper _mapper;
        private const string BucketName = "my-films-1207";



        public MovieService(IMapper mapper, IMovieRepository repo, UserManager<AppUser> userManager = null)
        {
            _mapper = mapper;
            _repo = repo;
            _userManager = userManager;
        }



        public async Task<ApiResponse> Create(MovieCreateDto movie)
        {


            Movie mappedData = new()
            {
               Name=movie.Name,
               AgeRestriction=movie.AgeRestriction,
               Description=movie.Description,
               ImageUrl=await Upload(movie.ImageUrl),
               Raiting=movie.Raiting,
               BackgroundImage=await Upload(movie.BackgroundImage),
                VideoUrl=await Upload(movie.VideoUrl),
               Year=movie.Year,
               GenreId=movie.GenreId,    
            };
            await _repo.Create(mappedData);
            await _repo.CreateMany(mappedData, movie.qualityIds);

            return new ApiResponse { Errors = null, StatusCode = 200, };
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


        public async Task Delete(int id)
        {
         var movie= await  _repo.Get(id);
            await _repo.Delete(movie);
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

        public async Task SoftDelete(int id)
        {
            var movie = await _repo.Get(id);
            await _repo.SoftDelete(movie);
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

        public async Task<MoviePageDto> Get(MovieGetOneDto movieDto)
        {
            bool LikeActive = false;
            bool DisLikeActive = false;
            IQueryable<Movie> query = _repo.GetAllT().Include(m => m.MovieActresses)
                    .ThenInclude(m => m.Actress).Include(m => m.MovieQualities)
                    .ThenInclude(m => m.Quality).Include(m => m.MovieRaitings).ThenInclude(m => m.User).Include(m => m.Genre);
            Movie movie = await query.Where(m => !m.isDeleted).FirstOrDefaultAsync(m => m.Id == movieDto.MovieId);
            AppUser user = await _userManager.FindByNameAsync(movieDto.UserName);
            if (movie != null && movie.MovieRaitings.FirstOrDefault() != null && movie.MovieRaitings.FirstOrDefault().User.UserName == user.UserName)
            {
                LikeActive = movie.MovieRaitings.FirstOrDefault().LikeActive;
                DisLikeActive = movie.MovieRaitings.FirstOrDefault().DisLikeActive;
            }
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
                LikeActive = LikeActive,
               DislikeActive = DisLikeActive,
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

            GoogleCredential credential;
            using (var stream = new FileStream(@"C:\Users\HP\Desktop\Final Project\server\App\App\myfilmproject-6df0eb86f541.json", FileMode.Open))
            {
                credential = await GoogleCredential.FromStreamAsync(stream,CancellationToken.None);
            }

            var storageClient = await StorageClient.CreateAsync(credential);

            using (var memoryStream = new MemoryStream())
            {
                await file.CopyToAsync(memoryStream);
                memoryStream.Position = 0;

                var options = new UploadObjectOptions
                {
                    PredefinedAcl = PredefinedObjectAcl.PublicRead // Burada dosyayı genel olarak erişilebilir hale getiriyoruz
                };

                await storageClient.UploadObjectAsync(BucketName, uniqueFileName, null, memoryStream, options);
            }

            var url = $"https://storage.googleapis.com/{BucketName}/{uniqueFileName}";
            return url;
        }

        public async Task<MoviePointDto> Like(MovieRaitingDto movieRaitingDto)
        {
            AppUser user = await _userManager.FindByNameAsync(movieRaitingDto.UserName);
            var movie = _repo.GetAllT().Include(m => m.MovieRaitings).ThenInclude(m => m.User)
                .Where(m => !m.isDeleted).FirstOrDefault(m => m.Id == movieRaitingDto.Id);
            var existMovieRaiting = movie.MovieRaitings.FirstOrDefault(m => m.MovieId == movieRaitingDto.Id && m.UserId == user.Id);


            movie.LikeCount = movie.LikeCount + 1;
            movie.Raiting = movie.Raiting + 0.1f;
            if (existMovieRaiting == null)
            {
                movie.MovieRaitings = new List<MovieRaiting>();
                MovieRaiting movieRaiting = new MovieRaiting();
                movieRaiting.MovieId = movieRaitingDto.Id;
                movieRaiting.UserId = user.Id;
                movieRaiting.LikeActive = true;
                movieRaiting.DisLikeActive = false;
                movie.MovieRaitings.Add(movieRaiting);
            }
            else
            {
                existMovieRaiting.LikeActive = true;
                existMovieRaiting.DisLikeActive = false;

            }
                await _repo.SavaChanges();
            MoviePointDto moviePointDto= new MoviePointDto();
            moviePointDto.Raiting = movie.Raiting;
            moviePointDto.LikeActive = true;
            moviePointDto.DisLikeActive = false;
            return moviePointDto;

        }

        public async Task<MoviePointDto> DisLike(MovieRaitingDto movieRaitingDto)
        {
            AppUser user = await _userManager.FindByNameAsync(movieRaitingDto.UserName);
            var movie = _repo.GetAllT().Include(m => m.MovieRaitings).ThenInclude(m => m.User)
                .Where(m => !m.isDeleted).FirstOrDefault(m => m.Id == movieRaitingDto.Id);
            var existMovieRaiting = movie.MovieRaitings.FirstOrDefault(m => m.MovieId == movieRaitingDto.Id && m.UserId == user.Id);


            movie.DisLikeCount = movie.DisLikeCount + 1;
            movie.Raiting = movie.Raiting - 0.1f;
            if (existMovieRaiting == null)
            {
                movie.MovieRaitings = new List<MovieRaiting>();
                MovieRaiting movieRaiting = new MovieRaiting();
                movieRaiting.MovieId = movieRaitingDto.Id;
                movieRaiting.UserId = user.Id;
                movieRaiting.LikeActive = false ;
                movieRaiting.DisLikeActive = true;
                movie.MovieRaitings.Add(movieRaiting);
            }
            else
            {
                existMovieRaiting.LikeActive = false;
                existMovieRaiting.DisLikeActive = true;

            }
            await _repo.SavaChanges();
            MoviePointDto moviePointDto = new MoviePointDto();
            moviePointDto.Raiting = movie.Raiting;
            moviePointDto.LikeActive = false;
            moviePointDto.DisLikeActive = true;
            return moviePointDto;
        }
    }
}
