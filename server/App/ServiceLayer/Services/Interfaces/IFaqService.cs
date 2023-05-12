using ServiceLayer.DTOs.EpisodeDto;
using ServiceLayer.DTOs.Faq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IFaqService
    {
        Task Create(FaqCreateDto faq);
        Task Update(int id, FaqUpdateDto faq);
        Task<List<FaqListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
   
    }
}
