using NewsFeed.Models.Common;
using System;
using System.ComponentModel.DataAnnotations;

namespace NewsFeed.Models
{
    public class User : AuditableEntity<int, string, string>
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string UserID { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        public int UserType { get; set; }
    }
}
