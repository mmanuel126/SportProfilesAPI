using spapi.Data;
using spapi.Models.Member;
using spapi.Models.Setting;

namespace spapi.Interfaces {
   public interface ISettingRepository
    {
        List<MemberNameInfoModel> GetMemberNameInfo(int memberID);
        void SaveMemberNameInfo(int memberID, string fName, string mName, string lName);
        void SaveMemberEmailInfo(int memberID, string email);
        void SavePasswordInfo(string memberID, string pwd);
        void SaveSecurityQuestionInfo(int memberID, int questionID, string answer);
        void DeactivateAccount(int memberID, int reason, string explanation, bool? futureEmail);
        bool ValidateMemberId(int memberID);
        List<NotificationsSettingModel> GetMemberNotifications(int memberId);
        public void SaveNotificationSettings(
              int MemberID,
              bool LG_SendMsg,
              bool LG_AddAsFriend,
              bool LG_ConfirmFriendShipRequest,
              bool HE_RepliesToYourHelpQuest
        );
        List<PrivacySearchSettingsModel> GetProfileSettings(int memberID);
        void SaveProfileSettings(int memberID, PrivacySearchSettingsModel body);
        List<PrivacySearchSettingsModel> GetPrivacySearchSettings(int memberID);
        void SavePrivacySearchSettings(
          int memberID,
          int visibility,
          bool viewProfilePicture,
          bool viewFriendsList,
          bool viewLinkToRequestAddingYouAsFriend,
          bool viewLinkToSendYouMsg);
        List<TbMemberProfile> GetAllMembers(string searchText);
        bool IsEmailExist(int memberID, string email);
        List<TbMemberProfilePicture> GetMemberProfilePictures(int memberID);
        string GetMemberDefaultPicture(int memberID);
        void RemoveProfilePicture(int memberID, string noPhotoFilename);
        void SetPictureAsDefault(int memberID, int profileID, string fileName);
        void RemovePicture(int profileID, string defaultFileName);
    } 
}