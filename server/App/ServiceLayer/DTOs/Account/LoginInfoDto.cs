using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Account
{
    public class LoginInfoDto
    {
        public string ?Token { get; set; }
        public string ?UserName { get; set; }
    }
}
