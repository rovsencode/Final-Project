using DomainLayer.Entites;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Comment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services.Interfaces
{
    public interface ICommentService
    {
        public Task<ApiResponse> Add(CommentCreateDto commentCreateDto);
        public Task<ApiResponse> Delete(int CommentId);
        public Task<List<CommentListDto>> GetComments(int movieId);
    }
}
