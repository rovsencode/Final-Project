using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.DTOs.Comment
{
    public class CommentListDto
    {
        public int CommentId { get; set; }
        public string Message { get; set; }
        public string UserName { get; set; }
        public string CreatedTime { get; set; }


    }
}
