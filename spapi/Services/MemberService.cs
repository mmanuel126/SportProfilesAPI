using spapi.Models.Member;
using spapi.Interfaces;
using spapi.Data;

namespace spapi.Services
{
    /// <summary>
    /// Contact service functionality code
    /// </summary>
    public class MemberService(IMemberRepository memberRepository, IConfiguration configuration, IAccountRepository loggingRepository) : IMemberService
    {
        readonly IMemberRepository _mbrRepo = memberRepository;
        private readonly IConfiguration _configuration = configuration;
        private readonly IAccountRepository _logRepo = loggingRepository;

        /// <summary>
        /// Validates the new registered user.
        /// </summary>
        /// <returns>The new registered user.</returns>
        /// <param name="email">Email.</param>
        /// <param name="code">Code.</param>
        public string ValidateNewRegisteredUser(string email, string code)
        {
            return _logRepo.AuthenticateNewRegisteredUser(email, code);
        }

        /// <summary>
        /// Saves the posts.
        /// </summary>
        /// <returns>The posts.</returns>
        /// <param name="memberID"></param>
        /// <param name="postID"></param>
        /// <param name="postMsg"></param>
        public string SavePosts(int memberID, int postID, string postMsg)
        {
            if (postID == 0)
                _mbrRepo.CreateMemberPost(memberID, postMsg);
            else
                _mbrRepo.CreatePostComment(memberID, postID, postMsg);
            return "success";
        }

        /// <summary>
        /// LGRs the recent post responses.
        /// </summary>
        /// <returns>The recent post responses.</returns>
        /// <param name="postID">Post identifier.</param>
        public List<RecentPostChildModel> GetRecentPostResponses(int postID)
        {
            return _mbrRepo.GetMemberPostResponses(postID);
        }

        /// <summary>
        /// Get the recent posts.
        /// </summary>
        /// <returns>The recent posts.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberPostsModel> GetRecentPosts(int memberID)
        {
            return _mbrRepo.GetMemberPosts(memberID);
        }

        /// <summary>
        /// Gets the member general info v2.
        /// </summary>
        /// <returns>The member general info v2.</returns>
        /// <param name="memberID">Member identifier.</param>
        public MemberProfileGenInfoModel GetMemberGeneralInfoV2(int memberID)
        {
            return _mbrRepo.GetMemberGeneralInfoV2(memberID);
        }

        /// <summary>
        /// Gets list of member dates.
        /// </summary>
        /// <returns>The member dates.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberDatesModel> GetMemberDates(int memberID)
        {
            return _mbrRepo.GetMemberDates(memberID);
        }

        /// <summary>
        /// Gets member interest description.
        /// </summary>
        /// <returns>The interest description.</returns>
        /// <param name="interestID">Interest identifier.</param>
        public string GetInterestDescription(int interestID)
        {
            return _mbrRepo.GetInterestDescription(interestID);
        }

        /// <summary>
        /// Gets member personal information.
        /// </summary>
        /// <returns>The member personal info.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<TbMemberProfilePersonalInfo> GetMemberPersonalInfo(int memberID)
        {
            return _mbrRepo.GetMemberPersonalInfo(memberID);
        }

        /// <summary>
        /// Gets member contact information.
        /// </summary>
        /// <returns>The member contact info.</returns>
        /// <param name="memberID">Member identifier.</param>
        public TbMemberProfileContactInfo GetMemberContactInfo(int memberID)
        {
            List<TbMemberProfileContactInfo> lst = _mbrRepo.GetMemberConnectionInfo(memberID);
            if (lst.Count == 0) { return null!; } else { return lst[0]; }
            ;
        }

        /// <summary>
        /// Gets member education information.
        /// </summary>
        /// <returns>The member education info.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberProfileEducationModel> GetMemberEducationInfo(int memberID)
        {
            return _mbrRepo.GetMemberEducationInfo(memberID);
        }

        /// <summary>
        /// Saves or update the member general info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">input data of the MemberProfileGenInfo Model.</param>
        public void SaveMemberGeneralInfo(int memberID, MemberProfileGenInfoModel body)
        {
            _mbrRepo.SaveMemberGeneralInfo(memberID, body);
        }

        /// <summary>
        /// Saves or update the member personal info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="activities">Activities.</param>
        /// <param name="interests">Interests.</param>
        /// <param name="specialSkills">Special skills.</param>
        /// <param name="aboutMe">About me.</param>
        public void SaveMemberPersonalInfo(
                      int memberID,
                      string activities,
                      string interests,
                      string specialSkills,
                      string aboutMe)
        {
            _mbrRepo.SaveMemberPersonalInfo(memberID, activities, interests, specialSkills, aboutMe);
        }

        /// <summary>
        /// Saves or update the member contact information.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">model input data.</param>
        public void SaveMemberContactInfo(int memberID, MemberProfileContactInfoModel body)
        {
            _mbrRepo.SaveMemberContactInfo(memberID, body);
        }

        /// <summary>
        /// Saves or update the member contact information.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="Email"></param>
        /// <param name="OtherEmail"></param>
        /// <param name="Facebook"></param>
        /// <param name="Instagram"></param>
        /// <param name="Twitter"></param>
        /// <param name="Website"></param>
        /// <param name="HomePhone"></param>
        /// <param name="CellPhone"></param>
        /// <param name="Address"></param>
        /// <param name="City"></param>
        /// <param name="Neighborhood"></param>
        /// <param name="State"></param>
        /// <param name="Zip"></param>
        /// <param name="ShowAddress"></param>
        /// <param name="ShowEmailToMembers"></param>
        /// <param name="ShowCellPhone"></param>
        /// <param name="ShowHomePhone"></param>
        public void SaveMemberContactInfoV2(int memberID,
             string Email,
             string OtherEmail,
             string Facebook,
             string Instagram,
             string Twitter,
             string Website,
             string HomePhone,
             string CellPhone,
             string Address,
             string City,
             string Neighborhood,
             string State,
             string Zip,
             string ShowAddress,
             string ShowEmailToMembers,
             string ShowCellPhone,
             string ShowHomePhone
            )
        {

            _mbrRepo.SaveMemberContactInfoV2(memberID, Email, OtherEmail, Facebook, Instagram,
                                              Twitter, Website, HomePhone, CellPhone,
                                              Address, City, Neighborhood, State, Zip, ShowAddress, ShowEmailToMembers,
                                              ShowCellPhone, ShowHomePhone);
        }


        /// <summary>
        /// Sends the friend request.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="email">Email.</param>
        public void SendFriendRequest(int memberID, string email)
        {
            _mbrRepo.SendFriendRequest(memberID, email);
        }

        /// <summary>
        /// checks if contact request was sent to member id.
        /// </summary>
        /// <returns><c>true</c>, if contact request sent was ised, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="toMemberID">To member identifier.</param>
        public bool IsContactRequestSent(int memberID, int toMemberID)
        {
            return _mbrRepo.IsContactRequestSent(memberID, toMemberID);
        }

        /// <summary>
        /// checks if member exists for an email".
        /// </summary>
        /// <returns><c>true</c>, if member was ised, <c>false</c> otherwise.</returns>
        /// <param name="email">Email.</param>
        public bool IsMember(string email)
        {
            return _mbrRepo.IsMember(email);
        }

        /// <summary>
        /// checks if member is a contact by contact's email.
        /// </summary>
        /// <returns><c>true</c>, if friend by email was used, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="email">Email.</param>
        public bool IsFriendByEmail(int memberID, string email)
        {
            return _mbrRepo.IsFriend(memberID, email);
        }

        /// <summary>
        /// checks if member is a contact by contact id
        /// </summary>
        /// <returns><c>true</c>, if friend by contact identifier was ised, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public bool IsFriendByContactID(int memberID, int contactID)
        {
            bool b = _mbrRepo.IsFriend(memberID, contactID);
            return b;
        }

        /// <summary>
        /// Saves the member basic profile info.
        /// </summary>
        /// <param name="email">Email.</param>
        /// <param name="highSchool">High school.</param>
        /// <param name="highSchoolYear">High school year.</param>
        /// <param name="college">College.</param>
        /// <param name="collegeYear">College year.</param>
        /// <param name="company">Company.</param>
        public void SaveBasicProfileInfo(string email,
                                     string highSchool,
                                     string highSchoolYear,
                                     string college,
                                     string collegeYear,
                                     string company)
        {
            _mbrRepo.SaveBasicProfileInfo(email, highSchool, highSchoolYear, college, collegeYear, company);
        }

        /// <summary>
        /// Gets the member info by email.
        /// </summary>
        /// <returns>The member info by email.</returns>
        /// <param name="email">Email.</param>
        public List<MemberInfoByEmailModel> GetMemberInfoByEmail(string email)
        {
            List<MemberInfoByEmailModel> lst = _mbrRepo.GetMemberInfoByEmail(email);
            return lst;
        }

        /// <summary>
        /// Gets the member posts.
        /// </summary>
        /// <returns>The member posts.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberPostsModel> GetMemberPosts(int memberID)
        {
            List<MemberPostsModel> lst = _mbrRepo.GetMemberPosts(memberID);
            return lst;
        }

        /// <summary>
        /// Gets the member post responses.
        /// </summary>
        /// <returns>The member post responses.</returns>\
        /// <param name="postID">Post identifier.</param>
        public List<RecentPostChildModel> GetMemberPostResponses(int postID)
        {
            List<RecentPostChildModel> lst = _mbrRepo.GetMemberPostResponses(postID);
            return lst;
        }


        /// <summary>
        /// Creates the member post.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="postMsg">Post message.</param>
        public void CreateMemberPost(int memberID, string postMsg)
        {
            _mbrRepo.CreateMemberPost(memberID, postMsg);
        }


        /// <summary>
        /// Creates the post comment.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="postID">Post identifier.</param>
        /// <param name="postMsg">Post message.</param>
        public void CreatePostComment(int memberID, int postID, string postMsg)
        {
            _mbrRepo.CreatePostComment(memberID, postID, postMsg);
        }


        /// <summary>
        /// Gets the member interests.
        /// </summary>
        /// <returns>The member interests.</returns>
        public List<TbInterest> GetMemberInterests()
        {
            return (_mbrRepo.GetMemberInterests());
        }

        /// <summary>
        /// Adds the member school to db.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        public void AddMemberSchool(int memberID, MemberProfileEducationModel body)
        {
            _mbrRepo.AddMemberSchool(memberID, long.Parse(body.SchoolID), int.Parse(body.SchoolType), body.SchoolName, body.YearClass, body.Major, int.Parse(body.Degree), body.Societies, body.SportLevelType);
        }

        /// <summary>
        /// Updates the member school.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        public void UpdateMemberSchool(int memberID, MemberProfileEducationModel body)
        {
            _mbrRepo.UpdateMemberSchool(memberID, int.Parse(body.SchoolID), int.Parse(body.SchoolType), body.YearClass, body.Major, int.Parse(body.Degree), body.Societies, body.SportLevelType);
        }

        /// <summary>
        /// Removes the member school.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="instID">Inst identifier.</param>
        /// <param name="instType">Inst type.</param>
        public void RemoveMemberSchool(int memberID, int instID, int instType)
        {
            _mbrRepo.RemoveMemberSchool(memberID, instID, instType);
        }

        /// <summary>
        /// checks to see if the member is active.
        /// </summary>
        /// <returns><c>true</c>, if member active was used, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        public bool IsMemberActive(int memberID)
        {
            return _mbrRepo.IsMemberActive(memberID);
        }

        /// <summary>
        /// Gets the member email.
        /// </summary>
        /// <returns>The member email.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<TbMember> GetMemberEmail(int memberID)
        {
            return (_mbrRepo.GetMemberEmail(memberID));
        }

        /// <summary>
        /// Gets the registered members.
        /// </summary>
        /// <returns>The registered members.</returns>
        /// <param name="status">Status.</param>
        public List<RegisteredMembersModel> GetRegisteredMembers(int status)
        {
            return _mbrRepo.GetRegisteredMembers(status);
        }

        public string GetYoutubeChannel(int memberID)
        {
            return _mbrRepo.GetYoutubeChannel(memberID);
        }

        public void SetYoutubeChannel(YoutubeChannelModel body)
        {
            _mbrRepo.SetYoutubeChannel(body.MemberID, body.ChannelID);
        }

        public string GetInstagramURL(int memberID)
        {
            return _mbrRepo.GetInstagramURL(memberID);
        }

        public void SetInstagramURL(InstagramURLModel body)
        {
            _mbrRepo.SetInstagramURL(body.MemberID, body.InstagramURL);
        }

        private static string HTMLBodyText(string email, string name, string code, string appName, string webSiteLink)
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
            str = str + "The " + appName + " staff<br />";
            str += "</p>";
            str += "<p></p><p>";
            str += "</td>";
            str += "</tr>";
            str += "</table>";
            return str;
        }

        /// <summary>
        /// Uploads the profile photo.
        /// </summary>
        /// <returns>The profile photo.</returns>
        /// <param name="memberId">Member identifier.</param>

        public void UploadProfilePhoto(string memberId, string fileName)
        {
            //update table with file name
            _mbrRepo.UpdateProfilePicture(Convert.ToInt32(memberId), fileName);

        }

        /// <summary>
        /// set member status
        /// </summary>
        /// <param name="memberId">Member identifier.</param>
        /// <param name="status">member status</param>
        public void SetMemberStatus(int memberId, int status)
        {
            _logRepo.SetMemberStatus(memberId, status);
        }

        /// <summary>
        /// Get utube video playlist
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public List<YoutubePlayListModel> GetVideoPlayList(string memberId)
        {
            return _mbrRepo.GetVideoPlayList(memberId);
        }

        /// <summary>
        /// Get videos list for a player list.
        /// </summary>
        /// <param name="playerListID"></param>
        /// <returns></returns>
        public List<YoutubeVideosListModel> GetVideosList(string playerListID)
        {
            return _mbrRepo.GetVideosList(playerListID);
        }

        private string HTMLContactUsBodyText(string name, string strUserEmail, string subject, string issueType, string desc)
        {
            string appName = _configuration.GetValue<string>("AppStrings:AppName") ?? "";
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
            str = str + "<p>On behalf of " + appName + " user " + strUserEmail + ", the following message from ContactUs page was sent:" + "<br/>";
            str += "<p />";
            str = str + "<p><b>Email Address:</b> " + strUserEmail + " <br/>";
            str = str + "<b>Subject:</b> " + subject + " <br/>";
            str = str + "<b>Issue type:</b> " + issueType + " <br/>";
            str = str + "<b>Description:</b> " + desc + " <br/>";
            str += "<p/>";
            str += "Thanks.<br />";
            str = str + "The " + appName + " Staff<br />";
            str += "</p>";
            str += "<p></p><p>";
            str += "</td>";
            str += "</tr>";
            str += "</table>";
            return str;
        }

    }
}