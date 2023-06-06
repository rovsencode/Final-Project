using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Comment
{
    public class CommentListDto
    {
        public string Message { get; set; }
        public string UserName { get; set; }
        public DateTime CreatedTime { get; set; }


    }
}
