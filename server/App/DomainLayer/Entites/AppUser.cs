using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Entites
{
    public class AppUser:IdentityUser
    {
        public string? FullName { get; set; }
        public List<Comment> Comments { get; set; }
        public List<MovieRaiting> MovieRaitings { get; set; }
        public int? PlanId { get; set; }
        public PricingPlans Plan { get; set; }

    }
}
