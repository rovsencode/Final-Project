using DomainLayer.Entites;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Repostories
{
    public class PartnerRepository : Repository<Partners>, IPartnerRepository
    {
        public PartnerRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }
    }
}
