using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NewsFeed.Models;
using NewsFeed.Services;
using NewsFeed.Utility;

namespace NewsFeedWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DataController : ControllerBase
    {
        private readonly IDataService _dataService;
        public DataController(IDataService dataService)
        {
            _dataService = dataService;
        }
        /// <summary>
        /// Get All Post by post name
        /// </summary>
        /// <returns>VMNewsFeed</returns>
        [HttpPost]
        [Route("GetAll")]
        public async Task<VMNewsFeed> GetAllUserAsync(object postName)
        {
            return await _dataService.GetNewsFeedData(postName.ToString());
        }

    }
}
