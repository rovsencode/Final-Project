using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
    }
}
