using ServiceLayer.DTOs.Actress;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class ActressService : IActressService
    {
        public Task Create(ActressCreateDto actress)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<ActressListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, ContactUpdateDto actress)
        {
            throw new NotImplementedException();
        }
    }
}
