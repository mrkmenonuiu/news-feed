using NewsFeed.Models.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace NewsFeed.Models
{
    public class UserLikeDislikeMapping : AuditableEntity<int, string, string>
    {
        [Key]
        public int UserLikeDislikeMappingID { get; set; }

        public int UserID { get; set; }

        public bool IsLike { get; set; }

        public bool IsDislike { get; set; }
        public int CommentID { get; set; }
    }
}
