using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbMember
{
    public int MemberId { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    /// <summary>
    /// 1-NewlyRegistered,2-Active, 3-InActive
    /// </summary>
    public int? Status { get; set; }

    public int? SecurityQuestion { get; set; }

    public string? SecurityAnswer { get; set; }

    public int? DeactivateReason { get; set; }

    public string? DeactivateExplanation { get; set; }

    public bool? FutureEmails { get; set; }

    /// <summary>
    /// 1=available, 2=busy, 3=offline
    /// </summary>
    public int? ChatStatus { get; set; }

    public bool? LogOn { get; set; }

    public string? YoutubeChannel { get; set; }

    public virtual ICollection<TbContact> TbContactContacts { get; set; } = new List<TbContact>();

    public virtual ICollection<TbContact> TbContactMembers { get; set; } = new List<TbContact>();

    public virtual ICollection<TbContactRequest> TbContactRequestFromMembers { get; set; } = new List<TbContactRequest>();

    public virtual ICollection<TbContactRequest> TbContactRequestToMembers { get; set; } = new List<TbContactRequest>();

    public virtual ICollection<TbMemberPostResponse> TbMemberPostResponses { get; set; } = new List<TbMemberPostResponse>();

    public virtual ICollection<TbMemberPost> TbMemberPosts { get; set; } = new List<TbMemberPost>();

    public virtual TbMemberProfile? TbMemberProfile { get; set; }

    public virtual TbMemberProfileContactInfo? TbMemberProfileContactInfo { get; set; }

    public virtual TbMemberProfilePersonalInfo? TbMemberProfilePersonalInfo { get; set; }

    public virtual ICollection<TbMembersPrivacySetting> TbMembersPrivacySettings { get; set; } = new List<TbMembersPrivacySetting>();

    public virtual ICollection<TbMembersRecentActivity> TbMembersRecentActivities { get; set; } = new List<TbMembersRecentActivity>();

    public virtual ICollection<TbMembersRegistered> TbMembersRegistereds { get; set; } = new List<TbMembersRegistered>();

    public virtual ICollection<TbMessage> TbMessageContacts { get; set; } = new List<TbMessage>();

    public virtual ICollection<TbMessage> TbMessageSenders { get; set; } = new List<TbMessage>();

    public virtual ICollection<TbMessagesSent> TbMessagesSentContacts { get; set; } = new List<TbMessagesSent>();

    public virtual ICollection<TbMessagesSent> TbMessagesSentSenders { get; set; } = new List<TbMessagesSent>();

    public virtual ICollection<TbNotificationSetting> TbNotificationSettings { get; set; } = new List<TbNotificationSetting>();
}
