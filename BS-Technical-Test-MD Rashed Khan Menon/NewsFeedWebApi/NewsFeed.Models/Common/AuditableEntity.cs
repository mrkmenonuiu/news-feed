using System;
using System.ComponentModel.DataAnnotations;

namespace NewsFeed.Models.Common
{
    /// <summary>
    /// Generic Entity Class, this class can be used for those Entities, who are transactional.
    /// Example: Order Transaction
    /// </summary>
    /// <typeparam name="T">Defines the Primary Key Type</typeparam>
    /// <typeparam name="TEntryBy">Generic Type for Entry By</typeparam>
    /// <typeparam name="TUpdateBy">Generic Type for Update By</typeparam>
    public class AuditableEntity<T, TEntryBy, TUpdateBy>
    {
        public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
        [MaxLength(30)]
        public TEntryBy CreatedBy { get; set; }
        [MaxLength(30)]
        public TUpdateBy UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; } = DateTime.UtcNow;
        public int Status { get; set; } = 1;
    }
}
