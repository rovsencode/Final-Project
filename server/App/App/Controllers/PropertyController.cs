using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.Services;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PropertyController : ControllerBase
    {
        private readonly IPropertyService _propertyService;

        public PropertyController(IPropertyService propertyService)
        {
            _propertyService = propertyService;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _propertyService.GetAll());
        }
        [HttpPost]
        public async Task<IActionResult> Create(PropertyCreateDto property)
        {
      
            return Ok(await _propertyService.Create(property));
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _propertyService.SoftDelete(id);
            return Ok();
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, PropertyUpdateDto property)
        {
            await _propertyService.Update(id, property);
            return Ok();
        }
    }
}
