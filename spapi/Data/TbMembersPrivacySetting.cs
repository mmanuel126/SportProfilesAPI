using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMembersPrivacySetting
{
    public int Id { get; set; }

    public int MemberId { get; set; }

    /// <summary>
    /// 1-everyone, 2-friends of firends, 3- only friends, 4-only you
    /// </summary>
    public int? Profile { get; set; }

    public int? BasicInfo { get; set; }

    public int? PersonalInfo { get; set; }

    public int? PhotosTagOfYou { get; set; }

    public int? VideosTagOfYou { get; set; }

    public int? ContactInfo { get; set; }

    public int? Education { get; set; }

    public int? WorkInfo { get; set; }

    public int? ImdisplayName { get; set; }

    public int? MobilePhone { get; set; }

    public int? OtherPhone { get; set; }

    public int? EmailAddress { get; set; }

    public int? Visibility { get; set; }

    public bool? ViewProfilePicture { get; set; }

    public bool? ViewFriendsList { get; set; }

    public bool? ViewLinkToRequestAddingYouAsFriend { get; set; }

    public bool? ViewLinkToSendYouMsg { get; set; }

    public virtual TbMember Member { get; set; } = null!;
}
