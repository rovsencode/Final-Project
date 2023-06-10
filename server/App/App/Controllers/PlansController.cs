using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PlansController : ControllerBase
    {
        private readonly IPricingPlansService _pricingPlansService;

        public PlansController(IPricingPlansService pricingPlansService)
        {
            _pricingPlansService = pricingPlansService;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {

            return Ok(await _pricingPlansService.GetAll());
        }
        [HttpPost]
        public async Task<IActionResult> Create(PricingPlansCreateDto pricingPlans)
        {
            await _pricingPlansService.Create(pricingPlans);
            return Ok();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute]int id)
        {
            await _pricingPlansService.SoftDelete(id);
            return Ok();
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id,PricingPlansUpdateDto pricingPlans)
        {
            await _pricingPlansService.Update(id,pricingPlans);
            return Ok();
        }
    }
}
