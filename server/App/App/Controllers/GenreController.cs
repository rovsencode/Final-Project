using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Genre;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly IGenreService _genreService;
        public GenreController(IGenreService genreService)
        {
            _genreService = genreService;
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] GenreCreateDto genre)
        {
            if (genre == null) return NotFound();
            await _genreService.Create(genre);
            return Ok();
        }

        [HttpGet]
        public async Task<IActionResult> GetDatas()
        {   
            return Ok(await _genreService.GetAll());
        }
    }
}
