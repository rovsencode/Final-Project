using AutoMapper;
using DomainLayer.Entites;
using ServiceLayer.DTOs.Contact;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Mappings
{
    public class MappingProfile :Profile
    {
        public MappingProfile()
        {
            CreateMap<ContactCreateDto, Contact>();
            CreateMap<Contact, ContactListDto>();
            CreateMap<ContactUpdateDto, Contact>();

        }
    }
}
