using spapi.Models;
using spapi.Models.Account;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using spapi.Interfaces;
using spapi.Data;
using spapi.Helper;

namespace spapi.Repositories
{
    /// <summary>
    /// Describes the functionalities for accessing account data for security
    /// </summary>
    public class AccountRepository(DBContextModel context, IConfiguration configuration) : IAccountRepository
    {
        readonly DBContextModel _context = context;
        private readonly IConfiguration _configuration = configuration;

        /// <summary>
        /// Allows you to change user password.
        /// </summary>
        /// <param name="email"></param>
        /// <param name="newPwd"></param>
        public void ChangePassword(string email, string newPwd)
        {
            var em = new SqlParameter("@Email", email);
            var nPwd = new SqlParameter("@NewPwd", newPwd);
            _context.Database.ExecuteSqlRaw("EXEC spChangePasswordViaEmail @Email, @NewPwd", em, nPwd);
        }

        /// <summary>
        /// validates a user to see if he/she has an account on this site.
        /// </summary>
        /// <param name="strEmail"></param>
        /// <param name="strPwd"></param>
        /// <returns></returns>
        public List<UserModel> ValidateUser(string strEmail, string strPwd)
        {
            var mlist = (from c in _context.TbMembers
                         join m in _context.TbMemberProfiles on c.MemberId equals m.MemberId
                         where (c.Email == strEmail) && (c.Password == strPwd) && (c.Status == 2 || c.Status == 3)
                         select new UserModel()
                         {
                             MemberID = c.MemberId.ToString(),
                             Name = m.FirstName + " " + m.LastName,
                             Email = c.Email ?? "",
                             PicturePath = m.PicturePath ?? "",
                             Title = m.TitleDesc ?? "",
                             CurrentStatus = c.Status.ToString() ?? "0"
                         }).ToList();
            return mlist;
        }

        /// <summary>
        /// validates a new registered user. returns a row of info about the validated user. 
        /// </summary>
        /// <param name="strEmail"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public List<ValidateNewRegisteredUserModel> ValidateNewRegisteredUser(string strEmail, int code)
        {
            List<ValidateNewRegisteredUserModel> lst = (from m in _context.TbMembers
                                                        join mp in _context.TbMemberProfiles on m.MemberId equals mp.MemberId
                                                        join mr in _context.TbMembersRegistereds on m.MemberId equals mr.MemberId
                                                        where (mr.MemberCodeId == code) && (m.Email == strEmail) && (m.Status == 1)
                                                        select new ValidateNewRegisteredUserModel()
                                                        {
                                                            MemberId = m.MemberId.ToString(),
                                                            Email = m.Email ?? "",
                                                            FirstName = mp.FirstName ?? "",
                                                            LastName = mp.LastName ?? "",
                                                            PassWord = m.Password ?? "",
                                                            UserImage = mp.PicturePath ?? "",
                                                            Title = mp.TitleDesc ?? ""
                                                        }

                    ).ToList();
            if (lst.Count != 0)
            {
                var mem = (from z in _context.TbMembers where z.MemberId == Convert.ToInt32(lst[0].MemberId) select z).First();
                mem.Status = 2;
                _context.SaveChanges();
            }
            return (lst);
        }

        public List<UserModel> FindByUniqueEmail(string strEmail)
        {
            List<UserModel> lst = (from m in _context.TbMembers
                                   join mp in _context.TbMemberProfiles on m.MemberId equals mp.MemberId
                                   where m.Email == strEmail
                                   select new UserModel()
                                   {
                                       MemberID = m.MemberId.ToString(),
                                       Email = m.Email ?? "",
                                       PicturePath = mp.PicturePath ?? ""
                                   }

                   ).ToList();
            return lst;
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
            {
                var fName = new SqlParameter("@FirstName", firstName);
                var lName = new SqlParameter("@LastName", lastName);
                var em = new SqlParameter("@Email", email);
                var pwd = new SqlParameter("@Password", password);
                var gder = new SqlParameter("@Gender", gender);
                var mth = new SqlParameter("@Month", month);
                var da = new SqlParameter("@Day", day);
                var yr = new SqlParameter("@Year", year);
                var pType = new SqlParameter("@ProfileType", profileType);

                var memberCode = new SqlParameter
                {
                    ParameterName = "MemberCode",
                    SqlDbType = System.Data.SqlDbType.Int,
                    Direction = System.Data.ParameterDirection.Output
                };
                _context.Database.ExecuteSqlRaw("EXEC spCreateNewUser @FirstName,@LastName ,@Email,@Password,@Gender,@Month,@Day,@Year, @ProfileType, @MemberCode OUTPUT",
                                    fName, lName, em, pwd, gder, mth, da, yr, pType, memberCode);

                return ((int)memberCode.Value);
            }
        }

        /// <summary>
        /// check to see if email exists -- everyone on here has a unique email address
        /// </summary>
        /// <param name="email"></param>
        /// <returns>return list if email exist</returns>
        public List<TbMember> CheckEmailExists(string email)
        {
            var mlist = (from m in _context.TbMembers where (m.Email == email) select m).ToList();
            return mlist;
        }

        /// <summary>
        /// get code and name for forgot passwords
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public List<CodeAndNameForgotPwdModel> GetCodeAndNameForgotPwd(string email)
        {
            List<CodeAndNameForgotPwdModel> bLST = new List<CodeAndNameForgotPwdModel>();
            var l = (from m in _context.TbMembers
                     join mp in _context.TbMemberProfiles on m.MemberId equals mp.MemberId
                     where m.Email == email
                     select mp).ToList();

            var memID = l[0].MemberId;
            var fName = l[0].FirstName;

            CodeAndNameForgotPwdModel lst = new CodeAndNameForgotPwdModel();
            if (memID != 0)
            {
                spapi.Data.TbForgotPwdCode ins = new()
                {
                    Email = email,
                    CodeDate = System.DateTime.Now,
                    Status = 0
                };

                _context.TbForgotPwdCodes.Add(ins);
                _context.SaveChanges();

                lst.CodeID = ins.CodeId.ToString();
                lst.FirstName = fName ?? "";
                bLST.Add(lst);
            }
            else
            {
                lst.CodeID = "0";
                lst.FirstName = "";
                bLST.Add(lst);
            }
            return bLST;
        }

        /// <summary>
        /// checked code expired
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public List<TbForgotPwdCode> CheckCodeExpired(int code)
        {
            var flist = (from f in _context.TbForgotPwdCodes where (f.CodeId == code && f.Status == 0) select f).ToList();
            return flist;
        }

        /// <summary>
        /// Set the code to expire 
        /// </summary>
        /// <param name="code"></param>
        public void SetCodeToExpire(int code)
        {
            var fEdit = (from f in _context.TbForgotPwdCodes where f.CodeId == code select f).First();
            fEdit.Status = 1;
            _context.SaveChanges();
        }

        /// <summary>
        /// record log in user
        /// </summary>
        /// <param name="memberID"></param>
        public void RecordLogInUser(int memberID)
        {
            var mId = new SqlParameter("@MemberID", memberID);
            _context.Database.ExecuteSqlRaw("EXEC spLoggedInUser @MemberID", mId);
        }

        /// <summary>
        /// check to see if user is active
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public bool IsActiveUser(int memberID)
        {
            var q = (from m in _context.TbMembers where m.MemberId == memberID && m.Status == 2 select m).ToList();
            if (q.Count != 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// Set status for member id - active, newregister, or inactive
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="status"></param>
        public void SetMemberStatus(int memberID, int status)
        {
            var mEdit = (from m in _context.TbMembers where m.MemberId == memberID select m).First();
            mEdit.Status = status;
            _context.SaveChanges();
        }

        /// <summary>
        /// Authenticate the user using email and pwd
        /// </summary>
        /// <param name="email"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public string AuthenticateUser(String email, String pwd)
        {
            string strEmail = email;
            string key = _configuration.GetValue<string>("EncryptionKey") ?? "";
            string strPwd = EncryptionHelper.Encrypt(pwd.Trim(), key);
            List<UserModel> memberList = ValidateUser(strEmail, strPwd);
            if (memberList.Count != 0)
                return memberList[0].MemberID.ToString() + "~" + memberList[0].Email.ToString() + "~" + memberList[0].PicturePath + "~" + memberList[0].Name + "~" + memberList[0].Title + "~" + memberList[0].CurrentStatus;
            else
                return "";
        }

        /// <summary>
        /// Authenticate new registered user given email and code.
        /// </summary>
        /// <param name="email"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public string AuthenticateNewRegisteredUser(string email, string code)
        {
            List<ValidateNewRegisteredUserModel> memberList = ValidateNewRegisteredUser(email, Convert.ToInt32(code));
            if (memberList.Count != 0)
                return memberList[0].MemberId.ToString() + "~" + memberList[0].Email.ToString() + "~" + memberList[0].UserImage + "~" + memberList[0].FirstName + " " + memberList[0].LastName + "~" + memberList[0].Title + "~2";
            else
                return "";
        }

    }
}

