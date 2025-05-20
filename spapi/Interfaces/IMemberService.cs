using spapi.Data;
using spapi.Models.Member;

namespace spapi.Interfaces
{
    public interface IMemberService
    {
        string ValidateNewRegisteredUser(string email, string code);
        string SavePosts(int memberID, int postID, string postMsg);
        List<RecentPostChildModel> GetRecentPostResponses(int postID);
        List<MemberPostsModel> GetRecentPosts(int memberID);
        MemberProfileGenInfoModel GetMemberGeneralInfoV2(int memberID);
        List<MemberDatesModel> GetMemberDates(int memberID);
        string GetInterestDescription(int interestID);
        List<TbMemberProfilePersonalInfo> GetMemberPersonalInfo(int memberID);
        TbMemberProfileContactInfo GetMemberContactInfo(int memberID);
        List<MemberProfileEducationModel> GetMemberEducationInfo(int memberID);
        void SaveMemberGeneralInfo(int memberID, MemberProfileGenInfoModel body);
        void SaveMemberPersonalInfo(
                     int memberID,
                     string activities,
                     string interests,
                     string specialSkills,
                     string aboutMe);
        void SaveMemberContactInfo(int memberID, MemberProfileContactInfoModel body);
        void SaveMemberContactInfoV2(int memberID,
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
           );
        void SendFriendRequest(int memberID, string email);
        bool IsContactRequestSent(int memberID, int toMemberID);
        bool IsMember(string email);
        bool IsFriendByEmail(int memberID, string email);
        bool IsFriendByContactID(int memberID, int contactID);
        void SaveBasicProfileInfo(string email,
                                    string highSchool,
                                    string highSchoolYear,
                                    string college,
                                    string collegeYear,
                                    string company);
        List<MemberInfoByEmailModel> GetMemberInfoByEmail(string email);
        List<MemberPostsModel> GetMemberPosts(int memberID);
        List<RecentPostChildModel> GetMemberPostResponses(int postID);
        void CreateMemberPost(int memberID, string postMsg);
        void CreatePostComment(int memberID, int postID, string postMsg);
        List<TbInterest> GetMemberInterests();
        void AddMemberSchool(int memberID, MemberProfileEducationModel body);
        void UpdateMemberSchool(int memberID, MemberProfileEducationModel body);
        void RemoveMemberSchool(int memberID, int instID, int instType);
        bool IsMemberActive(int memberID);
        List<TbMember> GetMemberEmail(int memberID);
        List<RegisteredMembersModel> GetRegisteredMembers(int status);
        string GetYoutubeChannel(int memberID);
        void SetYoutubeChannel(YoutubeChannelModel body);
        string GetInstagramURL(int memberID);
        void SetInstagramURL(InstagramURLModel body);
        void UploadProfilePhoto(string memberId, string fileName);
        void SetMemberStatus(int memberId, int status);
        List<YoutubePlayListModel> GetVideoPlayList(string memberId);
        List<YoutubeVideosListModel> GetVideosList(string playerListID);
    }
}