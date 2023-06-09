using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.GenreDto;
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

            return Ok(await _genreService.Create(genre));
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {   
            return Ok(await _genreService.GetAll());
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Update([FromRoute]int id,GenreUpdateDto genre)
        {
            return Ok(await _genreService.Update(id, genre));
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> Get([FromRoute] int id)
        {
            return Ok(await _genreService.GetOne(id));
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> SoftDelete([FromRoute] int id)
        {
            await _genreService.SoftDelete(id);
            return Ok();
        }
    }
}
