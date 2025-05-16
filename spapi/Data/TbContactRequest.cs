using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbContactRequest
{
    public int RequestId { get; set; }

    public int? FromMemberId { get; set; }

    /// <summary>
    /// 0-waiting, 1-accepted, 2-rejected
    /// </summary>
    public int? ToMemberId { get; set; }

    public DateTime? RequestDate { get; set; }

    public int? Status { get; set; }

    public virtual TbMember? FromMember { get; set; }

    public virtual TbMember? ToMember { get; set; }
}
