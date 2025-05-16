using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbContact
{
    public int MemberId { get; set; }

    public int ContactId { get; set; }

    /// <summary>
    ///  status (rejected=2, accepted=1, deleted=3, requested=0)
    /// </summary>
    public int Status { get; set; }

    public DateTime? DateStamp { get; set; }

    public virtual TbMember Contact { get; set; } = null!;

    public virtual TbMember Member { get; set; } = null!;
}
