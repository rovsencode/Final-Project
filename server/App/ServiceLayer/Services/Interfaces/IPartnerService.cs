using DomainLayer.Entites;
using ServiceLayer.DTOs.Partners;
using ServiceLayer.DTOs.Social;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IPartnerService
    {
        Task Create(PartnersCreateDto partner);
        Task<List<PartnersListDto>> GetAll();
        Task<Partners>Get(int id);
        Task<Partners> GetAny();

        Task Delete(int id);
        Task SoftDelete(int id);
        Task Update(int id, PartnersUpdateDto partner);
    }
}
