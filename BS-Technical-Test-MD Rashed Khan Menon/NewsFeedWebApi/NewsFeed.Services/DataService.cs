using Microsoft.EntityFrameworkCore;
using NewsFeed.Database;
using NewsFeed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace NewsFeed.Services
{
    public class DataService : IDataService
    {
        private readonly NewsFeedDbContext _context;
        public DataService(NewsFeedDbContext context)
        {
            _context = context;
        }

        public async Task<VMNewsFeed> GetNewsFeedData(string postName)
        {
            VMNewsFeed vMNewsFeed = new VMNewsFeed();
            try
            {
               
               if (string.IsNullOrEmpty(postName))
                {
                    vMNewsFeed.lstMasterData = _context.Posts.
                                         Select(post => new MasterData
                                         {
                                             PostID = post.PostID,
                                             PostText = post.PostText,
                                             UserName = post.CreatedBy,
                                             PostDate = post.CreatedDate,
                                             NumberOfComments = _context.Comments.Where(d => d.PostID == post.PostID).ToList().Count,

                                         }).ToList();



                    vMNewsFeed.lstDetailData = _context.Posts
                                                   .Join(
                                                   _context.Comments,
                                                   post => post.PostID,
                                                   comment => comment.PostID,
                                                   (post, comment) => new DetailData
                                                   {
                                                       PostID = post.PostID,
                                                       CommentText = comment.CommentText,
                                                       UserName = _context.Users.Where(u => u.ID == comment.CommentUserID).FirstOrDefault().UserName,
                                                       CommentDate = comment.CreatedDate,
                                                       LikeCount = _context.UserLikeDislikeMappings.Where(d => d.CommentID == comment.CommentID && d.IsLike).ToList().Count,
                                                       DisLikeCount = _context.UserLikeDislikeMappings.Where(d => d.CommentID == comment.CommentID && d.IsDislike).ToList().Count
                                                   }
                                                   ).ToList();
                }
                else
                {
                    vMNewsFeed.lstMasterData = _context.Posts.Where(p => p.PostText.Contains(postName)).
                                         Select(post => new MasterData
                                         {
                                             PostID = post.PostID,
                                             PostText = post.PostText,
                                             UserName = post.CreatedBy,
                                             PostDate = post.CreatedDate,
                                             NumberOfComments = _context.Comments.Where(d => d.PostID == post.PostID).ToList().Count,

                                         }).ToList();



                    vMNewsFeed.lstDetailData = _context.Posts.Where(p => p.PostText.Contains(postName))
                                                   .Join(
                                                   _context.Comments,
                                                   post => post.PostID,
                                                   comment => comment.PostID,
                                                   (post, comment) => new DetailData
                                                   {
                                                       PostID = post.PostID,
                                                       CommentText = comment.CommentText,
                                                       UserName = _context.Users.Where(u => u.ID == comment.CommentUserID).FirstOrDefault().UserName,
                                                       CommentDate = comment.CreatedDate,
                                                       LikeCount = _context.UserLikeDislikeMappings.Where(d => d.CommentID == comment.CommentID && d.IsLike).ToList().Count,
                                                       DisLikeCount = _context.UserLikeDislikeMappings.Where(d => d.CommentID == comment.CommentID && d.IsDislike).ToList().Count
                                                   }
                                                   ).ToList();
                }


            }
            catch (Exception ex)
            {

            }

            return vMNewsFeed;
        }


    }

    public interface IDataService
    {
        Task<VMNewsFeed> GetNewsFeedData(string postName);

    }
}
