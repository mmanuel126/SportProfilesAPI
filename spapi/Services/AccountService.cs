using spapi.Models.Account;
using spapi.Interfaces;
using spapi.Data;
using spapi.Helper;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace spapi.Services
{
    /// <summary>
    /// Describes the functionalities for accessing account data for security
    /// </summary>
    public class AccountService(IAccountRepository accountRepository, IConfiguration configuration) : IAccountService
    {
        private readonly IAccountRepository _accountRepository = accountRepository;
        private readonly IConfiguration _configuration = configuration;

        /// <summary>
        /// Allows you to change user password.
        /// </summary>
        /// <param name="pwd"></param>
        /// <param name="email"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public string ChangePassword(string pwd, string email, string code)
        {
            string mykey = _configuration["EncryptionKey"]!;
            pwd =  Helper.EncryptionHelper.Encrypt(pwd, mykey);
            if (code != "")
            {
                _accountRepository.SetCodeToExpire(Convert.ToInt32(code));
            }
            _accountRepository.ChangePassword(email, pwd);

            var memberList = _accountRepository.ValidateUser(email, pwd);
            if (memberList.Count != 0)
            {
                return memberList[0].MemberID.ToString() + ":" + memberList[0].Email.ToString();
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// validates a user to see if he/she has an account on this site.
        /// </summary>
        /// <param name="strEmail"></param>
        /// <param name="strPwd"></param>
        /// <returns></returns>
        public List<UserModel> ValidateUser(string strEmail, string strPwd)
        {
            return _accountRepository.ValidateUser(strEmail, strPwd);
        }

        /// <summary>
        /// validates a new registered user. returns a row of info about the validated user. 
        /// </summary>
        /// <param name="strEmail"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public List<ValidateNewRegisteredUserModel> ValidateNewRegisteredUser(string strEmail, int code)
        {
            return _accountRepository.ValidateNewRegisteredUser(strEmail, code);
        }

        /// <summary>
        /// find by unique email.
        /// </summary>
        /// <param name="strEmail"></param>
        /// <returns></returns>
        public List<UserModel> FindByUniqueEmail(string strEmail)
        {
            return _accountRepository.FindByUniqueEmail(strEmail);
        }

        /// <summary>
        /// Creates the new user.
        /// </summary>
        /// <returns>The new user.</returns>
        /// <param name="firstName">First name.</param>
        /// <param name="lastName">Last name.</param>
        /// <param name="email">Email.</param>
        /// <param name="password">Password.</param>
        /// <param name="gender">Gender.</param>
        /// <param name="month">Month.</param>
        /// <param name="day">Day.</param>
        /// <param name="year">Year.</param>
        /// <param name="profileType"></param>
        public int CreateNewUser(string firstName, string lastName, string email, string password, string gender, string month,
                                  string day, string year, string profileType)
        {
            return _accountRepository.CreateNewUser(firstName, lastName, email, password, gender, month, day, year, profileType);
        }

        /// <summary>
        /// check to see if email exists -- everyone on here has a unique email address
        /// </summary>
        /// <param name="email"></param>
        /// <returns>return list if email exist</returns>
        public List<TbMember> CheckEmailExists(string email)
        {
            return _accountRepository.CheckEmailExists(email);
        }

        /// <summary>
        /// get code and name for forgot passwords
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public List<CodeAndNameForgotPwdModel> GetCodeAndNameForgotPwd(string email)
        {
            return _accountRepository.GetCodeAndNameForgotPwd(email);
        }

        /// <summary>
        /// checked code expired
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public string CheckCodeExpired(int code)
        {
            List<TbForgotPwdCode> lst = _accountRepository.CheckCodeExpired(code);
            if (lst.Count == 0)
            {
                return "yes";
            }
            else
            {
                return "no";
            }
        }

        /// <summary>
        /// Set the code to expire 
        /// </summary>
        /// <param name="code"></param>
        public void SetCodeToExpire(int code)
        {
            _accountRepository.SetCodeToExpire(code);
        }

        /// <summary>
        /// Authenticate the user using email and pwd
        /// </summary>
        /// <param name="email"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public UserModel AuthenticateUser(String email, String pwd)
        {
            UserModel user = new();

            var loginResult = _accountRepository.AuthenticateUser(email, pwd);
            if (loginResult != "")
            {
                user.Email = loginResult.Split("~")[1];
                user.MemberID = loginResult.Split("~")[0];
                user.PicturePath = loginResult.Split("~")[2];
                var jwt = GetToken(ref user, out DateTime expiredDate);
                user.AccessToken = jwt;
                user.ExpiredDate = expiredDate;
                user.Name = loginResult.Split("~")[3];
                user.Title = loginResult.Split("~")[4];
                user.CurrentStatus = loginResult.Split("~")[5];
            }
            return user;
        }

        /// <summary>
        /// Authenticate the newly created member using generated code emailed to user
        /// </summary>
        /// <param name="email"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public UserModel AuthenticateNewRegisteredUser(string email, string code)
        {
            UserModel user = new();
            var loginResult = _accountRepository.AuthenticateNewRegisteredUser(email, code);
            if (loginResult != "")
            {
                user.Email = loginResult.Split("~")[1];
                user.MemberID = loginResult.Split("~")[0];
                user.PicturePath = loginResult.Split("~")[2];
                var jwt = GetToken(ref user, out DateTime expiredDate);
                user.AccessToken = jwt;//new JwtSecurityTokenHandler().WriteToken(jwt);
                user.ExpiredDate = expiredDate;
                user.Name = loginResult.Split("~")[3];
                user.Title = loginResult.Split("~")[4];
                user.CurrentStatus = loginResult.Split("~")[5];
            }
            return user;
        }

        /// <summary>
        /// Get new access token given an existing one if valid.
        /// </summary>
        /// <param name="accessToken"></param>
        /// <returns></returns>
        public UserModel RefreshToken(string accessToken)
        {
            var principal = GetPrincipalFromExpiredToken(accessToken);
            var username = principal.Identity!.Name; //this is mapped to the Name claim by default

            var user = new UserModel();
            var lst = _accountRepository.FindByUniqueEmail(username ?? "");
            if (lst != null)
            {
                user.Email = lst[0].Email;
                user.MemberID = lst[0].MemberID;
                user.PicturePath = lst[0].PicturePath;
                var jwt = GetToken(ref user, out DateTime expiredDate);
                user.ExpiredDate = expiredDate;
                user.AccessToken = jwt;
            }
            return user;
        }

        /// <summary>
        /// Get principal from expired token.
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        private ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
        {
            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateAudience = false, //you might want to validate the audience and issuer depending on your use case
                ValidateIssuer = false,
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_configuration.GetValue<String>("Jwt:Key") ?? "")),
                ValidateLifetime = false //here we are saying that we don't care about the token's expiration date
            };
            var tokenHandler = new JwtSecurityTokenHandler();
            SecurityToken securityToken;
            var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out securityToken);
            var jwtSecurityToken = securityToken as JwtSecurityToken;
            if (jwtSecurityToken == null || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256Signature, StringComparison.InvariantCultureIgnoreCase))
                throw new SecurityTokenException("Invalid token");
            return principal;
        }

        /// <summary>
        /// Resets password.
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public string ResetPassword(string email){
            List<CodeAndNameForgotPwdModel> lst = _accountRepository.GetCodeAndNameForgotPwd(email);
            if (lst.Count != 0)
            {
                CodeAndNameForgotPwdModel ds = lst[0];
                string code = ds.CodeID.ToString();
                string firstName = ds.FirstName.ToString();
                SendEmail(email, code, firstName);
                return "success";
            }
            else
            {
                return "fail";
            }
        }

        #region helper routines...

        private string GetToken(ref UserModel user, out DateTime ExpiredDate)
        {
            var _key = _configuration["Jwt:Key"];
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_key ?? "");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] {
                    new Claim(ClaimTypes.Name, user.Name)
                }),
                Expires = DateTime.UtcNow.AddSeconds(_configuration.GetValue<int>("Jwt:Lifetime")),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)

            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            ExpiredDate = token.ValidTo;
            var tokenString = tokenHandler.WriteToken(token);
            return tokenString;
        }

        private void SendEmail(string email, string code, string firstName)
        {
            string  name = _configuration.GetValue<string>("AppStrings:AppAdmin") ?? "";
            string smtpHost = _configuration.GetValue<string>("AppStrings:AppSMTPHost") ?? "";
            int smtpPort = Convert.ToInt32(_configuration.GetValue<string>("AppStrings:AppSMTPPort"));
            string appSMTPpwd = _configuration.GetValue<string>("AppStrings:AppSMTPpwd") ?? "";

            string fromEmail = _configuration.GetValue<string>("AppStrings:AppFromEmail") ?? ""; 
            string appName = _configuration.GetValue<string>("AppStrings:AppName") ?? "";
            string subject = "Password Reset Confirmation";
            string webSiteLink = _configuration.GetValue<string>("AppStrings:WebSiteLink") ?? "";
            string body = HTMLBodyText(email, firstName, code, appName,webSiteLink);

            SendMailHelper.SendMail(smtpHost, smtpPort, appSMTPpwd, name, fromEmail, email, subject, body, true);
        }

        private static string HTMLBodyText(string email, string name, string code, string appName, string webSiteLink )
        {
            string str = "";

            str += "<table width='100%' style='text-align: center;'>";
            str += "<tr>";
            str += "<td style='font-weight: bold; font-size: 12px; height: 25px; text-align: left; background-color: #4a6792;";
            str += "vertical-align: middle; color: White;'>";
            str = str + "&nbsp;" + appName;
            str += "</td>";
            str += "</tr>";
            str += "<tr><td>&nbsp;</td></tr>";
            str += "<tr>";
            str += "<td style='font-size: 12px; text-align: left; width: 100%; font-family: Trebuchet MS,Trebuchet,Verdana,Helvetica,Arial,sans-seri'>";
            str = str + "<p>Hi " + name + ",<p/>";
            str += "</td>";
            str += "</tr>";
            str += "<tr>";
            str += "<td style='font-size: 12px; text-align: left; width: 100%; font-family: Trebuchet MS,Trebuchet,Verdana,Helvetica,Arial,sans-seri'>";
            str += "<p>You recently requested a new password. <br/>";
            str += "<p />";
            str += "<p>Here is your reset code, which you can enter on the password reset page:<br/><b>";
            str = str + code + "</b><p />";
            str += "<p>Do not share this code. We will never call or text you for it.<br/></p>";
            str += "<p>If you did not request to reset your password, please disregard this message.<br>";
            str += "<p/>";
            str += "Thanks.<br />";
            str = str + "The " + appName  + " staff<br />";
            str += "</p>";
            str += "<p></p><p>";
            str += "</td>";
            str += "</tr>";
            str += "</table>";

            return str;
        }

        #endregion

    }
}

