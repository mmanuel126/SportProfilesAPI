namespace spapi.Models.Account
{
    /// <summary>
    /// Holds code and name forgot password data - used by the Account controller.
    /// </summary>
    public class CodeAndNameForgotPwdModel
    {
        public string CodeID { get; set; } = string.Empty;
        public string FirstName { get; set; } = string.Empty;
    }
}