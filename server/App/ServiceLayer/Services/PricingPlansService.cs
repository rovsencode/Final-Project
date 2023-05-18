﻿using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.DTOs.PricingPlans;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class PricingPlansService : IPricingPlansService
    {
        private readonly IPricingPlansRepository _repo;
        private readonly IMapper _mapper;

        public PricingPlansService(IMapper mapper, IPricingPlansRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }


        public async Task Create(PricingPlansCreateDto plan)
        {
            var mappedData = _mapper.Map<PricingPlans>(plan);
            await _repo.Create(mappedData);
        }

        public async Task Delete(int id)
        {
            var faq = await _repo.Get(id);
            if (faq == null) throw new ArgumentNullException();
            await _repo.Delete(faq);
        }
        public async Task SoftDelete(int id)
        {
            var faq = await _repo.Get(id);
            if (faq == null) throw new ArgumentNullException();
            await _repo.SoftDelete(faq);
        }

        public async Task<List<PricingPlansListDto>> GetAll()
        {
            var plans = await _repo.GetAll();
            return _mapper.Map<List<PricingPlansListDto>>(plans);
        }

        public async Task Update(int id, PricingPlansUpdateDto plan)
        {

            var dbPlan = await _repo.Get(id);
            _mapper.Map(plan, dbPlan);
            await _repo.Update(dbPlan);
        }

        public Task<List<PricingPlans>> PlansProperty()
        {
            throw new NotImplementedException();
        }
        //public async Task<List<PricingPlans>> PlansProperty()
        //{
        //    var includeProperties = new Expression<Func<PricingPlans, object>>[]
        //    {
        //    p => p.Properties
        //    };

        //    return _repo.GetAllIncluding();
        //}
    }
}