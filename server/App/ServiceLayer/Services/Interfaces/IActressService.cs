using DomainLayer.Entites;
using ServiceLayer.DTOs.ActressDto;
using ServiceLayer.DTOs.Contact;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IActressService
    {
        Task Create(ActressCreateDto actress);
        Task Update(int id, ActressUpdateDto actress);

        Task<List<ActressListDto>> GetAll();
        Task Delete(int id);
        Task SoftDelete(int id);
    }
}
