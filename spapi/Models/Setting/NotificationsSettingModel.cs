namespace spapi.Models.Setting
{
    /// <summary>
    /// Holds the system notifications to member info 
    /// </summary>
    public class NotificationsSettingModel
    {
        public int MemberID { get; set; }
        public bool SendMsg { get; set; }
        public bool AddAsFriend { get; set; }
        public bool ConfirmFriendShipRequest { get; set; }
        public bool RepliesToYourHelpQuest { get; set; }
    }
}