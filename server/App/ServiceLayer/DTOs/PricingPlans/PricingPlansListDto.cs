using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.PricingPlans
{
    public class PricingPlansListDto
    {
        public string PlanName { get; set; }
        public string Property { get; set; }
        public double Price { get; set; }
    }
}
