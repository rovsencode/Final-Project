using DomainLayer.Common;
using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
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

        public  async Task Create(T entity)
        {
            if (entity == null) throw new ArgumentNullException();
            await _entites.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();
        }

        public  async Task SoftDelete(T entity)
        {
            if (entity == null) throw new ArgumentNullException();
            entity.isDeleted = true;
            await _appDbContext.SaveChangesAsync();
        }
        public async Task Delete(T entity)
        {
            if (entity == null) throw new ArgumentNullException();
            _entites.Remove(entity);
            await _appDbContext.SaveChangesAsync();
        }

        public Task<List<T>> Find(Expression<Func<T, bool>> expression)
        {
            throw new NotImplementedException();
        }

        public async Task<T> Get(int id)
        {
            return await _entites.FindAsync(id)  ?? throw new NullReferenceException();
           
        }

        public async Task<List<T>> GetAll()
        {
          return await  _entites.Where(e=>!e.isDeleted).ToListAsync();
        }

     

        public  async Task Update(T entity)
        {
            if (entity == null) throw new ArgumentNullException();
            _entites.Update(entity);
            await _appDbContext.SaveChangesAsync();
        }
    }
}
