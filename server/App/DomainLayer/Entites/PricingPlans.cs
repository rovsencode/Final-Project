using DomainLayer.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class PricingPlans:BaseEntity
    {
        public string PlanName { get; set; }
        public List<Property> Properties { get; set; }
        public double Price { get; set; }
    }
}
