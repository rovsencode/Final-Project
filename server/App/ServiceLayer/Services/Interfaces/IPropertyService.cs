using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.DTOs.PropertyDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IPropertyService
    {
        Task Create(PropertyCreateDto property);
        Task Update(int id, PropertyUpdateDto property);
        Task<List<PropertyListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
