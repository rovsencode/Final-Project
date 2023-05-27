﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Account
{
    public class LoginDto
    {
        [DataType(DataType.EmailAddress)]
        public string ?Email { get; set; }
        public string ?Password { get; set; }
      
    }
}
