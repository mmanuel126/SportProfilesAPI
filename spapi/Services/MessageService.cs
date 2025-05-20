using spapi.Interfaces;
using spapi.Data;
using spapi.Models.Message;

namespace spapi.Services
{
    /// <summary>
    /// Messages service functionality code
    /// </summary>
    public class MessageService(IMessageRepository messageRepository, IConfiguration configuration, IAccountRepository loggingRepository) : IMessageService
    {
        readonly IMessageRepository _msgRepo = messageRepository;
        private readonly IConfiguration _configuration = configuration;
        private readonly IAccountRepository _logRepo = loggingRepository;

        /// <summary>
        /// Gets member notifications.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="showType"></param>
        /// <returns></returns>
        public List<TbNotification> GetMemberNotifications(int memberID, string showType)
        {
            List<TbNotification> lst = _msgRepo.GetMemberNotifications(memberID, showType);
            return lst;
        }

        /// <summary>
        /// Gets the member messages.
        /// </summary>
        /// <returns>The member messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="showType">Show type.</param>
        public List<SearchMessagesModel> GetMemberMessages(int memberID, string showType)
        {
            var mlist = _msgRepo.GetMemberMessages(memberID, showType);
            return mlist;
        }

        /// <summary>
        /// Gets the total unread messages.
        /// </summary>
        /// <returns>The total unread messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        public int GetTotalUnreadMessages(int memberID)
        {
            int res = _msgRepo.GetTotalUnreadMessages(memberID);
            return (res);
        }

        /// <summary>
        /// Creates a message.
        /// </summary>
        /// <param name="to">To.</param>
        /// <param name="from">From.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="body">Body.</param>
        /// <param name="attachment">Attachment.</param>
        /// <param name="original">Original.</param>
        public void CreateMessage(int to, int from, string subject, string body, string attachment, string original)
        {
            _msgRepo.CreateMessage(to, from, subject, body, attachment, original);
        }

        /// <summary>
        /// Creates the message by source.
        /// </summary>
        /// <param name="to">To.</param>
        /// <param name="from">From.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="body">Body.</param>
        /// <param name="attachment">Attachment.</param>
        /// <param name="source">Source.</param>
        /// <param name="original">Original.</param>
        public void CreateMessageBySource(string to, string from, string subject, string body, string attachment, string source, string original)
        {
            _msgRepo.CreateMessage(to, from, subject, body, attachment, source, original);
        }

        /// <summary>
        /// Toggles the state of the notification.
        /// </summary>
        /// <param name="status">If set to <c>true</c> status.</param>
        /// <param name="notificationID">Notification identifier.</param>
        public void ToggleNotificationState(bool status, int notificationID)
        {
            _msgRepo.ToggleNotificationState(status, notificationID);
        }

        /// <summary>
        /// Deletes the notification.
        /// </summary>
        /// <param name="notificationID">Notification identifier.</param>
        /// <param name="memberID">Member identifier.</param>
        public void DeleteNotification(int notificationID, int memberID)
        {
            _msgRepo.DeleteNotification(notificationID, memberID);
        }

        /// <summary>
        /// Toggles the state of the message.
        /// </summary>
        /// <param name="status">Status.</param>
        /// <param name="msgID">Message identifier.</param>
        public void ToggleMessageState(int status, int msgID)
        {
            _msgRepo.ToggleMessageState(status, msgID);
        }

        /// <summary>
        /// Gets list of notifications by identifier.
        /// </summary>
        /// <returns>The notification by identifier.</returns>
        /// <param name="nid">Nid.</param>
        public IQueryable<TbNotification> GetNotificationByID(int nid)
        {
            IQueryable<TbNotification> lst = _msgRepo.GetNotificationByID(nid);
            return lst;
        }

        /// <summary>
        /// Gets the message info by identifier.
        /// </summary>
        /// <returns>The message info by identifier.</returns>
        /// <param name="msgID">Message identifier.</param>
        public List<MessageInfoModel> GetMessageInfoByID(int msgID)
        {
            List<MessageInfoModel> lst = _msgRepo.GetMessageInfoByID(msgID);
            return lst;
        }

        /// <summary>
        /// Deletes the message.
        /// </summary>
        /// <param name="msgID">Message identifier.</param>
        public void DeleteMessage(int msgID)
        {
            _msgRepo.DeleteMessage(msgID);
        }

        /// <summary>
        /// Searchs messages given search key for member id.
        /// </summary>
        /// <returns>The messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchKey">Search key.</param>
        public List<SearchMessagesModel> SearchMessages(int memberID, string searchKey)
        {
            List<SearchMessagesModel> msgList = _msgRepo.SearchMessages(memberID, searchKey);
            return msgList;
        }
    }
}