using DomainLayer.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories.Interfaces
{
    public interface ISerieRepository: IRepository<Serie>
    {
        public Task CreateMany(Serie serie, List<int> actressIds, List<int> seasonNumbers, List<int> episodes, string epiTitle, DateTime airDate);
        
    }
}
