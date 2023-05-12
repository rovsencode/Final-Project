using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PartnerController : ControllerBase
    {
        private readonly IPartnerService _partnerService;

        public PartnerController(IPartnerService partnerService)
        {
            _partnerService = partnerService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] PartnersCreateDto partner)
        {
            await _partnerService.Create(partner);
            return Ok();
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _partnerService.GetAll());
        }
        [HttpDelete("{id}")]

        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _partnerService.Delete(id);
            return Ok();
        }
        [HttpPost("{id}")]

        public async Task<IActionResult> SoftDelete([FromRoute] int id)
        {
            await _partnerService.SoftDelete(id);
            return Ok();
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, PartnersUpdateDto partner)
        {
            try
            {
                await _partnerService.Update(id, partner);
                return Ok();
            }
            catch (Exception)
            {

                return NotFound();
            }

        }
        [HttpGet]
        public async Task<IActionResult> GetAny()
        {
            return Ok(await _partnerService.GetAny());
        }

    }
}
