using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.ActressDto;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ActressController : ControllerBase
    {
        private readonly IActressService _actressService;
        public ActressController(IActressService actressService)
        {
            _actressService = actressService;
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] ActressCreateDto actress)
        {
            if (actress == null) return NotFound();
            await _actressService.Create(actress);
            return Ok();
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _actressService.GetAll());
        }
            
            }
}
