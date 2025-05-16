using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMemberPostResponse
{
    public int PostResponseId { get; set; }

    public int? PostId { get; set; }

    public string? Description { get; set; }

    public DateTime? ResponseDate { get; set; }

    public int? MemberId { get; set; }

    public virtual TbMember? Member { get; set; }

    public virtual TbMemberPost? Post { get; set; }
}
