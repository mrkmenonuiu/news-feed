using NewsFeed.Models.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace NewsFeed.Models
{
    public class Post : AuditableEntity<int, string, string>
    {
        [Key]
        public int PostID { get; set; }

        public string PostText { get; set; }

        public int PostedUserID { get; set; }

    }
}
