using DomainLayer.Entites;
using Google.Cloud.Storage.V1;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;
using Google.Apis.Auth.OAuth2;
using ServiceLayer.DTOs.Account;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieService _movieService;
        private static readonly string[] Summaries = new[]
     {
        "Freezing", "Bracing", "Chilly", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

        public MovieController(IMovieService movieService)
        {
            _movieService = movieService;
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromForm] MovieCreateDto movie)
        {
            if (movie == null) return NotFound();

            return Ok(await _movieService.Create(movie));
        }
        [HttpPost]
        public async Task<IActionResult> Like([FromBody]MovieRaitingDto movieRaitingDto)
        {
            return Ok(await _movieService.Like(movieRaitingDto));  
        }
        [HttpPost]
        public async Task<IActionResult> DisLike([FromBody] MovieRaitingDto movieRaitingDto)
        {
            return Ok(await _movieService.DisLike(movieRaitingDto));
        }
        [HttpGet]
        public async Task<IActionResult> RandomMovies()
        {
            return Ok(await _movieService.Random());
        }
        public class WeatherForecast
        {
            public DateTime Date { get; set; }

            public int TemperatureC { get; set; }

            public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

            public string? Summary { get; set; }

        }
        [HttpGet]
        public  IEnumerable<WeatherForecast> GetAll()
        {
          
            //return Ok(await _movieService.GetAll());
            return  Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
            })
         .ToArray();

        }
        [HttpGet("{skip}")]
        public async Task<IActionResult> MovieCatalog([FromRoute]int skip)
        {
           
            return Ok(await _movieService.MoviePage(skip));
        }
        [HttpGet]
        public async Task<IActionResult> MovieCount()
        {
            

            return Ok(await _movieService.Count());
        }
        [HttpGet("{search}")]
        public async Task<IActionResult> Search([FromRoute]string search)
        {
            return Ok(await _movieService.Search(search));
        }
        [HttpPost]
        public async Task<IActionResult> GetOne([FromBody] MovieGetOneDto movieGetOneDto)
        {
            return Ok(await _movieService.Get(movieGetOneDto));
        }

        [HttpGet]
        public async Task<IActionResult> FilterData()
        {
            var result = await _movieService.FilterData();
            var response = new { MinYear = result.Item1, MaxYear = result.Item2 };
            return Ok(response);
        }
        [HttpGet]
        public async Task<IActionResult> FilterPage([FromQuery] MovieFilterDto movieFilter)
        {
            int skip = 1;

            return Ok(await _movieService.MovieFilter(movieFilter, skip));
        }
        [HttpGet]
        public async Task<IActionResult> MovieVideo()
        {
            return Ok(await  _movieService.MovieVideos());
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute]int id)
        {
            await _movieService.SoftDelete(id);
            return Ok();

        }
        [HttpPost]
        public async Task<IActionResult> Update([FromRoute] int id,MovieUpdateDto movie)
        {
            await _movieService.Update(id, movie);
            return Ok();
        }







    }
}

