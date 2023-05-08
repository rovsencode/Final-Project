using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    internal class Contact:BaseEntity
    {
        public string PhoneNumber { get; set; }
        public string MailAccount { get; set; }
    }
}
