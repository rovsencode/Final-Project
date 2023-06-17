using DomainLayer.Entites;
using ServiceLayer.DTOs.Account;
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
        Task<ApiResponse> Create(PricingPlansCreateDto plan);
        Task<ApiResponse> ChoosePlan(ChoosePlanDto plan);
        Task Update(int id, PricingPlansUpdateDto plan);
        Task<List<PricingPlansListDto>> GetAll();
        Task<PricingPlans> Get(int id);
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
