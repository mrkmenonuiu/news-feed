using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NewsFeed.Models;
using NewsFeed.Services;
using NewsFeed.Utility;

namespace NewsFeedWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }
        /// <summary>
        /// Get All Users
        /// </summary>
        /// <returns>users</returns>
        [HttpPost]
        [Route("GetAll")]
        public async Task<ActionResult> GetAllUserAsync()
        {
            return Ok(await _userService.GetFilteredList(x => x.Status != (int)NewsFeedEnums.Status.Deleted));
        }
        /// <summary>
        /// Save User
        /// </summary>
        /// <returns>bool</returns>
        [HttpPost]
        [Route("Save")]
        public async Task<ActionResult> Save(User user)
        {
            return Ok(await _userService.SaveUser(user));
        }
    }
}
