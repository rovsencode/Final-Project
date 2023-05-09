using DomainLayer.Common;
using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories
{
    public class Repository<T> : IRepository<T> where T : BaseEntity
    {
        private readonly AppDbContext _appDbContext;
        private  DbSet<T> _entites;

        public Repository(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
            _entites = _appDbContext.Set<T>();
        }

        public  Task Create(T entity)
        {
            throw new NotImplementedException();
        }

        public  Task Delete(T entity)
        {
            throw new NotImplementedException();
        }

        public async Task<T> Get(int id)
        {
            return await _entites.FindAsync(id)  ?? throw new NotImplementedException();
           
        }

        public async Task<List<T>> GetAll()
        {
          return await  _entites.ToListAsync();
        }

        public  Task Update(T entity)
        {
            throw new NotImplementedException();
        }
    }
}
