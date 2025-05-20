
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Data;
using spapi.Models;
using spapi.Models.Message;
using spapi.Interfaces;
using spapi.Data;

namespace spapi.Repositories
{
    /// <summary>
    /// Describes the functionalities for member and network messages
    /// </summary>
    public class MessageRepository(DBContextModel context) : IMessageRepository
    {
        readonly DBContextModel _context = context;

        public enum MessageStatus { UnRead, Read, Forwarded, RepliedTo };
        public enum MessageMoveType { Deleted, Junk, Sent, Message };
        public enum MessageFolder { Inbox, Junk, Sent, Deleted };

        /// <summary>
        /// get a listo of member notifications
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="showType"></param>
        /// <returns></returns>
        public List<TbNotification> GetMemberNotifications(int memberID, string showType)
        {
            List<TbNotification> nlist = [];
            if (showType == "All")
                nlist = (from n in _context.TbNotifications
                         join m in _context.TbMemberNotifications
                         on n.NotificationId equals m.NotificationId
                         where (m.MemberId == memberID)
                         orderby n.SentDate descending
                         select n).ToList();
            else
                nlist = (from n in _context.TbNotifications
                         join m in _context.TbMemberNotifications
                         on n.NotificationId equals m.NotificationId
                         where (m.MemberId == memberID) && (n.Status == false)
                         orderby n.SentDate descending
                         select n).ToList();
            return nlist;
        }

        private static string Getpicturepath(int id, DBContextModel context)
        {
            var q = (from p in context.TbMemberProfiles where p.MemberId == id select p.PicturePath).ToList();
            if (q == null)
            {
                return "default.png";
            }
            else
            {
                return q[0].ToString();
            }
        }

        public List<SearchMessagesModel> GetMemberMessages(int memberID, string showType)
        {
            List<SearchMessagesModel> msgList = [];
            if (showType != "All" && showType != "UnRead")
            {
                msgList = (
                    from msg in _context.TbMessages
                    join mpf in _context.TbMemberProfiles on msg.SenderId equals mpf.MemberId
                    into t
                    from nt in t.DefaultIfEmpty()
                    where
                        msg.ContactId == memberID &&
                        (nt.FirstName!.Contains(showType) || nt.LastName!.Contains(showType) || msg.Body!.Contains(showType))
                    orderby msg.MsgDate descending
                    select new SearchMessagesModel()
                    {
                        Attachement = msg.Attachment.ToString() ?? "",
                        Body = (msg.Body!.Length > 35) ? msg.Body.Substring(0, Math.Min(msg.Body.Length, 33)) + "..." : msg.Body,
                        ContactName = nt.FirstName + " " + nt.LastName,
                        ContactImage = Getpicturepath(Convert.ToInt32(msg.ContactId), _context),
                        SenderImage = string.IsNullOrEmpty(nt.PicturePath) ? "default.png" : nt.PicturePath,
                        ContactID = memberID.ToString(),
                        FlagLevel = msg.FlagLevel.ToString() ?? "",
                        ImportanceLevel = msg.ImportanceLevel.ToString() ?? "",
                        MessageID = msg.MessageId.ToString(),
                        MessageState = msg.MessageState.ToString(),
                        SenderID = nt.FirstName + " " + nt.LastName,
                        Subject = msg.Subject ?? "",
                        MsgDate = msg.MsgDate.ToString() ?? "",
                        FromID = msg.SenderId.ToString() ?? "",
                        FirstName = nt.FirstName ?? "",
                        FullBody = msg.Body
                    }
                ).ToList();
            }
            else if (showType == "All")
            {
                msgList = (
                    from msg in _context.TbMessages
                    join mpf in _context.TbMemberProfiles on msg.SenderId equals mpf.MemberId
                    into t
                    from nt in t.DefaultIfEmpty()
                    where
                           msg.ContactId == memberID
                    orderby msg.MsgDate descending
                    select new SearchMessagesModel()
                    {
                        Attachement = msg.Attachment.ToString() ?? "",
                        Body = (msg.Body!.Length > 35) ? msg.Body.Substring(0, Math.Min(msg.Body.Length, 33)) + "..." : msg.Body,
                        ContactName = nt.FirstName + " " + nt.LastName,
                        ContactImage = Getpicturepath(Convert.ToInt32(msg.ContactId), _context),
                        SenderImage = string.IsNullOrEmpty(nt.PicturePath) ? "default.png" : nt.PicturePath,
                        ContactID = memberID.ToString(),
                        FlagLevel = msg.FlagLevel.ToString() ?? "",
                        ImportanceLevel = msg.ImportanceLevel.ToString() ?? "",
                        MessageID = msg.MessageId.ToString(),
                        MessageState = msg.MessageState.ToString(),
                        SenderID = nt.FirstName + " " + nt.LastName,
                        Subject = msg.Subject ?? "",
                        MsgDate = msg.MsgDate.ToString() ?? "",
                        FromID = msg.SenderId.ToString() ?? "",
                        FirstName = nt.FirstName ?? "",
                        FullBody = msg.Body
                    }
                ).ToList();
            }
            else
            {
                msgList = (
                    from msg in _context.TbMessages
                    join mpf in _context.TbMemberProfiles on msg.SenderId equals mpf.MemberId
                    into t
                    from nt in t.DefaultIfEmpty()
                    where
                        msg.ContactId == memberID && msg.MessageState == 0
                    orderby msg.MsgDate descending
                    select new SearchMessagesModel()
                    {
                        Attachement = msg.Attachment.ToString() ?? "",
                        Body = (msg.Body!.Length > 35) ? msg.Body.Substring(0, Math.Min(msg.Body.Length, 33)) + "..." : msg.Body,
                        ContactName = nt.FirstName + " " + nt.LastName,
                        ContactImage = Getpicturepath(Convert.ToInt32(msg.ContactId), _context),
                        SenderImage = string.IsNullOrEmpty(nt.PicturePath) ? "default.png" : nt.PicturePath,
                        ContactID = memberID.ToString(),
                        FlagLevel = msg.FlagLevel.ToString() ?? "",
                        ImportanceLevel = msg.ImportanceLevel.ToString() ?? "",
                        MessageID = msg.MessageId.ToString(),
                        MessageState = msg.MessageState.ToString(),
                        SenderID = nt.FirstName + " " + nt.LastName,
                        Subject = msg.Subject ?? "",
                        MsgDate = msg.MsgDate.ToString() ?? "",
                        FromID = msg.SenderId.ToString() ?? "",
                        FirstName = nt.FirstName ?? "",
                        FullBody = msg.Body
                    }
                ).ToList();
            }
            return msgList;
        }


        /// <summary>
        /// Get total unread messages  for member id
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public int GetTotalUnreadMessages(int memberID)
        {
            var q = (from p in _context.TbMessages where p.ContactId == memberID && p.MessageState == 0 select p.MessageId).Count();
            return (q);
        }

        /// <summary>
        /// create a message 
        /// </summary>
        /// <param name="to"></param>
        /// <param name="from"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        /// <param name="attachment"></param>
        /// <param name="original"></param>
        public void CreateMessage(int to, int from, string subject, string body, string attachment, string original)
        {
            //create a new message object
            TbMessage m = new TbMessage();
            TbMessagesSent ms = new TbMessagesSent();

            m.SenderId = from; ms.SenderId = from;
            m.ContactId = to; ms.ContactId = to;
            m.Subject = subject; ms.Subject = subject;
            m.MsgDate = DateTime.Now; ms.MsgDate = DateTime.Now;
            m.Body = body; ms.Body = body;

            if (string.IsNullOrEmpty(attachment))
            {
                m.Attachment = false; ms.Attachment = false;
            }
            else
            {
                m.Attachment = true; ms.Attachment = true;
            }

            m.MessageState = 0; ms.MessageState = 0;
            m.AttachmentFile = attachment; ms.AttachmentFile = attachment;
            m.FlagLevel = 0; ms.FlagLevel = 0;
            m.ImportanceLevel = 0; ms.ImportanceLevel = 0;
            m.OriginalMsg = original; ms.OriginalMsg = original;

            // Add the new object to the the table.
            _context.TbMessages.Add(m); _context.TbMessagesSents.Add(ms);

            // submit and save the new message to both tables
            _context.SaveChanges();
        }

        /// <summary>
        /// create a message 
        /// </summary>
        /// <param name="to"></param>
        /// <param name="from"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        /// <param name="attachment"></param>
        /// <param name="source"></param>
        /// <param name="original"></param>
        public void CreateMessage(string to, string from, string subject, string body, string attachment, string source, string original)
        {
            //create a new message object
            TbMessage m = new TbMessage();
            TbMessagesSent ms = new TbMessagesSent();

            m.SenderId = Convert.ToInt32(from); ms.SenderId = Convert.ToInt32(from);
            m.ContactId = Convert.ToInt32(to); ms.ContactId = Convert.ToInt32(to);
            m.Subject = subject; ms.Subject = subject;
            m.MsgDate = DateTime.Now; ms.MsgDate = DateTime.Now;
            m.Body = body; ms.Body = body;

            if (string.IsNullOrEmpty(attachment))
            {
                m.Attachment = false; ms.Attachment = false;
            }
            else
            {
                m.Attachment = true; ms.Attachment = true;
            }

            m.MessageState = 0; ms.MessageState = 0;
            m.AttachmentFile = attachment; ms.AttachmentFile = attachment;
            m.FlagLevel = 0; ms.FlagLevel = 0;
            m.ImportanceLevel = 0; ms.ImportanceLevel = 0;
            m.OriginalMsg = original; ms.OriginalMsg = original;
            m.Source = source; ms.Source = source;

            // Add the new object to the the table.
            _context.TbMessages.Add(m); _context.TbMessagesSents.Add(ms);

            // submit and save the new message to both tables
            _context.SaveChanges();
        }

        /// <summary>
        /// toggle notification state
        /// </summary>
        /// <param name="status"></param>
        /// <param name="notificationID"></param>
        public void ToggleNotificationState(bool status, int notificationID)
        {
            var getNotification = (from n in _context.TbNotifications where (n.NotificationId == notificationID) select n).First();
            getNotification.Status = status;
            _context.SaveChanges();
        }

        /// <summary>
        /// Delete notification for member id
        /// </summary>
        /// <param name="notificationID"></param>
        /// <param name="memberID"></param>
        public void DeleteNotification(int notificationID, int memberID)
        {
            var getNotification = (from n in _context.TbMemberNotifications where (n.NotificationId == notificationID && n.MemberId == memberID) select n).First();
            _context.Remove(getNotification);
            _context.SaveChanges();
        }

        /// <summary>
        /// Toggle message state 
        /// </summary>
        /// <param name="status"></param>
        /// <param name="msgID"></param>
        public void ToggleMessageState(int status, int msgID)
        {
            switch (status)
            {
                case (int)MessageStatus.UnRead:
                    PerformMessageStatus(0, msgID, _context);
                    break;
                case (int)MessageStatus.Read:
                    PerformMessageStatus(1, msgID, _context);
                    break;
                case (int)MessageStatus.Forwarded:
                    PerformMessageStatus(2, msgID, _context);
                    break;
                case (int)MessageStatus.RepliedTo:
                    PerformMessageStatus(3, msgID, _context);
                    break;
            }
        }

        /// <summary>
        /// Perform message status
        /// </summary>
        /// <param name="status"></param>
        /// <param name="msgID"></param>
        /// <param name="context"></param>
        private void PerformMessageStatus(int status, int msgID, DBContextModel context)
        {
            var msg = (from m in context.TbMessages where (m.MessageId == msgID) select m).First();
            msg.MessageState = status;
            context.SaveChanges();
        }

        /// <summary>
        /// Get notification by id 
        /// </summary>
        /// <param name="nid"></param>
        /// <returns></returns>
        public IQueryable<TbNotification> GetNotificationByID(int nid)
        {
            var getNotification = (from n in _context.TbNotifications where (n.NotificationId == nid) select n);
            return getNotification;
        }

        /// <summary>
        /// Get message info by message ID
        /// </summary>
        /// <param name="msgID"></param>
        /// <returns></returns>
        public List<MessageInfoModel> GetMessageInfoByID(int msgID)
        {
            List<MessageInfoModel> lst;
            lst = (from msg in _context.TbMessages
                   join tmp in _context.TbMemberProfiles on msg.SenderId equals tmp.MemberId
                   where msg.MessageId == msgID
                   select new MessageInfoModel()
                   {
                       MessageID = msg.MessageId.ToString(),
                       SentDate = msg.MsgDate.ToString() ?? "",
                       From = tmp.FirstName + " " + tmp.LastName,
                       SenderPicture = string.IsNullOrEmpty(tmp.PicturePath) ? "default.png" : tmp.PicturePath,
                       Body = msg.Body ?? "",
                       Subject = msg.Subject ?? "",
                       AttachmentFile = msg.AttachmentFile ?? "",
                       OrginalMsg = msg.OriginalMsg ?? ""
                   }
                  ).ToList();
            return lst;
        }

        /// <summary>
        /// Delete moved message id
        /// </summary>
        /// <param name="msgID"></param>
        /// <param name="movestatus"></param>
        /// <param name="folder"></param>
        public void DeleteMoveMessage(int msgID, int movestatus, string folder)
        {
            int mtype = movestatus;
            int fType = 0;

            if (folder.ToLower() == "inbox")
                fType = (int)MessageFolder.Inbox;
            else if (folder.ToLower() == "junk")
                fType = (int)MessageFolder.Junk;
            else if (folder.ToLower() == "sent")
                fType = (int)MessageFolder.Sent;
            else if (folder.ToLower() == "deleted")
                fType = (int)MessageFolder.Deleted;
            var pId = new SqlParameter("@MsgID", msgID);
            var pMtype = new SqlParameter("@Movetype", mtype);
            var pFtype = new SqlParameter("@Folder", fType);
            _context.Database.ExecuteSqlRaw("EXEC spDeleteMoveMessage @MsgID, @Movetype, @Folder", pId, pMtype, pFtype);
        }

        /// <summary>
        /// Delete message id
        /// </summary>
        /// <param name="msgID"></param>
        public void DeleteMessage(int msgID)
        {
            var msg = (from m in _context.TbMessages where (m.MessageId == msgID) select m).First();
            //delete tbmessage
            _context.Remove(msg);
            //save changes to context
            _context.SaveChanges();
        }

        /// <summary>
        /// Search for messages
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<SearchMessagesModel> SearchMessages(int memberID, string searchKey)
        {
            List<SearchMessagesModel> msgList = (from msg in _context.TbMessages
                                                 join mpf in _context.TbMemberProfiles on msg.SenderId equals mpf.MemberId
                                                 where (mpf.FirstName!.Contains(searchKey) || mpf.LastName!.Contains(searchKey)
                                                        || msg.Subject!.Contains(searchKey) || msg.Body!.Contains(searchKey))
                                                  && msg.ContactId == memberID
                                                 orderby msg.MsgDate descending
                                                 select new SearchMessagesModel()
                                                 {
                                                     Attachement = msg.Attachment.ToString() ?? "",
                                                     Body = (msg.Body!.Length > 35) ? msg.Body.Substring(0, Math.Min(msg.Body.Length, 33)) + "..." : msg.Body,
                                                     ContactName = mpf.FirstName + " " + mpf.LastName,
                                                     ContactImage = Getpicturepath(Convert.ToInt32(msg.ContactId), _context),//string.IsNullOrEmpty((from p in _context.TbMemberProfiles where p.MemberId == msg.ContactId select p.MemberId).ToList()[0].ToString()) ? "default.png" : (from p in _context.TbMemberProfiles where p.MemberId == msg.ContactId select p.MemberId).ToList()[0].ToString(),
                                                     SenderImage = string.IsNullOrEmpty(mpf.PicturePath) ? "default.png" : mpf.PicturePath,// mpf.PicturePath,
                                                     ContactID = memberID.ToString(),
                                                     FlagLevel = msg.FlagLevel.ToString() ?? "",
                                                     ImportanceLevel = msg.ImportanceLevel.ToString() ?? "",
                                                     MessageID = msg.MessageId.ToString(),
                                                     MessageState = msg.MessageState.ToString(),
                                                     SenderID = mpf.FirstName + " " + mpf.LastName,
                                                     Subject = msg.Subject ?? "",
                                                     MsgDate = msg.MsgDate.ToString() ?? "",
                                                     FromID = msg.SenderId.ToString() ?? "",
                                                     FirstName = mpf.FirstName ?? "",
                                                     FullBody = msg.Body

                                                 }).ToList();
            return msgList;
        }

        /// <summary>
        /// Empty messages folder
        /// </summary>
        /// <param name="mID"></param>
        public void EmptyMessageFolders(int mID)
        {
            var msg = (from m in _context.TbMessages where m.ContactId == mID select m).First();
            _context.Remove(msg);
            _context.SaveChanges();
        }
    }
}