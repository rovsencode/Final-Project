using DomainLayer.Entites;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.PricingPlans;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IPricingPlansService
    {
        Task<string> PlansProperty();
        Task Create(PricingPlansCreateDto plan);
        Task Update(int id, PricingPlansUpdateDto plan);
        Task<List<PricingPlansListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
