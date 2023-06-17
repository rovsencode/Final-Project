using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;
using RepositoryLayer.Repostories;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.MovieDto;
using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.DTOs.PropertyDto;
using ServiceLayer.DTOs.QualityDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Numerics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using static Org.BouncyCastle.Crypto.Engines.SM2Engine;

namespace ServiceLayer.Services
{
    public class PricingPlansService : IPricingPlansService
    {
        private readonly IPricingPlansRepository _repo;
        private readonly IMapper _mapper;
        private readonly UserManager<AppUser> _userManager;
        public PricingPlansService(IMapper mapper, IPricingPlansRepository repo, UserManager<AppUser> userManager)
        {
            _mapper = mapper;
            _repo = repo;
            _userManager = userManager;
        }


        public async Task<ApiResponse> Create(PricingPlansCreateDto plan)
        {
            var mappedData = _mapper.Map<PricingPlans>(plan);
            await _repo.Create(mappedData);
            return new ApiResponse { Errors = null, StatusCode = 200 };
        }

        public async Task Delete(int id)
        {
            var faq = await _repo.Get(id);
            if (faq == null) throw new ArgumentNullException();
            await _repo.Delete(faq);
        }
        public async Task SoftDelete(int id)
        {
            var faq = await _repo.Get(id);
            if (faq == null) throw new ArgumentNullException();
            await _repo.SoftDelete(faq);
        }

        public async Task<List<PricingPlansListDto>> GetAll()
        {
            var plans = await _repo.GetAllT().Where(p=>!p.isDeleted).Include(p => p.Properties).ToListAsync();

            return plans.Select(p => new PricingPlansListDto
            {
                PlanName = p.PlanName,
                Price = p.Price,
                Id= p.Id,
                Properties = p.Properties.Select(p => new Property
                {
                    Name = p.Name
                }).ToList(),
            }).ToList();

           
        }

        public async Task Update(int id, PricingPlansUpdateDto plan)
        {

            var dbPlan = await _repo.Get(id);
            _mapper.Map(plan, dbPlan);
            await _repo.Update(dbPlan);

        }

        public async Task<ApiResponse> ChoosePlan(ChoosePlanDto plan)
        {     
            AppUser user =await _userManager.FindByNameAsync(plan.UserName);
            PricingPlans existPlan=await _repo.Get(plan.PlanId);
            if (existPlan!=null)
            {
                user.PlanId= plan.PlanId; 
            }
           await _userManager.UpdateAsync(user);
            return new ApiResponse { Errors = null, StatusCode = 200 };
         }
        public async Task<PricingPlans> Get(int id)
        {
            IQueryable<PricingPlans> query = _repo.GetAllT().Include(p => p.Properties);
 
            PricingPlans plan = await query.Where(p => !p.isDeleted).FirstOrDefaultAsync(p => p.Id == id);
            PricingPlans planSort = new()
            {
                Id=plan.Id,
                PlanName=plan.PlanName,
               Price=plan.Price,
        
         
               
                Properties = plan.Properties.Select(pa => new Property
                {
                    Name = pa.Name,
                }).ToList(),
          
            };

            return planSort;
        }

    }
}
