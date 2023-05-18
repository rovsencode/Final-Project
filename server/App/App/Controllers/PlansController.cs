using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
    }
}
