﻿using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories.Interfaces
{
    public interface IRepository<T> where T : BaseEntity
    {
        Task<List<T>> GetAll();
        Task<T> Get(int id);
        Task<T> GetAny();
        Task<T> GetLast();
        Task Create(T entity);
        Task Update(T entity);
        Task Delete(T entity);
        Task SoftDelete(T entity);
        Task<List<T>> FindAllByExpression(Expression<Func<T,bool>> expression);
        Task<List<T>> Including(params Expression<Func<T, object>>[] includeProperties);
        public IQueryable<T> GetAllT();
        Task<List<T>> PageList(IQueryable<T> query,int skip);

    }
}
