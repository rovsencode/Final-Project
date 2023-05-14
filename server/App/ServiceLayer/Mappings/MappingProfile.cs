using AutoMapper;
using DomainLayer.Entites;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.DTOs.PricingPlans;
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
            CreateMap<PricingPlansCreateDto, PricingPlans>();
            CreateMap<PricingPlans, PricingPlansListDto>();
            CreateMap<PricingPlansUpdateDto, PricingPlans>();
            CreateMap<FaqCreateDto, Faq>();
            CreateMap<Faq, FaqListDto>();
            CreateMap<FaqUpdateDto, Faq>();
            CreateMap<MovieCreateDto, Movie>();
            CreateMap<Movie, MovieCreateDto>();

            CreateMap<Movie, MovieListDto>();
            CreateMap<MovieUpdateDto, Movie>();


        }
    }
}
