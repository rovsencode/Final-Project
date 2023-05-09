﻿using DomainLayer.Entites;
using ServiceLayer.DTOs.Contact;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface IContactService
    {
        Task Create(ContactCreateDto contact);
        Task<List<ContactListDto>> GetAll();
        Task Delete(int id);
        
    }
}
