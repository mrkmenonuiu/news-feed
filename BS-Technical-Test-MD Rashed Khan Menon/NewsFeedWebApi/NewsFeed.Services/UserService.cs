using Microsoft.EntityFrameworkCore;
using NewsFeed.Database;
using NewsFeed.Models;
using NewsFeed.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace NewsFeed.Services
{
    public class UserService: IUserService
    {
        private readonly NewsFeedDbContext _context;
        public UserService(NewsFeedDbContext context)
        {
            _context = context;
        }
        public async Task<List<User>> GetFilteredList(Expression<Func<User, bool>> expression)
        {
            List<User> lstUser = new List<User>();
            try
            {
                lstUser = await _context.Users.Where(expression).ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return lstUser;
        }
        public async Task<User> SaveUser(User user)
        {
            if (user.ID > 0)
            {
                user.UpdatedDate = DateTime.Now;
                _context.Entry(user).State = EntityState.Modified;
            }
            else
            {
                user.Status = (int)NewsFeedEnums.Status.Active;
                await _context.Users.AddAsync(user);
            }
            await _context.SaveChangesAsync();

            return user;
        }
    }
    public interface IUserService
    {
        Task<User> SaveUser(User user);
        Task<List<User>> GetFilteredList(Expression<Func<User, bool>> expression);
    }
}
