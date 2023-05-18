using AutoMapper;
using DomainLayer.Entites;
using ServiceLayer.DTOs.Actress;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.FeatureDto;
using ServiceLayer.DTOs.Genre;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.DTOs.SerieDto;
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
            CreateMap<Movie, MovieListDto>();
            CreateMap<MovieUpdateDto, Movie>();
            CreateMap<ActressCreateDto, Actress>();
            CreateMap<Actress, ActressListDto>();
            CreateMap<ActressUpdateDto, Actress>();
            CreateMap<SerieCreateDto, Serie>();
            CreateMap<Serie, SerieListDto>();
            CreateMap<SerieUpdateDto, Serie>();
            CreateMap<GenreCreateDto, Genre>();
            CreateMap<Genre, GenreListDto>();
            CreateMap<GenreUpdateDto, Genre>();
            CreateMap<QualityCreateDto, Quality>();
            CreateMap<Quality, QualityListDto>();
            CreateMap<QualityUpdateDto, Quality>();
            CreateMap<FeatureCreateDto, Feature>();
            CreateMap<Feature, FeatureListDto>();
            CreateMap<FeatureUpdateDto, Feature>();
            CreateMap<PropertyCreateDto, Property>();
            CreateMap<Property, PropertyListDto>();
            CreateMap <PropertyUpdateDto, Property>();
        }
    }
}
