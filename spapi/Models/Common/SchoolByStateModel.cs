namespace spapi.Models.Common
{
    /// <summary>
    /// Stores list of schools by state info - Used by the Member controller.
    /// </summary>
    public class SchoolByStateModel
    {
        public string SchoolId { get; set; } = string.Empty;
        public string SchoolName { get; set; } = String.Empty;
    }
}