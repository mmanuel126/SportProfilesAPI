namespace spapi.Models.Message
{
    /// <summary>
    /// Stores message info 
    /// </summary>
    public class MessageInfoModel {
		public string MessageID  {get; set; } = string.Empty;
		public string SentDate  {get; set; } = string.Empty;
		public string From  {get; set; } = string.Empty;
		public string SenderPicture  {get; set; } = string.Empty;
		public string Body  {get; set; } = string.Empty;
		public string Subject  {get; set; } = string.Empty;
		public string AttachmentFile  {get; set; } = string.Empty;
        public string OrginalMsg  {get; set; } = string.Empty;
    }
}