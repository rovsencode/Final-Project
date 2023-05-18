using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FaqController : ControllerBase
    {
        private readonly IFaqService _faqService;

        public FaqController(IFaqService faqService)
        {
            _faqService = faqService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _faqService.GetAll());
        }
    }
}
