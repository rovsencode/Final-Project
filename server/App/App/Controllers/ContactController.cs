using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.Services;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        private readonly IContactService _contactService;

        public ContactController(IContactService contactService)
        {
            _contactService = contactService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody]ContactCreateDto contact)
        {
            await _contactService.Create(contact);
            return Ok();
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _contactService.GetAll());
        }
        [HttpDelete("{id}")]
     
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
           await _contactService.Delete(id);
            return Ok();
        }
       
    }
}
