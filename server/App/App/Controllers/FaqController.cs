using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.Services;
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
        [HttpPost]
        public async Task<IActionResult> Create(FaqCreateDto faq)
        {
            await _faqService.Create(faq);
            return Ok();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _faqService.SoftDelete(id);
            return Ok();
        }
        [HttpPost("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id, FaqUpdateDto faq)
        {
            await _faqService.Update(id, faq);
            return Ok();
        }
    }
}
