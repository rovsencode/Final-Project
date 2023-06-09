using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class QualityController : ControllerBase
    {
        private readonly IQualityService _qualityService;

        public QualityController(IQualityService qualityService)
        {
            _qualityService = qualityService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _qualityService.GetAll());
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody]QualityCreateDto quality)
        {
            await _qualityService.Create(quality);
            return Ok();
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetOne([FromRoute]int id)
        {
            return Ok(await _qualityService.GetOne(id));
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Update([FromRoute] int id,[FromBody]QualityUpdateDto quality)
        {
            await _qualityService.Update(id, quality);
            return Ok();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> SoftDelete([FromRoute] int id)
        {
            await _qualityService.SoftDelete(id);
            return Ok();
        }
    }
}
