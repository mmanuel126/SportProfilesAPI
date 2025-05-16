
using spapi.Models.Account;
using spapi.Data;

namespace spapi.Interfaces
{
   public interface IAccountRepository
   {
      List<ValidateNewRegisteredUserModel> ValidateNewRegisteredUser(string strEmail, int code);
      List<CodeAndNameForgotPwdModel> GetCodeAndNameForgotPwd(string email);
      List<TbForgotPwdCode> CheckCodeExpired(int code);
      void SetCodeToExpire(int code);
      void ChangePassword(string email, string newPwd);
      List<UserModel> ValidateUser(string strEmail, string strPwd);
      List<TbMember> CheckEmailExists(string email);
      List<UserModel> FindByUniqueEmail(string strEmail);
      int CreateNewUser(string firstName, string lastName, string email, string password, string gender, string month,
                                string day, string year, string profileType);
      void SetMemberStatus(int memberID, int status);
      string AuthenticateUser(String email, String pwd);
      string AuthenticateNewRegisteredUser(string email, string code);
     
   }
}