using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbNotification
{
    public int NotificationId { get; set; }

    public string? Subject { get; set; }

    public string? Notification { get; set; }

    public DateTime? SentDate { get; set; }

    public bool? Status { get; set; }
}
