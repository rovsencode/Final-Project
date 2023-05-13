using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.DTOs.Faq;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class FaqService : IFaqService
    {
        private readonly IFaqRepository _repo;
        private readonly IMapper _mapper;

        public FaqService(IMapper mapper, IFaqRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(FaqCreateDto faq)
        {
            var mappedData = _mapper.Map<Faq>(faq);
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

        public async Task<List<FaqListDto>> GetAll()
        {
            var faqs = await _repo.GetAll();
            return _mapper.Map<List<FaqListDto>>(faqs);
        }

        public async Task Update(int id, FaqUpdateDto faq)
        {

            var dbFaq = await _repo.Get(id);
            _mapper.Map(faq, dbFaq);
            await _repo.Update(dbFaq);




        }

    }
}
