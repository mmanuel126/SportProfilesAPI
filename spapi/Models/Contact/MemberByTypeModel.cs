namespace spapi.Models.Contact
{
    /// <summary>
    /// Stores members info by type - Used by the Contact controller.
    /// </summary>
    public class MemberByTypeModel
    {
        public string MemberID { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string PicturePath { get; set; } = string.Empty;
        public string TypeVal { get; set; } = string.Empty;
        public string IsFriend { get; set; } = string.Empty;
        public string IsSamePerson { get; set; } = string.Empty;
    }
}