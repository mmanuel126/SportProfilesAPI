using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMembersRecentActivity
{
    public int ActivityId { get; set; }

    public string? Description { get; set; }

    public DateTime? ActivityDate { get; set; }

    public int? MemberId { get; set; }

    public int? ActivityTypeId { get; set; }

    public virtual TbMember? Member { get; set; }
}
