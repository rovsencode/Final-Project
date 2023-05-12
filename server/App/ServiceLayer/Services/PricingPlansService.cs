using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class PricingPlansService : IPricingPlansService
    {
        public Task Create(PricingPlansCreateDto plan)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<PricingPlansListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, PricingPlansUpdateDto plan)
        {
            throw new NotImplementedException();
        }
    }
}
