using ServiceLayer.DTOs.Actress;
using ServiceLayer.DTOs.QualityDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IQualityService
    {
        Task Create(QualityCreateDto quality);
        Task Update(int id, QualityUpdateDto quality);

        Task<List<QualityListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
