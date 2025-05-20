using Microsoft.EntityFrameworkCore;
using spapi.Models.Contact;
using Microsoft.Data.SqlClient;
using System.Data;
using spapi.Models;
using System.Dynamic;
using spapi.Interfaces;

namespace spapi.Repositories
{
    /// <summary>
    /// Describes the functionalities for accessing data for contacts
    /// </summary>
    public class ContactRepository(DBContextModel context, IMemberRepository memberRepository, IMessageRepository messageRepository) : IContactRepository
    {
        readonly DBContextModel _context = context;
        readonly IMemberRepository _mbrRepo = memberRepository;
        readonly IMessageRepository _msgRepo = messageRepository;

        /// <summary>
        /// Get list of member contacts.
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<MemberContactsModel> GetMemberContacts(int memberID)
        {

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "spGetMemberContacts";

                // Add the memberID parameter and set its properties.
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@MemberID";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Input;
                parameter.Value = memberID;
                // Add the parameter to the Parameters collection. 
                command.Parameters.Add(parameter);

                // Add the memberID parameter and set its properties.
                parameter = new SqlParameter();
                parameter.ParameterName = "@ShowType";
                parameter.SqlDbType = SqlDbType.VarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Value = "";
                // Add the parameter to the Parameters collection. 
                command.Parameters.Add(parameter);

                List<MemberContactsModel> cList = new List<MemberContactsModel>();

                _context.Database.OpenConnection();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            MemberContactsModel pc = new MemberContactsModel();
                            pc.ContactID = reader.GetValue(reader.GetOrdinal("contactid")).ToString() ?? "0";
                            pc.Email = reader.GetValue(reader.GetOrdinal("email")).ToString() ?? "";
                            pc.FirstName = reader.GetValue(reader.GetOrdinal("firstname")).ToString() ?? "";
                            pc.FriendName = reader.GetValue(reader.GetOrdinal("friendname")).ToString() ?? "";
                            pc.LabelText = reader.GetValue(reader.GetOrdinal("labeltext")).ToString() ?? "";
                            pc.Location = reader.GetValue(reader.GetOrdinal("location")).ToString() ?? "";
                            pc.NameAndID = reader.GetValue(reader.GetOrdinal("nameandid")).ToString() ?? "";
                            pc.Params = reader.GetValue(reader.GetOrdinal("params")).ToString() ?? "";
                            pc.ParamsAV = reader.GetValue(reader.GetOrdinal("paramsav")).ToString() ?? "";
                            pc.PicturePath = reader.GetValue(reader.GetOrdinal("picturepath")).ToString() ?? "";
                            pc.ShowType = reader.GetValue(reader.GetOrdinal("showtype")).ToString() ?? "";
                            pc.Status = reader.GetValue(reader.GetOrdinal("status")).ToString() ?? "";
                            pc.TitleDesc = reader.GetValue(reader.GetOrdinal("titledesc")).ToString() ?? "";
                            cList.Add(pc);
                        }
                    }
                    reader.Close();
                }
                return cList;
            }
        }

        public List<MemberContactsModel> GetMemberSuggestions(int memberID)
        {

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "spGetMemberSuggestions";

                // Add the memberID parameter and set its properties.
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@MemberID";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Input;
                parameter.Value = memberID;
                // Add the parameter to the Parameters collection. 
                command.Parameters.Add(parameter);

                List<MemberContactsModel> cList = new List<MemberContactsModel>();

                _context.Database.OpenConnection();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            MemberContactsModel pc = new MemberContactsModel();
                            pc.ContactID = reader.GetValue(reader.GetOrdinal("contactid")).ToString() ?? "";
                            pc.Email = reader.GetValue(reader.GetOrdinal("email")).ToString() ?? "";
                            pc.FirstName = reader.GetValue(reader.GetOrdinal("firstname")).ToString() ?? "";
                            pc.FriendName = reader.GetValue(reader.GetOrdinal("friendname")).ToString() ?? "";
                            pc.LabelText = reader.GetValue(reader.GetOrdinal("labeltext")).ToString() ?? "";
                            pc.Location = reader.GetValue(reader.GetOrdinal("location")).ToString() ?? "";
                            pc.NameAndID = reader.GetValue(reader.GetOrdinal("nameandid")).ToString() ?? "";
                            pc.Params = reader.GetValue(reader.GetOrdinal("params")).ToString() ?? "";
                            pc.ParamsAV = reader.GetValue(reader.GetOrdinal("paramsav")).ToString() ?? "";
                            pc.PicturePath = reader.GetValue(reader.GetOrdinal("picturepath")).ToString() ?? "";
                            pc.ShowType = reader.GetValue(reader.GetOrdinal("showtype")).ToString() ?? "";
                            pc.Status = reader.GetValue(reader.GetOrdinal("status")).ToString() ?? "";
                            pc.TitleDesc = reader.GetValue(reader.GetOrdinal("titledesc")).ToString() ?? "";

                            pc.ShowFollow = reader.GetValue(reader.GetOrdinal("ShowFollow")).ToString() ?? "";
                            cList.Add(pc);
                        }
                    }
                    reader.Close();
                }
                return cList;
            }
        }

        public List<MemberContactsModel> GetMemberContactSuggestions(int memberID)
        {
            List<MemberContactsModel> lst = new List<MemberContactsModel>();
            return lst;
        }

        /// <summary>
        /// get search member contacts by search text wildcard
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public List<MemberContactsModel> SearchMemberContacts(int memberID, string searchText)
        {
            var lst = (from mpf in _context.TbMemberProfiles
                       join ct in _context.TbContacts on mpf.MemberId equals ct.ContactId
                       join mcti in _context.TbMemberProfileContactInfos on ct.ContactId equals mcti.MemberId
                       into t
                       from nt in t.DefaultIfEmpty()
                       where
                       ct.MemberId == memberID && (ct.Status == 0 || ct.Status == 1) &&
                       (mpf.FirstName!.Contains(searchText) || mpf.LastName!.Contains(searchText))
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           Location = nt.City + ", " + nt.State,
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = ct.ContactId.ToString(),
                           ShowType = "",
                           Status = ct.Status.ToString(),
                           TitleDesc = mpf.TitleDesc ?? ""
                       }).ToList();
            return lst;
        }

        /// <summary>
        /// Get member network invite contacts list
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="networkID"></param>
        /// <returns></returns>
        public List<MemberContactsModel> GetMemberNetworkInviteConnectionList(int memberID, int networkID)
        {
            var lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContacts on mpf.MemberId equals c.ContactId
                       join mpci in _context.TbMemberProfileContactInfos on c.ContactId equals mpci.MemberId
                       where c.MemberId == memberID && (c.Status == 0 || c.Status == 1)
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           Location = mpci.City + ", " + mpci.State,
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = c.ContactId.ToString(),
                           ShowType = "",
                           Status = c.Status.ToString(),
                           TitleDesc = mpf.TitleDesc ?? ""

                       }).ToList();
            return lst;
        }

        /// <summary>
        /// Get the list of contact requests.
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<MemberContactsModel> GetRequestsList(int memberID)
        {
            var lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContactRequests on mpf.MemberId equals c.FromMemberId
                       where c.ToMemberId == memberID && (c.Status == 0)
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = c.FromMemberId.ToString() ?? "",

                       }).ToList();
            return lst;
        }

        /// <summary>
        /// /Get the list of members by search type
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="searchType"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public List<MemberContactsModel> GetMembersBySearchType(int userID, string searchType, string searchText)
        {
            string[] s = searchText.Split(' ');
            string name = s[0];
            string name2 = "";
            if (s.Length > 1)
                name2 = s[1];

            if (searchType.ToLower() != "name" && searchType.ToLower() != "people")
                name = searchText;

            if (searchText.IndexOf("@", StringComparison.CurrentCulture) != -1) //email search
                searchType = "email";

            List<MemberContactsModel>? lst = null;

            var lstReq = (from t in _context.TbContactRequests where t.FromMemberId == userID select t).ToList();
            var lstCont = (from t in _context.TbContacts where t.MemberId == userID select new { t.MemberId }).ToList();

            if (searchType.ToLower() == "email")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       where m.Email == name
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = m.MemberId.ToString(),
                           ShowType = "",
                           TitleDesc = mpf.TitleDesc ?? "",
                           Email = m.Email ?? "",
                           LabelText = ((m.MemberId == userID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID)) ? "View Profile" : "Add as Contact",
                           NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                           Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       }).ToList();
            }
            else if (searchType.ToLower() == "public")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       join e in _context.TbMemberProfileEducationV2s on m.MemberId equals e.MemberId
                       where e.SchoolName!.Contains(name) && e.SchoolType == 1
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = m.MemberId.ToString(),
                           ShowType = "",
                           TitleDesc = mpf.TitleDesc ?? "",
                           Email = m.Email ?? "",
                           LabelText = ((m.MemberId == userID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID)) ? "View Profile" : "Add as Contact",
                           NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                           Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       }).ToList();
            }
            else if (searchType.ToLower() == "private")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       join e in _context.TbMemberProfileEducationV2s on m.MemberId equals e.MemberId
                       where e.SchoolName!.Contains(name) && e.SchoolType == 2
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = m.MemberId.ToString(),
                           ShowType = "",
                           TitleDesc = mpf.TitleDesc ?? "",
                           Email = m.Email ?? "",
                           LabelText = ((m.MemberId == userID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID)) ? "View Profile" : "Add as Contact",
                           NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                           Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       }).ToList();
            }
            else if (searchType.ToLower() == "college")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       join e in _context.TbMemberProfileEducationV2s on m.MemberId equals e.MemberId
                       where e.SchoolName!.Contains(searchText) && e.SchoolType == 3
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = m.MemberId.ToString(),
                           ShowType = "",
                           TitleDesc = mpf.TitleDesc ?? "",
                           Email = m.Email ?? "",
                           LabelText = ((m.MemberId == userID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID)) ? "View Profile" : "Add as Contact",
                           NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                           Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       }).ToList();
            }
            else if (searchType.ToLower() == "name" || searchType.ToLower() == "people")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       //join e in context.TbMemberProfileEducationV2 on m.MemberId equals e.MemberId
                       where mpf.FirstName!.Contains(name) && mpf.LastName!.Contains(name2)
                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           PicturePath = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,
                           ContactID = m.MemberId.ToString(),
                           ShowType = "",
                           TitleDesc = mpf.TitleDesc ?? "",
                           Email = m.Email ?? "",
                           LabelText = ((m.MemberId == userID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID)) ? "View Profile" : "Add as Contact",
                           NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                           Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       }).ToList();
            }

            return lst!;
        }

        /// <summary>
        /// Gets the search contacts.
        /// </summary>
        /// <returns>The search contacts.</returns>
        /// <param name="userID">User identifier.</param>
        /// <param name="searchText">Search text.</param>
        public List<MemberContactsModel> GetSearchContacts(int userID, string searchText)
        {
            var result = _context.Set<MemberContactsModel>().FromSqlRaw("exec spGetSearchContacts @UserID, @SearchText, @SearchText2 ", new SqlParameter("@UserID", userID), new SqlParameter("@SearchText", searchText), new SqlParameter("@SearchText2", ""));
            return new List<MemberContactsModel>(result);
        }

        /// <summary>
        /// Get the list of members browsed contacts.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="categoryID"></param>
        /// <param name="subCategory"></param>
        /// <returns></returns>
        public List<MemberContactsModel> GetMemberBrowsedConnections(int memberID, int categoryID, string subCategory)
        {
            List<MemberContactsModel>? lst = null;
            if (categoryID == 1)
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContacts on mpf.MemberId equals c.MemberId
                       join ps in _context.TbMemberProfileContactInfos on c.MemberId equals ps.MemberId
                       where (mpf.MemberId == memberID && ps.City == subCategory)

                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           Location = ps.City + " " + ps.State,
                           TitleDesc = mpf.TitleDesc ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           ContactID = c.ContactId.ToString()
                       }
                      ).ToList();
            }
            else if (categoryID == 2)
            {


                lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContacts on mpf.MemberId equals c.MemberId
                       join ps in _context.TbMemberProfileContactInfos on c.MemberId equals ps.MemberId
                       join ed in _context.TbMemberProfileEducationV2s on c.MemberId equals ed.MemberId
                       where (mpf.MemberId == memberID && ed.SchoolName == subCategory && ed.SchoolType == 3)

                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           Location = ps.City + " " + ps.State,
                           TitleDesc = mpf.TitleDesc ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           ContactID = c.ContactId.ToString()

                       }
                      ).ToList();
            }
            else
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContacts on mpf.MemberId equals c.MemberId
                       join ps in _context.TbMemberProfileContactInfos on c.MemberId equals ps.MemberId
                       join ed in _context.TbMemberProfileEducationV2s on c.MemberId equals ed.MemberId
                       where (mpf.MemberId == memberID && ed.SchoolName == subCategory && (ed.SchoolType == 1 || ed.SchoolType == 2))

                       select new MemberContactsModel()
                       {
                           FriendName = mpf.FirstName + " " + mpf.LastName,
                           Location = ps.City + " " + ps.State,
                           TitleDesc = mpf.TitleDesc ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           ContactID = c.ContactId.ToString()
                       }
                      ).ToList();
            }
            return lst;
        }

        /// <summary>
        /// Search for member by type
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="searchType"></param>
        /// <param name="searchString"></param>
        /// <returns></returns>
        public List<MemberByTypeModel> SearchMemberByType(int userID, int searchType, string searchString)
        {
            var lstCont = (from t in _context.TbContacts where t.MemberId == userID select new { t.MemberId }).ToList();

            List<MemberByTypeModel>? lst = null;

            if (searchType == 1)
            { //email
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       where m.Email!.Contains(searchString)

                       select new MemberByTypeModel()
                       {
                           MemberID = m.MemberId.ToString(),
                           Name = mpf.FirstName + " " + mpf.LastName,
                           TypeVal = m.Email ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           IsFriend = ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID) ? "yes" : "no",
                           IsSamePerson = (m.MemberId == userID) ? "yes" : "no",
                       }
                      ).ToList();
            }
            else if (searchType == 2)
            { //high schools
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       join p in _context.TbMemberProfileEducationV2s on m.MemberId equals p.MemberId
                       where p.SchoolName!.Contains(searchString) && (p.SchoolType == 1 || p.SchoolType == 0)

                       select new MemberByTypeModel()
                       {
                           MemberID = m.MemberId.ToString(),
                           Name = mpf.FirstName + " " + mpf.LastName,
                           TypeVal = p.SchoolName ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           IsFriend = ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID) ? "yes" : "no",
                           IsSamePerson = (m.MemberId == userID) ? "yes" : "no",
                       }
                      ).ToList();
            }
            else if (searchType == 4)
            { //college
                lst = (from mpf in _context.TbMemberProfiles
                       join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                       join p in _context.TbMemberProfileEducationV2s on m.MemberId equals p.MemberId
                       where p.SchoolName!.Contains(searchString) && (p.SchoolType == 3)

                       select new MemberByTypeModel()
                       {
                           MemberID = m.MemberId.ToString(),
                           Name = mpf.FirstName + " " + mpf.LastName,
                           TypeVal = p.SchoolName ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           IsFriend = ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != userID) ? "yes" : "no",
                           IsSamePerson = (m.MemberId == userID) ? "yes" : "no",
                       }
                      ).ToList();
            }
            return lst!;
        }

        /// <summary>
        /// Accept contact's request 
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        public void AcceptRequest(int memberID, int contactID)
        {
            var pMemberID = new SqlParameter("@MemberID", memberID);
            var pContactID = new SqlParameter("@ContactID", contactID);
            _context.Database.ExecuteSqlRaw("EXEC spAcceptRequest @MemberID, @ContactID", pMemberID, pContactID);
        }

        /// <summary>
        /// Reject contact's request
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        public void RejectRequest(int memberID, int contactID)
        {
            var pMemberID = new SqlParameter("@MemberID", memberID);
            var pContactID = new SqlParameter("@ContactID", contactID);
            _context.Database.ExecuteSqlRaw("EXEC spRejectRequest @MemberID, @ContactID", pMemberID, pContactID);

        }

        /// <summary>
        /// Delete contact
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        public void DeleteContact(int memberID, int contactID)
        {
            var pMemberID = new SqlParameter("@MemberID", memberID);
            var pContactID = new SqlParameter("@ContactID", contactID);
            _context.Database.ExecuteSqlRaw("EXEC spDeleteContact @MemberID, @ContactID", pMemberID, pContactID);
        }

        /// <summary>
        /// Get whose following me
        /// </summary>
        /// <returns>The list of members I am following.</returns>
        /// <param name="memberID">User identifier.</param>
        public List<MemberContactsModel> GetWhosFollowingMe(int memberID)
        {
            var result = _context.Set<MemberContactsModel>().FromSqlRaw("exec spGetWhosFollowingMe @MemberID", new SqlParameter("@MemberID", memberID));
            return new List<MemberContactsModel>(result);
        }

        /// <summary>
        /// get people I follow
        /// </summary>
        /// <param name="memberID">User identifier.</param>
        public List<MemberContactsModel> GetPeopleIFollow(int memberID)
        {
            var result = _context.Set<MemberContactsModel>().FromSqlRaw("exec spGetFollowedMembers @MemberID", new SqlParameter("@MemberID", memberID));
            return new List<MemberContactsModel>(result);
        }

        /// <summary>
        /// follow member
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        public void FollowMember(int memberID, int contactID)
        {
            var pMemberID = new SqlParameter("@MemberID", memberID);
            var pContactID = new SqlParameter("@FollowingMemberID", contactID);
            _context.Database.ExecuteSqlRaw("EXEC spAddFollowingMember @MemberID, @FollowingMemberID", pMemberID, pContactID);
        }

        /// <summary>
        /// un follow member
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        public void UnfollowMember(int memberID, int contactID)
        {
            var pMemberID = new SqlParameter("@MemberID", memberID);
            var pContactID = new SqlParameter("@FollowingMemberID", contactID);
            _context.Database.ExecuteSqlRaw("EXEC spUnFollowMember @MemberID, @FollowingMemberID", pMemberID, pContactID);
        }


        /// <summary>
        /// Get entity by search type
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="searchText"></param>
        /// <param name="searchType"></param>
        /// <returns></returns>
        public List<EntityModel> GetEntityBySearchType(int memberID, string searchText, string searchType)
        {
            List<EntityModel>? lst = null;
            if (searchType.ToLower() == "contact")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbContacts on mpf.MemberId equals c.MemberId
                       join p in _context.TbMemberProfileContactInfos on c.MemberId equals p.MemberId
                       where c.MemberId == memberID && (mpf.LastName!.Contains(searchText) || mpf.FirstName!.Contains(searchText))

                       select new EntityModel()
                       {
                           EntityID = c.ContactId.ToString(),
                           EntityName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           LastName = mpf.LastName ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           CityState = p.City + ", " + p.State,
                           Id = c.ContactId.ToString(),
                           Name = mpf.FirstName + " " + mpf.LastName
                       }
                      ).ToList();
            }
            else if (searchType == "people")
            {
                lst = (from mpf in _context.TbMemberProfiles
                       join c in _context.TbMembers on mpf.MemberId equals c.MemberId
                       join p in _context.TbMemberProfileContactInfos on c.MemberId equals p.MemberId
                       where (mpf.LastName!.Contains(searchText)) || (mpf.FirstName!.Contains(searchText)) || ((mpf.FirstName + " " + mpf.LastName).Contains(searchText))

                       select new EntityModel()
                       {
                           EntityID = c.MemberId.ToString(),
                           EntityName = mpf.FirstName + " " + mpf.LastName,
                           FirstName = mpf.FirstName ?? "",
                           LastName = mpf.LastName ?? "",
                           PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                           CityState = p.City + ", " + p.State,
                           Id = c.MemberId.ToString(),
                           Name = mpf.FirstName + " " + mpf.LastName
                       }
                      ).ToList();
            }
            return lst!;
        }

        /// <summary>
        /// Get contact search results 
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public List<ContactSearchModel> ContactSearchResults(int memberID, string searchText)
        {
            List<ContactSearchModel>? lst = null;
            lst = (from mpf in _context.TbMemberProfiles
                   join c in _context.TbContacts on mpf.MemberId equals c.MemberId
                   join p in _context.TbMemberProfileContactInfos on c.MemberId equals p.MemberId
                   where c.MemberId == memberID && (mpf.LastName!.Contains(searchText) || mpf.FirstName!.Contains(searchText))

                   select new ContactSearchModel()
                   {
                       EntityID = c.ContactId.ToString(),
                       EntityName = mpf.FirstName + " " + mpf.LastName,
                       FirstName = mpf.FirstName ?? "",
                       LastName = mpf.LastName ?? "",
                       PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                       CityState = p.City + ", " + p.State,
                       LabelText = "",
                       Email = "",
                       NameAndID = "",
                       Params = "",
                       ParamsAV = "",
                       Description = "",
                       MemberCount = "",
                       CreatedDate = "01/01/1900",
                       Location = "",
                   }
                      ).ToList();
            return lst;
        }

        /// <summary>
        /// return people search result
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public List<ContactSearchModel> PeopleSearchResults(int memberID, string searchText)
        {
            var lstReq = (from t in _context.TbContactRequests where t.FromMemberId == memberID select t).ToList();
            var lstCont = (from t in _context.TbContacts where t.MemberId == memberID select new { t.MemberId }).ToList();

            List<ContactSearchModel>? lst = null;
            lst = (from mpf in _context.TbMemberProfiles
                   join m in _context.TbMembers on mpf.MemberId equals m.MemberId
                   where (mpf.LastName!.Contains(searchText) || mpf.FirstName!.Contains(searchText))

                   select new ContactSearchModel()
                   {
                       EntityID = m.MemberId.ToString(),
                       EntityName = mpf.FirstName + " " + mpf.LastName,
                       FirstName = mpf.FirstName ?? "",
                       LastName = mpf.LastName ?? "",
                       PicturePath = (string.IsNullOrEmpty(mpf.PicturePath)) ? "default.png" : mpf.PicturePath,
                       CityState = "",
                       LabelText = ((m.MemberId == memberID) || (lstReq.Any(mb => mb.FromMemberId == m.MemberId)) || ((lstCont.Any(c => c.MemberId == m.MemberId)) && m.MemberId != memberID)) ? "View Profile" : "Add as Contact",
                       Email = m.Email ?? "",
                       NameAndID = m.MemberId.ToString() + "," + mpf.FirstName + "," + mpf.LastName,
                       Params = m.MemberId.ToString() + ",'" + mpf.FirstName + "','" + mpf.LastName + "'",
                       ParamsAV = "",
                       Description = "",
                       MemberCount = "",
                       CreatedDate = "01/01/1900",
                       Location = "",
                   }
                      ).ToList();
            return lst;
        }

        public List<SearchModel> SearchResults(int memberID, string searchText)
        {
            var result = _context.Set<SearchModel>().FromSqlRaw("exec spSearchResults @MemberID, @SearchText ", new SqlParameter("@MemberID", memberID), new SqlParameter("@SearchText", searchText));
            return new List<SearchModel>(result);
        }

        public List<SearchModel> SearchAllResults(int memberID, string searchText)
        {
            var result = _context.Set<SearchModel>().FromSqlRaw("exec spAllSearchResults @MemberID, @SearchText ", new SqlParameter("@MemberID", memberID), new SqlParameter("@SearchText", searchText));
            return new List<SearchModel>(result);
        }

        public void SendRequestContact(string memberID, string contactID)
        {
            _mbrRepo.SendFriendRequest(Convert.ToInt32(memberID), contactID);
            string msg = "I would like to add you to my contact list so we can start networking. Please accept the request from your request connections list.";
            _msgRepo.CreateMessage(Convert.ToInt32(contactID), Convert.ToInt32(memberID), "Requesting Contact", msg, "", "");

        }

        public IEnumerable<dynamic> GetDynamicResult(string commandText, params SqlParameter[] parameters)
        {
            // Get the connection from DbContext
            var connection = _context.Database.GetDbConnection();

            // Open the connection if isn't open
            if (connection.State != System.Data.ConnectionState.Open)
                connection.Open();

            using (var command = connection.CreateCommand())
            {
                command.CommandText = commandText;
                command.Connection = connection;

                if (parameters?.Length > 0)
                {
                    foreach (var parameter in parameters)
                    {
                        command.Parameters.Add(parameter);
                    }
                }

                using (var dataReader = command.ExecuteReader())
                {
                    // List for column names
                    var names = new List<string>();

                    if (dataReader.HasRows)
                    {
                        // Add column names to list
                        for (var i = 0; i < dataReader.VisibleFieldCount; i++)
                        {
                            names.Add(dataReader.GetName(i));
                        }
                        while (dataReader.Read())
                        {
                            // Create the dynamic result for each row
                            var result = new ExpandoObject() as IDictionary<string, object>;
                            foreach (var name in names)
                            {
                                // Add key-value pair
                                // key = column name
                                // value = column value
                                result.Add(name, dataReader[name]);
                            }
                            yield return result;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Check to see if contact id is followin memberID.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="connectionID"></param>
        /// <returns></returns>
        public bool IsFollowingContact(int memberID, int connectionID)
        {
            var result = _context.Set<ResultModel>().FromSqlRaw("exec IsFollowingContact @MemberID, @FollowingMemberId ", new SqlParameter("@MemberID", memberID), new SqlParameter("@FollowingMemberId", connectionID));
            var res = new List<ResultModel>(result);

            if (res.Count == 0)
                return false;
            else
                return true;
        }

    }
}