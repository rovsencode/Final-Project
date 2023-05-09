using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Contact
{
    public class ContactUpdateDto
    {
        public string PhoneNumber { get; set; }
        public string MailAccount { get; set; }
    }
}
