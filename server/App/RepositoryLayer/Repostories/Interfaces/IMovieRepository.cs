using DomainLayer.Entites;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories.Interfaces
{
    public interface IMovieRepository: IRepository<Movie>
    {


        public Task CreateMany(Movie movie, int[] actressIds,int[] qualityIds);
     
    }
}
