using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMemberFollowing
{
    public int Id { get; set; }

    public int? MemberId { get; set; }

    public int? FollowingMemberId { get; set; }
}
