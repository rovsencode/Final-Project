using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
        public async Task<IActionResult> GetDatas()
        {
            return Ok(await _qualityService.GetAll());
        }
    }
}
