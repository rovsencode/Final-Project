﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer.Common
{
    public abstract class BaseEntity
    {
        public int Id { get; set; }
        public bool isDeleted { get; set; }
        public DateTime CreatedTime { get; set; }
    }
}
