namespace spapi.Models.Account
{
    /// <summary>
    ///  Stores registered user info.
    /// </summary>
    public class RegisterModel
    {
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; }  = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Day { get; set; } = string.Empty;
        public string Month { get; set; } = string.Empty;
        public string Year { get; set; } = string.Empty;
        public string Gender { get; set; } = string.Empty;
        public string ProfileType { get; set; } = string.Empty;

    }
}