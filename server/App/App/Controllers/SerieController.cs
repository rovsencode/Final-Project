using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.SerieDto;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SerieController : ControllerBase
    {
        private readonly ISerieService _serieService;

        public SerieController(ISerieService serieService)
        {
            _serieService = serieService;
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] SerieCreateDto serie)
        {
           await _serieService.Create(serie);
            return Ok();
        } 
    }
}
