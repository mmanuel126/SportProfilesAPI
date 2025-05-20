using spapi.Data;
using spapi.Models.Member;

namespace spapi.Interfaces {
    public interface IMemberRepository
    {
        string SavePosts(int memberID, int postID, String postMsg);
        List<RecentPostChildModel> GetMemberPostResponses(int postID);
        List<MemberPostsModel> GetMemberPosts(int memberID);
        List<MemberDatesModel> GetMemberDates(int memberID);
        string GetInterestDescription(int interestID);
        List<TbMemberProfilePersonalInfo> GetMemberPersonalInfo(int memberID);
        List<TbMemberProfileContactInfo> GetMemberConnectionInfo(int memberID);
        List<MemberProfileEducationModel> GetMemberEducationInfo(int memberID);
        void SaveMemberGeneralInfo(int memberID, MemberProfileGenInfoModel saveInfo);
        void SaveMemberPersonalInfo(
                     int memberID,
                     string activities,
                     string interests,
                     string specialSkills,
                     string aboutMe);
        void SaveMemberContactInfo(int memberID, MemberProfileContactInfoModel body);

        void SaveMemberContactInfoV2(int memberID,
                               string email,
                               string otherEmail, string facebook, string instagram, string twitter,
                               string website, string homePhone, string cellPhone, string address, string city,
                               string neighborhood, string state, string zip,
                               string showAddress, string showEmailToMembers, string showCellPhone, string showHomePhone);
                     
        void SendFriendRequest(int memberID, string email);
        bool IsContactRequestSent(int memberID, int toMemberiD);
        bool IsMember(string email);
        bool IsFriend(int memberID, string email);
        bool IsFriend(int memberID, int contactID);
        void SaveBasicProfileInfo(string email,
                                    string highSchool,
                                    string highSchoolYear,
                                    string college,
                                    string collegeYear,
                                    string company);
        List<MemberInfoByEmailModel> GetMemberInfoByEmail(string email);
        void CreateMemberPost(int memberID, string postMsg);
        void CreatePostComment(int memberID, int postID, string postMsg);
        List<TbInterest> GetMemberInterests();
        void AddMemberSchool(int memberID, long instID, int instType, string school, string classYear, string major, int degree, string societies, string sportLevelType);
        void UpdateMemberSchool(int memberID, int instID, int instType, string classYear, string major, int degree, string societies, string sportLevelType);
        void RemoveMemberSchool(int memberID, int instID, int instType);
        bool IsMemberActive(int memberID);
        List<TbMember> GetMemberEmail(int memberID);
        List<RegisteredMembersModel> GetRegisteredMembers(int status);
        void UpdateProfilePicture(int memberID, string fileName);
        string GetYoutubeChannel(int memberID);
        void SetYoutubeChannel(string memberID, string channel);
        string GetInstagramURL(int memberID);
        void SetInstagramURL(string memberID, string instagramURL);
        List<YoutubePlayListModel> GetVideoPlayList(string memberID);
        List<YoutubeVideosListModel> GetVideosList(string playerListID);
        MemberProfileGenInfoModel GetMemberGeneralInfoV2(int memberID);
     }

}