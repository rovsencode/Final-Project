using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IActress
    {
        Task Create(Actress actress);
        Task<List<Actress>> GetAll();
    }
}
