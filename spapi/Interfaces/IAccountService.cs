using spapi.Models.Account;
using spapi.Data;

namespace spapi.Interfaces
{
   public interface IAccountService
   {
      List<CodeAndNameForgotPwdModel> GetCodeAndNameForgotPwd(string email);
      string CheckCodeExpired(int code);
      void SetCodeToExpire(int code);
      string ChangePassword(string pwd, string email, string code);
      List<UserModel> ValidateUser(string strEmail, string strPwd);
      List<TbMember> CheckEmailExists(string email);
      List<UserModel> FindByUniqueEmail(string strEmail);
      int CreateNewUser(string firstName, string lastName, string email, string password, string gender, string month,
                                string day, string year, string profileType);
      UserModel AuthenticateUser(string email, string pwd);
      UserModel AuthenticateNewRegisteredUser(string email, string code);
      UserModel RefreshToken(string accessToken);
      string ResetPassword(string email);
    
   }
}