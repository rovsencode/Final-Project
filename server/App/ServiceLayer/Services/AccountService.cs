using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Identity;
using ServiceLayer.DTOs.Account;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class AccountService : IAccountService
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IMapper _mapper;

        public AccountService(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, IMapper mapper)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _mapper = mapper;
        }
        
        public Task Login(LoginDto model)
        {
            throw new NotImplementedException();
        }

        public async Task<ApiResponse> Register(RegisterDto model)
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
            return new ApiResponse { Errors = null, StatusMessage = "Success" };


        }
    }
}
