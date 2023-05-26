using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using ServiceLayer.DTOs.Account;
using ServiceLayer.Services.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
 
        }

        [HttpPost]
        public async Task<ApiResponse> Register([FromBody] RegisterDto user)
        {

            return await _accountService.Register(user);
        }
        [HttpPost]
        public async Task<IActionResult> Login([FromBody] LoginDto user)
        {
            var result= await _accountService.Login(user);
            return Ok(result);
        }

    }
}
