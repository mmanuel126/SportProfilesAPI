using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMembersRegistered
{
    public int MemberCodeId { get; set; }

    public int MemberId { get; set; }

    public DateTime? RegisteredDate { get; set; }

    public virtual TbMember Member { get; set; } = null!;
}
