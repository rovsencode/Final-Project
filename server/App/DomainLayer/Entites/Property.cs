using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class Property:BaseEntity
    {
        public string  Name { get; set; }
        public int PlanId { get; set; }
        public PricingPlans Plan { get; set; }
    }
}
