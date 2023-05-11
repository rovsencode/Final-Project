using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Social;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface ISocialService
    {
        Task Create(SocialCreateDto social);
        Task<List<SocialListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
        Task Update(int id, SocialUpdateDto social);
    }
}
