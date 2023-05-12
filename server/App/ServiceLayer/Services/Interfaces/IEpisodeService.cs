using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.EpisodeDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IEpisodeService
    {
        Task Create(EpisodeCreateDto episode);

        Task<List<EpisodeListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
        Task Update(int id, EpisodeUpdateDto episode);
    }
}
