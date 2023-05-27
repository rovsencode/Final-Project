using AutoMapper;
using DomainLayer.Entites;
using MailKit.Security;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using MimeKit;
using ServiceLayer.DTOs.Account;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using MailKit.Net.Smtp;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Http;

namespace ServiceLayer.Services
{
    public class AccountService : IAccountService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserManager<AppUser> _userManager;
        private readonly IMapper _mapper;
        private readonly IConfiguration _config;
        private readonly RoleManager<IdentityRole> _roleManager;


        public AccountService(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, IMapper mapper, IConfiguration config, IHttpContextAccessor httpContextAccessor)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _mapper = mapper;
            _config = config;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task CreateRole(RoleDto model)
        {
            await _roleManager.CreateAsync(new IdentityRole { Name = model.Role});
        }

        public async Task<string?> Login(LoginDto model)
        {
            var dbUser=await _userManager.FindByEmailAsync(model.Email);
            if (!await _userManager.CheckPasswordAsync(dbUser, model.Password))
                return null;
            if(!dbUser.EmailConfirmed)
                return null;
            var roles = await _userManager.GetRolesAsync(dbUser);
            return  GenerateJwtToken(dbUser.UserName,(List<string>) roles);
        }

        public async Task<ApiResponse> Register(RegisterDto model, HttpRequest request)
        {
            var user=_mapper.Map<AppUser>(model);  
            IdentityResult result= await _userManager.CreateAsync(user,model.Password);
            if (!result.Succeeded)
            {
                ApiResponse response = new()
                {
                    Errors = result.Errors.Select(m => m.Description).ToList(),
                    StatusMessage = "Failed"
                };
                

                return response;
            }
            var dbUser = await _userManager.FindByEmailAsync(model.Email);
            var confirmEmailRoute = "ConfirmEmail"; // Doğru route adını buraya ekleyin
            var baseUrl = $"{request.Scheme}://{request.Host}";
            var token = await _userManager.GenerateEmailConfirmationTokenAsync(dbUser);
            var userId = await _userManager.GetUserIdAsync(dbUser);
            var encodedToken = Uri.EscapeDataString(token);
            var link = $"{baseUrl}/api/Account/{confirmEmailRoute}?userId={userId}&token={encodedToken}";
            await SendEmailConfirmationEmail(dbUser.Email, link);



            await _userManager.AddToRoleAsync(dbUser, "Member");    
            


            return new ApiResponse { Errors = null, StatusMessage = "Success" };

       



        }
        private string GenerateJwtToken(string username,List<string> roles)
        {
            var claims = new List<Claim>
        {
            new Claim(JwtRegisteredClaimNames.Sub, username),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim(ClaimTypes.NameIdentifier, username)
        };

            roles.ForEach(role =>
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            });

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.Now.AddDays(Convert.ToDouble(_config["Jwt:ExpireDays"]));

            var token = new JwtSecurityToken(
                _config["Jwt:Issuer"],
                _config["Jwt:Auidience"],
                claims,
                expires: expires,
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public async Task SendEmailConfirmationEmail(string email, string link)
        {
            var emailMessage = new MimeMessage();
            emailMessage.From.Add(new MailboxAddress("Rovsen", "rovshanakh@code.edu.az"));
            emailMessage.To.Add(new MailboxAddress("", email));
            emailMessage.Subject = "Confirm Your Email";
            emailMessage.Body = new TextPart("plain")
            {
                Text = $"Please click on the following link to confirm your email: {link}"
            };

            using (var client = new SmtpClient())
            {
                await client.ConnectAsync("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                await client.AuthenticateAsync("rovshanakh@code.edu.az", "lnxxosjsvskwuozk");
                await client.SendAsync(emailMessage);
                await client.DisconnectAsync(true);
            }
        }
        public async Task<string?> ConfirmEmail(string userId,string token)
        { 
            AppUser user = await _userManager.FindByIdAsync(userId);
            if (user == null) return null;
            await _userManager.ConfirmEmailAsync(user, token);

            return "email is confirmed successfuly";
          
        }
    }
}
