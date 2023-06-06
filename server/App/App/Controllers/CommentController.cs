﻿using DomainLayer.Entites;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ServiceLayer.DTOs.Comment;
using ServiceLayer.Services.Interfaces;

namespace App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly ICommentService _commentService;

        public CommentController(ICommentService commentService)
        {
            _commentService = commentService;
        }
        [HttpPost]
        public async Task<IActionResult> Create(CommentCreateDto comment)
        {
            return Ok(await _commentService.Add(comment));
        }
        [HttpDelete("{commentId}")]
        public async Task<IActionResult> Delete([FromRoute]int commentId)
        {
            return Ok(await _commentService.Delete(commentId));
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _commentService.GetComments());
        }

    }
}
