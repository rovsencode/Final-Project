using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.PropertyDto
{
    public class PropertyListDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PlanId { get; set; }
    }
}
