using Microsoft.AspNetCore.Http;
using ServiceLayer.DTOs.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IAccountService
    {
        Task<string?> Login(LoginDto model);
        Task<ApiResponse> Register(RegisterDto model,HttpRequest request);
        Task CreateRole(RoleDto model);
        Task<string?> ConfirmEmail(string userId, string token);
    }
}
