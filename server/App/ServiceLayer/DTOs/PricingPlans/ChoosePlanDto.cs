using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 

namespace ServiceLayer.DTOs.PricingPlans
{
    public class ChoosePlanDto
    {
        public string UserName { get; set; }
        public int PlanId { get; set; }
    }
}
