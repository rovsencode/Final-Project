using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.Services;
using ServiceLayer.Services.Interfaces;
using System.ComponentModel.DataAnnotations;

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
        public async Task<IActionResult> Create([FromBody] ContactCreateDto contact)
        {
        
            return Ok(await _contactService.Create(contact));
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _contactService.GetAll());
        }
        [HttpGet]
        public async Task<IActionResult> GetLast()
        {
            return Ok(await _contactService.GetLast());
        }

        [HttpDelete("{id}")]
     
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
           await _contactService.Delete(id);
            return Ok();
        }
        [HttpPost("{id}")]

        public async Task<IActionResult> SoftDelete([FromRoute] int id)
        {
            await _contactService.SoftDelete(id);
            return Ok();
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> Update([FromRoute] int id,ContactUpdateDto contact)
        {
            try
            {
                await _contactService.Update(id, contact);
                return Ok();
            }
            catch (Exception)
            {

                return NotFound();
            }
        
        }
        [HttpGet]
       public async Task<IActionResult> Search(string search)
        {
            return  Ok(await _contactService.Search(search));
        }


    }
}
