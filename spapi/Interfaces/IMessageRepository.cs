using spapi.Data;
using spapi.Models.Message;

namespace spapi.Interfaces
{
    public interface IMessageRepository
    {
        List<TbNotification> GetMemberNotifications(int memberID, string showType);
        List<SearchMessagesModel> GetMemberMessages(int memberID, string showType);
        int GetTotalUnreadMessages(int memberID);
        void CreateMessage(int to, int from, string subject, string body, string attachment, string original);
        void CreateMessage(string to, string from, string subject, string body, string attachment, string source, string original);

        void ToggleNotificationState(bool status, int notificationID);
        void DeleteNotification(int notificationID, int memberID);
        void ToggleMessageState(int status, int msgID);
        IQueryable<TbNotification> GetNotificationByID(int nid);
        List<MessageInfoModel> GetMessageInfoByID(int msgID);

        List<SearchMessagesModel> SearchMessages(int memberID, string searchKey);
        void DeleteMessage(int msgID);
    }
}