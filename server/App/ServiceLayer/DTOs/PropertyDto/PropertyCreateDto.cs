using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.PropertyDto
{
    public class PropertyCreateDto
    {
        public string Name { get; set; }
        public int PlanId { get; set; }
    }
}
