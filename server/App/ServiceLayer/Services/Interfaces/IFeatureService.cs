using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IFeatureService
    {
        Task Create(FaqCreateDto faq);

        Task<List<FaqListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
        Task Update(int id, FaqUpdateDto contact);
        Task<FaqListDto> GetLast();

    }
}
