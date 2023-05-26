using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Account
{
    public class ApiResponse
    {
        public List<string>? Errors { get; set; }
        public string? StatusMessage { get; set; }
    }
}
