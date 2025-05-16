namespace spapi.Models.Account
{
    /// <summary>
    /// holds validated new registered user data 
    /// </summary>
    public class ValidateNewRegisteredUserModel
    {
        public string MemberId  {get; set; } = string.Empty;
        public string Email  {get; set; } = string.Empty;
        public string FirstName  {get; set; } = string.Empty;
        public string LastName  {get; set; } = string.Empty;
        public string PassWord  {get; set; } = string.Empty;
        public string UserImage  {get; set; } = string.Empty;
        public string Title  {get; set; } = string.Empty; 
    }
}