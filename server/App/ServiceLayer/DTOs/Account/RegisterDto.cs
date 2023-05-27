using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Account
{
    public class RegisterDto
    {
        public string ?Username { get; set; }
        public string ?FullName { get; set; }
        [DataType(DataType.Password)]
        public string ?Email { get; set; }
        public string ?Password { get; set; }
        [DataType(DataType.Password), Compare(nameof(Password))]
        public string? RePassword { get; set; }
    }
}
