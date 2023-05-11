using AutoMapper;
using DomainLayer.Entites;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.DTOs.Social;
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
            CreateMap<PartnersCreateDto, Partners>();
            CreateMap<Partners, PartnersListDto>();
            CreateMap<PartnersUpdateDto, Partners>();
            CreateMap<SocialCreateDto, Social>();
            CreateMap<Social, SocialListDto>();
            CreateMap<SocialUpdateDto, Social>();


        }
    }
}
