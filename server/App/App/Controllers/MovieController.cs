using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.GenreDto;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieService _movieService;

        public MovieController(IMovieService movieService)
        {
            _movieService = movieService;
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] MovieCreateDto movie)
        {
            if (movie == null) return NotFound();
            await _movieService.Create(movie);
            return Ok();
        }
        [HttpGet]
        public async Task<IActionResult> GetAll(int skip)
        {
            return Ok(await _movieService.GetAll());
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

        [HttpGet]
        public async Task<IActionResult> FilterData()
        {
            var result = await _movieService.FilterData();
            var response = new { MinYear = result.Item1, MaxYear = result.Item2 };
            return Ok(response);
        }
        [HttpGet]
        public async Task<IActionResult> FilterPage([FromQuery] MovieFilterDto? movieFilter)
        {
            int skip = 1;

            return Ok(await _movieService.MovieFilter(movieFilter, skip));
        }
        [HttpGet]
        public async Task<IActionResult> MovieVideo()
        {
            return Ok(await  _movieService.MovieVideos());
        }






    }
}

