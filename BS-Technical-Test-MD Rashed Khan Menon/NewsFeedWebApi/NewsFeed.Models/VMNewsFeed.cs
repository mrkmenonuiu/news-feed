using System;
using System.Collections.Generic;
using System.Text;

namespace NewsFeed.Models
{
    public class VMNewsFeed
    {
        public List<MasterData> lstMasterData { get; set; }

        public List<DetailData> lstDetailData { get; set; } = new List<DetailData>();

    }

    public class MasterData
    {
        public int PostID { get; set; }
        public string PostText { get; set; }

        public string UserName { get; set; }

        public DateTime PostDate { get; set; }

        public int NumberOfComments { get; set; }
       
    }


    public class DetailData
    {
        public int PostID { get; set; }
        public string CommentText { get; set; }

        public string UserName { get; set; }

        public DateTime CommentDate { get; set; }

        public int LikeCount { get; set; }

        public int DisLikeCount { get; set; }
    }
}
