using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMemberPost
{
    public int PostId { get; set; }

    public string? Title { get; set; }

    public string? Description { get; set; }

    public DateTime? PostDate { get; set; }

    public string? AttachFile { get; set; }

    public int? MemberId { get; set; }

    /// <summary>
    /// 1-photo, 2-video, 3-liink
    /// </summary>
    public int? FileType { get; set; }

    public virtual TbMember? Member { get; set; }

    public virtual ICollection<TbMemberPostResponse> TbMemberPostResponses { get; set; } = new List<TbMemberPostResponse>();
}
