namespace spapi.Models.Account
{
    /// <summary>
    /// Stores new registered user info.
    /// </summary>
    public class NewRegisteredUser
    {
        public string Email { get; set; } = string.Empty;
        public string Code { get; set; } = string.Empty;
    }
}