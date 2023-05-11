using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Contact;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class ContactService : IContactService
    {
        private readonly IContactRepository _repo;
        private readonly IMapper _mapper;

        public ContactService(IContactRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        public async Task Create(ContactCreateDto contact)
        {
            var mappedData = _mapper.Map<Contact>(contact);
            await _repo.Create(mappedData);
        }

        public async Task Delete(int id)
        {
            var contact = await _repo.Get(id);
            if (contact == null) throw new ArgumentNullException();
            await _repo.Delete(contact);
        }
        public async Task SoftDelete(int id)
        {
            var contact = await _repo.Get(id);
            if (contact == null) throw new ArgumentNullException();
            await _repo.SoftDelete(contact);
        }

        public async Task<List<ContactListDto>> GetAll()
        {
            var contacts = await _repo.GetAll();
            return  _mapper.Map<List<ContactListDto>>(contacts);
        }

        public async Task Update(int id, ContactUpdateDto contact)
        {
         
                var dbContact = await _repo.Get(id);
                _mapper.Map(contact, dbContact);
                await _repo.Update(dbContact);

    


        }

        public async Task<List<ContactListDto>> Search(string searchText)
        {

            var searchDatas= await _repo.FindAllByExpression(m => m.MailAccount.StartsWith(searchText));
    return    _mapper.Map<List<ContactListDto>>(searchDatas);
        }
    }
}
