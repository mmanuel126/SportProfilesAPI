using spapi.Models.Member;
using spapi.Models.Setting;

namespace spapi.Interfaces
{
    public interface ISettingService
    {
        List<MemberNameInfoModel> GetMemberNameInfo(int memberID);
        void SaveMemberNameInfo(int memberID, string fName, string mName, string lName);
        void SaveMemberEmailInfo(int memberID, string email);
        void SavePasswordInfo(PasswordDataModel body);
        public void SaveSecurityQuestionInfo(int memberID, int questionID, string answer);
        void DeactivateAccount(int memberID, int reason, string explanation, bool? futureEmail);
        List<NotificationsSettingModel> GetMemberNotifications(int memberId);
        void SaveNotificationSettings(int memberID, NotificationsSettingModel body);
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
    }
}