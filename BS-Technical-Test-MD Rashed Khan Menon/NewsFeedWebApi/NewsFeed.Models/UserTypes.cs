using NewsFeed.Models.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace NewsFeed.Models
{
    public class UserType : AuditableEntity<int, string, string>
    {
        [Key]
        public int UserTypeID { get; set; }

        public string TypeName { get; set; }


    }
}
