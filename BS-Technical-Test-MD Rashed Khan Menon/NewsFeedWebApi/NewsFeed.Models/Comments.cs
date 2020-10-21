using NewsFeed.Models.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace NewsFeed.Models
{
    public class Comment : AuditableEntity<int, string, string>
    {
        [Key]
        public int CommentID { get; set; }

        public string CommentText { get; set; }

        public int CommentUserID { get; set; }

        public int PostID { get; set; }
    }
}
