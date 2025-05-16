using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using spapi.Data;

namespace spapi.Models;

public partial class DBContextModel : DbContext
{
    public DBContextModel()
    {
    }

    public DBContextModel(DbContextOptions<DBContextModel> options)
        : base(options)
    {
    }

    public virtual DbSet<TbAd> TbAds { get; set; }

    public virtual DbSet<TbCollege> TbColleges { get; set; }

    public virtual DbSet<TbContact> TbContacts { get; set; }

    public virtual DbSet<TbContactRequest> TbContactRequests { get; set; }

    public virtual DbSet<TbDay> TbDays { get; set; }

    public virtual DbSet<TbDegreeType> TbDegreeTypes { get; set; }

    public virtual DbSet<TbForgotPwdCode> TbForgotPwdCodes { get; set; }

    public virtual DbSet<TbInterest> TbInterests { get; set; }

    public virtual DbSet<TbMajor> TbMajors { get; set; }

    public virtual DbSet<TbMember> TbMembers { get; set; }

    public virtual DbSet<TbMemberFollowing> TbMemberFollowings { get; set; }

    public virtual DbSet<TbMemberNotification> TbMemberNotifications { get; set; }

    public virtual DbSet<TbMemberPost> TbMemberPosts { get; set; }

    public virtual DbSet<TbMemberPostResponse> TbMemberPostResponses { get; set; }

    public virtual DbSet<TbMemberProfile> TbMemberProfiles { get; set; }

    public virtual DbSet<TbMemberProfileContactInfo> TbMemberProfileContactInfos { get; set; }

    public virtual DbSet<TbMemberProfileEducationV2> TbMemberProfileEducationV2s { get; set; }

    public virtual DbSet<TbMemberProfilePersonalInfo> TbMemberProfilePersonalInfos { get; set; }

    public virtual DbSet<TbMemberProfilePicture> TbMemberProfilePictures { get; set; }

    public virtual DbSet<TbMembersPrivacySetting> TbMembersPrivacySettings { get; set; }

    public virtual DbSet<TbMembersRecentActivity> TbMembersRecentActivities { get; set; }

    public virtual DbSet<TbMembersRegistered> TbMembersRegistereds { get; set; }

    public virtual DbSet<TbMessage> TbMessages { get; set; }

    public virtual DbSet<TbMessagesSent> TbMessagesSents { get; set; }

    public virtual DbSet<TbMonth> TbMonths { get; set; }

    public virtual DbSet<TbNotification> TbNotifications { get; set; }

    public virtual DbSet<TbNotificationSetting> TbNotificationSettings { get; set; }

    public virtual DbSet<TbPrivateSchool> TbPrivateSchools { get; set; }

    public virtual DbSet<TbPublicSchool> TbPublicSchools { get; set; }

    public virtual DbSet<TbRecentNews> TbRecentNews { get; set; }

    public virtual DbSet<TbSchoolType> TbSchoolTypes { get; set; }

    public virtual DbSet<TbSport> TbSports { get; set; }

    public virtual DbSet<TbState> TbStates { get; set; }

    public virtual DbSet<TbYear> TbYears { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbAd>(entity =>
        {
            entity.ToTable("tbAds");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.HeaderText)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ImageUrl)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.NavigateUrl)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("NavigateURL");
            entity.Property(e => e.PostingDate).HasColumnType("datetime");
            entity.Property(e => e.TextField)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbCollege>(entity =>
        {
            entity.HasKey(e => e.SchoolId);

            entity.ToTable("tbColleges");

            entity.Property(e => e.SchoolId).HasColumnName("SchoolID");
            entity.Property(e => e.Address)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.AwardsOffered)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CampusHousing)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.CampusSetting)
                .HasMaxLength(90)
                .IsUnicode(false);
            entity.Property(e => e.ImageFile)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Ipedsid)
                .HasMaxLength(150)
                .IsUnicode(false)
                .HasColumnName("IPEDSID");
            entity.Property(e => e.Name)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Opeid)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("OPEID");
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.StudentToFacultyRatio)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.Website)
                .HasMaxLength(150)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbContact>(entity =>
        {
            entity.HasKey(e => new { e.MemberId, e.ContactId }).HasName("PK_tbFriends");

            entity.ToTable("tbContacts");

            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.ContactId).HasColumnName("ContactID");
            entity.Property(e => e.DateStamp)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Status).HasComment(" status (rejected=2, accepted=1, deleted=3, requested=0)");

            entity.HasOne(d => d.Contact).WithMany(p => p.TbContactContacts)
                .HasForeignKey(d => d.ContactId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbContacts_tbMembers1");

            entity.HasOne(d => d.Member).WithMany(p => p.TbContactMembers)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbContacts_tbMembers");
        });

        modelBuilder.Entity<TbContactRequest>(entity =>
        {
            entity.HasKey(e => e.RequestId).HasName("PK_tbFriendRequests");

            entity.ToTable("tbContactRequests");

            entity.Property(e => e.RequestId).HasColumnName("RequestID");
            entity.Property(e => e.FromMemberId).HasColumnName("FromMemberID");
            entity.Property(e => e.RequestDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Status).HasDefaultValue(0);
            entity.Property(e => e.ToMemberId)
                .HasComment("0-waiting, 1-accepted, 2-rejected")
                .HasColumnName("ToMemberID");

            entity.HasOne(d => d.FromMember).WithMany(p => p.TbContactRequestFromMembers)
                .HasForeignKey(d => d.FromMemberId)
                .HasConstraintName("FK_tbContactRequests_tbMembers");

            entity.HasOne(d => d.ToMember).WithMany(p => p.TbContactRequestToMembers)
                .HasForeignKey(d => d.ToMemberId)
                .HasConstraintName("FK_tbContactRequests_tbMembers1");
        });

        modelBuilder.Entity<TbDay>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tbDays");

            entity.Property(e => e.Day)
                .HasMaxLength(2)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbDegreeType>(entity =>
        {
            entity.HasKey(e => e.DegreeTypeId);

            entity.ToTable("tbDegreeType");

            entity.Property(e => e.DegreeTypeId)
                .ValueGeneratedNever()
                .HasColumnName("DegreeTypeID");
            entity.Property(e => e.DegreeTypeDesc)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbForgotPwdCode>(entity =>
        {
            entity.HasKey(e => e.CodeId);

            entity.ToTable("tbForgotPwdCodes");

            entity.Property(e => e.CodeId).HasColumnName("CodeID");
            entity.Property(e => e.CodeDate).HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbInterest>(entity =>
        {
            entity.HasKey(e => e.InterestId);

            entity.ToTable("tbInterests");

            entity.Property(e => e.InterestId).HasColumnName("InterestID");
            entity.Property(e => e.InterestDesc)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.InterestType)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbMajor>(entity =>
        {
            entity.HasKey(e => e.MajorId);

            entity.ToTable("tbMajors");

            entity.Property(e => e.MajorId).HasColumnName("MajorID");
            entity.Property(e => e.MajorDesc)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbMember>(entity =>
        {
            entity.HasKey(e => e.MemberId);

            entity.ToTable("tbMembers");

            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.ChatStatus)
                .HasDefaultValue(1)
                .HasComment("1=available, 2=busy, 3=offline");
            entity.Property(e => e.DeactivateExplanation)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.LogOn).HasDefaultValue(false);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SecurityAnswer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Status).HasComment("1-NewlyRegistered,2-Active, 3-InActive");
            entity.Property(e => e.YoutubeChannel)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbMemberFollowing>(entity =>
        {
            entity.ToTable("tbMemberFollowing");
        });

        modelBuilder.Entity<TbMemberNotification>(entity =>
        {
            entity.HasKey(e => new { e.NotificationMemberId, e.MemberId, e.NotificationId });

            entity.ToTable("tbMemberNotifications");

            entity.Property(e => e.NotificationMemberId)
                .ValueGeneratedOnAdd()
                .HasColumnName("NotificationMemberID");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
        });

        modelBuilder.Entity<TbMemberPost>(entity =>
        {
            entity.HasKey(e => e.PostId).HasName("PK_tbPosts");

            entity.ToTable("tbMemberPosts");

            entity.Property(e => e.PostId).HasColumnName("PostID");
            entity.Property(e => e.AttachFile)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(700)
                .IsUnicode(false);
            entity.Property(e => e.FileType)
                .HasDefaultValue(0)
                .HasComment("1-photo, 2-video, 3-liink");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.PostDate).HasColumnType("datetime");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Member).WithMany(p => p.TbMemberPosts)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_tbMemberPosts_tbMembers");
        });

        modelBuilder.Entity<TbMemberPostResponse>(entity =>
        {
            entity.HasKey(e => e.PostResponseId).HasName("PK_tbPostResponses");

            entity.ToTable("tbMemberPostResponses");

            entity.Property(e => e.PostResponseId).HasColumnName("PostResponseID");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.PostId).HasColumnName("PostID");
            entity.Property(e => e.ResponseDate).HasColumnType("datetime");

            entity.HasOne(d => d.Member).WithMany(p => p.TbMemberPostResponses)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_tbMemberPostResponses_tbMembers");

            entity.HasOne(d => d.Post).WithMany(p => p.TbMemberPostResponses)
                .HasForeignKey(d => d.PostId)
                .HasConstraintName("FK_tbMemberPostResponses_tbMemberPosts");
        });

        modelBuilder.Entity<TbMemberProfile>(entity =>
        {
            entity.HasKey(e => e.MemberId).HasName("PK_tbMemberProfiles");

            entity.ToTable("tbMemberProfile");

            entity.Property(e => e.MemberId)
                .ValueGeneratedNever()
                .HasColumnName("MemberID");
            entity.Property(e => e.Bio).HasColumnType("text");
            entity.Property(e => e.CurrentCity)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CurrentStatus)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Dobday)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("DOBDay");
            entity.Property(e => e.Dobmonth)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("DOBMonth");
            entity.Property(e => e.Dobyear)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("DOBYear");
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Height)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.HomeNeighborhood)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Hometown)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.JoinedDate).HasColumnType("datetime");
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.LeftRightHandFoot)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.MiddleName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PicturePath)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.PreferredPosition)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SecondaryPosition)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Sex)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ShowDobtype).HasColumnName("ShowDOBType");
            entity.Property(e => e.Sport)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TitleDesc)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Weight)
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.HasOne(d => d.Member).WithOne(p => p.TbMemberProfile)
                .HasForeignKey<TbMemberProfile>(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbMemberProfile_tbMembers");
        });

        modelBuilder.Entity<TbMemberProfileContactInfo>(entity =>
        {
            entity.HasKey(e => e.MemberId);

            entity.ToTable("tbMemberProfileContactInfo");

            entity.Property(e => e.MemberId)
                .ValueGeneratedNever()
                .HasColumnName("MemberID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CellPhone)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Facebook)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.HomePhone)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Instagram)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Neighborhood)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.OtherEmail)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.OtherPhone)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Twitter)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.Website)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Zip)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Member).WithOne(p => p.TbMemberProfileContactInfo)
                .HasForeignKey<TbMemberProfileContactInfo>(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbMemberProfileContactInfo_tbMembers");
        });

        modelBuilder.Entity<TbMemberProfileEducationV2>(entity =>
        {
            entity.HasKey(e => new { e.MemberId, e.SchoolId, e.SchoolType });

            entity.ToTable("tbMemberProfileEducationV2");

            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.SchoolId).HasColumnName("SchoolID");
            entity.Property(e => e.SchoolType).HasComment("1 pub, 2 priv, 3 col");
            entity.Property(e => e.ClassYear)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Major)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.SchoolName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Societies)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.SportLevelType)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbMemberProfilePersonalInfo>(entity =>
        {
            entity.HasKey(e => e.MemberId);

            entity.ToTable("tbMemberProfilePersonalInfo");

            entity.Property(e => e.MemberId)
                .ValueGeneratedNever()
                .HasColumnName("MemberID");
            entity.Property(e => e.AboutMe).HasColumnType("text");
            entity.Property(e => e.Activities).HasColumnType("text");
            entity.Property(e => e.FavoriteBooks).HasColumnType("text");
            entity.Property(e => e.FavoriteMovies).HasColumnType("text");
            entity.Property(e => e.FavoriteMusic).HasColumnType("text");
            entity.Property(e => e.FavoriteQuotations).HasColumnType("text");
            entity.Property(e => e.FavoriteTvshows)
                .HasColumnType("text")
                .HasColumnName("FavoriteTVShows");
            entity.Property(e => e.Interests).HasColumnType("text");
            entity.Property(e => e.SpecialSkills).HasColumnType("text");

            entity.HasOne(d => d.Member).WithOne(p => p.TbMemberProfilePersonalInfo)
                .HasForeignKey<TbMemberProfilePersonalInfo>(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbMemberProfilePersonalInfo_tbMembers");
        });

        modelBuilder.Entity<TbMemberProfilePicture>(entity =>
        {
            entity.HasKey(e => new { e.ProfileId, e.MemberId });

            entity.ToTable("tbMemberProfilePictures");

            entity.Property(e => e.ProfileId)
                .ValueGeneratedOnAdd()
                .HasColumnName("ProfileID");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.FileName)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbMembersPrivacySetting>(entity =>
        {
            entity.HasKey(e => new { e.Id, e.MemberId }).HasName("PK_tbApplicationSettings");

            entity.ToTable("tbMembersPrivacySettings");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.BasicInfo).HasDefaultValue(3);
            entity.Property(e => e.ContactInfo).HasDefaultValue(3);
            entity.Property(e => e.Education).HasDefaultValue(3);
            entity.Property(e => e.EmailAddress).HasDefaultValue(3);
            entity.Property(e => e.ImdisplayName)
                .HasDefaultValue(3)
                .HasColumnName("IMDisplayName");
            entity.Property(e => e.MobilePhone).HasDefaultValue(3);
            entity.Property(e => e.OtherPhone).HasDefaultValue(3);
            entity.Property(e => e.PersonalInfo).HasDefaultValue(3);
            entity.Property(e => e.PhotosTagOfYou).HasDefaultValue(3);
            entity.Property(e => e.Profile)
                .HasDefaultValue(3)
                .HasComment("1-everyone, 2-friends of firends, 3- only friends, 4-only you");
            entity.Property(e => e.VideosTagOfYou).HasDefaultValue(3);
            entity.Property(e => e.ViewFriendsList).HasDefaultValue(true);
            entity.Property(e => e.ViewLinkToRequestAddingYouAsFriend).HasDefaultValue(true);
            entity.Property(e => e.ViewLinkToSendYouMsg).HasDefaultValue(true);
            entity.Property(e => e.ViewProfilePicture).HasDefaultValue(true);
            entity.Property(e => e.Visibility).HasDefaultValue(1);
            entity.Property(e => e.WorkInfo).HasDefaultValue(3);

            entity.HasOne(d => d.Member).WithMany(p => p.TbMembersPrivacySettings)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbMembersPrivacySettings_tbMembers");
        });

        modelBuilder.Entity<TbMembersRecentActivity>(entity =>
        {
            entity.HasKey(e => e.ActivityId).HasName("PK_tbRecentActivities");

            entity.ToTable("tbMembersRecentActivities");

            entity.Property(e => e.ActivityId).HasColumnName("ActivityID");
            entity.Property(e => e.ActivityDate).HasColumnType("datetime");
            entity.Property(e => e.ActivityTypeId).HasColumnName("ActivityTypeID");
            entity.Property(e => e.Description)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.MemberId).HasColumnName("MemberID");

            entity.HasOne(d => d.Member).WithMany(p => p.TbMembersRecentActivities)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_tbMembersRecentActivities_tbMembers");
        });

        modelBuilder.Entity<TbMembersRegistered>(entity =>
        {
            entity.HasKey(e => new { e.MemberCodeId, e.MemberId }).HasName("PK_tbRegisteredMembers");

            entity.ToTable("tbMembersRegistered");

            entity.Property(e => e.MemberCodeId)
                .ValueGeneratedOnAdd()
                .HasColumnName("MemberCodeID");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.RegisteredDate).HasColumnType("datetime");

            entity.HasOne(d => d.Member).WithMany(p => p.TbMembersRegistereds)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbMembersRegistered_tbMembers");
        });

        modelBuilder.Entity<TbMessage>(entity =>
        {
            entity.HasKey(e => e.MessageId);

            entity.ToTable("tbMessages");

            entity.Property(e => e.MessageId).HasColumnName("MessageID");
            entity.Property(e => e.AttachmentFile)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Body)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.ContactId).HasColumnName("ContactID");
            entity.Property(e => e.MsgDate).HasColumnType("datetime");
            entity.Property(e => e.OriginalMsg).IsUnicode(false);
            entity.Property(e => e.SenderId).HasColumnName("SenderID");
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Subject)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Contact).WithMany(p => p.TbMessageContacts)
                .HasForeignKey(d => d.ContactId)
                .HasConstraintName("FK_tbMessages_tbMembers1");

            entity.HasOne(d => d.Sender).WithMany(p => p.TbMessageSenders)
                .HasForeignKey(d => d.SenderId)
                .HasConstraintName("FK_tbMessages_tbMembers");
        });

        modelBuilder.Entity<TbMessagesSent>(entity =>
        {
            entity.HasKey(e => e.MessageId).HasName("PK_tbSentMessages");

            entity.ToTable("tbMessagesSent");

            entity.Property(e => e.MessageId).HasColumnName("MessageID");
            entity.Property(e => e.AttachmentFile)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Body)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.ContactId).HasColumnName("ContactID");
            entity.Property(e => e.MsgDate).HasColumnType("datetime");
            entity.Property(e => e.OriginalMsg).IsUnicode(false);
            entity.Property(e => e.SenderId).HasColumnName("SenderID");
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Subject)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Contact).WithMany(p => p.TbMessagesSentContacts)
                .HasForeignKey(d => d.ContactId)
                .HasConstraintName("FK_tbMessagesSent_tbMembers1");

            entity.HasOne(d => d.Sender).WithMany(p => p.TbMessagesSentSenders)
                .HasForeignKey(d => d.SenderId)
                .HasConstraintName("FK_tbMessagesSent_tbMembers");
        });

        modelBuilder.Entity<TbMonth>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tbMonths");

            entity.Property(e => e.Desc)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Month)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("month");
        });

        modelBuilder.Entity<TbNotification>(entity =>
        {
            entity.HasKey(e => e.NotificationId);

            entity.ToTable("tbNotifications");

            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
            entity.Property(e => e.Notification)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.SentDate).HasColumnType("datetime");
            entity.Property(e => e.Subject)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbNotificationSetting>(entity =>
        {
            entity.HasKey(e => new { e.Id, e.MemberId });

            entity.ToTable("tbNotificationSettings");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.EvDateChanged)
                .HasDefaultValue(true)
                .HasColumnName("EV_DateChanged");
            entity.Property(e => e.EvInviteToEvent)
                .HasDefaultValue(true)
                .HasColumnName("EV_InviteToEvent");
            entity.Property(e => e.EvMakeYouEventAdmin)
                .HasDefaultValue(true)
                .HasColumnName("EV_MakeYouEventAdmin");
            entity.Property(e => e.EvRequestToJoinEventYouAdmin)
                .HasDefaultValue(true)
                .HasColumnName("EV_RequestToJoinEventYouAdmin");
            entity.Property(e => e.GiSendYouGift)
                .HasDefaultValue(true)
                .HasColumnName("GI_SendYouGift");
            entity.Property(e => e.GpChangesTheNameOfGroupYouBelong)
                .HasDefaultValue(true)
                .HasColumnName("GP_ChangesTheNameOfGroupYouBelong");
            entity.Property(e => e.GpInviteYouToJoin)
                .HasDefaultValue(true)
                .HasColumnName("GP_InviteYouToJoin");
            entity.Property(e => e.GpMakesYouAgpadmin)
                .HasDefaultValue(true)
                .HasColumnName("GP_MakesYouAGPAdmin");
            entity.Property(e => e.GpPromoteToAdmin)
                .HasDefaultValue(true)
                .HasColumnName("GP_PromoteToAdmin");
            entity.Property(e => e.GpRepliesToYourDiscBooardPost)
                .HasDefaultValue(true)
                .HasColumnName("GP_RepliesToYourDiscBooardPost");
            entity.Property(e => e.GpRequestToJoinGpyouAdmin)
                .HasDefaultValue(true)
                .HasColumnName("GP_RequestToJoinGPYouAdmin");
            entity.Property(e => e.HeRepliesToYourHelpQuest)
                .HasDefaultValue(true)
                .HasColumnName("HE_RepliesToYourHelpQuest");
            entity.Property(e => e.LgAddAsFriend)
                .HasDefaultValue(true)
                .HasColumnName("LG_AddAsFriend");
            entity.Property(e => e.LgAddsFriendYouSuggest)
                .HasDefaultValue(true)
                .HasColumnName("LG_AddsFriendYouSuggest");
            entity.Property(e => e.LgConfirmFriendDetails)
                .HasDefaultValue(true)
                .HasColumnName("LG_ConfirmFriendDetails");
            entity.Property(e => e.LgConfirmFriendShipRequest)
                .HasDefaultValue(true)
                .HasColumnName("LG_ConfirmFriendShipRequest");
            entity.Property(e => e.LgHasBirthDayComingUp)
                .HasDefaultValue(false)
                .HasColumnName("LG_HasBirthDayComingUp");
            entity.Property(e => e.LgPoking)
                .HasDefaultValue(false)
                .HasColumnName("LG_Poking");
            entity.Property(e => e.LgRequestToListAsFamily)
                .HasDefaultValue(true)
                .HasColumnName("LG_RequestToListAsFamily");
            entity.Property(e => e.LgSendMsg)
                .HasDefaultValue(true)
                .HasColumnName("LG_SendMsg");
            entity.Property(e => e.NoCommentAfterYouInNote)
                .HasDefaultValue(true)
                .HasColumnName("NO_CommentAfterYouInNote");
            entity.Property(e => e.NoCommentYourNotes)
                .HasDefaultValue(true)
                .HasColumnName("NO_CommentYourNotes");
            entity.Property(e => e.NoTagsYouInNote)
                .HasDefaultValue(true)
                .HasColumnName("NO_TagsYouInNote");
            entity.Property(e => e.PhTagInPhoto)
                .HasDefaultValue(true)
                .HasColumnName("PH_TagInPhoto");
            entity.Property(e => e.PhTagOneOfYourPhotos)
                .HasDefaultValue(true)
                .HasColumnName("PH_TagOneOfYourPhotos");
            entity.Property(e => e.ViCommentAfterYouInVideo)
                .HasDefaultValue(true)
                .HasColumnName("VI_CommentAfterYouInVideo");
            entity.Property(e => e.ViCommentOnVideo)
                .HasDefaultValue(true)
                .HasColumnName("VI_CommentOnVideo");
            entity.Property(e => e.ViCommentOnVideoOfYou)
                .HasDefaultValue(true)
                .HasColumnName("VI_CommentOnVideoOfYou");
            entity.Property(e => e.ViTagsInVideo)
                .HasDefaultValue(true)
                .HasColumnName("VI_TagsInVideo");
            entity.Property(e => e.ViTagsOneOfYourVideos)
                .HasDefaultValue(true)
                .HasColumnName("VI_TagsOneOfYourVideos");

            entity.HasOne(d => d.Member).WithMany(p => p.TbNotificationSettings)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tbNotificationSettings_tbMembers");
        });

        modelBuilder.Entity<TbPrivateSchool>(entity =>
        {
            entity.HasKey(e => e.Lgid);

            entity.ToTable("tbPrivateSchools");

            entity.Property(e => e.Lgid).HasColumnName("LGId");
            entity.Property(e => e.City).HasMaxLength(255);
            entity.Property(e => e.County).HasMaxLength(255);
            entity.Property(e => e.HiGrade).HasMaxLength(255);
            entity.Property(e => e.ImageFile).HasMaxLength(255);
            entity.Property(e => e.LoGrade).HasMaxLength(255);
            entity.Property(e => e.PPacislPct)
                .HasMaxLength(255)
                .HasColumnName("P_PACISL_PCT");
            entity.Property(e => e.PTwomorePct)
                .HasMaxLength(255)
                .HasColumnName("P_TWOMORE_PCT");
            entity.Property(e => e.Phone).HasMaxLength(255);
            entity.Property(e => e.PssAsianPct)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASIAN_PCT");
            entity.Property(e => e.PssAssoc1)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_1");
            entity.Property(e => e.PssAssoc2)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_2");
            entity.Property(e => e.PssAssoc3)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_3");
            entity.Property(e => e.PssAssoc4)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_4");
            entity.Property(e => e.PssAssoc5)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_5");
            entity.Property(e => e.PssAssoc6)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_6");
            entity.Property(e => e.PssAssoc7)
                .HasMaxLength(255)
                .HasColumnName("PSS_ASSOC_7");
            entity.Property(e => e.PssBlackPct)
                .HasMaxLength(255)
                .HasColumnName("PSS_BLACK_PCT");
            entity.Property(e => e.PssCoed)
                .HasMaxLength(255)
                .HasColumnName("PSS_COED");
            entity.Property(e => e.PssCommType)
                .HasMaxLength(255)
                .HasColumnName("PSS_COMM_TYPE");
            entity.Property(e => e.PssCountyFips)
                .HasMaxLength(255)
                .HasColumnName("PSS_COUNTY_FIPS");
            entity.Property(e => e.PssCountyNo)
                .HasMaxLength(255)
                .HasColumnName("PSS_COUNTY_NO");
            entity.Property(e => e.PssEnroll1)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_1");
            entity.Property(e => e.PssEnroll10)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_10");
            entity.Property(e => e.PssEnroll11)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_11");
            entity.Property(e => e.PssEnroll12)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_12");
            entity.Property(e => e.PssEnroll2)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_2");
            entity.Property(e => e.PssEnroll3)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_3");
            entity.Property(e => e.PssEnroll4)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_4");
            entity.Property(e => e.PssEnroll5)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_5");
            entity.Property(e => e.PssEnroll6)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_6");
            entity.Property(e => e.PssEnroll7)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_7");
            entity.Property(e => e.PssEnroll8)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_8");
            entity.Property(e => e.PssEnroll9)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_9");
            entity.Property(e => e.PssEnrollK)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_K");
            entity.Property(e => e.PssEnrollPk)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_PK");
            entity.Property(e => e.PssEnrollT)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_T");
            entity.Property(e => e.PssEnrollTk12)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_TK12");
            entity.Property(e => e.PssEnrollUg)
                .HasMaxLength(255)
                .HasColumnName("PSS_ENROLL_UG");
            entity.Property(e => e.PssFips)
                .HasMaxLength(255)
                .HasColumnName("PSS_FIPS");
            entity.Property(e => e.PssFteTeach)
                .HasMaxLength(255)
                .HasColumnName("PSS_FTE_TEACH");
            entity.Property(e => e.PssHispPct)
                .HasMaxLength(255)
                .HasColumnName("PSS_HISP_PCT");
            entity.Property(e => e.PssIndianPct)
                .HasMaxLength(255)
                .HasColumnName("PSS_INDIAN_PCT");
            entity.Property(e => e.PssLevel)
                .HasMaxLength(255)
                .HasColumnName("PSS_LEVEL");
            entity.Property(e => e.PssLibrary)
                .HasMaxLength(255)
                .HasColumnName("PSS_LIBRARY");
            entity.Property(e => e.PssLocale)
                .HasMaxLength(255)
                .HasColumnName("PSS_LOCALE");
            entity.Property(e => e.PssOrient)
                .HasMaxLength(255)
                .HasColumnName("PSS_ORIENT");
            entity.Property(e => e.PssRace2)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_2");
            entity.Property(e => e.PssRaceAi)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_AI");
            entity.Property(e => e.PssRaceAs)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_AS");
            entity.Property(e => e.PssRaceB)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_B");
            entity.Property(e => e.PssRaceH)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_H");
            entity.Property(e => e.PssRaceP)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_P");
            entity.Property(e => e.PssRaceW)
                .HasMaxLength(255)
                .HasColumnName("PSS_RACE_W");
            entity.Property(e => e.PssRelig)
                .HasMaxLength(255)
                .HasColumnName("PSS_RELIG");
            entity.Property(e => e.PssSchDays)
                .HasMaxLength(255)
                .HasColumnName("PSS_SCH_DAYS");
            entity.Property(e => e.PssSchoolId)
                .HasMaxLength(255)
                .HasColumnName("PSS_SCHOOL_ID");
            entity.Property(e => e.PssStdtchRt)
                .HasMaxLength(255)
                .HasColumnName("PSS_STDTCH_RT");
            entity.Property(e => e.PssStuDayHrs)
                .HasMaxLength(255)
                .HasColumnName("PSS_STU_DAY_HRS");
            entity.Property(e => e.PssType)
                .HasMaxLength(255)
                .HasColumnName("PSS_TYPE");
            entity.Property(e => e.PssWhitePct)
                .HasMaxLength(255)
                .HasColumnName("PSS_WHITE_PCT");
            entity.Property(e => e.SchoolName).HasMaxLength(255);
            entity.Property(e => e.State).HasMaxLength(255);
            entity.Property(e => e.StreetName).HasMaxLength(255);
            entity.Property(e => e.Zip).HasMaxLength(255);
        });

        modelBuilder.Entity<TbPublicSchool>(entity =>
        {
            entity.HasKey(e => e.Lgid);

            entity.ToTable("tbPublicSchools");

            entity.Property(e => e.Lgid).HasColumnName("LGID");
            entity.Property(e => e.Charter)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CountryName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.District)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.DistrictId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("DistrictID");
            entity.Property(e => e.HighGrade)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ImageFile)
                .HasMaxLength(70)
                .IsUnicode(false);
            entity.Property(e => e.LocalCode)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("localCode");
            entity.Property(e => e.Locale)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("locale");
            entity.Property(e => e.LowGrade)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Magnet)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.SchoolId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SchoolID");
            entity.Property(e => e.SchoolName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.StateDistrict)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.StateSchoolId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("StateSchoolID");
            entity.Property(e => e.StreetName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Title1SchoolWide)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Titlle1School)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Zip)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Zip4Digit)
                .HasMaxLength(4)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbRecentNews>(entity =>
        {
            entity.ToTable("tbRecentNews");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.HeaderText)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ImageUrl)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.NavigateUrl)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("NavigateURL");
            entity.Property(e => e.PostingDate).HasColumnType("datetime");
            entity.Property(e => e.TextField)
                .HasMaxLength(2000)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSchoolType>(entity =>
        {
            entity.HasKey(e => e.SchoolTypeId);

            entity.ToTable("tbSchoolType");

            entity.Property(e => e.SchoolTypeId)
                .ValueGeneratedNever()
                .HasColumnName("SchoolTypeID");
            entity.Property(e => e.SchoolTypeDesc)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSport>(entity =>
        {
            entity.ToTable("tbSports");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbState>(entity =>
        {
            entity.HasKey(e => e.StateId);

            entity.ToTable("tbStates");

            entity.Property(e => e.StateId).HasColumnName("StateID");
            entity.Property(e => e.Abbreviation)
                .HasMaxLength(5)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbYear>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tbYears");

            entity.Property(e => e.Year)
                .HasMaxLength(4)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
