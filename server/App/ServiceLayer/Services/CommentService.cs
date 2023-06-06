using AutoMapper;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.Account;
using ServiceLayer.DTOs.Comment;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class CommentService : ICommentService
    {
        private readonly ICommentRepository _repo;
        private readonly IMapper _mapper;
        private readonly UserManager<AppUser> _userManager;

        public CommentService(ICommentRepository repo, UserManager<AppUser> userManager, IMapper mapper)
        {
            _repo = repo;
            _userManager = userManager;
            _mapper = mapper;
        }

        public async Task<ApiResponse> Add(CommentCreateDto commentCreateDto)
        {
            if (commentCreateDto == null)
            {
                new ApiResponse { StatusMessage = "Comment cannot be null", StatusCode = StatusCodes.Status400BadRequest };
            }
         AppUser dbUser = await _userManager.FindByNameAsync(commentCreateDto.UserName);
            if (dbUser == null)
            {
                new ApiResponse { StatusMessage = "User is not found ", StatusCode = StatusCodes.Status400BadRequest };
            }

            Comment comment = new()
            {
                AppUserId = dbUser.Id,
                Message = commentCreateDto.Message,
                MovieId = commentCreateDto.MovieId,
            };
           await  _repo.Create(comment);
            return new ApiResponse { StatusMessage = "Commen is added", StatusCode = StatusCodes.Status201Created };

    }

        public async Task<ApiResponse> Delete(int CommentId)
        {
           var comment= await _repo.Get(CommentId);
            await _repo.SoftDelete(comment);
            return new ApiResponse { StatusCode = StatusCodes.Status200OK };
        }

        public async Task<List<CommentListDto>> GetComments()
        {
           var comments=await _repo.GetAll();
            return comments.Select(c=> new CommentListDto
            {
                UserName=c.AppUser.UserName,
                Message=c.Message,
                CreatedTime=c.CreatedTime,
            }).ToList();
        }
    }
}
