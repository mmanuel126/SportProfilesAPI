namespace spapi.Models.Account
{
     /// <summary>
    /// Holds the User info.
    /// </summary>
    public class UserModel
    {
        public string Name { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string MemberID { get; set; } = string.Empty;
        public string PicturePath { get; set; } = string.Empty;
        public string AccessToken { get; set; } = string.Empty;
        public DateTime ExpiredDate { get; set; }
        public string CurrentStatus { get; set; } = string.Empty;
    }
}