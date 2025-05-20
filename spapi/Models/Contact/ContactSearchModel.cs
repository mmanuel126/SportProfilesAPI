namespace spapi.Models.Contact
{
    /// <summary>
    /// Stores contacts searched info 
    /// </summary>
    public class ContactSearchModel
    {
        public string EntityID { get; set; } = string.Empty;
        public string EntityName { get; set; } = string.Empty;
        public string PicturePath { get; set; } = string.Empty;
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string CityState { get; set; } = string.Empty;
        public string LabelText { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string NameAndID { get; set; } = string.Empty;
        public string Params { get; set; } = string.Empty;
        public string ParamsAV { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string MemberCount { get; set; } = string.Empty;
        public string CreatedDate { get; set; } = string.Empty;
        public string Location { get; set; } = string.Empty;
    }
}