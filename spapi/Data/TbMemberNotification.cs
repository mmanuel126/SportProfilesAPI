using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMemberNotification
{
    public int NotificationMemberId { get; set; }

    public int MemberId { get; set; }

    public int NotificationId { get; set; }
}
