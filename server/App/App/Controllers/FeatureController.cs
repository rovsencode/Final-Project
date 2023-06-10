using DomainLayer.Entites;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.FeatureDto;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.Services;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{

    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FeatureController : ControllerBase
    {
        private readonly IFeatureService _featureService;

        public FeatureController(IFeatureService featureService)
        {
            _featureService = featureService;
        }

  
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
           return Ok( await _featureService.GetAll());
        }
        [HttpPost]
        public async Task<IActionResult> Create(FeatureCreateDto feature)
        {
            await _featureService.Create(feature);
            return Ok();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _featureService.SoftDelete(id);
            return Ok();
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id, FeatureUpdateDto feature)
        {
            await _featureService.Update(id, feature);
            return Ok();
        }
    }
}
