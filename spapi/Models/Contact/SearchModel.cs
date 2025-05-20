namespace spapi.Models.Contact
{
    /// <summary>
    /// Stores the searched info.
    /// </summary>
    public class SearchModel
    {
        public int EntityID { get; set; }
        public string EntityName { get; set; } = string.Empty;
        public string PicturePath { get; set; } = string.Empty;
        public string Location { get; set; } = string.Empty;
        public string EventDate { get; set; } = string.Empty;
        public string Rsvp { get; set; } = string.Empty;
        public string Params { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string MemberCount { get; set; } = string.Empty;
        public DateTime CreatedDate { get; set; }
        public string CityState { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string NameAndID { get; set; } = string.Empty;
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string LabelText { get; set; } = string.Empty;
        public string ShowCancel { get; set; } = string.Empty;
        public string ParamsAV { get; set; } = string.Empty;
        public string Stype { get; set; } = string.Empty;
    }
}