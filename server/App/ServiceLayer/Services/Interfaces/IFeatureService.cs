using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.FeatureDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IFeatureService
    {
        Task Create(FeatureCreateDto feature);

        Task<List<FeatureListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
        Task Update(int id, FeatureUpdateDto feature);
   

    }
}
