namespace spapi.Models.Contact
{
    /// <summary>
    /// Stores entity (any data from the site, i.e., contact, etc) 
    /// </summary>
    public class EntityModel
    {
        public string EntityID { get; set; } = string.Empty;
        public string EntityName { get; set; } = string.Empty;
        public string PicturePath { get; set; } = string.Empty;
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string CityState { get; set; } = string.Empty;
        public string Id { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
    }
}