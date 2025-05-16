namespace spapi.Models.Account
{
    /// <summary>
    /// Holds the log in data.
    /// </summary>
    public class LoginModel
    {
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}