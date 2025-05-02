USE [SportProfilesDB]
GO
/****** Object:  Table [dbo].[tbActivityType]    Script Date: 4/30/2025 2:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbActivityType](
	[ActivityTypeID] [int] NOT NULL,
	[ActivityTypeDesc] [varchar](100) NULL,
	[ImageFile] [varchar](100) NULL,
 CONSTRAINT [PK_tbActivityType] PRIMARY KEY CLUSTERED 
(
	[ActivityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAds]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[HeaderText] [varchar](150) NULL,
	[PostingDate] [datetime] NULL,
	[TextField] [varchar](2000) NULL,
	[NavigateURL] [varchar](200) NULL,
	[ImageUrl] [varchar](100) NULL,
	[Type] [varchar](100) NULL,
 CONSTRAINT [PK_tbAds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlbumPhotos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlbumPhotos](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [int] NULL,
	[PhotoName] [varchar](100) NULL,
	[PhotoDesc] [varchar](200) NULL,
	[FileName] [varchar](50) NULL,
	[Removed] [bit] NULL,
 CONSTRAINT [PK_tbAlbumPhotos] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlbums]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlbums](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[AlbumName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Location] [varchar](100) NULL,
	[PrivacySetting] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Removed] [bit] NULL,
 CONSTRAINT [PK_tbAlbums] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCaliPublicSchools]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCaliPublicSchools](
	[SchoolID] [varchar](50) NULL,
	[StateSchoolID] [varchar](50) NULL,
	[DistrictID] [varchar](50) NULL,
	[StateDistrict] [varchar](100) NULL,
	[LowGrade] [varchar](50) NULL,
	[HighGrade] [varchar](50) NULL,
	[SchoolName] [varchar](100) NULL,
	[District] [varchar](100) NULL,
	[CountryName] [varchar](100) NULL,
	[StreetName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](10) NULL,
	[Zip4Digit] [varchar](4) NULL,
	[Phone] [varchar](20) NULL,
	[localCode] [varchar](50) NULL,
	[locale] [varchar](50) NULL,
	[Charter] [varchar](50) NULL,
	[Magnet] [varchar](50) NULL,
	[Titlle1School] [varchar](50) NULL,
	[Title1SchoolWide] [varchar](50) NULL,
	[Students] [int] NULL,
	[Teachers] [int] NULL,
	[StudeintTeacherRatio] [real] NULL,
	[FreeLunch] [int] NULL,
	[ReducedLunch] [int] NULL,
	[Image] [varchar](50) NULL,
	[LGID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbCaliPublicSchools] PRIMARY KEY CLUSTERED 
(
	[LGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbChatMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbChatMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[UserID] [int] NULL,
	[ToUserID] [int] NULL,
	[Text] [varchar](300) NULL,
	[TimeStamp] [datetime] NULL,
	[Color] [varchar](50) NULL,
 CONSTRAINT [PK_tbChatMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbChatRoom]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbChatRoom](
	[RoomID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Responded] [bit] NULL,
 CONSTRAINT [PK_tbChatRoom] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbColleges]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbColleges](
	[Name] [varchar](200) NULL,
	[Address] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Website] [varchar](150) NULL,
	[Type] [varchar](250) NULL,
	[AwardsOffered] [varchar](500) NULL,
	[CampusSetting] [varchar](90) NULL,
	[CampusHousing] [varchar](150) NULL,
	[StudentPopulation] [int] NULL,
	[UnderGradStudents] [int] NULL,
	[StudentToFacultyRatio] [varchar](50) NULL,
	[IPEDSID] [varchar](150) NULL,
	[OPEID] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[ImageFile] [varchar](50) NULL,
 CONSTRAINT [PK_tbColleges] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCompanies]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCompanies](
	[Symbol] [varchar](20) NULL,
	[Name] [varchar](100) NULL,
	[IPOYear] [varchar](50) NULL,
	[Sector] [varchar](60) NULL,
	[Industry] [varchar](75) NULL,
	[summaryQuote] [varchar](75) NULL,
	[Description] [text] NULL,
	[website] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[ImageFile] [varchar](100) NULL,
 CONSTRAINT [PK_tbCompanies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCompaniesOfInterest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCompaniesOfInterest](
	[CompInterestID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_tbCompaniesOfInterest] PRIMARY KEY CLUSTERED 
(
	[CompInterestID] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbContactRequests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbContactRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[FromMemberID] [int] NULL,
	[ToMemberID] [int] NULL,
	[RequestDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbFriendRequests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbContacts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbContacts](
	[MemberID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateStamp] [datetime] NULL,
 CONSTRAINT [PK_tbFriends] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDays]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDays](
	[Day] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDegreeType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDegreeType](
	[DegreeTypeID] [int] NOT NULL,
	[DegreeTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_tbDegreeType] PRIMARY KEY CLUSTERED 
(
	[DegreeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDiscussionTopicPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDiscussionTopicPosts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[MemberID] [int] NULL,
	[PostDesc] [varchar](250) NULL,
	[PostDate] [datetime] NULL,
 CONSTRAINT [PK_tbDiscussionTopicPosts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEventInvites]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEventInvites](
	[InviteID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[MemberID] [int] NULL,
	[Email] [varchar](100) NULL,
	[RSVPStatus] [varchar](50) NULL,
 CONSTRAINT [PK_tbEventInvites] PRIMARY KEY CLUSTERED 
(
	[InviteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEventPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEventPosts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](700) NULL,
	[PostDate] [datetime] NULL,
	[AttachFile] [varchar](100) NULL,
	[MemberID] [int] NULL,
	[EventID] [int] NULL,
	[FileType] [int] NULL,
 CONSTRAINT [PK_tbEventPosts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEvents]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEvents](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkID] [int] NULL,
	[MemberID] [int] NULL,
	[StartDate] [datetime] NULL,
	[StartTime] [varchar](50) NULL,
	[StartEndTime] [varchar](50) NULL,
	[EndDate] [datetime] NULL,
	[EndTime] [varchar](50) NULL,
	[EndEndTime] [varchar](50) NULL,
	[PlanningWhat] [varchar](150) NULL,
	[Location] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[MoreInfo] [varchar](200) NULL,
	[InviteAllGroupMembers] [bit] NULL,
	[AnyoneCanViewRSVP] [bit] NULL,
	[ShowGuestList] [bit] NULL,
	[EventImg] [varchar](70) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbEvents] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEventTimes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEventTimes](
	[TimeID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbEventTimes] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbForgotPwdCodes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbForgotPwdCodes](
	[CodeID] [int] IDENTITY(1000,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[CodeDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbForgotPwdCodes] PRIMARY KEY CLUSTERED 
(
	[CodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbInterests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbInterests](
	[InterestID] [int] IDENTITY(1,1) NOT NULL,
	[InterestDesc] [varchar](150) NULL,
	[InterestType] [varchar](20) NULL,
 CONSTRAINT [PK_tbInterests] PRIMARY KEY CLUSTERED 
(
	[InterestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbIssues]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbIssues](
	[IssueID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](70) NULL,
	[Subject] [varchar](50) NULL,
	[IssueType] [int] NULL,
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_tbContacts] PRIMARY KEY CLUSTERED 
(
	[IssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJobApplicants]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJobApplicants](
	[AppJobID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[AppliedDate] [datetime] NULL,
 CONSTRAINT [PK_tbJobApplicants] PRIMARY KEY CLUSTERED 
(
	[AppJobID] ASC,
	[MemberID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJobExperienceLevel]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJobExperienceLevel](
	[ExperienceID] [int] NOT NULL,
	[ExperienceDesc] [varchar](150) NULL,
 CONSTRAINT [PK_tbJobExperienceLevel] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJobFunctions]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJobFunctions](
	[FunctionID] [int] NOT NULL,
	[FunctionDesc] [varchar](150) NULL,
 CONSTRAINT [PK_tbJobFunctions] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJobs]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJobs](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [varchar](150) NULL,
	[Sector] [varchar](150) NULL,
	[Industry] [varchar](150) NULL,
	[Company] [varchar](200) NULL,
	[Country] [varchar](100) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[JobType] [varchar](150) NULL,
	[ExperienceType] [varchar](150) NULL,
	[JobFunction] [varchar](150) NULL,
	[Compensation] [varchar](170) NULL,
	[ReferralBonus] [varchar](150) NULL,
	[JobDescription] [text] NULL,
	[SkillsExperience] [text] NULL,
	[CompanyDescription] [varchar](50) NULL,
	[PostMemberID] [int] NULL,
	[ShowPosterProfile] [bit] NULL,
	[ApplicantRouting] [int] NULL,
	[Email] [varchar](150) NULL,
	[WebSite] [varchar](150) NULL,
	[Status] [int] NULL,
	[DatePosted] [datetime] NULL,
 CONSTRAINT [PK_tbJobs] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJobsToFollow]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJobsToFollow](
	[JobFollowID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
 CONSTRAINT [PK_tbJobsToFollow] PRIMARY KEY CLUSTERED 
(
	[JobFollowID] ASC,
	[PostID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbLinks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLinks](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [int] NULL,
	[Url] [varchar](50) NULL,
	[Description] [varchar](1000) NULL,
	[ThumbNail] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[OwnerType] [int] NULL,
	[PrivacyType] [int] NULL,
 CONSTRAINT [PK_tbLinks] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbLoggedInUser]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLoggedInUser](
	[LoggedInUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoomID] [int] NULL,
 CONSTRAINT [PK_tbLoggedInUser] PRIMARY KEY CLUSTERED 
(
	[LoggedInUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMajors]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMajors](
	[MajorID] [int] IDENTITY(1,1) NOT NULL,
	[MajorDesc] [varchar](100) NULL,
 CONSTRAINT [PK_tbMajors] PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberFollowing]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberFollowing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[FollowingMemberId] [int] NULL,
 CONSTRAINT [PK_tbMemberFollowing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberNotifications]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberNotifications](
	[NotificationMemberID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
 CONSTRAINT [PK_tbMemberNotifications] PRIMARY KEY CLUSTERED 
(
	[NotificationMemberID] ASC,
	[MemberID] ASC,
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberPostResponses]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberPostResponses](
	[PostResponseID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[Description] [varchar](500) NULL,
	[ResponseDate] [datetime] NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_tbPostResponses] PRIMARY KEY CLUSTERED 
(
	[PostResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberPosts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](700) NULL,
	[PostDate] [datetime] NULL,
	[AttachFile] [varchar](100) NULL,
	[MemberID] [int] NULL,
	[FileType] [int] NULL,
 CONSTRAINT [PK_tbPosts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfile]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfile](
	[MemberID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Sex] [varchar](20) NULL,
	[ShowSexInProfile] [bit] NULL,
	[DOBMonth] [varchar](3) NULL,
	[DOBDay] [varchar](3) NULL,
	[DOBYear] [varchar](5) NULL,
	[ShowDOBType] [bit] NULL,
	[Hometown] [varchar](50) NULL,
	[HomeNeighborhood] [varchar](50) NULL,
	[CurrentStatus] [varchar](50) NULL,
	[InterestedInType] [int] NULL,
	[LookingForEmployment] [bit] NULL,
	[LookingForRecruitment] [bit] NULL,
	[LookingForPartnership] [bit] NULL,
	[LookingForNetworking] [bit] NULL,
	[PicturePath] [varchar](150) NULL,
	[JoinedDate] [datetime] NULL,
	[CurrentCity] [varchar](50) NULL,
	[TitleDesc] [varchar](200) NULL,
	[Sport] [varchar](50) NULL,
	[PreferredPosition] [varchar](50) NULL,
	[SecondaryPosition] [varchar](50) NULL,
	[LeftRightHandFoot] [varchar](30) NULL,
	[Height] [varchar](20) NULL,
	[Weight] [varchar](20) NULL,
	[Bio] [text] NULL,
 CONSTRAINT [PK_tbMemberProfiles] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfileContactInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfileContactInfo](
	[MemberID] [int] NOT NULL,
	[Email] [varchar](100) NULL,
	[ShowEmailToMembers] [bit] NULL,
	[OtherEmail] [varchar](100) NULL,
	[Facebook] [varchar](100) NULL,
	[Instagram] [varchar](100) NULL,
	[CellPhone] [varchar](20) NULL,
	[ShowCellPhone] [bit] NULL,
	[HomePhone] [varchar](20) NULL,
	[ShowHomePhone] [bit] NULL,
	[OtherPhone] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
	[ShowAddress] [bit] NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Twitter] [varchar](300) NULL,
	[Website] [varchar](100) NULL,
	[Neighborhood] [varchar](50) NULL,
 CONSTRAINT [PK_tbMemberProfileContactInfo] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfileEducation]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfileEducation](
	[MemberID] [int] NOT NULL,
	[HighSchool] [varchar](50) NULL,
	[HighSchoolClassYear] [varchar](50) NULL,
	[College1] [varchar](50) NULL,
	[College1ClassYear] [varchar](50) NULL,
	[College1Major] [varchar](50) NULL,
	[College1DegreeType] [int] NULL,
	[College1Societies] [varchar](200) NULL,
	[College2] [varchar](50) NULL,
	[College2ClassYear] [varchar](50) NULL,
	[College2Major] [varchar](50) NULL,
	[College2DegreeType] [int] NULL,
	[College2Societies] [varchar](200) NULL,
 CONSTRAINT [PK_tbMemberProfileEducation] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfileEducationV2]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfileEducationV2](
	[MemberID] [int] NOT NULL,
	[SchoolID] [int] NOT NULL,
	[SchoolType] [int] NOT NULL,
	[SchoolName] [varchar](100) NULL,
	[ClassYear] [varchar](10) NULL,
	[Major] [varchar](100) NULL,
	[DegreeType] [int] NULL,
	[Societies] [varchar](300) NULL,
	[Description] [varchar](200) NULL,
	[SportLevelType] [varchar](20) NULL,
 CONSTRAINT [PK_tbMemberProfileEducationV2] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[SchoolID] ASC,
	[SchoolType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfileEmploymentInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfileEmploymentInfo](
	[MemberID] [int] NOT NULL,
	[Employer1] [varchar](50) NULL,
	[Emp1Position] [varchar](50) NULL,
	[Emp1JobDesc] [varchar](300) NULL,
	[Emp1City] [varchar](50) NULL,
	[Emp1State] [varchar](50) NULL,
	[Emp1StartMonth] [varchar](2) NULL,
	[Emp1StartYear] [varchar](4) NULL,
	[Emp1EndMonth] [varchar](2) NULL,
	[Emp1EndYear] [varchar](4) NULL,
	[CurrentlyWorkHere] [bit] NULL,
	[Employer2] [varchar](50) NULL,
	[Emp2Position] [varchar](50) NULL,
	[Emp2JobDesc] [varchar](300) NULL,
	[Emp2City] [varchar](50) NULL,
	[Emp2State] [varchar](50) NULL,
	[Emp2StartMonth] [varchar](2) NULL,
	[Emp2StartYear] [varchar](4) NULL,
	[Emp2EndMonth] [varchar](2) NULL,
	[Emp2EndYear] [varchar](4) NULL,
	[Employer3] [varchar](50) NULL,
	[Emp3Position] [varchar](50) NULL,
	[Emp3JobDesc] [varchar](300) NULL,
	[Emp3City] [varchar](50) NULL,
	[Emp3State] [varchar](50) NULL,
	[Emp3StartMonth] [varchar](2) NULL,
	[Emp3StartYear] [varchar](4) NULL,
	[Emp3EndMonth] [varchar](2) NULL,
	[Emp3EndYear] [varchar](4) NULL,
 CONSTRAINT [PK_tbMemberProfileEmploymentInfo] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfileEmploymentInfoV2]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfileEmploymentInfoV2](
	[EmpInfoID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[CompanyName] [varchar](100) NULL,
	[Position] [varchar](150) NULL,
	[JobDesc] [varchar](300) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[StartMonth] [varchar](2) NULL,
	[StartYear] [varchar](4) NULL,
	[EndMonth] [varchar](2) NULL,
	[EndYear] [varchar](4) NULL,
	[CurrentlyWorkedHere] [bit] NULL,
 CONSTRAINT [PK_tbMemberProfileEmploymentInfoV2] PRIMARY KEY CLUSTERED 
(
	[EmpInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfilePersonalInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfilePersonalInfo](
	[MemberID] [int] NOT NULL,
	[Activities] [text] NULL,
	[Interests] [text] NULL,
	[FavoriteMusic] [text] NULL,
	[FavoriteTVShows] [text] NULL,
	[FavoriteMovies] [text] NULL,
	[FavoriteBooks] [text] NULL,
	[FavoriteQuotations] [text] NULL,
	[AboutMe] [text] NULL,
	[SpecialSkills] [text] NULL,
 CONSTRAINT [PK_tbMemberProfilePersonalInfo] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMemberProfilePictures]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMemberProfilePictures](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[FileName] [varchar](100) NULL,
	[IsDefault] [bit] NULL,
	[Removed] [bit] NULL,
 CONSTRAINT [PK_tbMemberProfilePictures] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMembers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMembers](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[Status] [int] NULL,
	[SecurityQuestion] [int] NULL,
	[SecurityAnswer] [varchar](50) NULL,
	[DeactivateReason] [int] NULL,
	[DeactivateExplanation] [varchar](1000) NULL,
	[FutureEmails] [bit] NULL,
	[ChatStatus] [int] NULL,
	[LogOn] [bit] NULL,
	[YoutubeChannel] [varchar](100) NULL,
 CONSTRAINT [PK_tbMembers] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMembersBlocked]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMembersBlocked](
	[MemberID] [int] NULL,
	[BlockMemberID] [int] NULL,
	[BlockMemberName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMembersPrivacySettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMembersPrivacySettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Profile] [int] NULL,
	[BasicInfo] [int] NULL,
	[PersonalInfo] [int] NULL,
	[PhotosTagOfYou] [int] NULL,
	[VideosTagOfYou] [int] NULL,
	[ContactInfo] [int] NULL,
	[Education] [int] NULL,
	[WorkInfo] [int] NULL,
	[IMDisplayName] [int] NULL,
	[MobilePhone] [int] NULL,
	[OtherPhone] [int] NULL,
	[EmailAddress] [int] NULL,
	[Visibility] [int] NULL,
	[ViewProfilePicture] [bit] NULL,
	[ViewFriendsList] [bit] NULL,
	[ViewLinkToRequestAddingYouAsFriend] [bit] NULL,
	[ViewLinkToSendYouMsg] [bit] NULL,
 CONSTRAINT [PK_tbApplicationSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMembersRecentActivities]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMembersRecentActivities](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[ActivityDate] [datetime] NULL,
	[MemberID] [int] NULL,
	[ActivityTypeID] [int] NULL,
 CONSTRAINT [PK_tbRecentActivities] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMembersRegistered]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMembersRegistered](
	[MemberCodeID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[RegisteredDate] [datetime] NULL,
 CONSTRAINT [PK_tbRegisteredMembers] PRIMARY KEY CLUSTERED 
(
	[MemberCodeID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[ContactID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Body] [varchar](500) NULL,
	[MsgDate] [datetime] NULL,
	[Attachment] [bit] NULL,
	[MessageState] [int] NOT NULL,
	[FlagLevel] [int] NULL,
	[ImportanceLevel] [int] NULL,
	[AttachmentFile] [varchar](150) NULL,
	[Source] [varchar](50) NULL,
	[OriginalMsg] [varchar](max) NULL,
 CONSTRAINT [PK_tbMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMessagesDeleted]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMessagesDeleted](
	[MessageID] [int] NOT NULL,
	[SenderID] [int] NULL,
	[ContactID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Body] [varchar](500) NULL,
	[MsgDate] [datetime] NULL,
	[Attachment] [bit] NULL,
	[MessageState] [int] NOT NULL,
	[FlagLevel] [int] NULL,
	[ImportanceLevel] [int] NULL,
	[AttachmentFile] [varchar](150) NULL,
	[Source] [varchar](50) NULL,
	[OriginalMsg] [varchar](max) NULL,
 CONSTRAINT [PK_tbDeletedMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMessagesJunk]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMessagesJunk](
	[MessageID] [int] NOT NULL,
	[SenderID] [int] NULL,
	[ContactID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Body] [varchar](500) NULL,
	[MsgDate] [datetime] NULL,
	[Attachment] [bit] NULL,
	[MessageState] [int] NOT NULL,
	[FlagLevel] [int] NULL,
	[ImportanceLevel] [int] NULL,
	[AttachmentFile] [varchar](150) NULL,
	[Source] [varchar](50) NULL,
	[OriginalMsg] [varchar](max) NULL,
 CONSTRAINT [PK_JunktbMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMessagesReplies]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMessagesReplies](
	[ReplyID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[SenderID] [int] NULL,
	[ContactID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Body] [varchar](500) NULL,
	[MsgDate] [datetime] NULL,
	[Attachment] [bit] NULL,
	[MessageState] [int] NOT NULL,
	[FlagLevel] [int] NULL,
	[ImportanceLevel] [int] NULL,
	[AttachmentFile] [varchar](150) NULL,
	[Source] [varchar](50) NULL,
 CONSTRAINT [PK_tbMessagesReplies] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMessagesSent]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMessagesSent](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[ContactID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Body] [varchar](500) NULL,
	[MsgDate] [datetime] NULL,
	[Attachment] [bit] NULL,
	[MessageState] [int] NULL,
	[FlagLevel] [int] NULL,
	[ImportanceLevel] [int] NULL,
	[AttachmentFile] [varchar](150) NULL,
	[Source] [varchar](50) NULL,
	[OriginalMsg] [varchar](max) NULL,
 CONSTRAINT [PK_tbSentMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMonths]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMonths](
	[month] [varchar](2) NULL,
	[Desc] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkCategory]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbGroupCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkCategoryType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkCategoryType](
	[CategoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_tbGroupCategoryType] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkDiscussionTopics]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkDiscussionTopics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkID] [int] NULL,
	[MemberID] [int] NULL,
	[TopicDesc] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbGroupDiscussionTopics] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkMemberInvites]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkMemberInvites](
	[InviteID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkID] [int] NULL,
	[MemberID] [int] NULL,
	[Email] [varchar](100) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbGroupMemberInvites] PRIMARY KEY CLUSTERED 
(
	[InviteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkMemberRequests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkMemberRequests](
	[NetworkID] [int] NULL,
	[RequestorID] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkMembers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkMembers](
	[NetworkID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[JoinedDate] [datetime] NULL,
	[IsOwner] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbNetworkMembers] PRIMARY KEY CLUSTERED 
(
	[NetworkID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkPhotos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkPhotos](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkID] [int] NULL,
	[MemberID] [int] NULL,
	[PhotoName] [varchar](100) NULL,
	[PhotoDesc] [varchar](200) NULL,
	[FileName] [varchar](50) NULL,
	[Removed] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbGroupPhotos] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkPostResponses]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkPostResponses](
	[PostResponseID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[Description] [varchar](500) NULL,
	[ResponseDate] [datetime] NULL,
	[MemberID] [int] NULL,
	[NetworkID] [int] NULL,
 CONSTRAINT [PK_tbGroupPostResponses] PRIMARY KEY CLUSTERED 
(
	[PostResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkPosts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](700) NULL,
	[PostDate] [datetime] NULL,
	[AttachFile] [varchar](100) NULL,
	[MemberID] [int] NULL,
	[NetworkID] [int] NULL,
	[FileType] [int] NULL,
 CONSTRAINT [PK_tbGroupPosts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkRecentActivities]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkRecentActivities](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[ActivityDate] [datetime] NULL,
	[MemberID] [int] NULL,
	[NetworkID] [int] NULL,
	[ActivityTypeID] [int] NULL,
 CONSTRAINT [PK_tbGroupRecentActivities] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkRegulators]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkRegulators](
	[NetworkID] [int] NULL,
	[OwnerID] [int] NULL,
	[AdministratorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkRequests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[NetworkID] [int] NULL,
	[NetworkType] [int] NULL,
	[Purpose] [varchar](500) NULL,
	[RequestedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbNetworkRequests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworks](
	[NetworkID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkName] [varchar](100) NULL,
	[Description] [varchar](100) NULL,
	[CategoryID] [int] NULL,
	[CategoryTypeID] [int] NULL,
	[RecentNews] [text] NULL,
	[Office] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Zip] [varchar](100) NULL,
	[InActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Image] [varchar](80) NULL,
 CONSTRAINT [PK_tbNetworks] PRIMARY KEY CLUSTERED 
(
	[NetworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkSettings](
	[NetworkID] [int] NOT NULL,
	[NonAdminCanWrite] [bit] NULL,
	[ShowGroupEvents] [bit] NULL,
	[ShowProfileBox] [bit] NULL,
	[ShowProfileTab] [bit] NULL,
	[EnableDiscussionBoard] [bit] NULL,
	[EnablePhotos] [bit] NULL,
	[OnlyAllowAdminsToUploadPhotos] [bit] NULL,
	[ShowEnablePhotoProfileBox] [bit] NULL,
	[ShowEnableProfileTab] [bit] NULL,
	[EnableVideos] [bit] NULL,
	[OnlyAllowAdminsToUploadVideos] [bit] NULL,
	[ShowVideoProfileBox] [bit] NULL,
	[ShowVideoProfileTab] [bit] NULL,
	[EnableLinks] [bit] NULL,
	[OnlyAllowAdminsToPostLinks] [bit] NULL,
	[Access] [int] NULL,
 CONSTRAINT [PK_tbGroupSettings] PRIMARY KEY CLUSTERED 
(
	[NetworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNetworkVideos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNetworkVideos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[VideoName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[FileName] [varchar](80) NULL,
	[VidDate] [datetime] NULL,
	[VidCategory] [int] NULL,
	[VidType] [int] NULL,
	[Removed] [bit] NULL,
 CONSTRAINT [PK_tbGroupVideos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNoteCommentPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNoteCommentPosts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NULL,
	[MemberID] [int] NULL,
	[CommentDesc] [varchar](200) NULL,
	[PostDate] [datetime] NULL,
 CONSTRAINT [PK_tbNoteCommentPosts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNotes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNotes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Title] [varchar](200) NULL,
	[NoteText] [text] NULL,
	[PrivacyType] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbNotes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNotifications]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNotifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](100) NULL,
	[Notification] [varchar](2000) NULL,
	[SentDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tbNotifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNotificationSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNotificationSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[LG_SendMsg] [bit] NULL,
	[LG_AddAsFriend] [bit] NULL,
	[LG_ConfirmFriendShipRequest] [bit] NULL,
	[LG_Poking] [bit] NULL,
	[LG_ConfirmFriendDetails] [bit] NULL,
	[LG_RequestToListAsFamily] [bit] NULL,
	[LG_AddsFriendYouSuggest] [bit] NULL,
	[LG_HasBirthDayComingUp] [bit] NULL,
	[PH_TagInPhoto] [bit] NULL,
	[PH_TagOneOfYourPhotos] [bit] NULL,
	[VI_TagsInVideo] [bit] NULL,
	[VI_TagsOneOfYourVideos] [bit] NULL,
	[VI_CommentOnVideo] [bit] NULL,
	[VI_CommentOnVideoOfYou] [bit] NULL,
	[VI_CommentAfterYouInVideo] [bit] NULL,
	[GP_InviteYouToJoin] [bit] NULL,
	[GP_PromoteToAdmin] [bit] NULL,
	[GP_MakesYouAGPAdmin] [bit] NULL,
	[GP_RequestToJoinGPYouAdmin] [bit] NULL,
	[GP_RepliesToYourDiscBooardPost] [bit] NULL,
	[GP_ChangesTheNameOfGroupYouBelong] [bit] NULL,
	[EV_InviteToEvent] [bit] NULL,
	[EV_DateChanged] [bit] NULL,
	[EV_MakeYouEventAdmin] [bit] NULL,
	[EV_RequestToJoinEventYouAdmin] [bit] NULL,
	[NO_TagsYouInNote] [bit] NULL,
	[NO_CommentYourNotes] [bit] NULL,
	[NO_CommentAfterYouInNote] [bit] NULL,
	[GI_SendYouGift] [bit] NULL,
	[HE_RepliesToYourHelpQuest] [bit] NULL,
 CONSTRAINT [PK_tbNotificationSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPollAnswers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPollAnswers](
	[PollAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[DisplayText] [nvarchar](500) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PollAnswers] PRIMARY KEY CLUSTERED 
(
	[PollAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPolls]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPolls](
	[PollID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayText] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Polls] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPrivateSchools]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPrivateSchools](
	[PSS_SCHOOL_ID] [nvarchar](255) NULL,
	[SchoolName] [nvarchar](255) NULL,
	[LoGrade] [nvarchar](255) NULL,
	[HiGrade] [nvarchar](255) NULL,
	[StreetName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PSS_COUNTY_NO] [nvarchar](255) NULL,
	[PSS_COUNTY_FIPS] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PSS_FIPS] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[PSS_SCH_DAYS] [nvarchar](255) NULL,
	[PSS_STU_DAY_HRS] [nvarchar](255) NULL,
	[PSS_LIBRARY] [nvarchar](255) NULL,
	[PSS_ENROLL_UG] [nvarchar](255) NULL,
	[PSS_ENROLL_PK] [nvarchar](255) NULL,
	[PSS_ENROLL_K] [nvarchar](255) NULL,
	[PSS_ENROLL_1] [nvarchar](255) NULL,
	[PSS_ENROLL_2] [nvarchar](255) NULL,
	[PSS_ENROLL_3] [nvarchar](255) NULL,
	[PSS_ENROLL_4] [nvarchar](255) NULL,
	[PSS_ENROLL_5] [nvarchar](255) NULL,
	[PSS_ENROLL_6] [nvarchar](255) NULL,
	[PSS_ENROLL_7] [nvarchar](255) NULL,
	[PSS_ENROLL_8] [nvarchar](255) NULL,
	[PSS_ENROLL_9] [nvarchar](255) NULL,
	[PSS_ENROLL_10] [nvarchar](255) NULL,
	[PSS_ENROLL_11] [nvarchar](255) NULL,
	[PSS_ENROLL_12] [nvarchar](255) NULL,
	[PSS_ENROLL_T] [nvarchar](255) NULL,
	[PSS_ENROLL_TK12] [nvarchar](255) NULL,
	[PSS_RACE_AI] [nvarchar](255) NULL,
	[PSS_RACE_AS] [nvarchar](255) NULL,
	[PSS_RACE_H] [nvarchar](255) NULL,
	[PSS_RACE_B] [nvarchar](255) NULL,
	[PSS_RACE_W] [nvarchar](255) NULL,
	[PSS_RACE_P] [nvarchar](255) NULL,
	[PSS_RACE_2] [nvarchar](255) NULL,
	[PSS_FTE_TEACH] [nvarchar](255) NULL,
	[PSS_LOCALE] [nvarchar](255) NULL,
	[PSS_COED] [nvarchar](255) NULL,
	[PSS_TYPE] [nvarchar](255) NULL,
	[PSS_LEVEL] [nvarchar](255) NULL,
	[PSS_RELIG] [nvarchar](255) NULL,
	[PSS_COMM_TYPE] [nvarchar](255) NULL,
	[PSS_INDIAN_PCT] [nvarchar](255) NULL,
	[PSS_ASIAN_PCT] [nvarchar](255) NULL,
	[PSS_HISP_PCT] [nvarchar](255) NULL,
	[PSS_BLACK_PCT] [nvarchar](255) NULL,
	[PSS_WHITE_PCT] [nvarchar](255) NULL,
	[P_PACISL_PCT] [nvarchar](255) NULL,
	[P_TWOMORE_PCT] [nvarchar](255) NULL,
	[PSS_STDTCH_RT] [nvarchar](255) NULL,
	[PSS_ORIENT] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[PSS_ASSOC_1] [nvarchar](255) NULL,
	[PSS_ASSOC_2] [nvarchar](255) NULL,
	[PSS_ASSOC_3] [nvarchar](255) NULL,
	[PSS_ASSOC_4] [nvarchar](255) NULL,
	[PSS_ASSOC_5] [nvarchar](255) NULL,
	[PSS_ASSOC_6] [nvarchar](255) NULL,
	[PSS_ASSOC_7] [nvarchar](255) NULL,
	[LGId] [int] IDENTITY(1,1) NOT NULL,
	[ImageFile] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbPrivateSchools] PRIMARY KEY CLUSTERED 
(
	[LGId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPublcSchoolDisctricts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPublcSchoolDisctricts](
	[NCESDistrictID] [varchar](50) NULL,
	[StateDistrictID] [varchar](50) NULL,
	[SchoolName] [varchar](255) NULL,
	[CountyName] [varchar](255) NULL,
	[StreetName] [varchar](255) NULL,
	[City] [varchar](150) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[ZIP4] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Students] [varchar](50) NULL,
	[Teachers] [varchar](50) NULL,
	[Schools] [varchar](50) NULL,
	[LocaleCode] [varchar](255) NULL,
	[Locale] [varchar](255) NULL,
	[StudentTeacherRatio] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[LGID] [int] IDENTITY(1,1) NOT NULL,
	[ImageFile] [varchar](70) NULL,
 CONSTRAINT [PK_tbPublcSchoolDisctricts] PRIMARY KEY CLUSTERED 
(
	[LGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPublicLibraries]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPublicLibraries](
	[NCESID] [varchar](50) NULL,
	[SchoolName] [varchar](200) NULL,
	[LIBSYSNAME] [varchar](255) NULL,
	[State] [varchar](20) NULL,
	[FSCSKEY] [varchar](255) NULL,
	[FSCS_SEQ] [varchar](255) NULL,
	[LIBID] [varchar](255) NULL,
	[CITY] [varchar](200) NULL,
	[StreetName] [varchar](155) NULL,
	[CNTY] [varchar](255) NULL,
	[Pub_Fips] [varchar](255) NULL,
	[PHONE] [varchar](255) NULL,
	[ZIP] [varchar](255) NULL,
	[C_OUT_TY] [varchar](255) NULL,
	[StateCode] [varchar](255) NULL,
	[DBase] [varchar](255) NULL,
	[DataYear] [varchar](255) NULL,
	[SystemName] [varchar](255) NULL,
	[MStatus] [varchar](255) NULL,
	[rgdetail] [varchar](255) NULL,
	[stabr_M] [varchar](255) NULL,
	[ZIP4] [varchar](255) NULL,
	[ADDRES_M] [varchar](255) NULL,
	[CITY_M] [varchar](255) NULL,
	[ZIP_M] [varchar](255) NULL,
	[ZIP4_M] [varchar](255) NULL,
	[WEB_ADDR] [varchar](255) NULL,
	[C_RELATN] [varchar](255) NULL,
	[C_LEGBAS] [varchar](255) NULL,
	[C_ADMIN] [varchar](255) NULL,
	[C_FSCS] [varchar](255) NULL,
	[GEOCODE] [varchar](255) NULL,
	[POPU_LSA] [varchar](255) NULL,
	[POPU_UND] [varchar](255) NULL,
	[CENTLIB] [varchar](255) NULL,
	[BRANLIB] [varchar](255) NULL,
	[BKMOB] [varchar](255) NULL,
	[MASTER] [varchar](255) NULL,
	[LIBRARIA] [varchar](255) NULL,
	[OTHPAID] [varchar](255) NULL,
	[TOTSTAFF] [varchar](255) NULL,
	[LOCGVT] [varchar](255) NULL,
	[STGVT] [varchar](255) NULL,
	[FEDGVT] [varchar](255) NULL,
	[OTHINCM] [varchar](255) NULL,
	[TOTINCM] [varchar](255) NULL,
	[SALARIES] [varchar](255) NULL,
	[BENEFIT] [varchar](255) NULL,
	[STAFFEXP] [varchar](255) NULL,
	[TOTEXPCO] [varchar](255) NULL,
	[OTHOPEXP] [varchar](255) NULL,
	[TOTOPEXP] [varchar](255) NULL,
	[CAPITAL] [varchar](255) NULL,
	[BKVOL] [varchar](255) NULL,
	[AUDIO] [varchar](255) NULL,
	[VIDEO] [varchar](255) NULL,
	[SUBSCRIP] [varchar](255) NULL,
	[HRS_OPEN] [varchar](255) NULL,
	[VISITS] [varchar](255) NULL,
	[REFERENC] [varchar](255) NULL,
	[TOTCIR] [varchar](255) NULL,
	[LOANTO] [varchar](255) NULL,
	[LOANFM] [varchar](255) NULL,
	[KIDCIRCL] [varchar](255) NULL,
	[KIDATTEN] [varchar](255) NULL,
	[ELMATEXP] [nvarchar](255) NULL,
	[GPTERMS] [varchar](255) NULL,
	[ERES_USR] [varchar](255) NULL,
	[CNTYFIPS] [varchar](255) NULL,
	[YR_SUB] [varchar](255) NULL,
	[OBEREG] [varchar](255) NULL,
	[RSTATUS] [varchar](255) NULL,
	[LSABOUND] [varchar](255) NULL,
	[PRMATEXP] [varchar](255) NULL,
	[OTHMATEX] [varchar](255) NULL,
	[CAP_REV] [varchar](255) NULL,
	[DATABASE] [varchar](255) NULL,
	[ESUBSCRP] [varchar](255) NULL,
	[EBOOK] [varchar](255) NULL,
	[LGID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbPublicLibraries] PRIMARY KEY CLUSTERED 
(
	[LGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPublicSchools]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPublicSchools](
	[SchoolID] [varchar](50) NULL,
	[StateSchoolID] [varchar](50) NULL,
	[DistrictID] [varchar](50) NULL,
	[StateDistrict] [varchar](100) NULL,
	[LowGrade] [varchar](50) NULL,
	[HighGrade] [varchar](50) NULL,
	[SchoolName] [varchar](100) NULL,
	[District] [varchar](100) NULL,
	[CountryName] [varchar](100) NULL,
	[StreetName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](10) NULL,
	[Zip4Digit] [varchar](4) NULL,
	[Phone] [varchar](20) NULL,
	[localCode] [varchar](50) NULL,
	[locale] [varchar](50) NULL,
	[Charter] [varchar](50) NULL,
	[Magnet] [varchar](50) NULL,
	[Titlle1School] [varchar](50) NULL,
	[Title1SchoolWide] [varchar](50) NULL,
	[Students] [int] NULL,
	[Teachers] [int] NULL,
	[StudeintTeacherRatio] [real] NULL,
	[FreeLunch] [int] NULL,
	[ReducedLunch] [int] NULL,
	[ImageFile] [varchar](70) NULL,
	[LGID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbPublicSchools] PRIMARY KEY CLUSTERED 
(
	[LGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRecentNews]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRecentNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[HeaderText] [varchar](150) NULL,
	[PostingDate] [datetime] NULL,
	[TextField] [varchar](2000) NULL,
	[NavigateURL] [varchar](200) NULL,
	[ImageUrl] [varchar](100) NULL,
 CONSTRAINT [PK_tbRecentNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbResumeSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbResumeSettings](
	[MemberID] [int] NOT NULL,
	[ShowResume] [bit] NULL,
	[ShowSpecialSkills] [bit] NULL,
	[ShowAbout] [bit] NULL,
	[ShowInterests] [bit] NULL,
	[ShowActivities] [bit] NULL,
 CONSTRAINT [PK_tbResumeSettings] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSchoolsILike]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSchoolsILike](
	[SchoolLikeID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[SchoolType] [varchar](50) NULL,
 CONSTRAINT [PK_tbSchoolsILike] PRIMARY KEY CLUSTERED 
(
	[SchoolLikeID] ASC,
	[SchoolID] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSchoolType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSchoolType](
	[SchoolTypeID] [int] NOT NULL,
	[SchoolTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_tbSchoolType] PRIMARY KEY CLUSTERED 
(
	[SchoolTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbStates]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbStates](
	[Name] [varchar](50) NULL,
	[Abbreviation] [varchar](5) NULL,
	[StateID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbStates] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSuggestions]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSuggestions](
	[MemberID] [int] NOT NULL,
	[ContactEmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbSuggestions] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[ContactEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUserResponses]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUserResponses](
	[UserID] [int] NOT NULL,
	[PollAnswerID] [int] NOT NULL,
 CONSTRAINT [PK_UserResponses] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PollAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbVideoCategory]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbVideoCategory](
	[CategoryID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbVideoCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbVideos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbVideos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[VideoName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[FileName] [varchar](80) NULL,
	[VidDate] [datetime] NULL,
	[VidCategory] [int] NULL,
	[VidType] [int] NULL,
	[Removed] [bit] NULL,
 CONSTRAINT [PK_tbVideos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbYears]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbYears](
	[Year] [varchar](4) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbAlbumPhotos] ADD  CONSTRAINT [DF_tbAlbumPhotos_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[tbAlbums] ADD  CONSTRAINT [DF_tbAlbums_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[tbChatRoom] ADD  CONSTRAINT [DF_tbChatRoom_Responded]  DEFAULT ((0)) FOR [Responded]
GO
ALTER TABLE [dbo].[tbContactRequests] ADD  CONSTRAINT [DF_tbFriendRequests_RequestDate]  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[tbContactRequests] ADD  CONSTRAINT [DF_tbFriendRequests_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tbContacts] ADD  CONSTRAINT [DF_tbFriends_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tbContacts] ADD  CONSTRAINT [DF_tbFriends_DateStamp]  DEFAULT (getdate()) FOR [DateStamp]
GO
ALTER TABLE [dbo].[tbEventInvites] ADD  CONSTRAINT [DF_tbEventInvites_RSVPStatus]  DEFAULT ('Attending') FOR [RSVPStatus]
GO
ALTER TABLE [dbo].[tbEventPosts] ADD  CONSTRAINT [DF_tbEventPosts_FileType]  DEFAULT ((0)) FOR [FileType]
GO
ALTER TABLE [dbo].[tbJobs] ADD  CONSTRAINT [DF_tbJobs_DatePosted]  DEFAULT (getdate()) FOR [DatePosted]
GO
ALTER TABLE [dbo].[tbLinks] ADD  CONSTRAINT [DF_tbLinks_PrivacyType]  DEFAULT ((0)) FOR [PrivacyType]
GO
ALTER TABLE [dbo].[tbMemberPosts] ADD  CONSTRAINT [DF_tbPosts_FileType]  DEFAULT ((0)) FOR [FileType]
GO
ALTER TABLE [dbo].[tbMemberProfile] ADD  CONSTRAINT [DF__tbMemberP__Title__0E8E2250]  DEFAULT ('') FOR [TitleDesc]
GO
ALTER TABLE [dbo].[tbMembers] ADD  CONSTRAINT [DF_tbMembers_ChatStatus]  DEFAULT ((1)) FOR [ChatStatus]
GO
ALTER TABLE [dbo].[tbMembers] ADD  DEFAULT ((0)) FOR [LogOn]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_Profile]  DEFAULT ((3)) FOR [Profile]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_BasicInfo]  DEFAULT ((3)) FOR [BasicInfo]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_PersonalInfo]  DEFAULT ((3)) FOR [PersonalInfo]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_PhotosTagOfYou]  DEFAULT ((3)) FOR [PhotosTagOfYou]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_VideosTagOfYou]  DEFAULT ((3)) FOR [VideosTagOfYou]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_Friends]  DEFAULT ((3)) FOR [ContactInfo]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_Education]  DEFAULT ((3)) FOR [Education]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_WorkInfo]  DEFAULT ((3)) FOR [WorkInfo]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_IMDisplayName]  DEFAULT ((3)) FOR [IMDisplayName]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_MobilePhone]  DEFAULT ((3)) FOR [MobilePhone]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_OtherPhone]  DEFAULT ((3)) FOR [OtherPhone]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_EmailAddress]  DEFAULT ((3)) FOR [EmailAddress]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_Visibility]  DEFAULT ((1)) FOR [Visibility]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_ViewProfilePicture]  DEFAULT ((1)) FOR [ViewProfilePicture]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_ViewFriendsList]  DEFAULT ((1)) FOR [ViewFriendsList]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_ViewLinkToRequestAddingYouAsFriend]  DEFAULT ((1)) FOR [ViewLinkToRequestAddingYouAsFriend]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] ADD  CONSTRAINT [DF_tbPrivacySettings_ViewLinkToSendYouMsg]  DEFAULT ((1)) FOR [ViewLinkToSendYouMsg]
GO
ALTER TABLE [dbo].[tbNetworkMemberInvites] ADD  CONSTRAINT [DF_tbGroupMemberInvites_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tbNetworkMemberRequests] ADD  CONSTRAINT [DF_tbGroupMemberRequests_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tbNetworkMembers] ADD  CONSTRAINT [DF_tbNetworkMembers_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tbNetworkPhotos] ADD  CONSTRAINT [DF_tbGroupPhotos_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[tbNetworkPhotos] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbNetworkPosts] ADD  CONSTRAINT [DF_tbGroupPosts_FileType]  DEFAULT ((0)) FOR [FileType]
GO
ALTER TABLE [dbo].[tbNetworkRequests] ADD  CONSTRAINT [DF_tbNetworkRequests_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tbNetworks] ADD  CONSTRAINT [DF_tbNetworks_InActive]  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_NonAdminCanWrite]  DEFAULT ((1)) FOR [NonAdminCanWrite]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_ShowGroupEvents]  DEFAULT ((1)) FOR [ShowGroupEvents]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_EnableDiscussionBoard]  DEFAULT ((1)) FOR [EnableDiscussionBoard]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_EnablePhotos]  DEFAULT ((1)) FOR [EnablePhotos]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_OnlyAllowAdminsToUploadPhotos]  DEFAULT ((0)) FOR [OnlyAllowAdminsToUploadPhotos]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_EnableVideos]  DEFAULT ((1)) FOR [EnableVideos]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_OnlyAllowAdminsToUploadVideos]  DEFAULT ((0)) FOR [OnlyAllowAdminsToUploadVideos]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_EnableLinks]  DEFAULT ((1)) FOR [EnableLinks]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_OnlyAllowAdminsToPostLinks]  DEFAULT ((0)) FOR [OnlyAllowAdminsToPostLinks]
GO
ALTER TABLE [dbo].[tbNetworkSettings] ADD  CONSTRAINT [DF_tbGroupSettings_Access]  DEFAULT ((1)) FOR [Access]
GO
ALTER TABLE [dbo].[tbNetworkVideos] ADD  CONSTRAINT [DF_tbGrpVideos_VidCategory]  DEFAULT ((1)) FOR [VidCategory]
GO
ALTER TABLE [dbo].[tbNetworkVideos] ADD  CONSTRAINT [DF_tbGrpVideos_VidType]  DEFAULT ((0)) FOR [VidType]
GO
ALTER TABLE [dbo].[tbNetworkVideos] ADD  CONSTRAINT [DF_tbGrpVideos_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_SendMsg]  DEFAULT ((1)) FOR [LG_SendMsg]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_AddAsFriend]  DEFAULT ((1)) FOR [LG_AddAsFriend]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_ConfirmFriendShipRequest]  DEFAULT ((1)) FOR [LG_ConfirmFriendShipRequest]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_Poking]  DEFAULT ((0)) FOR [LG_Poking]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_ConfirmFriendDetails]  DEFAULT ((1)) FOR [LG_ConfirmFriendDetails]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_RequestToListAsFamily]  DEFAULT ((1)) FOR [LG_RequestToListAsFamily]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_AddsFriendYouSugges]  DEFAULT ((1)) FOR [LG_AddsFriendYouSuggest]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_LG_HasBirthDayComingUp]  DEFAULT ((0)) FOR [LG_HasBirthDayComingUp]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_PH_TagInPhoto]  DEFAULT ((1)) FOR [PH_TagInPhoto]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_PH_TagOneOfYourPhotos]  DEFAULT ((1)) FOR [PH_TagOneOfYourPhotos]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_VI_TagsInVideo]  DEFAULT ((1)) FOR [VI_TagsInVideo]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_VI_TagsOneOfYourVideos]  DEFAULT ((1)) FOR [VI_TagsOneOfYourVideos]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_VI_CommentOnVideo]  DEFAULT ((1)) FOR [VI_CommentOnVideo]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_VI_CommentOnVideoOfYou]  DEFAULT ((1)) FOR [VI_CommentOnVideoOfYou]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_VI_CommentAfterYouInVideo]  DEFAULT ((1)) FOR [VI_CommentAfterYouInVideo]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_InviteYouToJoin]  DEFAULT ((1)) FOR [GP_InviteYouToJoin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_PromoteToAdmin]  DEFAULT ((1)) FOR [GP_PromoteToAdmin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_MakesYouAGPAdmin]  DEFAULT ((1)) FOR [GP_MakesYouAGPAdmin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_RequestToJoinGPYouAdmin]  DEFAULT ((1)) FOR [GP_RequestToJoinGPYouAdmin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_RepliesToYourDiscBooardPost]  DEFAULT ((1)) FOR [GP_RepliesToYourDiscBooardPost]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GP_ChangesTheNameOfGroupYouBelong]  DEFAULT ((1)) FOR [GP_ChangesTheNameOfGroupYouBelong]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_EV_InviteToEvent]  DEFAULT ((1)) FOR [EV_InviteToEvent]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_EV_DateChanged]  DEFAULT ((1)) FOR [EV_DateChanged]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_EV_MakeYouEventAdmin]  DEFAULT ((1)) FOR [EV_MakeYouEventAdmin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_EV_RequestToJoinEventYouAdmin]  DEFAULT ((1)) FOR [EV_RequestToJoinEventYouAdmin]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_NO_TagsYouInNote]  DEFAULT ((1)) FOR [NO_TagsYouInNote]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_NO_CommentYourNotes]  DEFAULT ((1)) FOR [NO_CommentYourNotes]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_NO_CommentAfterYouInNote]  DEFAULT ((1)) FOR [NO_CommentAfterYouInNote]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_GI_SendYouGift]  DEFAULT ((1)) FOR [GI_SendYouGift]
GO
ALTER TABLE [dbo].[tbNotificationSettings] ADD  CONSTRAINT [DF_tbNotificationSettings_HE_RepliesToYourHelpQuest]  DEFAULT ((1)) FOR [HE_RepliesToYourHelpQuest]
GO
ALTER TABLE [dbo].[tbPollAnswers] ADD  CONSTRAINT [DF_PollAnswers_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[tbVideos] ADD  CONSTRAINT [DF_tbVideos_VidType]  DEFAULT ((0)) FOR [VidType]
GO
ALTER TABLE [dbo].[tbVideos] ADD  CONSTRAINT [DF_tbVideos_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[tbAlbumPhotos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbAlbumPhotos_tbAlbums] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[tbAlbums] ([AlbumID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbAlbumPhotos] NOCHECK CONSTRAINT [FK_tbAlbumPhotos_tbAlbums]
GO
ALTER TABLE [dbo].[tbAlbums]  WITH NOCHECK ADD  CONSTRAINT [FK_tbAlbums_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbAlbums] NOCHECK CONSTRAINT [FK_tbAlbums_tbMembers]
GO
ALTER TABLE [dbo].[tbChatMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_tbChatMessages_tbChatRoom] FOREIGN KEY([RoomID])
REFERENCES [dbo].[tbChatRoom] ([RoomID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbChatMessages] NOCHECK CONSTRAINT [FK_tbChatMessages_tbChatRoom]
GO
ALTER TABLE [dbo].[tbChatMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_tbChatMessages_tbMembers] FOREIGN KEY([ToUserID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbChatMessages] NOCHECK CONSTRAINT [FK_tbChatMessages_tbMembers]
GO
ALTER TABLE [dbo].[tbChatMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_tbChatMessages_tbMembers1] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbChatMessages] NOCHECK CONSTRAINT [FK_tbChatMessages_tbMembers1]
GO
ALTER TABLE [dbo].[tbContactRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_tbContactRequests_tbMembers] FOREIGN KEY([FromMemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbContactRequests] NOCHECK CONSTRAINT [FK_tbContactRequests_tbMembers]
GO
ALTER TABLE [dbo].[tbContactRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_tbContactRequests_tbMembers1] FOREIGN KEY([ToMemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbContactRequests] NOCHECK CONSTRAINT [FK_tbContactRequests_tbMembers1]
GO
ALTER TABLE [dbo].[tbContacts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbContacts_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbContacts] NOCHECK CONSTRAINT [FK_tbContacts_tbMembers]
GO
ALTER TABLE [dbo].[tbContacts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbContacts_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbContacts] NOCHECK CONSTRAINT [FK_tbContacts_tbMembers1]
GO
ALTER TABLE [dbo].[tbDiscussionTopicPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbDiscussionTopicPosts_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbDiscussionTopicPosts] NOCHECK CONSTRAINT [FK_tbDiscussionTopicPosts_tbMembers]
GO
ALTER TABLE [dbo].[tbEventInvites]  WITH CHECK ADD  CONSTRAINT [FK_tbEventInvites_tbEvents] FOREIGN KEY([EventID])
REFERENCES [dbo].[tbEvents] ([EventID])
GO
ALTER TABLE [dbo].[tbEventInvites] CHECK CONSTRAINT [FK_tbEventInvites_tbEvents]
GO
ALTER TABLE [dbo].[tbEventInvites]  WITH NOCHECK ADD  CONSTRAINT [FK_tbEventInvites_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbEventInvites] NOCHECK CONSTRAINT [FK_tbEventInvites_tbMembers]
GO
ALTER TABLE [dbo].[tbEventPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbEventPosts_tbEvents] FOREIGN KEY([EventID])
REFERENCES [dbo].[tbEvents] ([EventID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbEventPosts] NOCHECK CONSTRAINT [FK_tbEventPosts_tbEvents]
GO
ALTER TABLE [dbo].[tbEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_tbEvents_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbEvents] NOCHECK CONSTRAINT [FK_tbEvents_tbMembers]
GO
ALTER TABLE [dbo].[tbEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_tbEvents_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbEvents] NOCHECK CONSTRAINT [FK_tbEvents_tbNetworks]
GO
ALTER TABLE [dbo].[tbLinks]  WITH NOCHECK ADD  CONSTRAINT [FK_tbLinks_tbMembers] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbLinks] NOCHECK CONSTRAINT [FK_tbLinks_tbMembers]
GO
ALTER TABLE [dbo].[tbLoggedInUser]  WITH NOCHECK ADD  CONSTRAINT [FK_tbLoggedInUser_tbChatRoom] FOREIGN KEY([RoomID])
REFERENCES [dbo].[tbChatRoom] ([RoomID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbLoggedInUser] NOCHECK CONSTRAINT [FK_tbLoggedInUser_tbChatRoom]
GO
ALTER TABLE [dbo].[tbLoggedInUser]  WITH NOCHECK ADD  CONSTRAINT [FK_tbLoggedInUser_tbMembers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbLoggedInUser] NOCHECK CONSTRAINT [FK_tbLoggedInUser_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberPostResponses]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberPostResponses_tbMemberPosts] FOREIGN KEY([PostID])
REFERENCES [dbo].[tbMemberPosts] ([PostID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberPostResponses] NOCHECK CONSTRAINT [FK_tbMemberPostResponses_tbMemberPosts]
GO
ALTER TABLE [dbo].[tbMemberPostResponses]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberPostResponses_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberPostResponses] NOCHECK CONSTRAINT [FK_tbMemberPostResponses_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberPosts]  WITH CHECK ADD  CONSTRAINT [FK_tbMemberPosts_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
GO
ALTER TABLE [dbo].[tbMemberPosts] CHECK CONSTRAINT [FK_tbMemberPosts_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberProfile]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberProfile_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberProfile] NOCHECK CONSTRAINT [FK_tbMemberProfile_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberProfileContactInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberProfileContactInfo_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberProfileContactInfo] NOCHECK CONSTRAINT [FK_tbMemberProfileContactInfo_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberProfileEducation]  WITH CHECK ADD  CONSTRAINT [FK_tbMemberProfileEducation_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
GO
ALTER TABLE [dbo].[tbMemberProfileEducation] CHECK CONSTRAINT [FK_tbMemberProfileEducation_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberProfileEmploymentInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberProfileEmploymentInfo_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberProfileEmploymentInfo] NOCHECK CONSTRAINT [FK_tbMemberProfileEmploymentInfo_tbMembers]
GO
ALTER TABLE [dbo].[tbMemberProfilePersonalInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMemberProfilePersonalInfo_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMemberProfilePersonalInfo] NOCHECK CONSTRAINT [FK_tbMemberProfilePersonalInfo_tbMembers]
GO
ALTER TABLE [dbo].[tbMembersBlocked]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersBlocked_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersBlocked] NOCHECK CONSTRAINT [FK_tbMembersBlocked_tbMembers]
GO
ALTER TABLE [dbo].[tbMembersBlocked]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersBlocked_tbMembers1] FOREIGN KEY([BlockMemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersBlocked] NOCHECK CONSTRAINT [FK_tbMembersBlocked_tbMembers1]
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersPrivacySettings_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersPrivacySettings] NOCHECK CONSTRAINT [FK_tbMembersPrivacySettings_tbMembers]
GO
ALTER TABLE [dbo].[tbMembersRecentActivities]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersRecentActivities_tbActivityType] FOREIGN KEY([ActivityTypeID])
REFERENCES [dbo].[tbActivityType] ([ActivityTypeID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersRecentActivities] NOCHECK CONSTRAINT [FK_tbMembersRecentActivities_tbActivityType]
GO
ALTER TABLE [dbo].[tbMembersRecentActivities]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersRecentActivities_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersRecentActivities] NOCHECK CONSTRAINT [FK_tbMembersRecentActivities_tbMembers]
GO
ALTER TABLE [dbo].[tbMembersRegistered]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMembersRegistered_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMembersRegistered] NOCHECK CONSTRAINT [FK_tbMembersRegistered_tbMembers]
GO
ALTER TABLE [dbo].[tbMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessages_tbMembers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessages] NOCHECK CONSTRAINT [FK_tbMessages_tbMembers]
GO
ALTER TABLE [dbo].[tbMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessages_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessages] NOCHECK CONSTRAINT [FK_tbMessages_tbMembers1]
GO
ALTER TABLE [dbo].[tbMessagesDeleted]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesDeleted_tbMembers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesDeleted] NOCHECK CONSTRAINT [FK_tbMessagesDeleted_tbMembers]
GO
ALTER TABLE [dbo].[tbMessagesDeleted]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesDeleted_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesDeleted] NOCHECK CONSTRAINT [FK_tbMessagesDeleted_tbMembers1]
GO
ALTER TABLE [dbo].[tbMessagesJunk]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesJunk_tbMembers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesJunk] NOCHECK CONSTRAINT [FK_tbMessagesJunk_tbMembers]
GO
ALTER TABLE [dbo].[tbMessagesJunk]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesJunk_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesJunk] NOCHECK CONSTRAINT [FK_tbMessagesJunk_tbMembers1]
GO
ALTER TABLE [dbo].[tbMessagesReplies]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesReplies_tbMembers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesReplies] NOCHECK CONSTRAINT [FK_tbMessagesReplies_tbMembers]
GO
ALTER TABLE [dbo].[tbMessagesReplies]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesReplies_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesReplies] NOCHECK CONSTRAINT [FK_tbMessagesReplies_tbMembers1]
GO
ALTER TABLE [dbo].[tbMessagesSent]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesSent_tbMembers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesSent] NOCHECK CONSTRAINT [FK_tbMessagesSent_tbMembers]
GO
ALTER TABLE [dbo].[tbMessagesSent]  WITH NOCHECK ADD  CONSTRAINT [FK_tbMessagesSent_tbMembers1] FOREIGN KEY([ContactID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbMessagesSent] NOCHECK CONSTRAINT [FK_tbMessagesSent_tbMembers1]
GO
ALTER TABLE [dbo].[tbNetworkDiscussionTopics]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkDiscussionTopics_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkDiscussionTopics] NOCHECK CONSTRAINT [FK_tbNetworkDiscussionTopics_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkDiscussionTopics]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkDiscussionTopics_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkDiscussionTopics] NOCHECK CONSTRAINT [FK_tbNetworkDiscussionTopics_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkMemberInvites]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkMemberInvites_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkMemberInvites] NOCHECK CONSTRAINT [FK_tbNetworkMemberInvites_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkMemberInvites]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkMemberInvites_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkMemberInvites] NOCHECK CONSTRAINT [FK_tbNetworkMemberInvites_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkMemberRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkMemberRequests_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkMemberRequests] NOCHECK CONSTRAINT [FK_tbNetworkMemberRequests_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkMembers_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkMembers] NOCHECK CONSTRAINT [FK_tbNetworkMembers_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkMembers_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkMembers] NOCHECK CONSTRAINT [FK_tbNetworkMembers_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkPhotos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPhotos_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPhotos] NOCHECK CONSTRAINT [FK_tbNetworkPhotos_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkPhotos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPhotos_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPhotos] NOCHECK CONSTRAINT [FK_tbNetworkPhotos_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkPostResponses]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPostResponses_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPostResponses] NOCHECK CONSTRAINT [FK_tbNetworkPostResponses_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkPostResponses]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPostResponses_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPostResponses] NOCHECK CONSTRAINT [FK_tbNetworkPostResponses_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPosts_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPosts] NOCHECK CONSTRAINT [FK_tbNetworkPosts_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkPosts_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkPosts] NOCHECK CONSTRAINT [FK_tbNetworkPosts_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkRecentActivities]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRecentActivities_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRecentActivities] NOCHECK CONSTRAINT [FK_tbNetworkRecentActivities_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkRecentActivities]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRecentActivities_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRecentActivities] NOCHECK CONSTRAINT [FK_tbNetworkRecentActivities_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkRegulators]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRegulators_tbMembers] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRegulators] NOCHECK CONSTRAINT [FK_tbNetworkRegulators_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkRegulators]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRegulators_tbMembers1] FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRegulators] NOCHECK CONSTRAINT [FK_tbNetworkRegulators_tbMembers1]
GO
ALTER TABLE [dbo].[tbNetworkRegulators]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRegulators_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRegulators] NOCHECK CONSTRAINT [FK_tbNetworkRegulators_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRequests_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRequests] NOCHECK CONSTRAINT [FK_tbNetworkRequests_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkRequests_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkRequests] NOCHECK CONSTRAINT [FK_tbNetworkRequests_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworks]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworks_tbNetworkCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbNetworkCategory] ([CategoryID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworks] NOCHECK CONSTRAINT [FK_tbNetworks_tbNetworkCategory]
GO
ALTER TABLE [dbo].[tbNetworks]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworks_tbNetworkCategoryType] FOREIGN KEY([CategoryTypeID])
REFERENCES [dbo].[tbNetworkCategoryType] ([CategoryTypeID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworks] NOCHECK CONSTRAINT [FK_tbNetworks_tbNetworkCategoryType]
GO
ALTER TABLE [dbo].[tbNetworkSettings]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkSettings_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkSettings] NOCHECK CONSTRAINT [FK_tbNetworkSettings_tbNetworks]
GO
ALTER TABLE [dbo].[tbNetworkVideos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkVideos_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkVideos] NOCHECK CONSTRAINT [FK_tbNetworkVideos_tbMembers]
GO
ALTER TABLE [dbo].[tbNetworkVideos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNetworkVideos_tbNetworks] FOREIGN KEY([NetworkID])
REFERENCES [dbo].[tbNetworks] ([NetworkID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNetworkVideos] NOCHECK CONSTRAINT [FK_tbNetworkVideos_tbNetworks]
GO
ALTER TABLE [dbo].[tbNotificationSettings]  WITH NOCHECK ADD  CONSTRAINT [FK_tbNotificationSettings_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbNotificationSettings] NOCHECK CONSTRAINT [FK_tbNotificationSettings_tbMembers]
GO
ALTER TABLE [dbo].[tbSuggestions]  WITH CHECK ADD  CONSTRAINT [FK_tbSuggestions_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
GO
ALTER TABLE [dbo].[tbSuggestions] CHECK CONSTRAINT [FK_tbSuggestions_tbMembers]
GO
ALTER TABLE [dbo].[tbVideos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbVideos_tbMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tbMembers] ([MemberID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbVideos] NOCHECK CONSTRAINT [FK_tbVideos_tbMembers]
GO
ALTER TABLE [dbo].[tbVideos]  WITH NOCHECK ADD  CONSTRAINT [FK_tbVideos_tbVideoCategory] FOREIGN KEY([VidCategory])
REFERENCES [dbo].[tbVideoCategory] ([CategoryID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbVideos] NOCHECK CONSTRAINT [FK_tbVideos_tbVideoCategory]
GO
/****** Object:  StoredProcedure [dbo].[DeleteNetworkTopic]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec DeleteNetworkTopic 1
-- Description:	del topic and post relateed 
-- =============================================
Create PROCEDURE [dbo].[DeleteNetworkTopic]
	
    @TopicID int
   	
AS 
   DELETE FROM dbo.tbDiscussionTopicPosts WHERE TopicID = @TopicID 
   DELETE FROM dbo.tbNetworkDiscussionTopics WHERE TopicID = @TopicID 














GO
/****** Object:  StoredProcedure [dbo].[GetContactsNotInNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContactsNotInNetwork]

   @memberID int,
    @networkID int
    
AS 
   DECLARE @boolval bit
  SET @boolval = 0
   SELECT 
      @boolval as IsAdmin, @boolval as IsOwner, getdate() as JoinedDate, @networkID as NetworkID,
      m.MemberID, m.FirstName, m.LastName,m.PicturePath,m.TitleDesc   
FROM 
      tbMemberProfile m
WHERE 
      m.memberID in (select contactID from tbContacts c where c.memberID = @MemberID  
      EXCEPT
      select memberid  from  tbNetworkMembers where networkid = @NetworkID
      EXCEPT
       select memberID from tbNetworkMemberInvites where networkid = @NetworkID )
GO
/****** Object:  StoredProcedure [dbo].[GetJobPosterApplicants]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec GetJobPosterApplicants 1
-- Description:	get all applicants who applied for job
-- =============================================
CREATE PROCEDURE [dbo].[GetJobPosterApplicants]

	@PostID int
   
AS 

		SELECT 
			f.firstname + ' ' + f.lastname as ApplicantName,
			f.firstName as FirstName,
		       
			isnull(picturepath,'default.png') as PicturePath,
			PostID, AppJobID, AppliedDate, f.MemberID, f.TitleDesc as ApplicantTitle,
		    f.firstname + ' ' + f.lastname + ':' + CAST(f.MemberID AS varchar(20)) + ':' + CAST(PostID AS varchar(20))  as SPData		          
		FROM 
				tbMemberProfile f 
                join tbJobApplicants j on f.memberID = j.memberID
        WHERE 
			j.postID =@PostID order by applieddate


GO
/****** Object:  StoredProcedure [dbo].[IsFollowingConnection]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2022
-- example: exec [IsFollowingConnection] 1, 3
-- Description:	check to see if member is following another member
-- =============================================
CREATE PROCEDURE [dbo].[IsFollowingConnection]
	
	@MemberID int,
    @FollowingMemberId int
   	
AS

   SELECT 
      MemberId
  FROM tbMemberFollowing where MemberID =@MemberID and FollowingMemberID = @FollowingMemberId
GO
/****** Object:  StoredProcedure [dbo].[SearchContactResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec SearchContactResults 1, 'west'
-- Description:	gets all search base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[SearchContactResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 
 select TOP 8 * from (
    -- people search
	SELECT m.MemberID as EntityID, 
           t.FirstName + ' ' + t.LastName as EntityName, 
		   CASE 
                WHEN picturePath is null THEN  '../members/images/default.png'
                WHEN ps.ViewProfilePicture = 0 THEN '../members/images/default.png'
                ELSE '../members/images/' + picturepath
		   END as PicturePath, 
           --ISNULL('../members/images/' + picturepath,'../members/images/default.png') as PicturePath,    
		   CASE 
				WHEN m.memberID = @MemberID then 'View Profile' -- same person
				WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile'
				WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
				ELSE 'Add as Contact' 
		   END as LabelText, 
           m.Email,
           Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID,  
           Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params,
	       Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
             ',''' + CASE 
		     WHEN m.memberID = @MemberID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile' 
		     WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		     ELSE 'Add as Contact' 
	       END + ''''  as ParamsAV, 
           case when TitleDesc ='' then  City + ', ' + state 
                when TitleDesc is null then City + ', ' + state 
                else TitleDesc + '<br/>' + City + ', ' + state end as CityState, 
           '' as description, '' as MemberCount, 
           '01/01/1900' as CreatedDate,
           '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate,   
           '' as ShowCancel, 'people' as sType 	        
	FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         left join tbMemberProfileContactInfo c on m.memberid = c.memberId
		 join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@memberID) ) )
	WHERE 
        t.firstname like @SearchText + '%' or t.lastname like @SearchText + '%'
  
    UNION

    -- search schools
    select * from (
      select
           lgid as EntityID, 
           schoolName as EntityName, 
           ISNULL('../Institutions/Images/Colleges' + [ImageFile],'../Institutions/Images/Colleges/default.png') as PicturePath,    	
		   '' as LabelText, 
           '' as Email ,
           Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
		   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

           ISNULL(schoolname,'') + '~' + ISNULL(streetname,'') + '~' + ISNULL(city,'') + '~' + ISNULL(state,'') + '~' + ISNULL(zip,'') + '~' + ISNULL(county,'') + '~' + 
           ISNULL(phone,'') + '~' + ISNULL(PSS_Enroll_T,'') + '~' + ISNULL(PSS_Relig,'') + '~' + ISNULL(PSS_ASSOC_1,'') + '~' + ISNULL(PSS_Locale,'') 
           as ParamsAV, 

		   city + ', ' + state as CityState,
		   '' as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'private' as sType 
      from dbo.tbPrivateSchools 

	  union

	  select 
           lgid as EntityID, 
           schoolName as EntityName, 
           ISNULL('../Institutions/Images/Colleges' + [ImageFile],'../Institutions/Images/Colleges/default.png') as PicturePath,    	
		   '' as LabelText, 
           '' as Email,
           Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
		   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

           isnull(schoolName,'') + '~' + isnull(district,'') + '~' + isnull(StreetName,'') + '~' + isnull(city,'') + '~' + isnull(state,'') + '~' + isnull(zip,'') + '~' + 
           isnull(phone,'') + '~' + isnull(charter,'') + '~' + isnull(magnet,'') + '~' + isnull(Titlle1School,'') + '~' + isnull(countryName,'') + '~' + 
           cast(isnull(students,0) as varchar(20)) + '~' + cast(isnull(teachers,0) as varchar(20)) + '~' + isnull(locale,'') 
            as ParamsAV, 

		   city + ', ' + state as CityState,
		   '' as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
          'public' as sType 
      from dbo.tbPublicSchools 

	  union

	  select 
           schoolid as EntityID,
           [name] as EntityName,
           ISNULL('../Institutions/Images/Colleges/' + [ImageFile],'../Institutions/Images/Colleges/default.png') as PicturePath, 
		   '' as LabelText, 
           '' as Email,
           Cast(schoolid as varchar(20)) + ',' + [name] as NameAndID,
		   Cast(schoolid as varchar(20)) + ',''' + [name] +  '''' as Params,

		   isnull([name],'') + '~' +  isnull(address,'') + '~' + isnull(phone,'') + '~' + isnull(website,'') + '~' + isnull([type],'') + '~' + isnull(awardsOffered,'') + '~' + isnull(CampusSetting,'') + '~' +  isnull(campusHousing,'')  + '~' + Cast(isnull(StudentPopulation,'') as varchar(20)) + '~' +
           Cast(isnull(UnderGradStudents,'') as varchar(20))  as ParamsAV,
 
		   address as CityState,
		   '' as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'college' as sType 
       from tbColleges 
	  ) AS TB2
	  WHERE EntityName 	like @SearchText + '%' 
    
     UNION

     -- organizations
      select 
           id as EntityID,
           [name] as EntityName,
           ISNULL('../Organizations/Images/' + [ImageFile],'../Organizations/Images/default.png') as PicturePath, 
		   '' as LabelText, 
           '' as Email,
           Cast(id as varchar(20)) + ',' + [name] as NameAndID,
		   Cast(id as varchar(20)) + ',''' + [name] +  '''' as Params,

		   isnull([name],'') + '~' + isnull(sector,'') + '~' + isnull(industry,'') + '~' + isnull(IPOYear,'') + '~' + isnull(SummaryQuote,'') + '~' + isnull(website,'') + '~' +  Cast(isnull(description,'') as varchar(1000)) as ParamsAV, 
		   
		   sector + ' - ' + industry as CityState,
		   '' as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'company' as sType 
       from tbCompanies where [name] like @SearchText + '%' 
     
) AS TB1
    





GO
/****** Object:  StoredProcedure [dbo].[SearchTop8NetworkResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec SearchTop8NetworkResults 'my'
-- Description:	gets all search base on search text 
-- =============================================
CREATE PROCEDURE [dbo].[SearchTop8NetworkResults]
			
   	@SearchText varchar(100)
   
AS 
    select TOP 8 NetworkID,NetworkName, N.Description, C.Description as Category, T.Description as CategoryType,
       CASE 
                WHEN n.[image] is null THEN  '../networks/images/default.png'                
                ELSE '../networks/images/' + n.[image]
	   END as PicturePath 
     FROM tbNetworks N
        left join tbNetworkCategory C on N.CategoryID = C.CategoryID
        left join tbNetworkCategoryType T on N.CategoryTypeID = T.CategoryTypeID
     WHERE NetworkName like @SearchText + '%'     
     --OR c.Description like @SearchText + '%'  
     --OR t.Description like @SearchText + '%'     
     ORDER BY n.NetworkName 





GO
/****** Object:  StoredProcedure [dbo].[sp_send_NewRegisteredUserMail]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_send_NewRegisteredUserMail] 

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	Create a new user. 
-- Sample exec sp_send_NewRegisteredUserMail 'test@test.com','test@test.com','Test of CDONTS','It works'
-- ============================================

	@From varchar(100),
	@To varchar(100),
	@Subject varchar(100),
	@Body varchar(4000),
	@CC varchar(100) = null,
	@BCC varchar(100) = null
AS
	Declare @MailID int
	Declare @hr int
	EXEC @hr = sp_OACreate 'CDONTS.NewMail', @MailID OUT
	EXEC @hr = sp_OASetProperty @MailID,'RemoteHost', 'mail.outcomesinc.com'
	EXEC @hr = sp_OASetProperty @MailID, 'From',@From
	EXEC @hr = sp_OASetProperty @MailID, 'Body', @Body
	EXEC @hr = sp_OASetProperty @MailID, 'BCC',@BCC
	EXEC @hr = sp_OASetProperty @MailID, 'CC', @CC
	EXEC @hr = sp_OASetProperty @MailID, 'Subject', @Subject
	EXEC @hr = sp_OASetProperty @MailID, 'To', @To
	EXEC @hr = sp_OAMethod @MailID, 'Send', NULL
	EXEC @hr = sp_OADestroy @MailID
GO
/****** Object:  StoredProcedure [dbo].[spAcceptRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetAcceptRequest 1
-- Description:	gets a member's events list
-- =============================================
CREATE PROCEDURE [dbo].[spAcceptRequest]
	
    @MemberID int,
	@ContactID int
   	
AS

   INSERT INTO dbo.tbContacts (memberid, ContactID,status,datestamp)
	   VALUES (@MemberID,@ContactID, 1,getdate())
  
   INSERT INTO dbo.tbContacts (memberid, ContactID,status,datestamp)
	   VALUES (@ContactID,@MemberID, 1,getdate())
   
   DELETE FROM dbo.tbContactRequests WHERE FromMemberID = @ContactID and ToMemberID = @MemberID













GO
/****** Object:  StoredProcedure [dbo].[spAddFollowingMember]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date:3/2022
-- example: exec spAddFollowingMember 1
-- Description:	adds a member's followiing list
-- =============================================
CREATE PROCEDURE [dbo].[spAddFollowingMember]
	
	@MemberID int,
    @FollowingMemberID int
AS
   insert into tbMemberFollowing (memberID, FollowingMemberID) values (@MemberID, @FollowingMemberID)
       
GO
/****** Object:  StoredProcedure [dbo].[spAddMemberToNetworkRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddMemberToNetworkRequest]	
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spAddMemberToNetworkRequest 16, 1, 0
-- Description:	 add a member who requested to join network
-- =============================================
	@NetworkID int,
    @MemberID int,
    @Status int
    
AS          
       insert into tbNetworkMemberRequests (NetworkID, RequestorID, Status)
		   VALUES (@NetworkID, @MemberID,@Status)

GO
/****** Object:  StoredProcedure [dbo].[spAddNetworkAdmin]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spAddNetworkAdmin] 3, 1
-- Description:	make member a admin for network
-- =============================================
CREATE PROCEDURE [dbo].[spAddNetworkAdmin]
	
	@NetworkID int,
    @MemberID int
 
AS 
   UPDATE tbNetworkMembers SET isAdmin = 1 WHERE NetworkID = @NetworkID
              and MemberID = @MemberID
GO
/****** Object:  StoredProcedure [dbo].[spAddNetworkMembers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec [spAddNetworkMembers] 12, 16
-- Description:   add network member
-- =============================================
CREATE PROCEDURE [dbo].[spAddNetworkMembers]
   
  @MemberID int,
  @NetworkID int
      
AS

IF NOT EXISTS (select * from tbNetworkMembers where memberID =@MemberID and NetworkID= @NetworkID) BEGIN
   INSERT INTO tbNetworkMembers (NetworkID, MemberID, JoinedDate,IsOwner, IsAdmin) 
       VALUES (@NetworkID, @MemberID, GetDate(),0,0 )
   
END
--UPDATE tbNetworkRequests set status = 1 where MemberID =@MemberID and NetworkID=@NetworkID
DELETE  FROM tbNetworkMemberRequests where RequestorID=@MemberID and NetworkID=@NetworkID
GO
/****** Object:  StoredProcedure [dbo].[spAdvanceJobSearch]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spAdvanceJobSearch] '','','','','','','','','14Days'
-- Description:	gets a album's photo list
-- =============================================
CREATE PROCEDURE [dbo].[spAdvanceJobSearch]
	
	@Title varchar(200),    
    @Sector varchar(150),
    @industry  varchar(150),
    @Company varchar(150),
    @Country  varchar(100),
    @state varchar(50), 
    @jobFunctions  varchar(6000),
    @ExpLevels varchar(6000),
    @DaysPosted varchar(50)
AS
    DECLARE @thisDay DateTime
    DECLARE @thatDay DateTime

	DECLARE @JF NVARCHAR(MAX), @xml XML
    SET @thisDay = GetDate()
	SET @JF = @jobFunctions
	SET @xml = '<values><value>' + REPLACE(@JF,',','</value><value>') + '</value></values>'

	DECLARE @Exp NVARCHAR(MAX), @xmlExp XML
	SET @Exp = @ExpLevels
	SET @xmlExp = '<values><value>' + REPLACE(@Exp,',','</value><value>') + '</value></values>'
   
    If @DaysPosted = '1Day' 
       SET @thatDay = DATEADD(day,-2,@thisDay)
    Else if @DaysPosted = '7Days' 
       SET @thatDay = DATEADD(day,-8,@thisDay)
    Else if @DaysPosted = '14Days' 
	   SET @thatDay = DATEADD(day,-15,@thisDay)
    Else if @DaysPosted = '30Days'
       SET @thatDay = DATEADD(day,-31,@thisDay)
   

    IF @DaysPosted = 'AnyTime' BEGIN
		 SELECT * from dbo.tbJobs 
	     WHERE Jobtitle like (CASE WHEN len(@Title) = 0 THEN Jobtitle ELSE @Title + '%' END)	  
				 AND  Sector like (CASE WHEN len(@Sector) = 0 THEN Sector ELSE @Sector + '%' END)
				 AND  Industry like (CASE WHEN len(@Industry) = 0 THEN Industry ELSE @Industry + '%' END)
				 AND  Company like (CASE WHEN len(@Company) = 0 THEN Company ELSE @Company +'%' END)
				 AND  Country like  (CASE WHEN len(@Country) = 0 THEN Country ELSE @Country  +'%' END)
				 AND State like (CASE WHEN len(@State) = 0 THEN State ELSE @State +'%' END)
				 AND JobFunction in (CASE WHEN len(@jobFunctions) = 0 THEN (JobFunction) 
				   ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xml.nodes('values/value') AS lst(itm)) END)
				 AND ExperienceType in (CASE WHEN len(@ExpLevels) = 0 THEN (ExperienceType) 
				   ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xmlExp.nodes('values/value') AS lst(itm)) END)
               order by dateposted desc	
 
       END
    ELSE BEGIN        
       
          SELECT * from dbo.tbJobs 
		  WHERE Jobtitle like (CASE WHEN len(@Title) = 0 THEN Jobtitle ELSE @Title + '%' END)	  
				 AND  Sector like (CASE WHEN len(@Sector) = 0 THEN Sector ELSE @Sector + '%' END)
				 AND  Industry like (CASE WHEN len(@Industry) = 0 THEN Industry ELSE @Industry + '%' END)
				 AND  Company like (CASE WHEN len(@Company) = 0 THEN Company ELSE @Company +'%' END)
				 AND  Country like  (CASE WHEN len(@Country) = 0 THEN Country ELSE @Country  +'%' END)
				 AND State like (CASE WHEN len(@State) = 0 THEN State ELSE @State +'%' END)
				 AND JobFunction in (CASE WHEN len(@jobFunctions) = 0 THEN (JobFunction) 
				   ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xml.nodes('values/value') AS lst(itm)) END)
				 AND ExperienceType in (CASE WHEN len(@ExpLevels) = 0 THEN (ExperienceType) 
				   ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xmlExp.nodes('values/value') AS lst(itm)) END)
                 AND 
                     DatePosted between @thatDay and @thisDay

			order by dateposted desc	
    END
  


--     DECLARE @strSQL varchar(8000)
--     set @strSQL = 
--	  '
--           WHERE Jobtitle = (CASE WHEN len(''' + @Title + ''') = 0 THEN Jobtitle ELSE ''' + @Title + ''' END)'
--      
--	   if (len(@Sector) <> 0)
--            set @strSQL  = @strSQL + ' AND  Sector = ''' + @Sector + ''''
--       
--	   if (len(@Industry) <> 0) 
--            set @strSQL  = @strSQL + ' AND  Industry = ''' + @Industry + ''''
--       
--	   if (len(@Company) <> 0) 
--            set @strSQL  = @strSQL + ' AND  Company = ''' + @Company + ''''
--       		
--	   if (len(@Country) <> 0) 
--            set @strSQL  = @strSQL + ' AND  Country = ''' + @Country + ''''       
--		
--	    if (len(@State) <> 0)
--            set @strSQL  = @strSQL + ' AND  State = ''' + @State + ''''       
--		
--	   if len(@jobFunctions) <> 0 
--           set @strSQL  = @strSQL + ' AND JobFunction IN (''' + @jobFunctions + ''')'
--       		
--	   if len(@ExpLevels) <> 0 
--           set @strSQL  = @strSQL + ' AND ExperienceType IN (''' + @ExpLevels + ''')'
--       
--
----print @strSQL
--execute (@strSQL)
--select * from tbJobs




GO
/****** Object:  StoredProcedure [dbo].[spAllSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAllSearchResults]
	-- exec spAllSearchResults 1, 'larr'
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 
 select * from (
    -- people search
	SELECT m.MemberID as EntityID, 
           t.FirstName + ' ' + t.LastName as FriendName,

		   CASE 
                WHEN picturePath is null THEN  'default.png'
                WHEN ps.ViewProfilePicture = 0 THEN 'default.png'
                ELSE  picturepath
		   END as PicturePath, 
           --ISNULL('../members/images/' + picturepath,'../members/images/default.png') as PicturePath,    
		   CASE 
				WHEN m.memberID = @MemberID then 'View Profile' -- same person
				WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile'
				WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
				ELSE 'Add as Contact' 
		   END as LabelText, 
           m.Email,
           Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID,  
           Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params,
	       Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
             ',''' + CASE 
		     WHEN m.memberID = @MemberID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile' 
		     WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		     ELSE 'Add as Contact' 
	       END + ''''  as ParamsAV, 
           case when TitleDesc ='' and (City is not null and City <> '') then  City + ', ' + state 
                when TitleDesc is null and (City is not null and City <> '') then City + ', ' + state 
				when TitleDesc is not null and (City is not null and City <> '') then TitleDesc
                else TitleDesc  end as CityState, 
           '' as description, '' as MemberCount, 
           getDate() as CreatedDate,
           '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   getDate() as startdate,
		   getdate() as enddate,   
           '' as ShowCancel, 'people' as sType 	        
	FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         left join tbMemberProfileContactInfo c on m.memberid = c.memberId         
         join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@memberID) ) )
	WHERE 
        t.firstname like @SearchText + '%' or t.lastname like @SearchText + '%'
        or t.Sport like  '%' + @SearchText + '%' or t.CurrentStatus like @SearchText + '%'
       /*  comment below to not show event, network, and other entities 
    UNION
    
    -- event search
    SELECT  E.eventid  as EntityID, 
       planningwhat  as EntityName,
       isnull(eventimg,'default.png') as PicturePath, 
       '' as LabelText, 
       '' as Email, 
       '' as NameAndID,
	   (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as Params,
	   '' as ParamsAV, 
       CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime + '</br>' + location as CityState, 
       '' as description, '' as MemberCount, 
       '01/01/1900' as CreatedDate,     
       location,        
       CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate,
	   Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 	     
	   startdate, 
       enddate,	 
	   case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel, 'event' as sType
	FROM tbEvents E left join tbEventInvites I on E.EventID = I.EventID  
	WHERE e.PlanningWhat like '%' + @SearchText + '%'   -- order by StartDate desc
	
    UNION

	-- network search
    SELECT n.NetworkID as EntityID, 
           n.NetworkName as EntityName, 
           ISNULL([Image],'default.png') as PicturePath,    
	CASE 		
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr where nr.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm where nm.MemberID = @MemberID) then 'View Network' 
		ELSE 'Join Network' 
	END as LabelText, 
    ISNULL(Email,'') as Email ,
    Cast(n.NetworkID as varchar(20)) + ',' + n.NetworkName as NameAndID  
    ,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName +  '''' as Params
	,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName  + '''' +
       ',''' + CASE 
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr2 where nr2.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm2 where nm2.MemberID = @MemberID) then 'View Network'
		ELSE 'Join Network' 
	END + '''' as ParamsAV, 
    'Created On ' + Cast(isnull(createddate, '') as varchar(50)) + '</br>' + cast( (select count(s.networkID) from tbNetworkMembers s where s.networkid = n.networkid) as varchar(100)) + ' member(s)'  as CityState,
    Description, '0 Members' as MemberCount, 
    isnull(createddate, '') as CreatedDate, 
    
		'' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate, '' as ShowCancel, 'network' as sType 	        
	FROM tbNetworks n
	WHERE 
        n.NetworkName like @SearchText + '%' 
	
    -- UNION

    -- search schools
    -- select * from (
    --   select
    --        lgid as EntityID, 
    --        schoolName as EntityName, 
    --        ISNULL( [ImageFile],'default.png') as PicturePath,    	
	-- 	   '' as LabelText, 
    --        '' as Email ,
    --        Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
	-- 	   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

    --        ISNULL(schoolname,'') + '~' + ISNULL(streetname,'') + '~' + ISNULL(city,'') + '~' + ISNULL(state,'') + '~' + ISNULL(zip,'') + '~' + ISNULL(county,'') + '~' + 
    --        ISNULL(phone,'') + '~' + ISNULL(PSS_Enroll_T,'') + '~' + ISNULL(PSS_Relig,'') + '~' + ISNULL(PSS_ASSOC_1,'') + '~' + ISNULL(PSS_Locale,'') 
    --        as ParamsAV, 

	-- 	   city + ', ' + state as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'private' as sType 
    --   from dbo.tbPrivateSchools 

	--   union

	--   select 
    --        lgid as EntityID, 
    --        schoolName as EntityName, 
    --        ISNULL([ImageFile],'default.png') as PicturePath,    	
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
	-- 	   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

    --        isnull(schoolName,'') + '~' + isnull(district,'') + '~' + isnull(StreetName,'') + '~' + isnull(city,'') + '~' + isnull(state,'') + '~' + isnull(zip,'') + '~' + 
    --        isnull(phone,'') + '~' + isnull(charter,'') + '~' + isnull(magnet,'') + '~' + isnull(Titlle1School,'') + '~' + isnull(countryName,'') + '~' + 
    --        cast(isnull(students,0) as varchar(20)) + '~' + cast(isnull(teachers,0) as varchar(20)) + '~' + isnull(locale,'') 
    --         as ParamsAV, 

	-- 	   city + ', ' + state as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --       'public' as sType 
    --   from dbo.tbPublicSchools 

	--   union

	--   select 
    --        schoolid as EntityID,
    --        [name] as EntityName,
    --        ISNULL( [ImageFile],'default.png') as PicturePath, 
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(schoolid as varchar(20)) + ',' + [name] as NameAndID,
	-- 	   Cast(schoolid as varchar(20)) + ',''' + [name] +  '''' as Params,

	-- 	   isnull([name],'') + '~' +  isnull(address,'') + '~' + isnull(phone,'') + '~' + isnull(website,'') + '~' + isnull([type],'') + '~' + isnull(awardsOffered,'') + '~' + isnull(CampusSetting,'') + '~' +  isnull(campusHousing,'')  + '~' + Cast(isnull(StudentPopulation,'') as varchar(20)) + '~' +
    --        Cast(isnull(UnderGradStudents,'') as varchar(20))  as ParamsAV,
 
	-- 	   address as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'college' as sType 
    --    from tbColleges 
	--   ) AS TB2
	--   WHERE EntityName 	like @SearchText + '%' 
    
    --  UNION

    --  -- organizations
    --   select 
    --        id as EntityID,
    --        [name] as EntityName,
    --        ISNULL( [ImageFile],'default.png') as PicturePath, 
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(id as varchar(20)) + ',' + [name] as NameAndID,
	-- 	   Cast(id as varchar(20)) + ',''' + [name] +  '''' as Params,

	-- 	   isnull([name],'') + '~' + isnull(sector,'') + '~' + isnull(industry,'') + '~' + isnull(IPOYear,'') + '~' + isnull(SummaryQuote,'') + '~' + isnull(website,'') + '~' +  Cast(isnull(description,'') as varchar(1000)) as ParamsAV, 
		   
	-- 	   sector + ' - ' + industry as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'company' as sType 
    --    from tbCompanies where [name] like @SearchText + '%' 
     */
) AS TB1



GO
/****** Object:  StoredProcedure [dbo].[spBlockMember]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spBlockMember] 1,2
-- Description:	block member
-- =============================================
CREATE PROCEDURE [dbo].[spBlockMember]
	@MemberID int,
    @BlockMemberName varchar (100),
	@BlockMemberID int = 0
AS
	IF not exists(SELECT MemberID FROM tbMembersBlocked WHERE MemberID = @MemberID and BlockMemberName = @BlockMemberName) 
    BEGIN
		INSERT INTO tbMembersBlocked(MemberID, BlockMemberName, BlockMemberID) Values (@MemberID,@BlockMemberName, @BlockMemberID)
	END 

GO
/****** Object:  StoredProcedure [dbo].[spCancelEvent]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCancelEvent 1
-- Description:	cancel event removing all records
-- =============================================
CREATE PROCEDURE [dbo].[spCancelEvent]
	
    @EventID int
   	
AS
   DELETE FROM tbEventInvites Where eventID =@eventID
   DELETE FROM tbEventPosts WHERE eventID = @eventID
   DELETE FROM tbEvents where eventID = @eventID
   







GO
/****** Object:  StoredProcedure [dbo].[spChangePasswordViaEmail]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spChangePasswordViaEmail 
-- Description: change member password
-- =============================================
CREATE PROCEDURE [dbo].[spChangePasswordViaEmail]  
	  
	@Email varchar(100),
	@Password varchar(100)    
AS
    UPDATE tbMembers SET Password = @Password WHERE Email = @Email
GO
/****** Object:  StoredProcedure [dbo].[spCheckMemberAlreayBlock]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCheckMemberAlreayBlock] 1
-- Description:	get a block member
-- =============================================
CREATE PROCEDURE [dbo].[spCheckMemberAlreayBlock]
	@MemberID int,
    @BlockMemberID int
AS
    
	SELECT b.MemberID, b.BlockMemberID FROM tbMembersBlocked b 
        WHERE b.MemberID = @MemberID and b.BlockMemberID =@BlockMemberID 
  





GO
/****** Object:  StoredProcedure [dbo].[spContactSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spContactSearchResults 1, 'jo'
-- Description:	gets all search base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[spContactSearchResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 
 
	SELECT f.ContactID as EntityID, p.FirstName + ' ' + p.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath, firstname, lastname, 
    
    CASE When c.city is null then '' 
		 When c.state is null then c.city
		 else c.city + ', ' + c.state
	END as CityState , '' as  LabelText, '' as Email, '' as NameAndID, '' as Params, '' as ParamsAV, '' as description, '' as MemberCount, '01/01/1900' as CreatedDate,
        '' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate      
	FROM tbContacts f JOIN tbMemberProfile p on f.Contactid = p.memberid
         left join tbMemberProfileContactInfo C on C.memberID = f.ContactID    
	WHERE 
            f.memberID = @MemberID
        AND 
			(p.lastname like @SearchText + '%'  or p.firstname like @SearchText + '%' )


 



GO
/****** Object:  StoredProcedure [dbo].[spCreateAlbum]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateAlbum] 1,'', '',0
-- Description:	Creates an photo album for member
-- =============================================
CREATE PROCEDURE [dbo].[spCreateAlbum]
	
	@MemberID int,
    @AlbumName varchar(50),
    @AlbumDesc varchar(200),
	@Privacy int
   	
AS
   if exists(select * from tbAlbums where albumName = @AlbumName and MemberID =@MemberId) begin
       insert into tbAlbums (MemberID, AlbumName, Description, PrivacySetting, CreatedDate)
       values (@MemberID, @AlbumName + ' - next copy', @AlbumDesc, @Privacy, getdate())
   end
   else begin
       insert into tbAlbums (MemberID, AlbumName, Description, PrivacySetting, CreatedDate)
       values (@MemberID, @AlbumName, @AlbumDesc, @Privacy, getdate())
   end 

GO
/****** Object:  StoredProcedure [dbo].[spCreateContact]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateContanct] 'email'...
-- Description:	Creates a new contact
-- =============================================
CREATE PROCEDURE [dbo].[spCreateContact]
	
	@Email varchar(70),
    @Subject varchar(50),
    @IssueID int,
	@Description varchar(2000)
	
AS

   INSERT INTO tbContacts (Email,Subject,IssueType,Description) VALUES
         (@Email,@Subject,@IssueID, @Description)
    
GO
/****** Object:  StoredProcedure [dbo].[spCreateContanct]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateContanct] 'email'...
-- Description:	Creates a new contact
-- =============================================
CREATE PROCEDURE [dbo].[spCreateContanct]
	
	@Email varchar(70),
    @Subject varchar(50),
    @IssueID int,
	@Description varchar(2000)
	
AS

   INSERT INTO tbContacts (Email,Subject,IssueType,Description) VALUES
         (@Email,@Subject,@IssueID, @Description)
    
GO
/****** Object:  StoredProcedure [dbo].[spCreateEvent]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateEvent] ....
-- Description:	Creates an event for member or group
-- =============================================
CREATE PROCEDURE [dbo].[spCreateEvent]
	
	@NetworkID int,
	@MemberID int,
	@StartDate varchar(20),
	@StartTime varchar(10),
	@EndDate varchar(20),
	@EndTime varchar(20),
    @EventName varchar(100),
    @EventInfo varchar(200),
	@Location varchar(150),
    @Street varchar(100),
    @City varchar(100),
    @State varchar(50),
    @Zip varchar(20),
    @InviteAllGrpMembers int,
	@AnyoneCanViewRSVP int,
	@AnyoneCanViewGuestList int
   	
AS
   DECLARE @ID int
   
   INSERT INTO tbEvents (NetworkID, MemberID,StartDate, StartTime, EndDate, EndTime,
		PlanningWhat, location, Street, City,state, zip, MoreInfo,InviteAllGroupMembers, AnyoneCanviewRSVP, ShowGuestList,createdDate) 
    VALUES
   (@NetworkID, @MemberID, @StartDate, @StartTime, @EndDate, @EndTime, @EventName,
        @Location, @Street, @City, @State, @zip, @EventInfo,@InviteAllGrpMembers,
	    @AnyoneCanViewRSVP, @AnyoneCanViewGuestList,getdate()) 

   SET @ID = SCOPE_IDENTITY()

   SELECT  @ID as id







GO
/****** Object:  StoredProcedure [dbo].[spCreateEventPost]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateEventPost 1, 'testing 123'
-- Description:	Creates a new post for event
-- =============================================
CREATE PROCEDURE [dbo].[spCreateEventPost]
	@EventID int,
	@MemberID int,
    @PostMsg varchar(700)
   	
AS
  
   INSERT INTO tbEventPosts (EventID,MemberID, PostDate, Description) VALUES
         (@EventID, @MemberID,GetDate(),@PostMsg)
    


GO
/****** Object:  StoredProcedure [dbo].[spCreateLink]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateLink 
-- Description:	Creates a link
-- =============================================

CREATE PROCEDURE [dbo].[spCreateLink]
	@MemberID int,
    @Url varchar(150),
	@Comment varchar(1000),
    @ThumbNail varchar(200),
    @OwnerType	int,
	@PrivacyType int,
	@Ext varchar(5)

  
AS
   if (@ThumbNail = '') set @ThumbNail = null

   INSERT INTO tbLinks (OwnerID, Url, Description, thumbnail, CreatedDate,OwnerType,PrivacyType)
   VALUES (@MemberID,@Url, @Comment, @ThumbNail,getDate(), @OwnerType,@PrivacyType )
   
   if (@Ext <> '') begin
     UPDATE tbLinks SET [thumbnail] = cast (SCOPE_IDENTITY() as varchar(50)) + @Ext
     WHERE LinkID = SCOPE_IDENTITY()
   end
 
   SELECT  SCOPE_IDENTITY() as id



GO
/****** Object:  StoredProcedure [dbo].[spCreateMemberPost]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateMemberPost 1, 'testing 123'
-- Description:	Creates a new post for member
-- =============================================
CREATE PROCEDURE [dbo].[spCreateMemberPost]
	
	@MemberID int,
    @PostMsg varchar(700)
   	
AS
  
   INSERT INTO tbMemberPosts (MemberID, PostDate, Description) VALUES
         (@MemberID,GetDate(),@PostMsg)
    

GO
/****** Object:  StoredProcedure [dbo].[spCreateMessage]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spValidateMemberFriend] 5,'jmcquire@yahoo.com', '', 'email'
-- Description:	Creates a new message
-- =============================================
CREATE PROCEDURE [dbo].[spCreateMessage]
	
	@To int,
    @From int,
    @Subject varchar(100),
	@Body varchar(700),
	@Attachment varchar(50),
    @OriginalMsg varchar(max)
	
AS
    DECLARE @bAttach bit
    SET @bAttach = 0

	If @Attachment <> ''
       SET @bAttach = 1    
 
    INSERT INTO tbMessages (SenderID,ContactID,Subject,Body,MsgDate,
                Attachment,MessageState,AttachmentFile, FlagLevel, ImportanceLevel,OriginalMsg )
	VALUES 
           (@From, @To,@Subject,@Body,convert(char, getdate(), 22) ,@bAttach,0,@Attachment, 0,0, @OriginalMsg)

	INSERT INTO tbSentMessages (MessageID,SenderID,ContactID,Subject,Body,MsgDate,
                Attachment,MessageState,AttachmentFile, FlagLevel, ImportanceLevel)
	VALUES 
           (@@identity,@From, @To,@Subject,@Body,convert(char, getdate(), 22) ,@bAttach,1,@Attachment, 0,0)



GO
/****** Object:  StoredProcedure [dbo].[spCreateMessageBySource]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateMessageBySource 5,'jmcquire@yahoo.com', '', 'email'
-- Description:	Creates a new message
-- =============================================
CREATE PROCEDURE [dbo].[spCreateMessageBySource]
	
	@To int,
    @From int,
    @Subject varchar(100),
	@Body varchar(700),
	@Attachment varchar(50),
    @Source varchar(50)
	
AS
    DECLARE @bAttach bit
    SET @bAttach = 0

	If @Attachment <> ''
       SET @bAttach = 1    
 
    INSERT INTO tbMessages (SenderID,ContactID,Subject,Body,MsgDate,
                Attachment,MessageState,AttachmentFile, FlagLevel, ImportanceLevel,Source)
	VALUES 
           (@From, @To,@Subject,@Body,convert(char, getdate(), 22) ,@bAttach,0,@Attachment, 0,0,@Source)

	INSERT INTO tbSentMessages (MessageID,SenderID,ContactID,Subject,Body,MsgDate,
                Attachment,MessageState,AttachmentFile, FlagLevel, ImportanceLevel)
	VALUES 
           (@@identity,@From, @To,@Subject,@Body,convert(char, getdate(), 22) ,@bAttach,1,@Attachment, 0,0)



GO
/****** Object:  StoredProcedure [dbo].[spCreateNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateNetwork] ....
-- Description:	Creates a new network
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNetwork]
	
	@MemberID int,
    @NetworkName varchar(50),
    @Desc varchar(300),
	@Category int,
    @Type int,
    @News varchar(500),
    @Office varchar(100),
    @Email varchar(150),
	@Website varchar(100),
	@Street varchar(100),
    @City varchar(100),
    @State varchar(50),
    @Zip varchar(20)
  
   	
AS
   DECLARE @ID int
   
   INSERT INTO tbNetworks (NetworkName, Description, CategoryID, [CategoryTypeID], RecentNews, Office,email,
        Website, Street, City, state, zip, createdDate) 
    VALUES
   (@NetworkName,@Desc, @Category, @Type, @News, @Office,@Email,
        @Website, @Street, @City, @State, @zip,getdate()) 

   SET @ID = SCOPE_IDENTITY()

   INSERT INTO tbNetworkSettings (NetworkID) values (@ID)

   INSERT INTO tbNetworkMembers (NetworkID,MemberID, JoinedDate, IsOwner, IsAdmin) values (@ID, @MemberID, Getdate(), 1,1)
                                              
   SELECT  @ID as id






GO
/****** Object:  StoredProcedure [dbo].[spCreateNetworkPhoto]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNetworkPhoto
-- Description:	Creates a photo for the network
-- =============================================

CREATE PROCEDURE [dbo].[spCreateNetworkPhoto]
	@NetworkID int,
	@MemberID int,
	@title varchar(100),
    @desc varchar(200), 
	@Ext varchar(5)
    
  
AS
   INSERT INTO dbo.tbNetworkPhotos (NetworkID, MemberID, PhotoName, PhotoDesc)
   VALUES (@NetworkID, @MemberID, @Title, @Desc)
   
   UPDATE tbNetworkPhotos SET [filename] = cast (SCOPE_IDENTITY() as varchar(40)) + @Ext
   WHERE PhotoID = SCOPE_IDENTITY()
 
   SELECT  SCOPE_IDENTITY() as id




GO
/****** Object:  StoredProcedure [dbo].[spCreateNetworkPost]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNetworkPost 1, 'testing 123'
-- Description:	Creates a new post for network
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNetworkPost]
	@NetworkID int,
	@MemberID int,
    @PostMsg varchar(700)
   	
AS
  
   INSERT INTO tbNetworkPosts (NetworkID,MemberID, PostDate, Description) VALUES
         (@NetworkID, @MemberID,GetDate(),@PostMsg)
    


GO
/****** Object:  StoredProcedure [dbo].[spCreateNetworkPostComment]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNetworkPostComment 1, 6, 'testing 123'
-- Description:	Creates a new post comment for member
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNetworkPostComment]
	@NetworkID int,
	@MemberID int,
	@PostID int,
    @PostMsg varchar(500)
   	
AS
  
   INSERT INTO tbNetworkPostResponses (NetworkID,MemberID, ResponseDate, PostID, Description) VALUES
         (@NetworkID,@MemberID,GetDate(),@PostID, @PostMsg)
    




GO
/****** Object:  StoredProcedure [dbo].[spCreateNetworkRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateNetworkRequest] 
-- Description:	gets a list of networks that member belongs
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNetworkRequest]
	@MemberID int,
	@NetworkName varchar(100),
	@NetworkType varchar(100),
	@Purpose varchar(500),	
	@Status int	
AS
    INSERT INTO tbNetworkRequests (MemberID,NetworkName,NetworkType, Purpose,RequestedDate)
		VALUES (@MemberID, @NetworkName, @NetworkType, @Purpose, GetDate())









GO
/****** Object:  StoredProcedure [dbo].[spCreateNetworkVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNetworkVideo
-- Description:	Creates a Video for the network
-- =============================================

CREATE PROCEDURE [dbo].[spCreateNetworkVideo]
	@NetworkID int,
	@MemberID int,
	@title varchar(100),
    @desc varchar(200), 
	@Ext varchar(5)
    
  
AS
   INSERT INTO dbo.tbNetworkVideos (NetworkID, MemberID, VideoName, Description, viddate)
   VALUES (@NetworkID, @MemberID, @Title, @Desc, getdate())
   
   UPDATE tbNetworkVideos SET [filename] = cast (SCOPE_IDENTITY() as varchar(40)) + @Ext
   WHERE VideoID = SCOPE_IDENTITY()
 
   SELECT  SCOPE_IDENTITY() as id





GO
/****** Object:  StoredProcedure [dbo].[spCreateNewUser]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- exec spCreateNewUser 'Linda', 'Carter', 'l2carter@yahoo.com','abcd1234','male','07','19','1922',0
-- Description:	Create a new user. 
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNewUser]
	
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar(75),
	@Password varchar(50),
	@Gender varchar(50),
	@Month varchar (3),
	@Day varchar(3),
	@Year varchar(5),
    @ProfileType varchar(40),
    @MemberCode int OUTPUT 

AS

BEGIN

    DECLARE  @MemberID int   
    SET @MemberID = 0

	INSERT INTO tbMembers (Email,Password,Status) VALUES (@Email,@Password, 1)    

	SET @MemberID = @@Identity
    
    if (@MemberID <> 0)BEGIN
		
		INSERT INTO tbMemberProfile	(MemberID, FirstName, LastName,Sex,DOBMonth, DOBDay, DOBYear, CurrentStatus)
		VALUES (@MemberID, @FirstName, @LastName, @Gender,@Month,@Day,@Year, @ProfileType)

       
        INSERT INTO tbMemberProfileContactInfo
        (
         [MemberID]
         ,[Email]
         ,[ShowEmailToMembers]
         ,[OtherEmail]
         ,[Facebook]
         ,[Instagram]
         ,[CellPhone]
         ,[ShowCellPhone]
         ,[HomePhone]
         ,[ShowHomePhone]
         ,[OtherPhone]
         ,[Address]
         ,[ShowAddress]
         ,[City]
         ,[State]
         ,[Zip]
         ,[Twitter]
         ,[Website]
         ,[Neighborhood]
        ) 
        VALUES (@MemberID,'',1,'','','','',1,'',1,'','',1,'','','','','','')

		INSERT INTO tbMembersRegistered (MemberID, RegisteredDate) 
		VALUES (@MemberID, getdate())
		
		INSERT INTO tbNotificationSettings (
           MemberID,
           LG_SendMsg,
		   LG_AddAsFriend,
		   LG_ConfirmFriendShipRequest,
		   GP_InviteYouToJoin,
		   GP_MakesYouAGPAdmin,
		   GP_RepliesToYourDiscBooardPost,
		   GP_ChangesTheNameOfGroupYouBelong,
		   EV_InviteToEvent,
		   EV_DateChanged,
		   HE_RepliesToYourHelpQuest)
        VALUES 
           (@MemberID,1,1,1,1,1,1,1,1,1,1)

		INSERT INTO tbMembersPrivacySettings (	
			MemberID,		           
			[profile],
			basicInfo, 
			personalInfo,
			ContactInfo,
			Education,
			WorkInfo,
			MobilePhone, 
			OtherPhone, 
			EmailAddress,
			visibility,
			ViewProfilePicture,
			ViewFriendsList,
			viewLinkToRequestAddingYouAsFriend,
			viewLinkToSendYouMsg)
         VALUES
            (@MemberID,1,1,3,3,3,3,2,2,3,1,1,1,1,1)


		SELECT @MemberCode = MemberCodeID FROM tbMembersRegistered WHERE MemberID=@MemberID
        
		INSERT INTO tbMembersRecentActivities (memberID, Description)
              VALUES(@MemberID, @FirstName + ' ' + @LastName + ' joined LinkedGlobe on ' +  CAST(GETDATE() as varchar))
  
 
	END
    ELSE BEGIN
       SELECT @MemberCode = 0
    END

END


GO
/****** Object:  StoredProcedure [dbo].[spCreateNote]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNote 
-- Description:	Creates a link
-- =============================================

CREATE PROCEDURE [dbo].[spCreateNote]
	@MemberID int,
    @Title varchar(200),
	@NoteText Text,
	@PrivacyType int

AS
   
   INSERT INTO tbNotes (MemberID, Title, NoteText,PrivacyType, CreatedDate)
   VALUES (@MemberID,@Title, @NoteText,@PrivacyType,getDate() )
   
GO
/****** Object:  StoredProcedure [dbo].[spCreateNoteCommentPost]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateNoteCommentPost 1, 1, 'msg'
-- Description:	Creates a new post for note comment
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNoteCommentPost]
	
	@MemberID int,
    @NoteID int,
    @NotePostMsg varchar(250)
   	
AS  
   INSERT INTO dbo.tbNoteCommentPosts (NoteID, MemberID, CommentDesc, PostDate) VALUES
         (@NoteID, @MemberID, @NotePostMsg, GetDate())
    


GO
/****** Object:  StoredProcedure [dbo].[spCreateNotificationsSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateNotificationsSettings] 1
-- Description: create the initial settings for member email notifications
-- =============================================
CREATE PROCEDURE [dbo].[spCreateNotificationsSettings]  
	@MemberID int
AS

 INSERT INTO [sn].[dbo].[tbNotificationSettings]
   (MemberID)
 VALUES
   (@MemberID)
GO
/****** Object:  StoredProcedure [dbo].[spCreatePostComment]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreatePostComment 1, 6, 'testing 123'
-- Description:	Creates a new post comment for member
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePostComment]
	
	@MemberID int,
	@PostID int,
    @PostMsg varchar(500)
   	
AS
  
   INSERT INTO tbMemberPostResponses (MemberID, ResponseDate, PostID, Description) VALUES
         (@MemberID,GetDate(),@PostID, @PostMsg)
    


GO
/****** Object:  StoredProcedure [dbo].[spCreatePrivacySearchSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreatePrivacySearchSettings] 1
-- Description: create the initial settings for member privacy settins
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePrivacySearchSettings]  
	@MemberID int
AS

 INSERT INTO [sn].[dbo].[tbPrivacySettings]
   (MemberID)
 VALUES
   (@MemberID)
GO
/****** Object:  StoredProcedure [dbo].[spCreateTopic]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spCreateTopic] ....
-- Description:	Creates a group topic
-- =============================================
CREATE PROCEDURE [dbo].[spCreateTopic]
	
	@NetworkID int,
    @MemberID int,    
	@TopicName varchar(100),
    @Post varchar(250)
   	
AS
   DECLARE @ID int
   
   INSERT INTO tbNetworkDiscussionTopics (NetworkID, MemberID, TopicDesc, CreatedDate) 
    VALUES
   (@NetworkID,@MemberID, @TopicName,getdate()) 

   IF (@Post != null OR TRIM(@Post) != '') BEGIN
      SET @ID = SCOPE_IDENTITY()

       INSERT INTO dbo.tbDiscussionTopicPosts (TopicID,MemberID,PostDesc,Postdate) values (@ID, @MemberID,@Post, getdate())
    END


GO
/****** Object:  StoredProcedure [dbo].[spCreateTopicPostComment]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spCreateTopicPostComment 1, 1, 'msg'
-- Description:	Creates a new post for discussion topic
-- =============================================
CREATE PROCEDURE [dbo].[spCreateTopicPostComment]
	
	@MemberID int,
    @TopicID int,
    @PostMsg varchar(250)
   	
AS
  
   INSERT INTO dbo.tbDiscussionTopicPosts (TopicID, MemberID, PostDesc, PostDate) VALUES
         (@TopicID, @MemberID, @PostMsg, GetDate())
    

GO
/****** Object:  StoredProcedure [dbo].[spCreateVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateVideo]
	@MemberID int,
	@VidName varchar(200),
    @VidDesc varchar(500),
    @VidCat	int,
	@Ext varchar(250)
  
AS
   INSERT INTO tbVideos (memberID, VideoName, Description, VidCategory, vidDate, [FileName])
   VALUES (@MemberID, @VidName, @VidDesc,@VidCat, getDate(),@ext)
   
   --UPDATE tbVideos SET [filename] = cast (SCOPE_IDENTITY() as varchar(20)) + @Ext
   --WHERE videoID = SCOPE_IDENTITY()
 
   SELECT  SCOPE_IDENTITY() as id


GO
/****** Object:  StoredProcedure [dbo].[spDactivateMemberFromNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spDactivateMemberFromNetwork 1, 'Requests'
-- Description:	deactivate 
-- =============================================
CREATE PROCEDURE [dbo].[spDactivateMemberFromNetwork]
	
	@MemberID int,
   	@NetworkID int
AS 
  UPDATE tbNetworkMembers set status = 2 where NetworkID = @NetworkID and MemberID =@MemberID
	







GO
/****** Object:  StoredProcedure [dbo].[spDeleteContact]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spDeleteFriend 1,1
-- Description:	del friend
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteContact]
	
    @MemberID int,
	@ContactID int
   	
AS 
   DELETE FROM dbo.tbContacts WHERE MemberID = @ContactID and ContactID = @MemberID
   DELETE FROM dbo.tbContacts WHERE MemberID = @MemberID and ContactID = @ContactID













GO
/****** Object:  StoredProcedure [dbo].[spDeleteInvite]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteInvite]
	
  @MemberID int,
  @NetworkID int,
  @Email varchar(200)
   	
AS
	if (@Email = '')
    begin
		DELETE FROM tbNetworkMemberInvites  where MemberID = @MemberID and NetworkID = networkID                      
    end
    else begin                
        DELETE FROM tbNetworkMemberInvites where Email = @Email 					
    end
   
    DELETE FROM tbNetworkMemberRequests WHERE  RequestorID =@MemberID and NetworkID=@NetworkID

GO
/****** Object:  StoredProcedure [dbo].[spDeleteLink]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spDeleteLink] 1, 2 
-- Description:	removes a link
-- =============================================

CREATE PROCEDURE [dbo].[spDeleteLink]
	@MemberID int,
    @LinkID int
  
AS
	DELETE FROM tbLinks WHERE linkID  = @LinkID and OwnerID = @MemberID
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLoggedInUser]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spLogged[spDeleteLoggedInUser]InUser] 1
-- Description:	delete Log in user
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteLoggedInUser]
	@UserID int  
AS
	DELETE from tbLoggedInUser WHERE UserID = @UserID
        
GO
/****** Object:  StoredProcedure [dbo].[spDeleteMessage]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spDeleteMessage] 6
-- Description:	deletes the given message id
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteMessage]	
	
    @MsgID int
   	
AS
   INSERT INTO tbDeletedMessages
      SELECT * FROM tbMessages WHERE MessageID=@MsgID

   DELETE FROM tbMessages WHERE MessageID = @MsgID









GO
/****** Object:  StoredProcedure [dbo].[spDeleteMoveMessage]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spDeleteMessage] 6
-- Description:	deletes and move the given message id
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteMoveMessage]	
	
    @MsgID int,
	@Movetype int,
	@Folder int
   	
AS

if (@folder = 0)  begin -- inbox

   IF (@Movetype = 0) BEGIN  -- deleted
      INSERT INTO tbMessagesDeleted SELECT * FROM tbMessages WHERE MessageID=@MsgID
      DELETE FROM tbMessages WHERE MessageID = @MsgID
   END

   IF (@Movetype = 1) BEGIN -- junk
      INSERT INTO tbMessagesJunk SELECT * FROM tbMessages WHERE MessageID=@MsgID
      DELETE FROM tbMessages WHERE MessageID = @MsgID
   END
  
   IF (@Movetype = 2) BEGIN -- sent
      INSERT INTO tbMessagesSent ([SenderID]
           ,[ContactID]
           ,[Subject]
           ,[Body]
           ,[MsgDate]
           ,[Attachment]
           ,[MessageState]
           ,[FlagLevel]
           ,[ImportanceLevel]
           ,[AttachmentFile]
           ,[Source]
           ,[OriginalMsg])


 SELECT [SenderID]
           ,[ContactID]
           ,[Subject]
           ,[Body]
           ,[MsgDate]
           ,[Attachment]
           ,[MessageState]
           ,[FlagLevel]
           ,[ImportanceLevel]
           ,[AttachmentFile]
           ,[Source]
           ,[OriginalMsg] FROM tbMessages WHERE MessageID=@MsgID
      DELETE FROM tbMessages WHERE MessageID = @MsgID
   END
  
end 

else if (@folder = 1) begin -- junk

   IF (@Movetype = 0) BEGIN  -- deleted
      INSERT INTO tbMessagesDeleted SELECT * FROM tbJunkMessages WHERE MessageID=@MsgID
      DELETE FROM tbJunkMessages WHERE MessageID = @MsgID
   END
   else IF (@Movetype = 2) BEGIN -- sent
      INSERT INTO tbMessagesSent SELECT * FROM tbJunkMessages WHERE MessageID=@MsgID
      DELETE FROM tbMessagesDeleted WHERE MessageID = @MsgID
   end
   else begin

      Declare @senderid int
      declare @contactid int
      declare @subject varchar(200)
      declare @body varchar(300)
      declare @msgdate datetime
      declare @attachment bit
      declare @messagestate int
      declare @flaglevel int
      declare @importanceLevel int
      declare @attachmentfile varchar(150)
      
	  SELECT @senderid=senderid,
             @contactid=contactid,
			 @subject=subject,
			 @body = body,
			 @msgdate = msgdate,
			 @attachment=attachment, 
			 @messagestate= messagestate,
             @flaglevel=flaglevel,
             @importanceLevel=importanceLevel,
			 @attachmentfile=attachmentfile
      FROM 
             tbMessagesDeleted WHERE MessageID=@MsgID

      INSERT tbMessages (senderid,contactid,subject,body,msgdate,attachment, messagestate,flaglevel,
          importanceLevel,attachmentfile) 
      VALUES       
         (@senderid,@contactid,@subject,@body,@msgdate,@attachment, @messagestate,@flaglevel,
          @importanceLevel,@attachmentfile)
      
      DELETE FROM tbMessagesDeleted WHERE MessageID = @MsgID
   END

end
--
else if (@folder = 2) begin -- sent
    
    IF (@Movetype = 0) BEGIN  -- deleted 
	    --INSERT INTO tbDeletedMessages SELECT * FROM tbSentMessages WHERE MessageID=@MsgID
        DELETE FROM tbMessagesSent WHERE MessageID = @MsgID
    END
    
end 

else if (@folder = 3) begin -- deleted

    IF (@Movetype = 0) BEGIN  -- deleted 	   
        DELETE FROM tbMessagesDeleted WHERE MessageID = @MsgID
    END

end 










GO
/****** Object:  StoredProcedure [dbo].[spDeleteNote]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spDeleteNote 1,3
-- Description:	delete a note
-- =============================================

CREATE PROCEDURE [dbo].[spDeleteNote]
	@MemberID int,
    @NoteID int
AS   
   DELETE  tbNotes  
   WHERE MemberID =@MemberID and NoteID = @NoteID
   
GO
/****** Object:  StoredProcedure [dbo].[spEventSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spEventSearchResults 1, 'night'
-- Description:	gets all search base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[spEventSearchResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 

 SELECT  E.eventid  as EntityID, isnull(eventimg,'default.png') as PicturePath, planningwhat  as EntityName,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
   Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
   (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as Params   
   ,startdate, enddate,
   '' as LabelText, '' as CityState, '' as Description, '01/01/1999' as CreatedDate, '' as memberCount,
	'' as Email,
    '' as NameAndID , 
    '' as EventParams,
	'' as ParamsAV, 
    case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
FROM tbEvents E left join tbEventInvites I on E.EventID = I.EventID  
WHERE e.PlanningWhat like '%' + @SearchText + '%'   -- order by StartDate desc

--
--	SELECT e.EventID as EntityID, e.PlanningWhat as EntityName, ISNULL([EventImg],'default.png') as PicturePath,    
--	'' as LabelText, 
--	'' as Email,
--    '' as NameAndID , 
--    '' as Params,
--	,'' as ParamsAV, City + ', ' + State as CityState, MoreInfo as description, '' as MemberCount, '01/01/1900' as CreatedDate 	        
--	FROM tbEvents e
--	WHERE 
--        e.PlanningWhat like '%' + @SearchText + '%' 
--
--
--
--
--


GO
/****** Object:  StoredProcedure [dbo].[spGetAds]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2020
-- example: exec spGetAds 'SiteGuide', 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spGetAds]
	
	@AdType varchar(50)
   	
AS
   SELECT * from tbAds 
		  WHERE [Type] = @AdType 
GO
/****** Object:  StoredProcedure [dbo].[spGetAlbumInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetAlbumInfo 1
-- Description:	get album info
-- =============================================
CREATE PROCEDURE [dbo].[spGetAlbumInfo]
	
	@AlbumID int
   	
AS
   SELECT * FROM tbAlbums WHERE AlbumID = @AlbumID and Removed <> 1
GO
/****** Object:  StoredProcedure [dbo].[spGetAlbumsPhotos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAlbumsPhotos]
	
	@AlbumID int
   	
AS
   declare @temp table (CountID int identity(1,1) , photoID int, [filename] varchar(100), PhotoDesc varchar(100), PhotoName varchar(100), memberID int, MemberName varchar(70)) 
  
if (@AlbumID <> 0) begin
insert @temp(PhotoID, [Filename], [PhotoDesc], [PhotoName],memberID, memberName)
   SELECT PhotoID, [FileName],PhotoDesc, PhotoName, 0 as memberID, '' as MemberName FROM tbAlbumPhotos
  
 WHERE AlbumID = @AlbumID and removed <> 1 order by photoID asc
end 
else begin
   insert @temp(PhotoID, [Filename], [PhotoDesc], [PhotoName],memberID, memberName)
   SELECT PhotoID, [FileName],PhotoDesc, PhotoName, 0 as memberID, '' as MemberName FROM tbAlbumPhotos
  
 WHERE removed <> 1 order by photoID asc
end 
SELECT * from @temp
GO
/****** Object:  StoredProcedure [dbo].[spGetAllMembersPhotoCount]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetAllMembersPhotoCount] 1
-- Description:	gets total count of pictures for member
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllMembersPhotoCount]
	@MemberID int
AS
select count (photoID) from tbalbumphotos where 
     albumid in (select albumid from tbalbums where memberid = @MemberID)
GO
/****** Object:  StoredProcedure [dbo].[spGetBlockedMember]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetBlockedMember] 1
-- Description:	get a block member
-- =============================================
CREATE PROCEDURE [dbo].[spGetBlockedMember]
	@MemberID int
AS
	SELECT b.MemberID, BlockMemberID,BlockMemberName, FirstName,lastName,isnull([PicturePath],'default.png') as [PicturePath] FROM tbMembersBlocked b left join tbMemberProfile m on b.BlockMemberID = m.memberID WHERE b.MemberID = @MemberID 
  




GO
/****** Object:  StoredProcedure [dbo].[spGetChatInvite]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetChatInvite] 1
-- Description:	get chat invite
-- =============================================
CREATE PROCEDURE [dbo].[spGetChatInvite]
	
	@UserID int
   	
AS


select top 1 * from tbChatMessages M join tbChatRoom C
   ON m.roomid = c.roomid
where c.Responded <> 1 and toUserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[spGetChatMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetChatMessages ...
-- Description:	insert a chat message
-- =============================================
CREATE PROCEDURE [dbo].[spGetChatMessages]
	
	@RoomID int 
AS
	SELECT top 20 * FROM tbChatMessages
          WHERE RoomID = @RoomID order by [TimeStamp] DESC

         
GO
/****** Object:  StoredProcedure [dbo].[spGetCodeAndNameForgotPwd]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	get code and member firstname for forgot pwd proc
-- =============================================
CREATE PROCEDURE [dbo].[spGetCodeAndNameForgotPwd]
	
	@Email varchar(100)
  	
AS

BEGIN

   DECLARE @MemberID int
   DECLARE @FirstName varchar(50)
   SET @MemberID=0
  
   SELECT @MemberID = M.MemberID, @FirstName = FirstName FROM tbMembers M join tbMemberProfile P on M.MemberID = P.MemberID WHERE  EMail = @Email

   IF (@MemberID <> 0) BEGIN
     INSERT INTO tbForgotPwdCodes (Email,CodeDate, Status) values (@Email,getdate(),0)
     SELECT @@Identity as CodeID,@FirstName as FirstName 		      
   END 
   ELSE BEGIN
    
     SELECT 0 as CodeID, '' as firstname FROM tbMembers where email =@Email 
    
   END 
   
END



GO
/****** Object:  StoredProcedure [dbo].[spGetColleges]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetColleges] 'AL', ''
-- Description:	gets a member's events list
-- =============================================
CREATE PROCEDURE [dbo].[spGetColleges]
	
    @State varchar(25),
	@SchoolName varchar(50)
   	
AS
   if (@SchoolName <> '') begin
		SELECT [name] AS schoolname, address as StreetName, '' as City, '' as State, '' as Zip,
		  Replace(Replace(Replace(Replace(substring(phone,1,14),'(',''),')',''),' ',''), '-','') as Phone,
		  SchoolID as LGID, [type], AwardsOffered,
          CampusSetting, CampusHousing,StudentPopulation,UnderGradStudents, website, ImageFile
		FROM 
			 dbo.tbColleges 
		WHERE 
			 State=@State and 
			 [name] like '%' + @SchoolName + '%'
   end
   else begin
       SELECT [name] AS schoolname, address as StreetName, '' as City, '' as State, '' as Zip,
		  Replace(Replace(Replace(Replace(substring(phone,1,14),'(',''),')',''),' ',''), '-','') as Phone,
		  SchoolID as LGID, [type], AwardsOffered,
          CampusSetting, CampusHousing,StudentPopulation,UnderGradStudents, website, ImageFile		
		FROM 
			 dbo.tbColleges 
		WHERE 
			 State=@State 			
   end 


      

GO
/****** Object:  StoredProcedure [dbo].[spGetCollegesByID]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCollegesByID]
	
    @InstID int	
AS
   		SELECT [name] AS schoolname, address as StreetName, '' as City, State, '' as Zip,
		  Replace(Replace(Replace(Replace(substring(phone,1,14),'(',''),')',''),' ',''), '-','') as Phone,
		  SchoolID as LGID, [type], AwardsOffered,
          CampusSetting, CampusHousing,StudentPopulation,UnderGradStudents, website, ImageFile 
		FROM 
			 dbo.tbColleges 
		WHERE 
			 SchoolID=@InstID
GO
/****** Object:  StoredProcedure [dbo].[spGetCompaniesOfInterest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetCompaniesOfInterest] 1
-- Description:	get companies interest for member id
-- =============================================
CREATE PROCEDURE [dbo].[spGetCompaniesOfInterest]
	
	@MemberID int	
AS
	Select *,  isnull(ImageFile,'default.png') as FileImage from tbCompanies C
	Inner join tbCompaniesOfInterest I on
		 C.ID = I.CompanyID
	WHERE 
		 MemberID =@MemberID order by [name] asc


GO
/****** Object:  StoredProcedure [dbo].[spGetCompanyInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCompanyInfo]
      
     @Sector varchar(80),   
	 @Industry varchar(150),
     @CompanyName varchar(150)             
AS

BEGIN
   
    if len(@CompanyName) <> 0 begin
	
		SELECT [Symbol]
      ,[Name]
      ,[IPOYear]
      ,[Sector]
      ,[Industry]
      ,[summaryQuote]
      ,REPLACE (REPLACE(dbo.RemoveSpecialChars([Description]),'"','`'),'''','`') as [Description]
      ,[website]
      ,[ID]
      ,[Email]
      ,[ImageFile], isnull(ImageFile,'default.png') as FileImage from tbCompanies 
			WHERE Sector = (CASE WHEN len(@Sector) = 0 THEN Sector ELSE @Sector END)
			AND Industry = (CASE WHEN len(@Industry) =0 THEN Industry ELSE @Industry END)
			AND [Name] LIKE '%' + @CompanyName + '%'
	end 
	
	else begin

			SELECT [Symbol]
      ,[Name]
      ,[IPOYear]
      ,[Sector]
      ,[Industry]
      ,[summaryQuote]
      ,REPLACE (REPLACE(dbo.RemoveSpecialChars([Description]),'"','`'),'''','`') as [Description]
      ,[website]
      ,[ID]
      ,[Email]
      ,[ImageFile],  isnull(ImageFile,'default.png') as FileImage from tbCompanies 
			WHERE Sector = (CASE WHEN len(@Sector) = 0 THEN Sector ELSE @Sector END)
			AND Industry = (CASE WHEN len(@Industry) =0 THEN Industry ELSE @Industry END)				
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGetContactsByCategory]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetContactsByCategory] 1, 1 (categoryid: 1 -city, 2-college, 3-high school
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetContactsByCategory]
	
	@MemberID int,
    @CategoryID int
   	
AS

IF (@CategoryID = 1) BEGIN -- city

   	SELECT City	AS Category, e.City + ' (' + cast(count(e.City) as varchar) + ')' as CategoryDesc 
    FROM tbContacts f left join dbo.tbMemberProfileContactInfo e on f.Contactid= e.memberid 
	WHERE f.memberid = @MemberID  and e.City is not null 
    GROUP BY City

END

ELSE IF (@CategoryID = 2) BEGIN

   	SELECT College1	AS Category, e.College1 + ' (' + cast(count(e.College1) as varchar) + ')' as CategoryDesc 
    FROM tbContacts f left join dbo.tbMemberProfileEducation e on f.Contactid= e.memberid 
	WHERE f.memberid = @MemberID  and e.College1 is not null 
    GROUP BY College1

END

ELSE BEGIN -- high school

	SELECT e.HighSchool as Category, e.highschool + ' (' + cast(count(e.highschool) as varchar) + ')' as CategoryDesc 
    FROM tbContacts f left join dbo.tbMemberProfileEducation e on f.Contactid= e.memberid 
	WHERE f.memberid = @MemberID  and e.highschool is not null 
    GROUP BY highschool

END











GO
/****** Object:  StoredProcedure [dbo].[spGetContactsLinks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetContactsLinks] 1
-- Description:	gets a member's links list
-- =============================================
CREATE PROCEDURE [dbo].[spGetContactsLinks]
	
    @MemberID int
   	
AS

  SELECT t.firstname + ' ' + t.lastname  as MemberName, t.FirstName, t.MemberID, 			
     isnull(picturepath,'default.png') as picturepath, l.*
   
  FROM 
      tbmemberProfile t JOIN  tbLinks L on t.memberiD = l.OwnerID 
      JOIN tbContacts f on l.ownerid = f.contactid
  WHERE f.MemberID = @MemberID  order by CreatedDate desc

















GO
/****** Object:  StoredProcedure [dbo].[spGetContactsList]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetContactsList 1,6
-- Description:	get contact list for member id where there isn't an event invite
-- =============================================
CREATE PROCEDURE [dbo].[spGetContactsList]
    @MemberID int,
   	@EventID int
AS
    DECLARE @tempFriends table (ContactID int)
    
    INSERT @TempFriends (ContactID) 
       SELECT ContactID FROM tbContacts WHERE memberiD = @MemberID  and ContactID <> @memberID

   SELECT distinct M.MemberID,FirstName + ' ' + LastName as MemberName, isnull(picturepath,'default.png') as ImageName 
      FROM tbmemberProfile M Join @TempFriends F on m.memberId=f.ContactID 
       WHERE M.MemberID NOT IN (select memberid from tbEventInvites where eventid = @eventid)




GO
/****** Object:  StoredProcedure [dbo].[spGetContactsNotes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetContactsNotes] 1
-- Description:	gets a member's Notes list
-- =============================================
CREATE PROCEDURE [dbo].[spGetContactsNotes]
	
    @MemberID int
   	
AS

  SELECT t.firstname + ' ' + t.lastname  as MemberName, t.FirstName,  			
     isnull(picturepath,'default.png') as picturepath, l.*
   
  FROM 
      tbmemberProfile t JOIN  tbNotes L on t.memberiD = l.MemberiD 
      JOIN tbContacts f on l.MemberID = f.contactid
  WHERE f.MemberID = @MemberID  
  and PrivacyType = 0 
  ORDER BY CreatedDate desc

select * from tbnotes



















GO
/****** Object:  StoredProcedure [dbo].[spGetContactSuggestions]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetContactSuggestions 1
-- Description:	get list of suggested contacts for member
-- =============================================
CREATE PROCEDURE [dbo].[spGetContactSuggestions]
   	@MemberID int
AS

SELECT 

  tb2.MemberID as FriendID,
  t.firstname + ' ' + t.lastname as FriendName,
  isnull(picturepath,'default.png') as picturepath,
  t.firstname as firstname
 
  FROM (		
	SELECT * from (
		SELECT M.MemberID FROM tbMembers M
		join tbSuggestions S ON M.Email = S.ContactEmail
		--join tbFriends F on f.friendid <> m.memberid
		WHERE s.memberID = @MemberID
	) AS tb1
	
    EXCEPT
 
	SELECT ContactID FROM tbContacts f WHERE f.memberid =@MemberID
   ) as tb2
   inner join tbmemberProfile t on t.memberid = tb2.memberID
   


GO
/****** Object:  StoredProcedure [dbo].[spGetDays]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetDays
-- Description: get list of days 
-- =============================================
CREATE PROCEDURE [dbo].[spGetDays]
	
AS
 
   SELECT  * from tbDays order by [day]








GO
/****** Object:  StoredProcedure [dbo].[spGetEntityBySearchType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetEntityBySearchType] 1, 't','network'
-- Description:	gets contacts base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[spGetEntityBySearchType]
	
	@MemberID int,	
   	@SearchText varchar(100),
	@SearchType varchar(20)
   
AS 

 IF (@SearchType = 'contact') BEGIN
	SELECT f.ContactID as EntityID, p.FirstName + ' ' + p.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath, firstname, lastname,
    CASE When c.city is null then '' 
		 When c.state is null then c.city
		 else c.city + ', ' + c.state
	END as CityState, f.ContactID as id, p.FirstName + ' ' + p.LastName as [name]
	FROM tbContacts f JOIN tbMemberProfile p on f.Contactid = p.memberid
         left join tbMemberProfileContactInfo C on C.memberID = f.ContactID    
	WHERE 
            f.memberID = @MemberID
        AND 
			(p.lastname like @SearchText + '%'  or p.firstname like @SearchText + '%' )
 END

 ELSE IF (@SearchType = 'people') BEGIN
    SELECT f.MemberID as EntityID, p.FirstName + ' ' + p.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath, firstname, lastname, 
     CASE When c.city is null then '' 
		 When c.state is null then c.city
		 else c.city + ', ' + c.state
	END as CityState, f.MemberID as id, p.FirstName + ' ' + p.LastName as [name]
	FROM tbMembers f JOIN tbMemberProfile p on f.MemberID = p.memberid
        join tbMemberProfileContactInfo C on C.memberID = f.memberid 
	WHERE            
			(p.lastname like @SearchText + '%' ) or (p.firstname like @SearchText + '%') or
            (p.firstname + ' ' + p.lastname like  @SearchText + '%' )
 END

 ELSE IF (@SearchType = 'network') begin

   	SELECT c.NetworkID as EntityID, c.NetworkName as EntityName, ISNULL([Image],'default.png') as PicturePath, '' as firstname, '' as lastname,
    CASE When c.city is null then '' 
		 When c.state is null then c.city
		 else c.city + ', ' + c.state
	END as CityState, c.NetworkID as id, c.NetworkName as [name]-- isnull(CONVERT(varchar(10), CreatedDate, 101),'') as CreatedDate
	FROM tbNetworks c
	WHERE 
        c.NetworkName like @SearchText + '%' 

 END
 
 ELSE IF (@SearchType = 'event') BEGIN

		SELECT E.eventid  as EntityID, isnull(eventimg,'default.png') as PicturePath, planningwhat  as EntityName, '' as firstname, '' as lastname,
			CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime  
            + ' - ' + location AS CityState , e.eventid as id, planningwhat as [name]
		  
		FROM tbEvents E -- left join tbEventInvites I on E.EventID = I.EventID  
		WHERE e.PlanningWhat like '%' + @SearchText + '%'   -- order by StartDate desc


 END

-- ELSE IF (@SearchType = 'network') BEGIN
--    SELECT f.friendID as EntityID, p.FirstName + ' ' + p.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath, firstname, lastname
--	FROM tbMembers f JOIN tbMemberProfile p on f.MemberID = p.memberid
--        
--	WHERE 
--            f.memberID = @MemberID
--        AND 
--			(p.lastname like @SearchText + '%'  or p.firstname like @SearchText + '%' )
-- END

-- ELSE IF (@SearchType = 'event') BEGIN
--    SELECT f.friendID as EntityID, p.FirstName + ' ' + p.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath, firstname, lastname
--	FROM tbMembers f JOIN tbMemberProfile p on f.MemberID = p.memberid
--        
--	WHERE 
--            f.memberID = @MemberID
--        AND 
--			(p.lastname like @SearchText + '%'  or p.firstname like @SearchText + '%' )
-- END







GO
/****** Object:  StoredProcedure [dbo].[spGetEventGuestList]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetEventGuestList 6
-- Description:	get event guest list
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventGuestList]
   	@EventID int
AS
   SELECT InviteID, E.MemberID,
   CASE when email is null OR email = '' then 
      FirstName + ' ' + LastName
   ELSE email end as MemberName,
   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
   WHERE EventID = @EventID



GO
/****** Object:  StoredProcedure [dbo].[spGetEventGuestListByType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetEventGuestListByType 6, 'All'
-- Description:	get event guest list
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventGuestListByType]
   	@EventID int,
    @Type varchar(50)
AS
   IF (@Type = 'Attending') BEGIN
	   SELECT InviteID, E.MemberID,
	   CASE when email is null OR email = '' then 
		  FirstName + ' ' + LastName
	   ELSE email end as MemberName,
	   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
	   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
	   WHERE EventID = @EventID and RSVPStatus = 'Attending'   
   END
  
   ELSE IF (@Type = 'MayAttend') BEGIN
	   SELECT InviteID, E.MemberID,
	   CASE when email is null OR email = '' then 
		  FirstName + ' ' + LastName
	   ELSE email end as MemberName,
	   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
	   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
	   WHERE EventID = @EventID and RSVPStatus = 'May Attend'   
   END
   
   ELSE IF (@Type = 'NotAttending') BEGIN
	   SELECT InviteID, E.MemberID,
	   CASE when email is null OR email = '' then 
		  FirstName + ' ' + LastName
	   ELSE email end as MemberName,
	   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
	   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
	   WHERE EventID = @EventID and RSVPStatus = 'Not Attending'   
   END
   
   ELSE IF (@Type = 'NotYetReplied') BEGIN
	   SELECT InviteID, E.MemberID,
	   CASE when email is null OR email = '' then 
		  FirstName + ' ' + LastName
	   ELSE email end as MemberName,
	   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
	   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
	   WHERE EventID = @EventID and RSVPStatus = 'Not Yet Replied'   
   END

   ELSE BEGIN
	   SELECT InviteID, E.MemberID,
	   CASE when email is null OR email = '' then 
		  FirstName + ' ' + LastName
	   ELSE email end as MemberName,
	   case when e.email = '' then null else e.Email end as email, RSVPStatus, isnull(picturepath,'default.png') as ImageName 
	   FROM tbEventInvites E join tbmemberProfile M on E.MemberID = M.MemberID
	   WHERE EventID = @EventID
   END 




GO
/****** Object:  StoredProcedure [dbo].[spGetEventInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetEventInfo 1
-- Description:	get event info
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventInfo]
   	@EventID int
AS
   SELECT I.InviteID, I.Email, I.RSVPStatus
      ,e.EventID, null as eventID1
      ,e.[NetworkID]
      ,e.[MemberID]
      ,e.[StartDate]
      ,e.[StartTime]
      ,e.[StartEndTime]
      ,e.[EndDate]
      ,e.[EndTime]
      ,e.[EndEndTime]
      ,e.[PlanningWhat]
      ,e.[Location]
      ,e.[Street]
      ,e.[City]
      ,e.[State]
      ,e.[Zip]
      ,e.[MoreInfo]
      ,e.[InviteAllGroupMembers]
      ,e.[AnyoneCanViewRSVP]
      ,e.[ShowGuestList]
      ,e.[EventImg]
      ,e.[CreatedDate]
, m.firstname + ' ' + m.lastname as MemberName, g.Networkname as NetworkName FROM tbEvents E left join tbEventInvites I on E.EventiD = I.EventiD
   left join tbMemberProfile M on E.MemberID = M.MemberID 
   left join tbNetworks G on E.NetworkID =  G.NetworkID
   WHERE E.EventID = @EventID





GO
/****** Object:  StoredProcedure [dbo].[spGetEventPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetEventPosts 1
-- Description:	gets a event posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventPosts]
	
	@EventID int
   	
AS

	SELECT PostID, Title, Description, PostDate, AttachFile, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
		m.FirstName + ' ' + m.LastName AS MemberName, m.firstname  
		FROM tbEventPosts P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.EventID =@EventID
			order by postdate desc



GO
/****** Object:  StoredProcedure [dbo].[spGetEventTimes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetEventTimes
-- Description:	get event times
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventTimes]
   	
AS
   SELECT Description FROM tbEventTimes order by TimeID

GO
/****** Object:  StoredProcedure [dbo].[spGetFollowedMembers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date:3/2022
-- example: exec spGetFollowedMembers 1
-- Description:	gets a member's followiing list
-- =============================================
CREATE PROCEDURE [dbo].[spGetFollowedMembers]
	
	@MemberID int
AS
   Select p.FirstName + ' ' + p.LastName as FriendName,
          p.FirstName, '' as [Location],
          isnull(p.Picturepath,'default.png') as Picturepath,
          '' as ShowType,
          p.CurrentStatus as [Status],
          p.TitleDesc,
          convert(varchar(10),m.FollowingMemberId) as ConnectionID, 
          '' as params, '' as paramsav, '' as email, '' as labelText, '' as NameAndID
          from tbMemberFollowing m inner join tbMemberProfile p
       On m.FollowingMemberId = p.MemberID
       WHERE m.memberID = @MemberID
       

GO
/****** Object:  StoredProcedure [dbo].[spGetInterestingCompanies]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetInterestingCompanies] 1
-- Description:	get companies interest for member id
-- =============================================
CREATE PROCEDURE [dbo].[spGetInterestingCompanies]
	
	@MemberID int	
AS
	Select c.*, isnull(ImageFile,'default.png') as FileImage from tbCompanies C
	   Inner join tbMemberProfile M on c.sector = m.sector or c.industry = m.industry 	                            	 
	WHERE 
		 M.MemberID =@MemberID  
         and c.id not in (select i.companyid from tbCompaniesOfInterest i where i.memberid=@memberid)
     order by name asc


GO
/****** Object:  StoredProcedure [dbo].[spGetInterests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetInterests]
-- Description: get list of member interest 
-- =============================================
CREATE PROCEDURE [dbo].[spGetInterests]
	
AS
 
   SELECT  * from tbInterests order by InterestDesc









GO
/****** Object:  StoredProcedure [dbo].[spGetLikeSchools]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetLikeSchools] 1
-- Description:	get member school listing
-- =============================================

CREATE PROCEDURE [dbo].[spGetLikeSchools]	
	@MemberID int   	
AS
    SET FMTONLY OFF
    CREATE TABLE #sqltemp (id int IDENTITY(1, 1) , schoolLikeID int, schoolid int, MemberId int,  SchoolType varchar(50))
	CREATE TABLE #sqlTempResult (LGID int, SchoolName Varchar(90),StreetName varchar(100),
                                City varchar(100), State varchar(100), Zip varchar(100),  phone varchar(30), ImageFile varchar(90), InstType varchar(50))
	
    INSERT INTO #sqltemp select * from tbSchoolsILike where memberid =@MemberID
   
    DECLARE @counter int 
    DECLARE @maxCnt int 
    SET @counter = 1
    SET @maxCnt = (SELECT COUNT(*) FROM #sqltemp)
    WHILE (@counter <= @maxCnt)
    BEGIN
		  DECLARE @SchoolID int
          DECLARE @SchoolType varchar (30)
		  SELECT @SchoolID = SchoolID, @SchoolType=SchoolType FROM #sqltemp where id= @counter
		  
		  IF @SchoolType='public' 
             INSERT INTO #sqlTempResult(lgid, schoolname,streetname,city, state, zip, phone,ImageFile,InstType) 			   
                 SELECT LGID,SchoolName,  StreetName + ', ' + City + ', ' + State + ' ' + Zip as StreetName,City, State,Zip, Phone, 'default.png' as ImageFile, @SchoolType  from tbPublicSchools where lgid= @SchoolID         
          ELSE IF @SchoolType='private' 
             INSERT INTO #sqlTempResult(lgid, schoolname,streetname,city, state, zip, phone,ImageFile, InstType) 			   
                 SELECT LGID,SchoolName,StreetName + ', ' + City + ', ' + State + ' ' + Zip as StreetName,City, State,Zip, Phone, 'default.png' as ImageFile, @SchoolType  from tbPrivateSchools where lgid= @SchoolID         		  
		  ELSE IF @SchoolType='colleges' 
             INSERT INTO #sqlTempResult(lgid, schoolname,streetname,city, state, zip, phone,ImageFile,InstType) 			   
                 SELECT SchoolID,[Name],Address, '' as City, '' as State,'' as Zip, Phone, ImageFile, @SchoolType  from tbColleges where schoolid= @SchoolID         		  
	       
          SET @counter = @counter + 1
    END
 
Select * from  #sqlTempResult order by schoolname asc
   
--drop table sqltemp
--drop table sqlTempResult

GO
/****** Object:  StoredProcedure [dbo].[spGetLoggedInUsers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetLoggedInUsers] 1
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetLoggedInUsers]
	
	@MemberID int
AS 
	SELECT 
		(select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.contactid) as FriendName,
		(select t.firstname  from tbmemberProfile t where t.memberid = m.contactid) as firstname,
		(select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.contactid) as Location,
	    
		(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.contactid) as PicturePath,
		m.contactid 
	         
	FROM 
			tbMemberProfile f join tbContacts m on m.memberid = f.memberid
			join tbLoggedInUser l on m.contactid = l.UserID
	WHERE 
		f.memberid =@MemberID and m.contactid <> @MemberID 
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberAlbums]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--isnull(picturepath,'default.png')




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberAlbums 1
-- Description:	gets a member album's list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberAlbums]
	
	@MemberID int
   	
as
  
   SELECT AlbumID, AlbumName, CreatedDate, Description, 
   CAST(albumid AS varchar(20)) +  ',''' + albumName + ''',''' + Description + ''',''' + CAST(PrivacySetting AS varchar(20)) + '''' as AlbumParams,
   --'''' + CAST(albumid AS varchar(20)) +  '|' + albumName + '|' + Description + '|' + CAST(PrivacySetting AS varchar(20)) + ''''  as AlbumParams,   
     case
       (SELECT cast (count(photoID) as varchar(20)) as ct FROM tbAlbumPhotos WHERE AlbumID = A.AlbumID and Removed <> 1)
     when 0 then 'No Photos' 
     when 1 then '1 Photo'
     else (SELECT cast (count(photoID) as varchar(20)) as ct FROM tbAlbumPhotos WHERE AlbumID = A.AlbumID and Removed <> 1) + ' Photos'
     end

 as PhotoCount, 

       isnull((SELECT top 1 [FileName]FROM tbAlbumPhotos WHERE AlbumID = A.AlbumID), 'default.png')  as [FileName] --into #tmp 
FROM tbAlbums A WHERE MemberID = @MemberID and a.Removed <> 1 order by CreatedDate desc

--select AlbumID, AlbumName, CreatedDate, Description,  case Photocount when 0 then 'No Photos' when 1 then '1 Photo'  else PhotoCount + ' Photos' end as photocount , isnull([filename],'default.png') as [FileName], AlbumParams from #tmp 
--   order by CreatedDate desc

--drop table #tmp










GO
/****** Object:  StoredProcedure [dbo].[spGetMemberAlbumsV2]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberAlbumsV2] 1
-- Description:	gets a member album's list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberAlbumsV2]
	
	@MemberID int
   	
AS
  
   SELECT AlbumID, AlbumName, CreatedDate, Description, CAST(albumid AS varchar(20)) +  ',''' + albumName + ''',''' + Description + ''',''' + CAST(PrivacySetting AS varchar(20)) + '''' as AlbumParams,
       (SELECT cast (count(photoID) as varchar(20)) FROM tbAlbumPhotos WHERE AlbumID = A.AlbumID and Removed <> 1) as PhotoCount, 
       (SELECT top 1 [FileName]FROM tbAlbumPhotos WHERE AlbumID = A.AlbumID)  as [FileName] into #tmp FROM tbAlbums A WHERE MemberID = @MemberID and a.Removed <> 1

select AlbumID, AlbumName, CreatedDate, Description,  case Photocount when 0 then 'No Photos' when 1 then '1 Photo'  else PhotoCount + ' Photos' end as photocount , isnull([filename],'default.png') as [FileName], AlbumParams from #tmp 
   order by CreatedDate desc
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberBrowsedContacts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberBrowsedContacts] 1, 1, ''  -- 1 city ,2 college, 3 HS
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberBrowsedContacts]
	
	@MemberID int,
    @CategoryID int,
   	@SubCategory varchar(50)
AS 
	IF (@CategoryID = 1) BEGIN
   
		SELECT 
  
			(select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.Contactid) as FriendName,
			(select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.Contactid) as Location,
		    
			(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.Contactid) as PicturePath,
			m.Contactid, f.TitleDesc
		         
		FROM 
				tbMemberProfile f join tbContacts m on m.memberid = f.memberid
				join tbMemberProfileContactInfo c on c.memberid = m.Contactid
		WHERE 
			f.memberid =@MemberID and c.city = @SubCategory

    END
    ELSE IF (@CategoryID = 2) BEGIN

		SELECT 
  
			(select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.Contactid) as FriendName,
			(select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.Contactid) as Location,
		    
			(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.Contactid) as PicturePath,
			m.Contactid,f.TitleDesc
		         
		FROM 
				tbMemberProfile f join tbContacts m on m.memberid = f.memberid
				join dbo.tbMemberProfileEducation c on c.memberid = m.Contactid
		WHERE 
			f.memberid =@MemberID and c.college1 = @SubCategory
    END
	ELSE BEGIN

		SELECT 
  
			(select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.Contactid) as FriendName,
			(select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.Contactid) as Location,
		    
			(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.Contactid) as PicturePath,
			m.ContactId,f.TitleDesc
		         
		FROM 
				tbMemberProfile f join tbContacts m on m.memberid = f.memberid
				join dbo.tbMemberProfileEducation c on c.memberid = m.Contactid
		WHERE 
			f.memberid =@MemberID and c.highschool = @SubCategory

    END









GO
/****** Object:  StoredProcedure [dbo].[spGetMemberChildPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberChildPosts 12
-- Description:	gets a member posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberChildPosts]
	
	@PostID int
   	
AS

	SELECT PostResponseID, PostID, Description, CONVERT(varchar,ResponseDate,100) as DateResponded, p.MemberID, isnull(picturepath,'default.png') as picturepath,
		m.FirstName + ' ' + m.LastName AS MemberName,  m.firstname  
		FROM tbMemberPostResponses P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.PostID =@PostID order by responsedate desc





GO
/****** Object:  StoredProcedure [dbo].[spGetMemberContactInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberContactInfo 1
-- Description:	gets a member contact info
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberContactInfo]
	
	@MemberID int
   	
AS
BEGIN
    SET NOCOUNT ON
	SELECT m.email as LoginEmail, i.* FROM dbo.tbMemberProfileContactInfo i join tbMembers m on i.memberid = m.memberid   WHERE i.MemberID = @MemberID

END
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberContacts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberContacts] 1, ''
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberContacts]
	
	@MemberID int,
   	@ShowType varchar(30) = ''
AS 

	IF (@ShowType = 'Requests') BEGIN
   
		SELECT 
            f.firstname + ' ' + f.lastname as FriendName,
			f.firstname  as firstname,
			p.City + ', ' + p.State as Location,		    
			isnull(picturepath,'default.png') as picturepath,
    		m.FromMemberID as ContactID, 'Request' as showtype, 1 as status, titleDesc, '' as params, '' as paramsAV, '' as email, '' as LabelText, '' as NameAndID 
		         
		FROM 
              	tbMemberProfile f                 
				join tbContactRequests m on f.memberid = m.FromMemberID
				left join tbMemberProfileContactInfo p on p.memberID = m.FrommemberID
		WHERE 
			m.Tomemberid =@MemberID 
    END	

	ELSE IF (@ShowType = 'AddedRecently') BEGIN
   
		SELECT 
			f.firstname + ' ' + f.lastname as FriendName,
			f.firstName as firstname,
		    p.City + ', ' + p.State as Location,	    
			isnull(picturepath,'default.png') as picturepath,
			m.Contactid, 'AddedRecently' as showtype, 1 as status, titleDesc, '' as params, '' as paramsAV, '' as email, '' as LabelText, '' as NameAndID 
		         
		FROM 
				tbMemberProfile f join tbContacts m on f.memberid = m.contactID
				left join tbMemberProfileContactInfo p on p.memberID = m.ContactID
		WHERE 
			m.memberid =@MemberID and datestamp between DATEADD(day,-14,GETDATE()) and getdate() 

    END
    ELSE BEGIN

		SELECT 
			 t.firstname + ' ' + t.lastname as friendname,
			 t.firstname as firstname, 
			 p.City + ', ' + p.State as location,
			 isnull(t.picturepath,'default.png') as picturepath,
			 c.contactid as ContactID, '' as showtype, c.status, titleDesc,

             Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
			 ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
			   ',''' + CASE 
				 WHEN m.memberID = @memberID then 'View Profile' -- same person
                 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @memberID) then 'View Profile'
				 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @memberID) and m.memberID <> @memberID) then 'View Profile' -- already friends 
				 ELSE 'Add as Contact' 
			   END + ''''  as ParamsAV, m.email,

			    
			   CASE 
					WHEN m.memberID = @memberID then 'View Profile' -- same person	
					WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @memberID) then 'View Profile'
					WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @memberID) and m.memberID <> @memberID) then 'View Profile' -- already friends 
					ELSE 'Add as Contact' 
			   END as LabelText,
			   Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID 
			  
			 
		FROM    
                  
				  tbMemberProfile t join tbContacts c on t.memberID = c.ContactID
			      left join tbMemberProfileContactInfo p on p.memberId = c.contactid
				  JOIN tbMembers m on m.memberid = t.memberid
	
		WHERE 
                 c.memberId = @memberID and c.status in (0, 1)

    END





















GO
/****** Object:  StoredProcedure [dbo].[spGetMemberDates]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberDates] 1
-- Description:	gets a member posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberDates]
	
	@MemberID int
   	
AS

	SELECT JoinedDate,   isnull(picturepath,'default.png') as picturepath, 
	  firstname + ' ' + lastname as MemberName, CurrentCity,
	  DOBMonth + '/' + DOBDay +  '/' + DOBYear as BirthDate from tbMemberProfile
	  
	WHERE memberid = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spGetMemberEducationInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberEducationInfo 1
-- Description:	gets a member education info
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberEducationInfo]
	
	@MemberID int
   	
AS
	SELECT * FROM dbo.tbMemberProfileEducation WHERE MemberID = @MemberID



GO
/****** Object:  StoredProcedure [dbo].[spGetMemberEmploymentInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberEmployementInfo 1
-- Description:	gets a member employment info
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberEmploymentInfo]
	
	@MemberID int
   	
AS
	SELECT * FROM dbo.tbMemberProfileEmploymentInfo WHERE MemberID = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spGetMemberEvents]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberEvents 1, 'upcoming'
-- Description:	gets a member's events list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberEvents]
	
    @MemberID int,
	@type varchar(20)   	
AS
 
 if @type =  '' 
   SELECT  distinct i.eventid, count(i.eventid) as cnt, isnull(eventimg,'default.png') as eventimg, planningwhat,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
       Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
       (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams   
      ,startdate, enddate,case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
   FROM tbEventInvites I inner join tbEvents E on E.EventID = I.EventID  
   WHERE e.MemberID = @MemberID  and i.memberID = @memberID group by i.eventid ,e.eventid, eventImg,planningwhat,location, startdate,starttime,enddate,endtime, rsvpstatus, i.memberid, e.memberid order by startDate desc 

else if @type ='upcoming' 
   begin
	
 Select * into tempTb1 from 
 (
  SELECT  distinct i.eventid, count(i.eventid) as cnt, isnull(eventimg,'default.png') as eventimg, planningwhat,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
       Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
       (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams   
      ,startdate, enddate,case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
   FROM tbEventInvites I inner join tbEvents E on E.EventID = I.EventID  
    
   WHERE startDate >=  dateAdd(day,-1,getdate()) and e.memberid in ( select contactid from tbcontacts c where c.memberid =@memberID ) and i.memberid =@memberID
     group by i.eventid ,e.eventid, eventImg,planningwhat,location, startdate,starttime,enddate,endtime, rsvpstatus, i.memberid, e.memberid 
 ) RV

 Select * into tempTb2 from 
 (
  SELECT  distinct i.eventid, count(i.eventid) as cnt, isnull(eventimg,'default.png') as eventimg, planningwhat,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
    Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
       (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams   
      ,startdate, enddate,case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
   FROM tbEventInvites I inner join tbEvents E on E.EventID = I.EventID  
   WHERE startDate >=  dateAdd(day,-1,getdate()) and e.MemberID = @MemberID  and i.memberID = @memberID group by i.eventid ,e.eventid, eventImg,planningwhat,location, startdate,starttime,enddate,endtime, rsvpstatus, i.memberid, e.memberid 
  
  ) EV

  select * from (
  select distinct EventID, cnt, eventImg,PlanningWhat,Location, EventDate,RSVP,EventParams, StartDate,EndDate, ShowCancel from tempTb1
  UNION
  select distinct EventID, cnt, eventImg,PlanningWhat,Location, EventDate,RSVP,EventParams, StartDate,EndDate, ShowCancel from tempTb2
  ) OV order by OV.STartDate desc

drop table tempTb1
drop table tempTb2

end 

else if @type ='past' 
    SELECT  distinct i.eventid, count(i.eventid) as cnt, isnull(eventimg,'default.png') as eventimg, planningwhat,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
       Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
       (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams   
      ,startdate, enddate,case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
   FROM tbEventInvites I inner join tbEvents E on E.EventID = I.EventID  
   WHERE startDate <   dateAdd(day,-1,getdate()) and   e.MemberID = @MemberID  and i.memberID = @memberID group by i.eventid ,e.eventid, eventImg,planningwhat,location, startdate,starttime,enddate,endtime, rsvpstatus, i.memberid, e.memberid order by startDate desc 

else if @type ='contacts' 
 begin
select * into tempTb from 

 (SELECT  distinct i.eventid, count(i.eventid) as cnt, isnull(eventimg,'default.png') as eventimg, planningwhat,location, CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate ,
       Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 
       (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams   
      ,startdate, enddate,case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel
   FROM tbEventInvites I inner join tbEvents E on E.EventID = I.EventID  
    
   WHERE e.memberid in ( select contactid from tbcontacts c where c.memberid =@memberID ) and i.memberid =@memberID
     group by i.eventid ,e.eventid, eventImg,planningwhat,location, startdate,starttime,enddate,endtime, rsvpstatus, i.memberid, e.memberid 
) EV

select distinct EventID, cnt, eventImg,PlanningWhat,Location, EventDate,RSVP,EventParams, StartDate,EndDate, ShowCancel from tempTb order by StartDate desc
drop table tempTb

end












GO
/****** Object:  StoredProcedure [dbo].[spGetMemberFriendsV2]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberFriendsV2 1, 'Name', 'm'
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberFriendsV2]
	
	@MemberID int,
   	@SearchType varchar(30),
	@SearchText varchar(90)
AS
 
    CREATE TABLE #tmp
            (friendID int, friendName varchar(100), email varchar(100))
 
	INSERT INTO #tmp 
	   
        	SELECT 
  
			m.friendid, (select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.friendid) as FriendName,
			--(select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.friendid) as Location,
		    (select email from tbMembers mb where mb.memberid = m.friendid) as email
		   
			--(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.friendid) as PicturePath,
			-- m.friendId
		         
		FROM 
				tbMemberProfile f join tbfriends m on m.memberid = f.memberid 
				
		WHERE 
			f.memberid =@MemberID  order by (select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.friendid)
			--AND FriendName like @SearchText + '%'

if (@Searchtype = 'Name')
   SELECT * from #tmp where friendname like @SearchText + '%' 
else 
	SELECT * from #tmp where email like @SearchText + '%' 


DROP table #tmp



GO
/****** Object:  StoredProcedure [dbo].[spGetMemberGeneralInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberGeneralInfo 1
-- Description:	gets a member general info
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberGeneralInfo]
	
	@MemberID int
   	
AS
	SELECT * FROM tbMemberProfile WHERE MemberID = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spGetMemberGroups]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberNetworks] 1
-- Description:	gets group listing member belongs
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberGroups]
	
	@MemberID int
AS 
  
SELECT G.GroupID, GroupName, Description as GroupDesc, Category, isnull(GroupImage,'default.png') as GroupImage, '0 Members' as MemberCount, createddate   
     FROM tbGroups G JOIN tbGroupMembers M on G.GroupID = M.GroupID where M.MemberID = @MemberID

	
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberInfoByEmail]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberInfoByEmail 'test@testemail.com.com'
-- Description:	get member info by email 
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberInfoByEmail]
	
	@email varchar(100)
   	
AS

 SELECT m.memberid as friendid,  case when picturepath is null then 'default.png' else picturepath end as picturepath, email, firstname + ' ' + lastname as [name] 
                        FROM tbMembers m JOIN tbmemberprofile mp on m.memberid = mp.memberid WHERE 
                        email = @email
  


  







GO
/****** Object:  StoredProcedure [dbo].[spGetMemberLinks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberLinks 1
-- Description:	gets a member's links list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberLinks]
	
    @MemberID int
   	
AS
  SELECT linkid, ownerID, url, description, isnull(thumbnail,'default.bmp') as thumbnail,
       CreatedDate,Ownertype, privacyType FROM tbLinks WHERE OwnerID = @MemberID  order by CreatedDate desc
















GO
/****** Object:  StoredProcedure [dbo].[spGetMemberMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMemberMessages]
	
	@MemberID int,
    @Type varchar(20),
	@ShowType varchar(25)
	
AS

BEGIN

   IF (@Type = 'Inbox') BEGIN
        

        IF (@Showtype <> 'All' and @Showtype <>'UnRead') BEGIN

			SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, 
				 (select isnull([picturepath],'default.png')  from tbMemberProfile where memberid = msg.contactid) as ContactImage,
				 isnull([picturepath],'default.png') as SenderImage,
				 contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
				 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessages msg left join tbMemberProfile m  
				 ON msg.SenderID = m.MemberID 
			WHERE 
			   ContactID = @MemberID and 
               (m.firstName like @ShowType + '%' or 
                m.lastName like @ShowType + '%' or 
			    body like @ShowType + '%')
                       

            ORDER BY MsgDate DESC

        END

		if (@Showtype='All') BEGIN
			SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, 
				 (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
				 isnull([picturepath],'default.png') as SenderImage,
				 contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
				 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessages msg left join tbMemberProfile m  
				 ON msg.SenderID = m.MemberID 
			WHERE 
			   ContactID = @MemberID ORDER BY MsgDate DESC
		END
		ELSE BEGIN
				SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, 
				 (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
				 isnull([picturepath],'default.png') as SenderImage,
				 contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
				 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessages msg left join tbMemberProfile m  
				 ON msg.SenderID = m.MemberID 
			WHERE 
			   ContactID = @MemberID AND MessageState = 0 ORDER BY MsgDate DESC		
		END

   END

   ELSE IF (@Type = 'Junk') BEGIN
		SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
              (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
			 isnull([picturepath],'default.png') as SenderImage,
			 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessagesJunk msg left join tbMemberProfile m  
             ON msg.SenderID = m.MemberID 
		WHERE 
           ContactID = @MemberID ORDER BY MsgDate DESC
   END

   ELSE IF (@Type = 'Sent') BEGIN

     if (@Showtype='All') BEGIN		
		SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
              (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
			 isnull([picturepath],'default.png') as SenderImage,
			  m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessagesSent msg left join tbMemberProfile m  
             ON msg.SenderID = m.MemberID 
		WHERE 
           ContactID = @MemberID ORDER BY MsgDate DESC
     END
     ELSE BEGIN
		SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
              (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
			 isnull([picturepath],'default.png') as SenderImage,
			  m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessagesSent msg left join tbMemberProfile m  
             ON msg.SenderID = m.MemberID 
		WHERE 
           ContactID = @MemberID AND MessageState = 0 ORDER BY MsgDate DESC         
     END
  
   END

   ELSE IF (@Type = 'Deleted') BEGIN
       if (@Showtype='All') BEGIN		
	
		SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
             (select isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
			  isnull([picturepath],'default.png') as SenderImage,
			 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessagesDeleted msg left join tbMemberProfile m  
             ON msg.SenderID = m.MemberID 
		WHERE 
           ContactID = @MemberID ORDER BY MsgDate DESC
       end
       else begin
          SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
             (select  isnull([picturepath],'default.png') from tbMemberProfile where memberid = msg.contactid) as ContactImage,
			 isnull([picturepath],'default.png') as SenderImage,
			 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname FROM tbMessagesDeleted msg left join tbMemberProfile m  
             ON msg.SenderID = m.MemberID 
		WHERE 
           ContactID = @MemberID and MessageState = 0  ORDER BY MsgDate DESC
	   end 
   END
	


END
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNameInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	get Member Name Info
-- =============================================

CREATE PROCEDURE [dbo].[spGetMemberNameInfo]
	
	@MemberID int

AS
  SELECT firstname, lastname, middlename, email, SecurityQuestion, SecurityAnswer, Password FROM 
        tbMemberProfile P JOIN tbMembers M on P.MemberID = M.MemberID WHERE M.MemberID =  @MemberID




GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNetworkInviteContactList]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberNetworkInviteContactList] 1,16
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberNetworkInviteContactList]	
	@MemberID int,
	@NetworkID int  
AS 
   DECLARE @ContactList TABLE (FriendName Varchar(50), FirstName varchar(25), Location varchar(75), PicturePath varchar(50),
   ContactID int, ShowType Varchar(20), Status int)	
   
   INSERT INTO @ContactList (FriendName, FirstName, Location, PicturePath, ContactID, ShowType, Status)
   SELECT 
			 mp.firstname + ' ' + mp.lastname as friendname,
			 mp.firstname as firstname, 
			 p.City + ', ' + p.State as location,
			 isnull(mp.picturepath,'default.png') as picturepath,
			 c.contactid as ContactID, '' as showtype, c.status			 
   FROM 
			tbMemberProfile mp join tbContacts c on mp.memberID = c.ContactID
			left join tbMemberProfileContactInfo p on p.memberId = c.contactid
   WHERE 
            c.memberId = @memberID and status in (0, 1)

	DELETE FROM @ContactList WHERE ContactID in(select memberID from tbNetworkMemberInvites where networkid =@NetworkID)

   SELECT * FROM @ContactList
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNetworkInvites]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberNetworkInvites] 1
-- Description:	gets network listing member belongs
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberNetworkInvites]
	
	@MemberID int
AS 
  
SELECT G.NetworkID, NetworkName, Description as NetworkDesc, CategoryID, isnull([Image],'default.png') as NetworkImage, convert(varchar(20), (select count(networkid) from tbNetworkMembers where networkid = g.networkid)) + ' Member(s)' as MemberCount, createddate   
     FROM tbNetworks G JOIN tbNetworkMemberInvites M on G.NetworkID = M.NetworkID where M.MemberID = @MemberID and M.status = 0

	


GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNetworks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMemberNetworks]
   -- exec spGetMemberNetworks  1
	@MemberID int	
AS
SELECT G.NetworkID, NetworkName, Description as NetworkDesc, CategoryID, isnull([Image],'default.png') 
     as NetworkImage, Convert(varchar(20), (select count(networkid) from tbNetworkMembers where networkid = g.networkid)) + ' Member(s)' as MemberCount, 
     createddate, 
	  (select  MP.FirstName + ' ' + MP.LastName from tbMemberProfile MP
	 LEFT JOIN tbNetworkMembers NM on MP.memberID = NM.MemberID Where isowner = 1 and networkID= G.NetworkID) as NetworkOwner
	   
	 --P.FirstName + ' ' + P.LastName as NetworkOwner   
     FROM tbNetworks G JOIN tbNetworkMembers M on G.NetworkID = M.NetworkID 
	 left join tbMemberProfile P on P.MemberID=M.MemberID	 
	 where M.MemberID = @MemberID



GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNotes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberNotes 1
-- Description:	gets a member's notes list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberNotes]
	
    @MemberID int
   	
AS
  SELECT t.firstname + ' ' + t.lastname  as MemberName, t.FirstName,  			
     isnull(picturepath,'default.png') as picturepath, L.* 
FROM tbmemberProfile t JOIN  tbNotes L on t.memberiD = l.MemberiD 
    WHERE L.MemberID = @MemberID  order by CreatedDate desc

















GO
/****** Object:  StoredProcedure [dbo].[spGetMemberNotifications]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	gets a member notifications
-- =============================================

CREATE PROCEDURE [dbo].[spGetMemberNotifications]
	
	@MemberID int,
	@ShowType varchar(20)
	
AS
  
  IF (@Showtype = 'All')
     SELECT * FROM tbNotifications where MemberID = @MemberID order by sentdate desc
  ELSE
	     SELECT * FROM tbNotifications where MemberID = @MemberID And Status = 0 order by sentdate desc
    





GO
/****** Object:  StoredProcedure [dbo].[spGetMemberPersonalInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberPersonalInfo 1
-- Description:	gets a member personal info
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberPersonalInfo]
	
	@MemberID int
   	
AS
	SELECT * FROM dbo.tbMemberProfilePersonalInfo WHERE MemberID = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spGetMemberPhoneBook]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberPhoneBook 6
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberPhoneBook]
	
	@MemberID int
   	
AS 
--	CREATE table #tmp (
--        fname varchar(50),
--	    hphone varchar(30),
--        cphone varchar(30), 
--        picturepath varchar(50),
--	    friendID int
--     )
--     insert into #tmp
		SELECT 
  
			(select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.Contactid) as FriendName,			
			  (select pp.homephone from tbMemberProfileContactInfo pp where pp.memberid = m.Contactid) as HomePhone,
			  (select ppp.cellphone from tbMemberProfileContactInfo ppp where ppp.memberid = m.Contactid) as CellPhone,
		    
			(select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.Contactid) as PicturePath,
			m.ContactId
		         
		FROM 
				tbMemberProfile f join tbContacts m on m.memberid = f.memberid
                join tbMemberProfileContactInfo q on f.memberid = q.memberid
		WHERE 
			f.memberid =@MemberID and homephone is not null and cellphone is not null

   
--select * from #tmp where (hphone is not null or cphone is not null) and friendid <> @memberID







GO
/****** Object:  StoredProcedure [dbo].[spGetMemberPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec spGetMemberPosts 1
-- Description:   gets a member posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberPosts]
   
   @MemberID int
      
AS
  select top 15 * from (
    SELECT PostID, Title, Description, CONVERT(varchar,PostDate,100) as DatePosted, AttachFile, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
      m.FirstName + ' ' + m.LastName AS MemberName, m.firstname,
       0 AS ChildpostCnt
  
      FROM tbMemberPosts P join tbMemberProfile M ON p.memberid = m.memberid 
            WHERE 
            p.memberid =@MemberID
         --order by postdate desc
    union
   SELECT PostID, Title, Description, CONVERT(varchar,PostDate,100) as DatePosted, AttachFile, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
      m.FirstName + ' ' + m.LastName AS MemberName, m.firstname,
        0 AS ChildpostCnt  
      FROM tbMemberPosts P join tbMemberProfile M ON p.memberid = m.memberid 
            WHERE 
            p.memberid in (select contactID From tbContacts tbC where tbC.memberID=@MemberID)
         --order by postdate desc
   ) as tbb order by postid desc
   /* SELECT PostResponseID, PostID, Description, ResponseDate, p.MemberID, isnull(picturepath,'default.png') as picturepath,
      m.FirstName + ' ' + m.LastName AS MemberName, firstName  
      FROM tbMemberPostResponses P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.PostID =PostID 

*/
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberRecentFriends]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberRecentFriends 1
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberRecentFriends]
	
	@MemberID int
   	
AS

SELECT
    (select t.firstname + ' ' + t.lastname from tbmemberProfile t where t.memberid = m.friendid) as FriendName,
    (select p.City + ', ' + p.State from tbMemberProfileContactInfo p where p.memberid = m.friendid) as Location,
    
    (select isnull(q.picturepath,'default.png') from tbmemberProfile q where q.memberid = m.friendid) as PicturePath,
    m.friendId
         
FROM 
    tbMemberProfile f join tbfriends m on m.memberid = f.memberid
WHERE 
    f.memberid =@MemberID 




GO
/****** Object:  StoredProcedure [dbo].[spGetMembersBySearchType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMembersBySearchType] '1', 'name','larry',''
-- Description:	gets members  base on search type and search text
-- =============================================
CREATE PROCEDURE [dbo].[spGetMembersBySearchType]
	@UserID int,
	@SearchType varchar(50),
   	@SearchText varchar(50),
    @SearchText2 varchar(50)=''
AS 
--	IF (@SearchType = 'College') BEGIN
--        
--		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
--		CASE 
--			WHEN m.memberID = @UserID then 'View Profile' -- same person 
--		    WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'          
--			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
--			ELSE 'Add as Contact' 
--		END as LabelText, Email, Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID
--            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params 
--			,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
--           ',''' + CASE 
--			 WHEN m.memberID = @UserID then 'View Profile' -- same person
--			 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
--			 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
--			 ELSE 'Add as Contact' 
--		   END + '''' as ParamsAV	    
--		FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
--        JOIN tbMemberProfileEducation e on m.memberid = e.memberid
--		WHERE 
--			e.college1 like @SearchText + '%'  or e.college2 like @SearchText + '%' 
--    END

    IF (@SearchType = 'Email') BEGIN
		
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person
			WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
		     ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
             ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
			   ',''' + CASE 
				 WHEN m.memberID = @UserID then 'View Profile' -- same person
				 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
				 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
				 ELSE 'Add as Contact' 
			   END + ''''  as ParamsAV, TitleDesc		
        FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid        
		WHERE 
           m.email = @SearchText 
	END 
   
	ELSE IF (@SearchType = 'Employer' or @SearchType ='company') BEGIN
	
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person	
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
		   ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
		   ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
           ',''' + CASE 
			 WHEN m.memberID = @UserID then 'View Profile' -- same person
			 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			 ELSE 'Add as Contact' 
		   END + ''''  as ParamsAV, TitleDesc		
        FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
		JOIN tbMemberProfileEmploymentInfoV2  e on m.memberid = e.memberid
		WHERE
           e.CompanyName like @SearchText + '%' 
    END

	ELSE IF (@SearchType = 'public') BEGIN
 
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person
			WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
		     ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
			 ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
			   ',''' + CASE 
				 WHEN m.memberID = @UserID then 'View Profile' -- same person
                 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
				 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
				 ELSE 'Add as Contact' 
			   END + ''''  as ParamsAV, TitleDesc		
        FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
		JOIN tbMemberProfileEducationV2 e on m.memberid = e.memberid
		WHERE
			e.SchoolName like @SearchText + '%'
            and schoolType = 1
             
	END

    ELSE IF (@SearchType = 'private') BEGIN
 
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person
			WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
		     ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
			 ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
			   ',''' + CASE 
				 WHEN m.memberID = @UserID then 'View Profile' -- same person
                 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
				 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
				 ELSE 'Add as Contact' 
			   END + ''''  as ParamsAV, TitleDesc		
        FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
		JOIN tbMemberProfileEducationV2 e on m.memberid = e.memberid
		WHERE
			e.SchoolName like @SearchText + '%'
            and schoolType = 2
             
	END

    ELSE IF (@SearchType = 'college') BEGIN
 
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person
			WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
		     ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
			 ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
			   ',''' + CASE 
				 WHEN m.memberID = @UserID then 'View Profile' -- same person
                 WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
				 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
				 ELSE 'Add as Contact' 
			   END + ''''  as ParamsAV, TitleDesc		
        FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
		JOIN tbMemberProfileEducationV2 e on m.memberid = e.memberid
		WHERE
			e.SchoolName like @SearchText + '%'
            and schoolType = 3
             
	END

	ELSE IF (@SearchType = 'Name' or @SearchType ='people') BEGIN
        -- 1 split the name 
        -- array 1 has firstname arr2 has lastname
        -- if only array 1 then
    
		SELECT m.MemberID, t.FirstName + ' ' + t.LastName as MemberName, ISNULL(picturepath,'default.png') as PicturePath,    
		CASE 
			WHEN m.memberID = @UserID then 'View Profile' -- same person
			WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
			WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile2' -- already friends 
			ELSE 'Add as Contact' 
		END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID  
           ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
		   ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
           ',''' + CASE 
			 WHEN m.memberID = @UserID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile' 
			 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
			 ELSE 'Add as Contact' 
		   END + ''''  as ParamsAV, TitleDesc		        
		FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
		WHERE 
 	        t.firstname like @SearchText + '%' and t.lastname like @SearchText2 + '%'
	END






GO
/****** Object:  StoredProcedure [dbo].[spGetMemberSchools]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec [spGetMemberSchools] 1
-- Description:   get member school listing
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberSchools]   
   @MemberID int      
AS
    SELECT e.MemberID, e.SchoolID, e.SchoolType,e.ClassYear,e.Major, e.DegreeType, e.Societies,e.Description,
    d.DegreeTypeDesc, e.SportLevelType, s.SchoolTypeDesc,

   (case e.SchoolType when 3  then
       (Select [Name] From tbColleges c with(nolock)  where c.schoolID=e.schoolID) 
       when 2 then
          (select schoolName  from tbPrivateSchools p with(nolock) where p.lgid = e.schoolID)
       when 1 then 
         (select schoolName  from tbPublicSchools p with(nolock) where p.lgid = e.schoolID)
     end ) as SchoolName,

   (case e.SchoolType when 3  then
       (Select Address From tbColleges c with(nolock)  where c.schoolID=e.schoolID) 
        when 2 then
          (select schoolName  from tbPrivateSchools p with(nolock) where p.lgid = e.schoolID)
      when 1 then 
        (select StreetName + ', ' + City + ', ' + State + ' ' + Zip from tbPublicSchools p with(nolock) where p.lgid = e.schoolID)
     end ) as Address,

   (case e.SchoolType when 3  then
       (Select c.website From tbColleges c with(nolock)  where c.schoolID=e.schoolID) 
       else
        'default.png'
     end ) as fileImage
   

    FROM dbo.tbMemberProfileEducationV2 e with(nolock)
    left JOIN tbDegreeType d on e.degreetype = d.DegreeTypeiD
    
   left JOIN tbSchoolType s on e.schooltype = s.schooltypeid where memberID = @MemberID 
   
    Order by ClassYear desc
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberVideoCount]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberVideoCount 1
-- Description:	gets total count of pictures for member
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberVideoCount]
	@MemberID int
   
AS
   select count(videoID) as  VideoCount from tbVideos where memberID =@memberID
   
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberVideos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










--isnull(picturepath,'default.png')




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMemberVideos 1,1
-- Description:	gets a member videos's list
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberVideos]
	
	@MemberID int,
    @CatID int	
AS
   
   declare @temp table (CountID int identity(1,1) , videoID int, MemberID int, 
   [videoname] varchar(100), description varchar(100), [filename] varchar(100), vidDate datetime, vidcategory int, vidType int, removed bit,
    params varchar(300), vidParams varchar(300))

   if (@CatID = 0)
      INSERT @temp(VideoID, memberID, VideoName, Description, [filename], vidDate, vidCategory, vidType, removed, 
      params, vidParams)
      SELECT VideoID, memberID, videoname, description, [filename], vidDate, vidcategory,vidtype, removed,
            CAST(VideoID AS varchar(20)) +  ',''' + VideoName + ''',''' + Description + '''' as params,
            '''' + [filename] +  ''',''' + VideoName + ''',''' + Description + '''' as VidParams
      FROM tbVideos WHERE MemberID = @MemberID  and removed = 0 ORDER BY VidDate DESC
   else
      INSERT @temp(VideoID, memberID, VideoName, Description, [filename], vidDate, vidCategory, vidType,removed, params, vidParams)
      SELECT VideoID, memberID, videoname, description, [filename], vidDate, vidcategory,vidtype, removed,
        CAST(VideoID AS varchar(20)) +  ',''' + VideoName + ''',''' + Description + '''' as params,
        '''' + [filename] +  ''',''' + VideoName + ''',''' + Description + '''' as VidParams
      FROM tbVideos WHERE MemberID = @MemberID and VidCategory = @CatID and removed = 0 ORDER BY VidDate DESC

SELECT * from @temp







GO
/****** Object:  StoredProcedure [dbo].[spGetMemberWorkExperience]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMemberWorkExperience] 1
-- Description:	get member school listing
-- =============================================
CREATE PROCEDURE [dbo].[spGetMemberWorkExperience]	
	@MemberID int   	
AS
select * from dbo.tbMemberProfileEmploymentInfoV2 e with(nolock)
left join tbCompanies c on  e.companyid = c.id
where e.memberid = @MemberID order by endYear desc
GO
/****** Object:  StoredProcedure [dbo].[spGetMessageInfoByID]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetMessageInfoByID] 3
-- Description:	gets message info by message id
-- =============================================
CREATE PROCEDURE [dbo].[spGetMessageInfoByID]	
	
    @MsgID int,
    @Folder varchar(20)
   	
AS
   
  IF (@Folder = 'Inbox') BEGIN
	SELECT  MessageID, 
        MsgDate as SentDate, 
       (SELECT FirstName + ' ' + LastName FROM tbMemberProfile p WHERE P.MemberID=SenderID) as [From],
       (SELECT PicturePath FROM tbMemberProfile m WHERE m.MemberID = SenderID) as SenderPicture,       
        Body, Subject, AttachmentFile, OriginalMsg
	FROM 
        tbMessages WHERE MessageID = @MsgID

  END
  
  IF (@Folder = 'Junk') BEGIN
    
	SELECT  MessageID, 
        MsgDate as SentDate, 
       (SELECT FirstName + ' ' + LastName FROM tbMemberProfile p WHERE P.MemberID=SenderID) as [From],
       (SELECT PicturePath FROM tbMemberProfile m WHERE m.MemberID = SenderID) as SenderPicture,       
        Body, Subject, AttachmentFile,  OriginalMsg
	FROM 
        tbMessagesJunk WHERE MessageID = @MsgID
  
  END

  IF (@Folder = 'Sent') BEGIN
    
	SELECT  MessageID, 
        MsgDate as SentDate, 
       (SELECT FirstName + ' ' + LastName FROM tbMemberProfile p WHERE P.MemberID=SenderID) as [From],
       (SELECT PicturePath FROM tbMemberProfile m WHERE m.MemberID = SenderID) as SenderPicture,       
        Body, Subject, AttachmentFile,  OriginalMsg
	FROM 
        tbMessagesSent WHERE MessageID = @MsgID
  
  END
 
  IF (@Folder = 'Deleted') BEGIN
    
	SELECT  MessageID, 
        MsgDate as SentDate, 
       (SELECT FirstName + ' ' + LastName FROM tbMemberProfile p WHERE P.MemberID=SenderID) as [From],
       (SELECT PicturePath FROM tbMemberProfile m WHERE m.MemberID = SenderID) as SenderPicture,       
        Body, Subject, AttachmentFile,  OriginalMsg
	FROM 
        tbMessagesDeleted WHERE MessageID = @MsgID
  
  END







GO
/****** Object:  StoredProcedure [dbo].[spGetMonths]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetMonths
-- Description: get list of months 
-- =============================================
CREATE PROCEDURE [dbo].[spGetMonths]
	
AS
 
   SELECT  * from tbMonths order by month








GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkAdmins]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNetworkAdmins] 3
-- Description:	gets group admin listings
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkAdmins]
	
	@NetworkID int
AS 
  
	SELECT M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
		   NetworkID,isOwner, isAdmin, g.JoinedDate,
		   case when isowner=1 then 'Owner' when (isOwner =0 and isAdmin=1) then null else null end as Access,  TitleDesc
	FROM  
		   tbmemberProfile M inner join tbNetworkMembers G on M.MemberID = G.MemberID
	WHERE 
		   NetworkID = @NetworkID and isAdmin = 1
	 





GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkBasicInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkBasicInfo 30
-- Description:	get network basic info
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkBasicInfo]
	
  @NetworkID int
   	
AS
   SELECT  convert(varchar(15), g.NetworkID) as NetworkID,
    g.NetworkName,
    g.Description as NetworkDesc,
    CONVERT(varchar(10),g.CategoryID) as CategoryID,
    ISNULL(g.[Image], 'default.png') as NetworkImage,
    convert(varchar(10), (Select count(memberID) from tbNetworkMembers tbn where tbn.networkid=@NetworkID )) as memberCount, 
    CONVERT(varchar(20), g.CreatedDate) as CreatedDate ,
    (Select mpe.FirstName + ' ' + mpe.LastName from tbMemberProfile mpe inner join tbNetworkMembers tnm on mpe.MemberID = tnm.MemberID  where tnm.networkID =@NetworkID and tnm.IsOwner=1 ) as networkOwner,
    convert(varchar(10), g.CategoryTypeID) as CategoryTypeID,
    g.RecentNews,
    g.Office, g.Email, g.Website, g.Street, g.City, g.[State], g.zip, 
    convert(varchar(10), g.[InActive]) as InActive,
    c.[Description] as CategoryDesc,
    t.[Description] as CategoryTypeDesc,
    convert(varchar(10), s.Access) as Access,
     convert(varchar(10), 0) as IsAlreadyMemberID  
   FROM tbNetworks g left join dbo.tbNetworkSettings s on g.NetworkID = s.Networkid 
   left join tbNetworkCategory C on g.categoryid = c.categoryID
   left join tbNetworkCategoryType T on g.[Categorytypeid] = t.CategoryTypeID
   WHERE g.NetworkID = @NetworkID








GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkCategories]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkCategories
-- Description:	get network cat
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkCategories]
	

   	
AS
   SELECT * FROM tbNetworkCategory order by description asc


GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkCategoryTypes]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNetworkCategoryTypes] 1
-- Description:	get nework cat type
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkCategoryTypes]
	@CategoryID int
   	
AS
   SELECT * FROM tbNetworkCategoryType Where Categoryid =@Categoryid
   order by description asc


GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkChildPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkChildPosts 1
-- Description:	gets a network child posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkChildPosts]
	
	@PostID int
   	
AS

	SELECT PostResponseID, PostID, Description, ResponseDate, p.MemberID, isnull(picturepath,'default.png') as picturepath,
		m.FirstName + ' ' + m.LastName AS MemberName,  m.firstname  
		FROM tbNetworkPostResponses P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.PostID =@PostID order by responsedate desc





GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkEvents]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec spGetNetworkEvents 16,1
-- Description:   gets a network's events list
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkEvents]
   
   @NetworkID int,
    @MemberID int
      
AS
   SELECT    distinct e.eventid, isnull(eventimg,'default.png') as eventimg, planningwhat,location, 
 CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate
 ,RSVPStatus as RSVP,
 (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' +  RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as EventParams,
 case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel 
 from tbEvents e join tbEventInvites I on E.eventID = i.eventID and e.memberid = i.memberID 
WHERE NetworkID = @NetworkID  order by eventid desc
GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkMemberRequests]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetNetworkMemberRequests]	
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkMemberRequests 16, 1
-- Description:	get network mmerber request 
-- =============================================
	@NetworkID int,
    @MemberID int 
    
AS          
       SELECT * FROM  dbo.tbNetworkMemberRequests
		   WHERE NetworkID = @NetworkID and RequestorID = @memberID
    
GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkMembers]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNetworkMembers] 16, 'rejects'
-- Description:	gets network listings
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkMembers]
	
	@NetworkID int,
    @ListType varchar(20)
    
AS 
  
    IF (@ListType = '') BEGIN

		SELECT M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
			   NetworkID,isOwner, isAdmin, g.JoinedDate as JoinedDate,
			   case when isowner=1 then 'Owner' when (isOwner =0 and isAdmin=1) then 'Admin' else '' end as Access, TitleDesc
		FROM  
			   tbmemberProfile M inner join tbNetworkMembers G on M.MemberID = G.MemberID
		WHERE 
			   NetworkID = @NetworkID and isAdmin = 0 and status = 1
	END 

    ELSE IF (@ListType = 'Joined') BEGIN
       
       SELECT M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
			   NetworkID,isOwner, isAdmin, g.JoinedDate as JoinedDate,
               case when isowner=1 then 'Owner' when (isOwner =0 and isAdmin=1) then 'Admin' else '' end as Access, TitleDesc
		FROM  
			   tbmemberProfile M inner join tbNetworkMembers G on M.MemberID = G.MemberID
		WHERE 
			   NetworkID = @NetworkID and status = 1
    
    END
    
    ELSE IF (@ListType = 'Invitees') BEGIN
       
        SELECT inviteID, M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
			   NetworkID, '' as Email,getdate() as JoinedDate, '' as Access, null as isOwner, null as isAdmin, TitleDesc
		FROM  
			   tbmemberProfile M inner join tbNetworkMemberInvites G on M.MemberID = G.MemberID
		WHERE 
			   NetworkID = @NetworkID and status = 0
		UNION

		SELECT inviteID, '' as memberid, email as MemberName, 'default.png' as PicturePath, 
			   NetworkID, Email, getdate() as JoinedDate, '' as Access,  null as isOwner, null as isAdmin, '' as TitleDesc
		FROM  
           tbNetworkMemberInvites 
		WHERE 
			   NetworkID = @NetworkID and (status = 0 or status is null) and (email is not null or email <> '') 
    
    END

    ELSE IF (@ListType = 'Requesters') BEGIN
       
       SELECT M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
			   NetworkID, getdate() as JoinedDate, '' as Access, null as isOwner, null as isAdmin, TitleDesc
		FROM  
			   tbmemberProfile M inner join dbo.tbNetworkMemberRequests G on M.MemberID = G.RequestorID
		WHERE 
			   NetworkID = @NetworkID and (status =0 or status is null)
    
    END

    ELSE IF (@ListType = 'Rejects') BEGIN
       
       SELECT M.memberid, M.firstname + ' ' + M.lastname as MemberName, isnull(PicturePath,'default.png') as PicturePath, 
			   NetworkID, getdate() as JoinedDate, '' as Access, null as isOwner, null as isAdmin, TitleDesc
		FROM  
			   tbmemberProfile M inner join dbo.tbNetworkMemberRequests G on M.MemberID = G.RequestorID
		WHERE 
			   NetworkID = @NetworkID and (status =2)
    
    END









GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkPhotos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkPhotos 16
-- Description:	gets a network's photo list
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkPhotos]
	
	@NetworkID int
   	
AS
   declare @temp table (CountID int identity(1,1) , photoID int, memberID int, MemberName varchar(70) , photoName varchar(100), photoDesc varchar(200), [filename] varchar(100), params varchar(300), CreatedDate datetime) 
  

insert @temp(PhotoID, memberID, MemberName, photoname, photodesc, [Filename], params,CreatedDate)
   SELECT PhotoID, G.memberID, M.firstname + ' ' + M.lastname as MemberName, photoName, photodesc, [FileName],
   '"' + CAST(photoID AS varchar(20)) +  ':' + photoName + ':' + photoDesc + '"' as params, CreatedDate
    
   FROM tbNetworkPhotos G join tbmemberProfile M on g.memberid = m.memberid
   WHERE NetworkID = @NetworkID and removed <> 1 order by photoID asc

SELECT * from @temp









GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec spGetNetworkPosts 1
-- Description:   gets a network posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkPosts]
   
   @NetworkID int
      
AS

   SELECT  PostID, Title, Description, PostDate, AttachFile, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
      m.FirstName + ' ' + m.LastName AS MemberName, m.firstname  
      FROM tbNetworkPosts P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.NetworkID =@NetworkID
         order by postdate desc

    SELECT PostResponseID, PostID, Description, ResponseDate, p.MemberID, isnull(picturepath,'default.png') as picturepath,
      m.FirstName + ' ' + m.LastName AS MemberName, firstName  
      FROM tbNetworkPostResponses P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.PostID =PostID 


GO
/****** Object:  StoredProcedure [dbo].[spGetNetworks]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNetworks] 'mi%'
-- Description:	gets a list of networks base on search text
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworks]
	
	@SearchText varchar(50)
	
AS

	 SELECT NetworkID, N.TypeID, N.Description as NetworkName, Country, State, City, OwnerID
			
--     CASE T.TypeId
--         WHEN 1 THEN N.Description -- region
 --        WHEN 2 THEN N.Description + '<br/>' + N.City + ', ' + N.State -- educatioal
  --       WHEN 3 THEN N.Description -- work         
   --      ELSE N.Description
    -- END AS NetworkName
 
     FROM tbNetworkMembers N JOIN tbNetworkType T ON N.TypeID=T.TypeID
     WHERE N.Description like @SearchText + '%'











GO
/****** Object:  StoredProcedure [dbo].[spGetNetworksByCatType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworksByCatType 1, 3,3
-- Description:	get networks by cat and type
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworksByCatType]
	
  @MemberID int,
  @CategoryID int,
  @SubCategoryID int
   	
AS
   SELECT NetworkID, NetworkName, Description as NetworkDesc, CategoryID, 
        isnull([Image],'default.png') as NetworkImage, 
        cast( (select count(s.networkID) from tbNetworkMembers s where s.networkid = n.networkid) as varchar(100)) as MemberCount, 
        createddate,
        (select networkID FROM tbNetworkMembers NM where NM.MemberID = @MemberID and nm.networkid =n.networkid) as IsAlreadyMemberID 

   FROM tbNetworks N
   WHERE CategoryID = @CategoryID and [CategoryTypeID] = @SubCategoryID





GO
/****** Object:  StoredProcedure [dbo].[spGetNetworksByKeyName]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNetworksByKeyName] 1,'my'
-- Description:	get networks by keyname or wild card search
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworksByKeyName]
  
  @memberID int,	
  @keyVal varchar(100)
   	
AS
   SELECT NetworkID, NetworkName, Description as NetworkDesc, CategoryID, 
        isnull([Image],'default.png') as NetworkImage, 
        cast( (select count(s.networkID) from tbNetworkMembers s where s.networkid = n.networkid) as varchar(100)) as MemberCount, 
        createddate,
        (select networkID FROM tbNetworkMembers NM where NM.MemberID = @MemberID and nm.networkid =n.networkid) as IsAlreadyMemberID 

   FROM tbNetworks N
   WHERE N.NetworkName like @KeyVal + '%'








GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkSettings 1
-- Description:	get network settings
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkSettings]
	
  @NetworkID int
   	
AS
   SELECT * FROM tbNetworkSettings WHERE NetworkID = @NetworkID



GO
/****** Object:  StoredProcedure [dbo].[spGetNetworkVideos]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetNetworkVideos 1
-- Description:	gets a network videos's list
-- =============================================
CREATE PROCEDURE [dbo].[spGetNetworkVideos]
	
	@NetworkID int
AS
   
   declare @temp table (CountID int identity(1,1) , videoID int, networkID int, MemberID int, 
   [videoname] varchar(100), description varchar(100), [filename] varchar(100), vidDate datetime, vidcategory int, vidType int, removed bit, params varchar(300), vidParams varchar(300))

   INSERT @temp(VideoID, networkID, memberID, VideoName, Description, [filename], vidDate, vidCategory, vidType, removed,
        params, vidParams)
      SELECT VideoID, networkID, memberID, videoname, description, [filename], vidDate, vidcategory,vidtype, removed,
      CAST(VideoID AS varchar(20)) +  ',''' + VideoName + ''',''' + Description + '''' as params,
      '''' + [filename] +  ''',''' + VideoName + ''',''' + Description + '''' as VidParams
      FROM tbNetworkVideos WHERE networkID = @NetworkID  and removed = 0 ORDER BY VidDate DESC
   
SELECT * from @temp










GO
/****** Object:  StoredProcedure [dbo].[spGetNoteCommentPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNoteCommentPosts] 1
-- Description:	get the list of note comment posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetNoteCommentPosts]
	
	@NoteID int
   	
AS
  
	SELECT NoteID,PostID, CommentDesc, PostDate, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
		m.FirstName + ' ' + m.LastName AS MemberName, m.FirstName  
		FROM tbNoteCommentPosts P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.NoteID =@NoteID
			order by postdate desc





GO
/****** Object:  StoredProcedure [dbo].[spGetNotificationsSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetNotificationsSettings] 1
-- Description: get member notifications
-- =============================================
CREATE PROCEDURE [dbo].[spGetNotificationsSettings]  
	@MemberID int
AS

 SELECT N.*, M.Email, mp.firstname + ' ' + mp.lastname as MemberName
    FROM [tbNotificationSettings] N join tbMembers M ON N.MemberID = m.MemberID 
    join tbMemberProfile mp on n.MemberID = mp.MemberID
    WHERE N.MemberID = @MemberID




GO
/****** Object:  StoredProcedure [dbo].[spGetPollResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2013
-- example: exec [spGetPollResults] 3
-- Description:	get poll results.
-- =============================================
CREATE PROCEDURE [dbo].[spGetPollResults]
	
	@PollID int
AS 
   SELECT a.PollAnswerID, a.PollID, a.DisplayText, a.SortOrder, COUNT(r.UserID) as Votes
     FROM tbPollAnswers a LEFT JOIN tbUserResponses r ON a.PollAnswerID = r.PollAnswerID 
     WHERE a.PollID = @PollID GROUP BY a.PollAnswerID, a.PollID, a.DisplayText, a.SortOrder
     ORDER BY a.SortOrder

  
GO
/****** Object:  StoredProcedure [dbo].[spGetPrivacySearchSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetPrivacySearchSettings] 1
-- Description: get privacy settings for member id
-- =============================================
CREATE PROCEDURE [dbo].[spGetPrivacySearchSettings]  
	@MemberID int
AS

 SELECT P.*, M.Email FROM [tbMembersPrivacySettings] P join tbMembers M ON P.MemberID = M.MemberID WHERE P.MemberID = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spGetRecentActivities]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetRecentActivities 1
-- Description:	gets a member recent activities
-- =============================================
CREATE PROCEDURE [dbo].[spGetRecentActivities]
	
	@MemberID int
   	
AS

   SELECT ActivityID, Description, ActivityDate, ImageFile from tbMembersRecentActivities R join tbActivityType A
       on r.ActivityTypeID = a.ActivityTypeID 
		  WHERE memberID = @memberID  Order by ActivityDate Desc




GO
/****** Object:  StoredProcedure [dbo].[spGetRecentNetworkActivities]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetRecentNetworkActivities 1
-- Description:	gets a group recent activities
-- =============================================
CREATE PROCEDURE [dbo].[spGetRecentNetworkActivities]
	
	@NetworkID int
   	
AS

   SELECT ActivityID, Description, ActivityDate, ImageFile from tbNetworkRecentActivities R join tbActivityType A
       on r.ActivityTypeID = a.ActivityTypeID 
		  WHERE NetworkID = @NetworkID  Order by ActivityDate Desc





GO
/****** Object:  StoredProcedure [dbo].[spGetRequestsList]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetRequestsList 1
-- Description:	gets a member request for contact
-- =============================================
CREATE PROCEDURE [dbo].[spGetRequestsList]
	
	@MemberID int
   	
AS 
		SELECT 
  
			P.firstname + ' ' + P.lastname as FriendName,
			
			isnull(p.picturepath,'default.png') as picturepath,
			r.FromMemberId
		         
		FROM 
				tbMemberProfile p join tbContactRequests r on p.memberid = r.FromMemberID
		WHERE 
			r.ToMemberid =@MemberID and status = 0








GO
/****** Object:  StoredProcedure [dbo].[spGetSearchContacts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      DB developer   
-- Create date: 05/2025
-- example: exec [spGetSearchContacts] '4117','lar',''
-- Description:   gets members  base on search type and search text
-- =============================================
CREATE PROCEDURE [dbo].[spGetSearchContacts]
   @UserID int,   
      @SearchText varchar(50),
    @SearchText2 varchar(50)=''
AS       
        if CHARINDEX('@',@SearchText) > 0  begin -- email check
         SELECT CAST(m.MemberID as varchar(10)) as connectionID, t.FirstName + ' ' + t.LastName as friendName, t.firstName,
            CASE 
                WHEN picturePath is null THEN  '../members/images/default.png'
                WHEN ps.ViewProfilePicture = 0 THEN '../members/images/default.png'
                ELSE '../members/images/' + picturepath
          END as PicturePath, 
            -- ISNULL(picturepath,'default.png') as PicturePath,    
         CASE 
            WHEN m.memberID = @UserID then 'View Profile' -- same person
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
            WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID)) then 'View Profile' -- already friends 
            ELSE 'Add as Connection' 
         END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
             ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
             ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
               ',''' + CASE 
                WHEN m.memberID = @UserID then 'View Profile' -- same person
                WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
                WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) ) then 'View Profile' -- already friends 
                ELSE 'Add as Connection' 
               END + ''''  as ParamsAV, TitleDesc, '' as location, '' as showType, '' as [status]      
         FROM tbMembers m left JOIN tbMemberProfile t on m.memberid = t.memberid 
         join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@UserID) ) )       
         WHERE 
            m.email = @SearchText 
       end

        else if @SearchText2 <> '' begin
          SELECT CAST(m.MemberID as varchar(10)) as connectionID, t.FirstName + ' ' + t.LastName as friendName, t.firstName, ISNULL(picturepath,'default.png') as PicturePath,    
         CASE 
            WHEN m.memberID = @UserID then 'View Profile' -- same person
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
            WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID)) then 'View Profile' -- already friends 
            ELSE 'Add as Connection' 
         END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID  
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
            ',''' + CASE 
             WHEN m.memberID = @UserID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile' 
             WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) ) then 'View Profile' -- already friends 
             ELSE 'Add as Connection' 
            END + ''''  as ParamsAV, TitleDesc, '' as location, '' as showType, '' as [status]              
         FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
                 join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@UserID) ) )
         WHERE 
            t.firstname like @SearchText + '%' and t.lastname like @SearchText2 + '%'         
        end

        else begin

         SELECT CAST(m.MemberID as varchar(10)) as connectionID, t.FirstName + ' ' + t.LastName as friendName, t.firstName, ISNULL(picturepath,'default.png') as PicturePath,    
         CASE 
            WHEN m.memberID = @UserID then 'View Profile' -- same person   
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
            WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) /*and m.memberID <> @UserID*/) then 'View Profile' -- already friends 
            ELSE 'Add as Connection' 
         END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
            ',''' + CASE 
             WHEN m.memberID = @UserID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
             WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) ) then 'View Profile' -- already friends 
             ELSE 'Add as Connection' 
            END + ''''  as ParamsAV, TitleDesc, '' as location, '' as showType, '' as [status]      
         FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         JOIN tbMemberProfileEmploymentInfoV2  e on m.memberid = e.memberid
         join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@UserID) ) )
         WHERE
            e.CompanyName like @SearchText + '%' 

         UNION

         SELECT CAST(m.MemberID as varchar(10)) as connectionID, t.FirstName + ' ' + t.LastName as friendName, t.firstName, ISNULL(picturepath,'default.png') as PicturePath,    
         CASE 
            WHEN m.memberID = @UserID then 'View Profile' -- same person
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
            WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
            ELSE 'Add as Connection' 
         END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID        
             ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
             ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
               ',''' + CASE 
                WHEN m.memberID = @UserID then 'View Profile' -- same person
                WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
                WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
                ELSE 'Add as Connection' 
               END + ''''  as ParamsAV, TitleDesc, '' as location, '' as showType, '' as [status]      
         FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         JOIN tbMemberProfileEducationV2 e on m.memberid = e.memberid
            join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@UserID) ) )
         WHERE
            e.SchoolName like @SearchText + '%'

         union

          SELECT CAST(m.MemberID as varchar(10)) as connectionID, t.FirstName + ' ' + t.LastName as friendName, t.firstName, ISNULL(picturepath,'default.png') as PicturePath,    
         CASE 
            WHEN m.memberID = @UserID then 'View Profile' -- same person
            WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile'
            WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
            ELSE 'Add as Connection' 
         END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID  
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
            ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
            ',''' + CASE 
             WHEN m.memberID = @UserID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @UserID) then 'View Profile' 
             WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'View Profile' -- already friends 
             ELSE 'Add as Connection' 
            END + ''''  as ParamsAV, TitleDesc  , '' as location, '' as showType, '' as [status]            
         FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
            join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@UserID) ) )
         WHERE 
            t.firstname like @SearchText + '%' OR t.lastname like @SearchText + '%'   

        end 
        
    

GO
/****** Object:  StoredProcedure [dbo].[spGetTalentList]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetTalentList 'Software','','','','','',''
-- Description:	gets a list of talent as described by search criteria
-- =============================================
CREATE PROCEDURE [dbo].[spGetTalentList]
	
	@Title varchar(200),    
    @Sector varchar(150),
    @industry  varchar(150),    
    @Country  varchar(100),
    @state varchar(50), 
    @jobFunctions  varchar(6000),
    @ExpLevels varchar(6000)
    
AS
    DECLARE @thisDay DateTime
    DECLARE @thatDay DateTime

	DECLARE @JF NVARCHAR(MAX), @xml XML   
	SET @JF = @jobFunctions
	SET @xml = '<values><value>' + REPLACE(@JF,',','</value><value>') + '</value></values>'

	DECLARE @Exp NVARCHAR(MAX), @xmlExp XML
	SET @Exp = @ExpLevels
	SET @xmlExp = '<values><value>' + REPLACE(@Exp,',','</value><value>') + '</value></values>'
   

	SELECT 
			firstname + ' ' + lastname as TalentName,
			firstName as FirstName,
		       
			isnull(picturepath,'default.png') as PicturePath,
			MemberID, TitleDesc as TalentTitle
	FROM 
        tbMemberProfile  
	WHERE 
           TitleDesc like (CASE WHEN len(@Title) = 0 THEN TitleDesc ELSE @Title + '%' END)	  
	AND  
           Sector like (CASE WHEN len(@Sector) = 0 THEN Sector ELSE @Sector + '%' END)
    AND  
		   Industry like (CASE WHEN len(@Industry) = 0 THEN Industry ELSE @Industry + '%' END)
--    AND  
--		   Company like (CASE WHEN len(@Company) = 0 THEN Company ELSE @Company +'%' END)
--    AND  
--           Country like  (CASE WHEN len(@Country) = 0 THEN Country ELSE @Country  +'%' END)
--    AND 
--           State like (CASE WHEN len(@State) = 0 THEN State ELSE @State +'%' END)
--	AND   
--           JobFunction in (CASE WHEN len(@jobFunctions) = 0 THEN (JobFunction) 
--		       ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xml.nodes('values/value') AS lst(itm)) END)
--    AND 
--		   ExperienceType in (CASE WHEN len(@ExpLevels) = 0 THEN (ExperienceType) 
--		       ELSE (SELECT lst.itm.value('.','nvarchar(max)') FROM @xmlExp.nodes('values/value') AS lst(itm)) END)



GO
/****** Object:  StoredProcedure [dbo].[spGetTopicPosts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetTopicPosts 1
-- Description:	get the list of topic posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetTopicPosts]
	
	@TopicID int
   	
AS
  
	SELECT PostID, PostDesc, PostDate, p.MemberID, 
    isnull(picturepath,'default.png') as picturepath,
		m.FirstName + ' ' + m.LastName AS MemberName, m.firstname  
		FROM tbDiscussionTopicPosts P join tbMemberProfile M ON p.memberid = m.memberid WHERE p.TopicID =@TopicID
			order by postdate desc




GO
/****** Object:  StoredProcedure [dbo].[spGetTopics]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spGetTopics] 3
-- Description:	gets a group posts
-- =============================================
CREATE PROCEDURE [dbo].[spGetTopics]
	
	@NetworkID int
   	
AS


   SELECT t.TopicID, t.TopicDesc, m.FirstName + ' ' + m.LastName AS MemberName, CONVERT(VARCHAR(20), t.CreatedDate, 100) as CreatedDate, t.MemberID,
      (SELECT  case when count(postid) > 1 then Cast(Count(postid) as varchar(20)) + ' posts' else Cast(Count(postid) as varchar(20)) + ' post' end FROM tbDiscussionTopicPosts P where p.topicid = t.topicid) as TopicPostCnt,
      
      (SELECT top 1 d.memberid FROM tbDiscussionTopicPosts D where d.topicid = t.topicid order by postdate desc ) AS LatestPostMemberID ,		

	  (SELECT top 1 m2.FirstName + ' ' + m2.LastName FROM tbDiscussionTopicPosts E join tbMemberProfile m2 ON E.memberid = m2.memberid where E.topicid = t.topicid order by postdate desc) AS LatestPostMemberName,

      CONVERT(VARCHAR(20), (SELECT top 1 F.PostDate FROM tbDiscussionTopicPosts F where f.topicid = t.topicid order by postdate desc), 100) as LatestPostDate 
	  
       FROM tbNetworkDiscussionTopics T join tbMemberProfile M ON T.memberid = m.memberid



      WHERE NetworkID = @NetworkID order by t.topicid desc

--(SELECT count(postid) FROM tbDiscussionTopicPosts P where p.topicid = t.topicid) as TopicPostCnt ,
	  
--	  (SELECT top 1 d.memberid FROM tbDiscussionTopicPosts D join tbMemberProfile M ON d.memberid = m.memberid  where d.topicid = t.topicid order by postdate desc)  AS LastestPostMemberID ,
	
  --    (SELECT top 1 m2.FirstName + ' ' + m2.LastName FROM tbDiscussionTopicPosts E join tbMemberProfile m2 ON E.memberid = m2.memberid where E.topicid = t.topicid order by postdate desc) AS LastestPostMemberName,
	  
    --  (SELECT top 1 F.PostDate FROM tbDiscussionTopicPosts F where f.topicid = t.topicid order by postdate) as LatestPostDate  
	  


GO
/****** Object:  StoredProcedure [dbo].[spGetTotalEventInvites]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	gets total count of network invites
-- exec spGetTotalEventInvites 1

-- =============================================
CREATE PROCEDURE [dbo].[spGetTotalEventInvites]
	@MemberID int	
AS
	BEGIN
       SELECT Count(InviteID) as Counter FROM dbo.tbEventInvites I 
		 JOIN tbEvents E on I.eventid = E.eventID where I.MemberID = @MemberID
	     AND E.StartDate >= getdate()
	END








GO
/****** Object:  StoredProcedure [dbo].[spGetTotalNetworkInvites]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	gets total count of network invites
-- exec spGetTotalNetworkInvites 1

-- =============================================
CREATE PROCEDURE [dbo].[spGetTotalNetworkInvites]
	@MemberID int	
AS
	BEGIN
       SELECT Count(InviteID) as Counter FROM dbo.tbNetworkMemberInvites where MemberID = @MemberID
          and status = 0
	END











GO
/****** Object:  StoredProcedure [dbo].[spGetTotalUnreadMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	gets total count of unread messages for user
-- =============================================
CREATE PROCEDURE [dbo].[spGetTotalUnreadMessages]
	@MemberID int	
AS
	BEGIN
		SELECT count(*) AS UnreadCnt FROM tbMessages 
		  WHERE MessageState = 0 and contactid = @MemberID
	END







GO
/****** Object:  StoredProcedure [dbo].[spGetUserAuthentication]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	gets a member from tbmembers table
-- example: exec [spGetUserAuthentication] 'test@testemail.com.com', 'turbo20'
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserAuthentication]
	
	@Email varchar(100),
	@Password varchar(50)

AS

BEGIN
	SELECT M.MemberID, Email, FirstName, LastName, chatStatus  FROM tbMembers M left join  tbMemberProfile P ON M.MemberID = P.MemberID 
		Where Email = @Email and Convert(binary, Password) = convert(binary, @password)
        and Status = 2
END






GO
/****** Object:  StoredProcedure [dbo].[spGetWhosFollowingMe]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date:3/2022
-- example: exec spGetWhosFollowingMe 1
-- Description:	gets whose following me list
-- =============================================
CREATE PROCEDURE [dbo].[spGetWhosFollowingMe]
	
	@MemberID int
AS
   Select 
    p.FirstName + ' ' + p.LastName as FriendName,
          p.FirstName, '' as [Location],
          isnull(p.picturepath,'default.png') as PicturePath,
          '' as ShowType,
          p.CurrentStatus as [Status],
          p.TitleDesc,
          convert(varchar(10),m.MemberId) as ConnectionID,
          convert(varchar(10), (select  count(memberID) from tbContacts where memberID=@MemberID and ContactID = m.MemberID))
           as params, 
           convert(varchar(10), (select count(FromMemberID) from tbContactRequests where FromMemberID=@MemberID and ToMemberID=m.memberID))
            as paramsav, '' as email, '' as labelText, '' as NameAndID
          from tbMemberFollowing m inner join tbMemberProfile p
          on m.MemberId = p.MemberID
       WHERE FollowingMemberid = @MemberID
GO
/****** Object:  StoredProcedure [dbo].[spGetYears]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spGetYears
-- Description: get list of Years 
-- =============================================
CREATE PROCEDURE [dbo].[spGetYears]
	
AS
 
   SELECT  * from tbYears order by [Year] desc








GO
/****** Object:  StoredProcedure [dbo].[spIgnoreJoinNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spIgnoreJoinNetwork] 1, 4
-- Description:	ignore joined network
-- =============================================
CREATE PROCEDURE [dbo].[spIgnoreJoinNetwork]
	
  @MemberID int,
  @NetworkID int
AS

  UPDATE tbNetworkMemberRequests set status = 2 WHERE NetworkID = @NetworkID and  RequestorID=@MemberID
  UPDATE dbo.tbNetworkMemberInvites set status = 2 WHERE NetworkID = @NetworkID and  MemberiD=@MemberID


GO
/****** Object:  StoredProcedure [dbo].[spInsertAlbumPhoto]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spInsertAlbumPhoto] 14, '.png'
-- Description:	Creates a photo for the album
-- =============================================
CREATE PROCEDURE [dbo].[spInsertAlbumPhoto]
	
	@AlbumID int,
    @Ext varchar(4)
  
	
AS
   INSERT INTO tbAlbumPhotos (AlbumID)
   VALUES (@AlbumID)
   
   UPDATE tbAlbumPhotos SET [filename] = cast (SCOPE_IDENTITY() as varchar(20)) + @Ext
   WHERE photoID = SCOPE_IDENTITY()
 
   SELECT  SCOPE_IDENTITY() as id
GO
/****** Object:  StoredProcedure [dbo].[spInsertEventInvite]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spInsertEventInvite ....
-- Description:	Creates an event invite for member or group
-- =============================================
CREATE PROCEDURE [dbo].[spInsertEventInvite]
	
	@EventID int,
	@MemberID int,
	@Email varchar(50),
	@RSVPStatus varchar(30)
	
AS
   
   INSERT INTO tbEventInvites (EventID, MemberID,Email, RSVPStatus) 
    VALUES
   (@EventID, @MemberID, @Email, @RSVPStatus)
GO
/****** Object:  StoredProcedure [dbo].[spInsertMessage]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spInsertMessage] 'email'...
-- Description:	insert a chat message
-- =============================================
CREATE PROCEDURE [dbo].[spInsertMessage]
	
	@RoomID int,
    @FromUser int,
    @ToUser int,
	@Msg varchar(900),
	@Color varchar(25)
    
AS

   INSERT INTO dbo.tbChatMessages (RoomID,UserID,ToUserID,[Text],Color,[TimeStamp]) VALUES
         (@RoomID,@FromUser,@ToUser, @Msg,@Color,GetDate())
    
GO
/****** Object:  StoredProcedure [dbo].[spInviteEmailToJoinNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spInviteEmailToJoinNetwork 3, 'sksk@dkdk.com'
-- Description:	invite email of LG to join network
-- =============================================
CREATE PROCEDURE [dbo].[spInviteEmailToJoinNetwork]
	
	@NetworkID int,
    @Email varchar(100)
    
AS

   INSERT INTO dbo.tbNetworkMemberInvites (NetworkID,Email)
         VALUES (@NetworkID,@Email)

SELECT  SCOPE_IDENTITY() as inviteID




GO
/****** Object:  StoredProcedure [dbo].[spInviteMemberToEvent]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spInviteMemberToEvent 3, 1  ...
-- Description:	invite email or memberid to event
-- =============================================
CREATE PROCEDURE [dbo].[spInviteMemberToEvent]
	
	@NetworkID int,
    @EventID int,
    @memberID int,
    @Email varchar(100)
    
AS

   if @MemberID = 0
     SET @MemberID = null
   if (@Email = '')
     SET @Email = null

   INSERT INTO tbEventInvites (EventID,MemberID, Email, RSVPStatus)
         VALUES (@EventID, @MemberID,@Email, 'Not Yet Replied')





GO
/****** Object:  StoredProcedure [dbo].[spInviteMemberToJoinNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spInviteMemberToJoinNetwork 3, 1  ...
-- Description:	invite members of LG to join network
-- =============================================
CREATE PROCEDURE [dbo].[spInviteMemberToJoinNetwork]
	
	@NetworkID int,
    @memberID int
    
AS

   INSERT INTO tbNetworkMemberInvites (NetworkID,MemberID)
         VALUES (@NetworkID,@MemberID)



GO
/****** Object:  StoredProcedure [dbo].[spIsEmailExists]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spIsEmailExists 'test@testemail.com.com'
-- Description:	Checks to see if email already in system
-- =============================================
CREATE PROCEDURE [dbo].[spIsEmailExists]
	
   	@Email varchar(100)
AS
	SELECT Email From tbMembers WHERE Email = @Email	
GO
/****** Object:  StoredProcedure [dbo].[spIsSocialNetworkFriend]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spIsSocialNetworkFriend] 1, 'larry', 'johnson'
-- Description:	check to see if name is a friend - return email of name if friend 
-- =============================================
CREATE PROCEDURE [dbo].[spIsSocialNetworkFriend]
	
	@MemberID int,
    @FirstName varchar(50),    
	@LastName varchar(60)
   	
AS
   select email from tbmembers m 
   join tbMemberProfile p on m.memberid = p.memberid
   join tbContacts f on f.Contactid = m.memberid
   where firstname = @FirstName and lastname = @LastName and f.memberid = @MemberID


  






GO
/****** Object:  StoredProcedure [dbo].[spIsSocialNetworkUserOnLinkedGlobe]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spIsSocialNetworkUserOnLinkedGlobe 1, 'larry', 'johnson'
-- Description:	get email for name
-- =============================================
CREATE PROCEDURE [dbo].[spIsSocialNetworkUserOnLinkedGlobe]

    @FirstName varchar(50),    
	@LastName varchar(60)
   	
AS
   select email from tbmembers m 
   join tbMemberProfile p on m.memberid = p.memberid
   where firstname = @FirstName and lastname = @LastName 

  






GO
/****** Object:  StoredProcedure [dbo].[spJoinNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spJoinNetwork] 1,2
-- Description:	allow member to join network
-- =============================================
CREATE PROCEDURE [dbo].[spJoinNetwork]
	@MemberID int,
	@NetworkID int	
AS
	IF not exists(SELECT networkid FROM tbNetworkMembers WHERE MemberID = @MemberID and NetworkID = @NetworkID) 
    BEGIN
		INSERT INTO tbNetworkMembers Values (@NetworkID,@MemberID,2) -- active
	END 












GO
/****** Object:  StoredProcedure [dbo].[spJoinNetworkByEmail]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spJoinNetwork] 1,2
-- Description:	allow new member with email to join network
-- =============================================
CREATE PROCEDURE [dbo].[spJoinNetworkByEmail]
	@Email varchar(50),
	@NetworkID int	
AS
    DECLARE @MemberID int
    SET @MemberID = 0
    SELECT @MemberID = MemberID FROM tbMembers WHERE Email = @Email
    
	IF (@MemberID <> 0) BEGIN
   
		IF not exists(SELECT networkid FROM tbNetworkMembers WHERE MemberID = @MemberID and NetworkID = @NetworkID) 
		BEGIN
			INSERT INTO tbNetworkMembers Values (@NetworkID,@MemberID, getdate(), 0, 0) -- active
		END 

    END











GO
/****** Object:  StoredProcedure [dbo].[spLoggedInUser]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spLoggedInUser] 1
-- Description:	Log in user
-- =============================================
CREATE PROCEDURE [dbo].[spLoggedInUser]
	
	@UserID int
    
AS

  if (not exists(select * from tbLoggedInUser where UserID = @UserID))
  BEGIN
    INSERT INTO tbLoggedInUser (UserID) VALUES
         (@UserID)
  END   
GO
/****** Object:  StoredProcedure [dbo].[spNetworkSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spNetworkSearchResults 1, 'my'
-- Description:	gets all search base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[spNetworkSearchResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 

	SELECT n.NetworkID as EntityID, n.NetworkName as EntityName, ISNULL([Image],'default.png') as PicturePath,    
	CASE 		
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr where nr.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm where nm.MemberID = @MemberID) then 'View Network' 
		ELSE 'Join Network' 
	END as LabelText, 
    ISNULL(Email,'') as Email ,
    Cast(n.NetworkID as varchar(20)) + ',' + n.NetworkName as NameAndID  
    ,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName +  '''' as Params
	,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName  + '''' +
       ',''' + CASE 
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr2 where nr2.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm2 where nm2.MemberID = @MemberID) then 'View Network'
		ELSE 'Join Network' 
	END + '''' as ParamsAV, Description, '0 Members' as MemberCount, isnull(createddate, '') as CreatedDate, '' as CityState,
		'' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate  	        
	FROM tbNetworks n
	WHERE 
        n.NetworkName like @SearchText + '%' 



GO
/****** Object:  StoredProcedure [dbo].[spPeopleSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spPeopleSearchResults 1, 'la'
-- Description:	gets all search base on search text and member id
-- =============================================
CREATE PROCEDURE [dbo].[spPeopleSearchResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 

	SELECT m.MemberID as EntityID, t.FirstName + ' ' + t.LastName as EntityName, ISNULL(picturepath,'default.png') as PicturePath,    
	CASE 
		WHEN m.memberID = @MemberID then 'View Profile' -- same person
		WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile'
		WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		ELSE 'Add as Contact' 
	END as LabelText, Email,Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID  
       ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params
	   ,Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
       ',''' + CASE 
		 WHEN m.memberID = @MemberID then 'View Profile' -- same person
         WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile' 
		 WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		 ELSE 'Add as Contact' 
	   END + ''''  as ParamsAV, '' as CityState, '' as description, '' as MemberCount, '01/01/1900' as CreatedDate,
        '' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate   	        
	FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
	WHERE 
        t.firstname like @SearchText + '%' or t.lastname like @SearchText + '%'

GO
/****** Object:  StoredProcedure [dbo].[spRejectNetworkRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRejectNetworkRequest 1,1
-- =============================================
CREATE PROCEDURE [dbo].[spRejectNetworkRequest]
	
    @MemberID int,
	@NetworkID int
   	
AS 
   DELETE FROM dbo.tbNetworkMemberRequests WHERE RequestorID = @MemberID and NetworkID = @NetworkID

GO
/****** Object:  StoredProcedure [dbo].[spRejectRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRejectRequest 1,1
-- Description:	rejct request
-- =============================================
CREATE PROCEDURE [dbo].[spRejectRequest]
	
    @MemberID int,
	@ContactID int
   	
AS 
   DELETE FROM dbo.tbContactRequests WHERE FromMemberID = @ContactID and ToMemberID = @MemberID










GO
/****** Object:  StoredProcedure [dbo].[spRemoveAlbum]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveAlbum 1
-- Description:	remove album id - set flag removed to true
-- =============================================
CREATE PROCEDURE [dbo].[spRemoveAlbum]
	
	@AlbumID int
   	
AS
   UPDATE tbAlbums SET Removed = 1 WHERE AlbumID = @AlbumID 

GO
/****** Object:  StoredProcedure [dbo].[spRemoveApplicant]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveApplicant 1, 2 
-- Description:	removes a link
-- =============================================

CREATE PROCEDURE [dbo].[spRemoveApplicant]
	@ApplicantID int,
    @PostID int
  
AS
	DELETE FROM tbJobApplicants WHERE postID  = @PostID and MemberID = @ApplicantID

GO
/****** Object:  StoredProcedure [dbo].[spRemoveBlockMember]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveBlockMember 1,2
-- Description:	remove block member
-- =============================================
CREATE PROCEDURE [dbo].[spRemoveBlockMember]
	@MemberID int,   
	@BlockMemberID int
AS
    DELETE FROM tbMembersBlocked WHERE MemberID = @MemberID and BlockMemberID = @BlockMemberID
GO
/****** Object:  StoredProcedure [dbo].[spRemoveNetworkPhoto]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveNetworkPhoto 1
-- Description:	remove network photo id - set flag removed to true
-- =============================================
CREATE PROCEDURE [dbo].[spRemoveNetworkPhoto]
	
	@PhotoID int
   	
AS
   UPDATE tbNetworkPhotos SET Removed = 1 WHERE PhotoID = @PhotoID 




GO
/****** Object:  StoredProcedure [dbo].[spRemoveNetworkVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveGroupVideo 1
-- Description:	remove group video id - set flag removed to true
-- =============================================
CREATE PROCEDURE [dbo].[spRemoveNetworkVideo]
	
	@VideoID int
   	
AS
   UPDATE tbNetworkVideos SET Removed = 1 WHERE VideoID = @VideoID 





GO
/****** Object:  StoredProcedure [dbo].[spRemovePhoto]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemovePhoto 1
-- Description:	remove photo id - set flag removed to true
-- =============================================
CREATE PROCEDURE [dbo].[spRemovePhoto]
	
	@PhotoID int
   	
AS
   UPDATE tbAlbumPhotos SET Removed = 1 WHERE PhotoID = @PhotoID 


GO
/****** Object:  StoredProcedure [dbo].[spRemoveVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spRemoveVideo 1
-- Description:	remove video id - set flag removed to true
-- =============================================
CREATE PROCEDURE [dbo].[spRemoveVideo]
	
	@VideoID int
   	
AS
   UPDATE tbVideos SET Removed = 1 WHERE VideoID = @VideoID 


GO
/****** Object:  StoredProcedure [dbo].[spSaveBasicProfileInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save basic prfile info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveBasicProfileInfo]
    @Email varchar(70),	
	@HighSchool varchar(75),
	@HighSchoolYear varchar(4),
	@College varchar(75),
	@CollegeYear varchar(4),
	@Company varchar(70)
   
AS

BEGIN

    DECLARE  @MemberID int   
    SET @MemberID = 0

    SELECT @MemberID = MemberID FROM tbMembers WHERE Email = @Email
	
    IF (@MemberID <> 0)BEGIN
   
       IF EXISTS(SELECT MemberID FROM tbMemberProfileEducation WHERE MemberID = @MemberID) BEGIN
            UPDATE tbMemberProfileEducation SET Highschool = @Highschool,
				   HighSchoolClassYear = @HighschoolYear, College1 = @College,
				   College1ClassYear = @CollegeYear
            WHERE  MemberID = @MemberID
       END
	   ELSE BEGIN
		   INSERT INTO tbMemberProfileEducation (MemberID,HighSchool,HighSchoolClassYear,College1,College1ClassYear)
		   VALUES (@MemberID, @HighSchool,@HighSchoolYear,@College,@CollegeYear)
	   END

	   IF EXISTS(SELECT MemberID FROM tbMemberProfileEmploymentInfo WHERE MemberID = @MemberID) BEGIN
            UPDATE tbMemberProfileEmploymentInfo SET Employer1 = @Company WHERE  MemberID = @MemberID
       END
	   ELSE BEGIN
		   INSERT INTO tbMemberProfileEmploymentInfo (MemberID,Employer1) VALUES (@MemberID, @Company)
	   END
      
	END
		
END	





GO
/****** Object:  StoredProcedure [dbo].[spSaveMemberContactInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save contact info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveMemberContactInfo]
      @MemberID int,
	  @Email varchar(100),
      @ShowEmailToMembers bit,
      @OtherEmail varchar(100),
      @Facebook varchar(100),
      @Instagram varchar(100),
      @Twitter varchar(100),
      @Website varchar(100),
	  @HomePhone varchar(20),
      @ShowHomePhone bit,
      @CellPhone varchar(20),
      @ShowCellPhone bit,     
      --@OtherPhone varchar(20),
      @Address varchar(50),
      @ShowAddress bit,
      @City varchar(50),
      @State varchar(50),
      @ZipCode varchar(10)
      --@WebSiteLinks varchar(300),
	  --@Neighborhood varchar(50),
      --@ShowLinks bit
   
AS

BEGIN

    DECLARE  @MemID int   
    SET @MemID = 0

    SELECT @MemID = MemberID FROM tbMemberProfileContactInfo WHERE MemberID = @MemberId
	
    IF (@MemID <> 0)BEGIN
   
         UPDATE dbo.tbMemberProfileContactInfo SET 
              Email=@Email,
			  ShowEmailToMembers = @ShowEmailToMembers,
			  OtherEmail=@OtherEmail,

			  Facebook=@Facebook,
			  Instagram=@Instagram,
              Twitter=@Twitter,
              Website=@Website,

			  CellPhone=@CellPhone,
			  ShowCellPhone=@ShowCellPhone,
			  HomePhone=@HomePhone,
			  ShowHomePhone=@ShowHomePhone,
			  --OtherPhone=@OtherPhone,
			  Address=@Address,
			  ShowAddress=@ShowAddress,
			  City=@City,
			  State=@State,
			  Zip=@ZipCode
			  --WebSiteLinks=@WebSiteLinks,
			  --ShowLinks=@ShowLinks,
			  --Neighborhood=@Neighborhood
	      
		WHERE 
				MemberID = @MemberID               
    END
    
    ELSE BEGIN
    
        INSERT INTO dbo.tbMemberProfileContactInfo (MemberID,
					  Email,
					  ShowEmailToMembers,
					  OtherEmail,

					  Facebook,
					  Instagram,
                      Twitter,
                      Website,

					  CellPhone,
					  ShowCellPhone,
					  HomePhone,
					  ShowHomePhone,
					  
					  Address,
					  ShowAddress,
					  City,
					  State,
					  Zip
					  --WebSiteLinks,
					  --ShowLinks,
					  --Neighborhood
                      ) 
          VALUES (@MemberID,
					  @Email,
					  @ShowEmailToMembers,
					  @OtherEmail,

					  @Facebook,
					  @Instagram,
					  @Twitter,
                      @Website,

                      @CellPhone,
					  @ShowCellPhone,
					  @HomePhone,
					  @ShowHomePhone,

					  @Address,
					  @ShowAddress,
					  @City,
					  @State,
					  @ZipCode
					 -- @WebSiteLinks,
					 -- @ShowLinks,
					 -- @Neighborhood
                     )					    
    END   
		
END	

GO
/****** Object:  StoredProcedure [dbo].[spSaveMemberEducationInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save education info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveMemberEducationInfo]
        
		@MemberID int,	 
		@HighSchool varchar(50),
		@HighSchoolClassYear varchar(4),
		@College1 varchar(50),
		@College1ClassYear varchar(50),
		@College1Major varchar(50),
		@College1DegreeType int,
		@College1Societies varchar(200),
		@College2 varchar(50),
		@College2ClassYear varchar(50),
		@College2Major varchar(50),
		@College2DegreeType int,
		@College2Societies varchar(200)   
AS

BEGIN

    DECLARE  @MemID int   
    SET @MemID = 0

    SELECT @MemID = MemberID FROM dbo.tbMemberProfileEducation WHERE MemberID = @MemberId
	
    IF (@MemID <> 0)BEGIN
   
         UPDATE dbo.tbMemberProfileEducation SET 
               	HighSchool=	@HighSchool,	
				HighSchoolClassYear=@HighSchoolClassYear,	
				College1=@College1,	
				College1ClassYear=@College1ClassYear,	
				College1Major=@College1Major,	
				College1DegreeType=@College1DegreeType,	
				College1Societies=@College1Societies,	
				College2=@College2,	
				College2ClassYear=@College2ClassYear,	
				College2Major=@College2Major,	
				College2DegreeType=@College2DegreeType,
				College2Societies=@College2Societies
	      
		WHERE 
				MemberID = @MemberID               
    END
    
    ELSE BEGIN
    
        INSERT INTO dbo.tbMemberProfileEducation (MemberID,
					HighSchool,
					HighSchoolClassYear,
					College1,
					College1ClassYear,
					College1Major,
					College1DegreeType,
					College1Societies,
					College2,
					College2ClassYear,
					College2Major,
					College2DegreeType,
					College2Societies) 
          VALUES (@MemberID,
					@HighSchool,
					@HighSchoolClassYear,
					@College1,
					@College1ClassYear,
					@College1Major,
					@College1DegreeType,
					@College1Societies,
					@College2,
					@College2ClassYear,
					@College2Major,
					@College2DegreeType,
					@College2Societies)
						    
    END   
		
END	







GO
/****** Object:  StoredProcedure [dbo].[spSaveMemberEmploymentInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save work info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveMemberEmploymentInfo]
           
      @MemberID int,
      @Employer varchar(50),
      @Emp1Position varchar(50),
      @Emp1JobDesc varchar(300),
      @Emp1City varchar(50),
      @Emp1State varchar(50),
      @Emp1StartMonth varchar(2),
      @Emp1StartYear varchar(4),
      @Emp1EndMonth varchar(2),
      @Emp1EndYear varchar(4),
      
	  @Employer2 varchar(50),
      @Emp2Position varchar(50),
      @Emp2JobDesc varchar(300),
      @Emp2City varchar(50),
      @Emp2State varchar(50),
      @Emp2StartMonth varchar(2),
      @Emp2StartYear varchar(4),
      @Emp2EndMonth varchar(2),
      @Emp2EndYear varchar(4),

      @Employer3 varchar(50),
      @Emp3Position varchar(50),
      @Emp3JobDesc varchar(300),
      @Emp3City varchar(50),
      @Emp3State varchar(50),
      @Emp3StartMonth varchar(2),
      @Emp3StartYear varchar(4),
      @Emp3EndMonth varchar(2),
      @Emp3EndYear varchar(4)

AS

BEGIN

    DECLARE  @MemID int   
    SET @MemID = 0

    SELECT @MemID = MemberID FROM dbo.tbMemberProfileEmploymentInfo WHERE MemberID = @MemberId
	
    IF (@MemID <> 0)BEGIN
   
         UPDATE dbo.tbMemberProfileEmploymentInfo SET                	
				Employer1=	@Employer,
				Emp1Position=	@Emp1Position,
				Emp1JobDesc=	@Emp1JobDesc,
				Emp1City=	@Emp1City,
				Emp1State=	@Emp1State,
				Emp1StartMonth=	@Emp1StartMonth,
				Emp1StartYear=	@Emp1StartYear,
				Emp1EndMonth=	@Emp1EndMonth,
				Emp1EndYear=	@Emp1EndYear,
				Employer2=	@Employer2,
				Emp2Position=	@Emp2Position,
				Emp2JobDesc=	@Emp2JobDesc,
				Emp2City=	@Emp2City,
				Emp2State=	@Emp2State,
				Emp2StartMonth=	@Emp2StartMonth,
				Emp2StartYear=	@Emp2StartYear,
				Emp2EndMonth=	@Emp2EndMonth,
				Emp2EndYear=	@Emp2EndYear,
				Employer3=	@Employer3,
				Emp3Position=	@Emp3Position,
				Emp3JobDesc=	@Emp3JobDesc,
				Emp3City=	@Emp3City,
				Emp3State=	@Emp3State,
				Emp3StartMonth=	@Emp3StartMonth,
				Emp3StartYear=	@Emp3StartYear,
				Emp3EndMonth=	@Emp3EndMonth,
				Emp3EndYear=	@Emp3EndYear	      
		WHERE 
				MemberID = @MemberID               
    END
    
    ELSE BEGIN
    
        INSERT INTO dbo.tbMemberProfileEmploymentInfo (MemberID,				
					Employer1,
					Emp1Position,
					Emp1JobDesc,
					Emp1City,
					Emp1State,
					Emp1StartMonth,
					Emp1StartYear,
					Emp1EndMonth,
					Emp1EndYear,
					Employer2,
					Emp2Position,
					Emp2JobDesc,
					Emp2City,
					Emp2State,
					Emp2StartMonth,
					Emp2StartYear,
					Emp2EndMonth,
					Emp2EndYear,
					Employer3,
					Emp3Position,
					Emp3JobDesc,
					Emp3City,
					Emp3State,
					Emp3StartMonth,
					Emp3StartYear,
					Emp3EndMonth,
					Emp3EndYear) 
          VALUES (@MemberID,
					@Employer,
					@Emp1Position,
					@Emp1JobDesc,
					@Emp1City,
					@Emp1State,
					@Emp1StartMonth,
					@Emp1StartYear,
					@Emp1EndMonth,
					@Emp1EndYear,
					@Employer2,
					@Emp2Position,
					@Emp2JobDesc,
					@Emp2City,
					@Emp2State,
					@Emp2StartMonth,
					@Emp2StartYear,
					@Emp2EndMonth,
					@Emp2EndYear,
					@Employer3,
					@Emp3Position,
					@Emp3JobDesc,
					@Emp3City,
					@Emp3State,
					@Emp3StartMonth,
					@Emp3StartYear,
					@Emp3EndMonth,
					@Emp3EndYear)
						    
    END   
		
END	







GO
/****** Object:  StoredProcedure [dbo].[spSaveMemberGeneralInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save general info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveMemberGeneralInfo]      
	  @MemberID int, 
      @FirstName varchar(50),
	  @MiddleName varchar(50),
	  @LastName varchar(50),
      @Title varchar(200),
	  --@Sector varchar(100),  --
	  --@Industry varchar(100), --
	  @InterestIn int,
      @CurrentStatus  varchar(75),
      @Gender varchar(20),
      @ShowGender bit,
      @DOBMonth varchar(2),
      @DOBDay varchar(2),
      @DOBYear varchar(5),
      @ShowDOB bit,     
      @lookingForPartnership bit,
      @lookingForEmployment bit,
      @lookingForRecruitment bit,
      @LookingForNetworking bit,
      @Sport varchar(50),
      @Bio varchar(500),
      @Height varchar(50),
      @Weight varchar(50),
      @LeftRightHandFoot varchar(50),
      @PreferredPosition varchar(20),
      @SecondaryPosition varchar(20)
AS

BEGIN

    DECLARE  @MemID int   
    SET @MemID = 0

    SELECT @MemID = MemberID FROM tbMemberProfile WHERE MemberID = @MemberId
	
    IF (@MemID <> 0)BEGIN
   
         UPDATE dbo.tbMemberProfile SET 
              FirstName = @FirstName,
			  MiddleName = @MiddleName,
			  LastName = @LastName,
              TitleDesc = @Title,
			  --Sector = @Sector,
			  --Industry = @Industry,
			  InterestedInType = @InterestIn,	
			  CurrentStatus =@CurrentStatus,
              Sex = @Gender,
			  ShowSexInProfile= @ShowGender,
			  DOBMonth=@DOBMonth,
			  DOBDay=@DOBDay,
			  DOBYear=@DOBYear,
			  ShowDOBType=@ShowDOB,			 
			  LookingForPartnership=@LookingForPartnership,
			  LookingForRecruitment=@LookingForRecruitment,
			  LookingForEmployment=@LookingForEmployment,
			  LookingForNetworking=@LookingForNetworking,
              Sport =  @Sport,
               Bio = @Bio,
               Height = @Height,
               Weight = @Weight,
               LeftRightHandFoot= @LeftRightHandFoot,
               PreferredPosition = @PreferredPosition,
               SecondaryPosition = @SecondaryPosition 

	      WHERE 
				MemberID = @MemberID             
    END
    
    ELSE BEGIN
    
        INSERT INTO dbo.tbMemberProfile (MemberID,                       
					  FirstName,
			          MiddleName,
					  LastName,
					  TitleDesc,
					
					  InterestedInType,	
					  CurrentStatus,
					  Sex,
					  ShowSexInProfile,
					  DOBMonth,
					  DOBDay,
					  DOBYear,
					  ShowDOBType,					 
					  LookingForPartnership,
					  LookingForRecruitment,
					  LookingForEmployment,
					  LookingForNetworking,
                       Sport,
                        Bio ,
                        Height ,
                        Weight ,
                        LeftRightHandFoot,
                        PreferredPosition ,
                        SecondaryPosition
					  ) 
          VALUES (@MemberID, 
					  @FirstName,
					  @MiddleName,
					  @LastName,
                      @Title,
					  @InterestIn,	
					  @CurrentStatus,
					  @Gender,
					  @ShowGender,
					  @DOBMonth,
					  @DOBDay,
					  @DOBYear,
					  @ShowDOB,					 
					  @LookingForPartnership,
					  @LookingForRecruitment,
					  @LookingForEmployment,
					  @LookingForNetworking,
                       @Sport,
                        @Bio ,
                        @Height ,
                        @Weight ,
                        @LeftRightHandFoot,
                        @PreferredPosition ,
                        @SecondaryPosition )
						    
    END   
		
END	












GO
/****** Object:  StoredProcedure [dbo].[spSaveMemberPersonalInfo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	save personal info
-- =============================================
CREATE PROCEDURE [dbo].[spSaveMemberPersonalInfo]
      
     @MemberID int,   
	 @Activities varchar(max),
     @Interests varchar(max),
     @SpecialSkills varchar(max),    
     @AboutMe varchar(max)        
AS

BEGIN

    DECLARE  @MemID int   
    SET @MemID = 0

    SELECT @MemID = MemberID FROM dbo.tbMemberProfilePersonalInfo WHERE MemberID = @MemberId
	
    IF (@MemID <> 0)BEGIN
   
         UPDATE dbo.tbMemberProfilePersonalInfo SET             
			 Activities = @Activities,
			 Interests = @Interests,
			 SpecialSkills =@SpecialSkills,
			 AboutMe = @AboutMe        
	      WHERE 
				MemberID = @MemberID                  
    END
    
    ELSE BEGIN
    
        INSERT INTO dbo.tbMemberProfilePersonalInfo (MemberID, 
					Activities,
					Interests,
					SpecialSkills,
					AboutMe)        
          VALUES (@MemberID,
					@Activities,
					@Interests,
					@SpecialSkills,
					@AboutMe)						    
    END   
		
END	







GO
/****** Object:  StoredProcedure [dbo].[spSearchJobByKeyword]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spSearchJobByKeyword] 'west'
-- Description:	gets a album's photo list
-- =============================================
CREATE PROCEDURE [dbo].[spSearchJobByKeyword]
	
	@Keywork varchar(200)
AS
	  select * from dbo.tbJobs 
		where jobTitle like @Keywork + '%'
			or company like @Keywork + '%'
			or industry like @Keywork + '%'
			or sector like  @Keywork + '%'
			or country like  @Keywork + '%'
			or state  like  @Keywork + '%'
     order by dateposted desc


GO
/****** Object:  StoredProcedure [dbo].[spSearchJobTop16ByKeyword]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchJobTop16ByKeyword]
	
	@Keywork varchar(200)
AS
	  select top 10 j.PostId, j.JobTitle, j.sector, j.industry, j.company,datePosted ,         
        CASE 
                WHEN n.[imageFile] is null THEN  'default.png'                
                ELSE n.[imageFile]
	    END as PicturePath  
        from dbo.tbJobs j  left  join tbCompanies n on n.[name]= j.company
		where jobTitle like @Keywork + '%'
			or j.company like @Keywork + '%'
			or j.industry like @Keywork + '%'
			or j.sector like  @Keywork + '%'
			or j.country like  @Keywork + '%'
			or j.state  like  @Keywork + '%'
        order by j.dateposted 

GO
/****** Object:  StoredProcedure [dbo].[spSearchMemberByType]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spSearchMemberByType] 1, 1,'larry_bi'
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spSearchMemberByType]
	
	@UserID int,
	@SearchType int,
   	@SearchString varchar(50)
AS 
    if (@SearchType = 1) begin  -- email
       select m.MemberID,firstname + ' ' + lastname as [Name], Picturepath, email,
       case when (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'yes' else 'no' end as IsFriend,
       case when m.memberID = @UserID then 'Yes' else 'no' end as IsSamePerson 
       from tbMembers m inner join tbMemberProfile p on m.memberid = p.memberid 
       where email like @SearchString + '%'   
    end 
    else if (@SearchType = 2) begin -- hs
       select m.MemberID,firstname + ' ' + lastname as [Name], Picturepath, highschool,
       case when (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'yes' else 'no' end as IsFriend,
       case when m.memberID = @UserID then 'Yes' else 'no' end as IsSamePerson 
       from tbMembers m inner join tbmemberProfileEducation p on m.memberid = p.memberid 
	   inner join tbMemberProfile pf on m.memberid = pf.memberid 
       where highschool like  @SearchString + '%'       
    end
	else if (@SearchType = 4) begin -- college
       select m.MemberID,firstname + ' ' + lastname as [Name], Picturepath, college1, college2,
       case when (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'yes' else 'no' end as IsFriend,
       case when m.memberID = @UserID then 'Yes' else 'no' end as IsSamePerson 
       from tbMembers m inner join tbmemberProfileEducation p on m.memberid = p.memberid
	   inner join tbMemberProfile pf on m.memberid = pf.memberid 	 
       where college1 like @SearchString + '%' or college2 like @SearchString + '%'       
    end
	if (@SearchType = 3) begin  -- name
       select m.MemberID,firstname + ' ' + lastname as [Name], Picturepath, 
       case when (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'yes' else 'no' end as IsFriend,
       case when m.memberID = @UserID then 'Yes' else 'no' end as IsSamePerson 
       from tbMembers m inner join tbMemberProfile p on m.memberid = p.memberid 
	   	
       where firstname like @SearchString + '%'   
    end 
	if (@SearchType = 5) begin  -- company
       select m.MemberID,firstname + ' ' + lastname as [Name], Picturepath, employer1,
       case when (m.memberID in (select ContactID from tbContacts where MemberID = @UserID) and m.memberID <> @UserID) then 'yes' else 'no' end as IsFriend,
       case when m.memberID = @UserID then 'Yes' else 'no' end as IsSamePerson 
       from tbMembers m inner join tbMemberProfileEmploymentInfo p on m.memberid = p.memberid 
	   inner join tbMemberProfile pf on m.memberid = pf.memberid 	
       where employer1 like @SearchString + '%' or Emp2Position like @SearchString or Emp3Position like @SearchString   
    end 
	--    if (contextKey == "1") //email
--        {
--        }
--        else if (contextKey == "2") //hs
--        {
--        }
--        else if (contextKey == "3") //name
--        {
--        }
--        else if (contextKey == "4") //college
--        {
--        }
--        else if (contextKey == "5") //company
--        {
--        }
--	IF (@SearchType = 'AddedRecently') BEGIN
   
	

GO
/****** Object:  StoredProcedure [dbo].[spSearchMemberContacts]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spSearchMemberContacts] 1, 'larry'
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spSearchMemberContacts]
	
	@MemberID int,
   	@searchText varchar(100)
AS 

 
		SELECT 
			 mp.firstname + ' ' + mp.lastname as friendname,
			 mp.firstname as firstname, 
			 p.City + ', ' + p.State as location,
			 isnull(mp.picturepath,'default.png') as picturepath,
			 c.contactid as ContactID, '' as showtype, c.status, TitleDesc
			 
		FROM 
				  tbMemberProfile mp join tbContacts c on mp.memberID = c.ContactID
			      left join tbMemberProfileContactInfo p on p.memberId = c.contactid
		WHERE 
                 c.memberId = @memberID and status in (0, 1) and
                 (mp.firstname like + '%' + @searchText + '%' or mp.lastname like + '%' + @searchText + '%' )
   
	

	














GO
/****** Object:  StoredProcedure [dbo].[spSearchMessages]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spSearchMessages] 1, 'order',''
-- Description:	deletes and move the given message id
-- =============================================
CREATE PROCEDURE [dbo].[spSearchMessages]	
	
    @MemberID int,
	@SearchKey varchar(190),
    @Type varchar(20)
   	
AS
	       SELECT Attachment, case when len(Body) > 35 then left(body,33) + '...' else body end as body, (select firstname + ' ' + lastname from tbMemberProfile where memberid = msg.contactid) as contactname, 
				 (select '~/Members/Images/' + picturepath from tbMemberProfile where memberid = msg.contactid) as ContactImage,
				 '~/Members/Images/' + m.picturepath as SenderImage,
				 contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
				 m.firstName + ' ' + m.lastName as SenderID, Subject, MsgDate,SenderID as FromID, m.firstname 
		
			FROM tbMessages msg inner join tbMemberProfile m  
				 ON msg.SenderID = m.MemberID 
			
            WHERE
			  --((Email like  + '%' +  @SearchKey + '%') OR
			  ((FirstName like + '%' + @SearchKey + '%') OR 
		      (LastName like + '%' + @SearchKey + '%') OR
			  (Subject like + '%' + @SearchKey + '%') OR
			  (Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID ORDER BY MsgDate DESC
		
--IF (@Type = 'Inbox') BEGIN
--	SELECT MessageID 
--	Attachment, Body, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
--    select firstname + ' ' + lastname from tbMemberProfile where memberid = m.contactid) as [From],
--				 p.firstName + ' ' + p.lastName as SenderID, Subject, MsgDate,SenderID as FromID 
--	FROM tbMessages m 
--			 join tbMemberProfile p on m.ContactID = p.MemberID
--			 join tbMembers mb on m.SenderID = mb.MemberID
--	WHERE
--		   ((Email like  + '%' +  @SearchKey + '%') OR
--			(FirstName like + '%' + @SearchKey + '%') OR 
--			(LastName like + '%' + @SearchKey + '%') OR
--			(Subject like + '%' + @SearchKey + '%') OR
--			(Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID
--END
--
--	SELECT  m.MessageID, 
--        m.MsgDate as SentDate, 
--       (SELECT FirstName + ' ' + LastName FROM tbMemberProfile p WHERE P.MemberID=m.SenderID) as [From],
--       (SELECT PicturePath FROM tbMemberProfile mp WHERE mp.MemberID = m.SenderID) as SenderImage,       
--        m.Body, m.Subject, m.AttachmentFile
--	FROM 
--        tbMessages m
--	    join tbMemberProfile p on m.ContactID = p.MemberID
--		join tbMembers mb on m.SenderID = mb.MemberID
--    WHERE
--		   ((Email like  + '%' +  @SearchKey + '%') OR
--			(FirstName like + '%' + @SearchKey + '%') OR 
--			(LastName like + '%' + @SearchKey + '%') OR
--			(Subject like + '%' + @SearchKey + '%') OR
--			(Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID
--		
--		
--ELSE IF (@Type = 'Junk') BEGIN
--	SELECT 
--	Attachment, Body, contactid, FlagLevel, ImportanceLevel, messageid, MessageState,
--				 (select firstname + ' ' + lastname from tbMemberProfile where memberid = m.contactid) as contactname, 
--				 p.firstName + ' ' + p.lastName as SenderID, Subject, MsgDate,SenderID as FromID 
--	FROM tbJunkMessages m 
--			 join tbMemberProfile p on m.ContactID = p.MemberID
--			 join tbMembers mb on m.SenderID = mb.MemberID
--	WHERE
--		   ((Email like  + '%' +  @SearchKey + '%') OR
--			(FirstName like + '%' + @SearchKey + '%') OR 
--			(LastName like + '%' + @SearchKey + '%') OR
--			(Subject like + '%' + @SearchKey + '%') OR
--			(Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID
--END
--
--ELSE IF (@Type = 'Sent') BEGIN
--	SELECT 
--	Attachment, Body, contactid, FlagLevel, ImportanceLevel, messageid, MessageState,
--				 (select firstname + ' ' + lastname from tbMemberProfile where memberid = m.contactid) as contactname, 
--				 p.firstName + ' ' + p.lastName as SenderID, Subject, MsgDate,SenderID as FromID 
--	FROM tbSentMessages m 
--			 join tbMemberProfile p on m.ContactID = p.MemberID
--			 join tbMembers mb on m.SenderID = mb.MemberID
--	WHERE
--		   ((Email like  + '%' +  @SearchKey + '%') OR
--			(FirstName like + '%' + @SearchKey + '%') OR 
--			(LastName like + '%' + @SearchKey + '%') OR
--			(Subject like + '%' + @SearchKey + '%') OR
--			(Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID
--END
--
--ELSE IF (@Type = 'Deleted') BEGIN
--	SELECT 
--	Attachment, Body, contactid, FlagLevel, ImportanceLevel, messageid, MessageState, 
--				 (select firstname + ' ' + lastname from tbMemberProfile where memberid = m.contactid) as contactname,
--				 p.firstName + ' ' + p.lastName as SenderID, Subject, MsgDate,SenderID as FromID 
--	FROM tbDeletedMessages m 
--			 join tbMemberProfile p on m.ContactID = p.MemberID
--			 join tbMembers mb on m.SenderID = mb.MemberID
--	WHERE
--		   ((Email like  + '%' +  @SearchKey + '%') OR
--			(FirstName like + '%' + @SearchKey + '%') OR 
--			(LastName like + '%' + @SearchKey + '%') OR
--			(Subject like + '%' + @SearchKey + '%') OR
--			(Body like + '%' + @SearchKey + '%')) AND ContactID = @MemberID
--END
--
--


GO
/****** Object:  StoredProcedure [dbo].[spSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchResults]
	-- exec spSearchResults 1, 'larr'
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 
 select TOP 8 * from (
    -- people search
	SELECT m.MemberID as EntityID, 
           t.FirstName + ' ' + t.LastName as EntityName,

		   CASE 
                WHEN picturePath is null THEN  'default.png'
                WHEN ps.ViewProfilePicture = 0 THEN 'default.png'
                ELSE  picturepath
		   END as PicturePath, 
           --ISNULL('../members/images/' + picturepath,'../members/images/default.png') as PicturePath,    
		   CASE 
				WHEN m.memberID = @MemberID then 'View Profile' -- same person
				WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile'
				WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
				ELSE 'Add as Contact' 
		   END as LabelText, 
           m.Email,
           Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID,  
           Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params,
	       Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
             ',''' + CASE 
		     WHEN m.memberID = @MemberID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile' 
		     WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		     ELSE 'Add as Contact' 
	       END + ''''  as ParamsAV, 
           case when TitleDesc ='' and (City is not null and City <> '') then  City + ', ' + state 
                when TitleDesc is null and (City is not null and City <> '') then City + ', ' + state 
				when TitleDesc is not null and (City is not null and City <> '') then TitleDesc
                else TitleDesc  end as CityState, 
           '' as description, '' as MemberCount, 
           getDate() as CreatedDate,
           '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   getDate() as startdate,
		   getdate() as enddate,   
           '' as ShowCancel, 'people' as sType 	        
	FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         left join tbMemberProfileContactInfo c on m.memberid = c.memberId         
         join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@memberID) ) )
	WHERE 
        t.firstname like @SearchText + '%' or t.lastname like @SearchText + '%'
        or t.Sport like  '%' + @SearchText + '%' or t.CurrentStatus like @SearchText + '%'
       /*  comment below to not show event, network, and other entities 
    UNION
    
    -- event search
    SELECT  E.eventid  as EntityID, 
       planningwhat  as EntityName,
       isnull(eventimg,'default.png') as PicturePath, 
       '' as LabelText, 
       '' as Email, 
       '' as NameAndID,
	   (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as Params,
	   '' as ParamsAV, 
       CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime + '</br>' + location as CityState, 
       '' as description, '' as MemberCount, 
       '01/01/1900' as CreatedDate,     
       location,        
       CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate,
	   Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 	     
	   startdate, 
       enddate,	 
	   case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel, 'event' as sType
	FROM tbEvents E left join tbEventInvites I on E.EventID = I.EventID  
	WHERE e.PlanningWhat like '%' + @SearchText + '%'   -- order by StartDate desc
	
    UNION

	-- network search
    SELECT n.NetworkID as EntityID, 
           n.NetworkName as EntityName, 
           ISNULL([Image],'default.png') as PicturePath,    
	CASE 		
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr where nr.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm where nm.MemberID = @MemberID) then 'View Network' 
		ELSE 'Join Network' 
	END as LabelText, 
    ISNULL(Email,'') as Email ,
    Cast(n.NetworkID as varchar(20)) + ',' + n.NetworkName as NameAndID  
    ,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName +  '''' as Params
	,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName  + '''' +
       ',''' + CASE 
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr2 where nr2.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm2 where nm2.MemberID = @MemberID) then 'View Network'
		ELSE 'Join Network' 
	END + '''' as ParamsAV, 
    'Created On ' + Cast(isnull(createddate, '') as varchar(50)) + '</br>' + cast( (select count(s.networkID) from tbNetworkMembers s where s.networkid = n.networkid) as varchar(100)) + ' member(s)'  as CityState,
    Description, '0 Members' as MemberCount, 
    isnull(createddate, '') as CreatedDate, 
    
		'' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate, '' as ShowCancel, 'network' as sType 	        
	FROM tbNetworks n
	WHERE 
        n.NetworkName like @SearchText + '%' 
	
    -- UNION

    -- search schools
    -- select * from (
    --   select
    --        lgid as EntityID, 
    --        schoolName as EntityName, 
    --        ISNULL( [ImageFile],'default.png') as PicturePath,    	
	-- 	   '' as LabelText, 
    --        '' as Email ,
    --        Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
	-- 	   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

    --        ISNULL(schoolname,'') + '~' + ISNULL(streetname,'') + '~' + ISNULL(city,'') + '~' + ISNULL(state,'') + '~' + ISNULL(zip,'') + '~' + ISNULL(county,'') + '~' + 
    --        ISNULL(phone,'') + '~' + ISNULL(PSS_Enroll_T,'') + '~' + ISNULL(PSS_Relig,'') + '~' + ISNULL(PSS_ASSOC_1,'') + '~' + ISNULL(PSS_Locale,'') 
    --        as ParamsAV, 

	-- 	   city + ', ' + state as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'private' as sType 
    --   from dbo.tbPrivateSchools 

	--   union

	--   select 
    --        lgid as EntityID, 
    --        schoolName as EntityName, 
    --        ISNULL([ImageFile],'default.png') as PicturePath,    	
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
	-- 	   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,

    --        isnull(schoolName,'') + '~' + isnull(district,'') + '~' + isnull(StreetName,'') + '~' + isnull(city,'') + '~' + isnull(state,'') + '~' + isnull(zip,'') + '~' + 
    --        isnull(phone,'') + '~' + isnull(charter,'') + '~' + isnull(magnet,'') + '~' + isnull(Titlle1School,'') + '~' + isnull(countryName,'') + '~' + 
    --        cast(isnull(students,0) as varchar(20)) + '~' + cast(isnull(teachers,0) as varchar(20)) + '~' + isnull(locale,'') 
    --         as ParamsAV, 

	-- 	   city + ', ' + state as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --       'public' as sType 
    --   from dbo.tbPublicSchools 

	--   union

	--   select 
    --        schoolid as EntityID,
    --        [name] as EntityName,
    --        ISNULL( [ImageFile],'default.png') as PicturePath, 
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(schoolid as varchar(20)) + ',' + [name] as NameAndID,
	-- 	   Cast(schoolid as varchar(20)) + ',''' + [name] +  '''' as Params,

	-- 	   isnull([name],'') + '~' +  isnull(address,'') + '~' + isnull(phone,'') + '~' + isnull(website,'') + '~' + isnull([type],'') + '~' + isnull(awardsOffered,'') + '~' + isnull(CampusSetting,'') + '~' +  isnull(campusHousing,'')  + '~' + Cast(isnull(StudentPopulation,'') as varchar(20)) + '~' +
    --        Cast(isnull(UnderGradStudents,'') as varchar(20))  as ParamsAV,
 
	-- 	   address as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'college' as sType 
    --    from tbColleges 
	--   ) AS TB2
	--   WHERE EntityName 	like @SearchText + '%' 
    
    --  UNION

    --  -- organizations
    --   select 
    --        id as EntityID,
    --        [name] as EntityName,
    --        ISNULL( [ImageFile],'default.png') as PicturePath, 
	-- 	   '' as LabelText, 
    --        '' as Email,
    --        Cast(id as varchar(20)) + ',' + [name] as NameAndID,
	-- 	   Cast(id as varchar(20)) + ',''' + [name] +  '''' as Params,

	-- 	   isnull([name],'') + '~' + isnull(sector,'') + '~' + isnull(industry,'') + '~' + isnull(IPOYear,'') + '~' + isnull(SummaryQuote,'') + '~' + isnull(website,'') + '~' +  Cast(isnull(description,'') as varchar(1000)) as ParamsAV, 
		   
	-- 	   sector + ' - ' + industry as CityState,
	-- 	   '' as Description, '0 Members' as MemberCount,
	-- 	   '' as CreatedDate,     
	--        '' as location,
	-- 	   '' as eventdate,
	-- 	   '' as rsvp,
	-- 	   '' as startdate,
	-- 	   '' as enddate, '' as ShowCancel,
    --        'company' as sType 
    --    from tbCompanies where [name] like @SearchText + '%' 
     */
) AS TB1



GO
/****** Object:  StoredProcedure [dbo].[spSendFriendRequest]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spSendFriendRequest 1, email
-- Description:	sends a member request to become friend
-- =============================================
CREATE PROCEDURE [dbo].[spSendFriendRequest]
	
	@MemberID int,
   	@Email varchar(100)
AS
    DECLARE @FriendID int
    SET @FriendID = 0
    
    IF (isnumeric(@Email) = 1) 
       SET @FriendID = @Email
    ELSE 
       SELECT @FriendID = MemberID FROM tbMembers WHERE Email = @Email
    
	IF (@FriendID <> 0) BEGIN
	    if not exists(select * from tbContactRequests where fromMemberID =@MemberID and ToMemberID= @FriendID) begin
		   INSERT INTO tbContactRequests (FromMemberID, ToMemberID) VALUES (@MemberID, @FriendID)
        end 
	END

     	
  


GO
/****** Object:  StoredProcedure [dbo].[spUnFollowMember]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date:3/2022
-- example: exec spUnFollowMember 1,2
-- Description:	unfollow member
-- =============================================
CREATE PROCEDURE [dbo].[spUnFollowMember]
	
	@MemberID int,
    @FollowingMemberID int
AS
   delete from tbMemberFollowing  where MemberID = @MemberID and  FollowingMemberid = @FollowingMemberID
       
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAlbum]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateAlbum 1...
-- Description:	get album info
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateAlbum]
    @AlbumID int,
    @MemberID int,
    @AlbumName varchar(50),
    @Desc varchar(200),
    @Privacy int
	
AS
  if exists(select * from tbAlbums where albumName = @AlbumName and MemberID =@MemberId and AlbumID <> @AlbumID) begin
     UPDATE tbAlbums SET AlbumName = @AlbumName + ' - next copy', Description =@Desc, PrivacySetting = @privacy
     WHERE MemberID = @MemberID and AlbumID = @AlbumID
  end
  else begin
     UPDATE tbAlbums SET AlbumName = @AlbumName, Description =@Desc, PrivacySetting = @privacy
     WHERE MemberID = @MemberID and AlbumID = @AlbumID
  end 
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEvent]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spUpdateEvent] ....
-- Description:	updates an event for event id
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateEvent]
	@EventID int,
	@StartDate varchar(20),
	@StartTime varchar(10),
	@EndDate varchar(20),
	@EndTime varchar(20),
    @EventName varchar(100),
    @EventInfo varchar(200),
	@Location varchar(150),
    @Street varchar(100),
    @City varchar(100),
    @State varchar(50),
    @Zip varchar(20),
    @InviteAllGrpMembers int,
	@AnyoneCanViewRSVP int,
	@AnyoneCanViewGuestList int
   	
AS
   DECLARE @ID int
   
   UPDATE tbEvents SET StartDate = @StartDate,StartTime=@StartTime,EndDate=@EndDate,EndTime=@EndTime,
		PlanningWhat =@EventName, location=@Location, Street=@Street, City=@City,state=@State, zip=@Zip, 
        MoreInfo=@EventInfo,InviteAllGroupMembers=@InviteAllGrpMembers, AnyoneCanviewRSVP=@AnyoneCanViewRSVP, 
		ShowGuestList=@AnyoneCanViewGuestList
	WHERE EventiD = @EventiD
   
  






GO
/****** Object:  StoredProcedure [dbo].[spUpdateNetwork]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spUpdateNetwork] ....
-- Description:	Update network info
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateNetwork]
	
	@NetworkID int,
    @NetworkName varchar(50),
    @Desc varchar(300),
	@Category int,
    @Type int,
    @News varchar(500),
    @Office varchar(100),
    @Email varchar(150),
	@Website varchar(100),
	@Street varchar(100),
    @City varchar(100),
    @State varchar(50),
    @Zip varchar(20)
 
AS

   DECLARE @ID int
   
   UPDATE tbNetworks SET NetworkName=@NetworkName, Description=@Desc, 
                       CategoryID=@Category, [CategoryTypeID]=@Type, 
                       RecentNews=@News,Office=@Office,
					   Email=@Email,Website=@WebSite, Street=@Street, 
					   City=@City, state=@State, 
					   zip=@Zip
    WHERE
		NetworkID =@NetworkID 
   




GO
/****** Object:  StoredProcedure [dbo].[spUpdateNetworkImage]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateGroupImage ....
-- Description:	Update group info
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateNetworkImage]
	
	@NetworkID int,
    @FileName varchar(50)

AS

   DECLARE @ID int
   
   UPDATE tbNetworks SET [Image]=@FileName
    WHERE
		NetworkID =@NetworkID 
   





GO
/****** Object:  StoredProcedure [dbo].[spUpdateNetworkPhoto]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateNetworkPhoto 1
-- Description:	update network photo id 
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateNetworkPhoto]
	
	@PhotoID int,
    @Title varchar(100),
	@Desc varchar(200)
   	
AS
   UPDATE tbNetworkPhotos SET PhotoName = @Title, PhotoDesc = @Desc
   WHERE PhotoID = @PhotoID 




GO
/****** Object:  StoredProcedure [dbo].[spUpdateNetworkSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateNetworkSettings 
-- Description:	update network settings
-- =============================================

CREATE PROCEDURE [dbo].[spUpdateNetworkSettings]
	@NetworkID int,
    @Access int, 
    @NonAdminCanWrite bit,
    @ShowGroupEvents bit,
    @EnableDiscussionBoard bit,
    @EnablePhotos bit,
    @EnableVideos bit,
    @EnableLinks bit ,
    @OnlyAllowAdminsToUploadPhotos bit,
    @OnlyAllowAdminsToUploadVideos bit, 
    @OnlyAllowAdminsToPostLinks bit
  
  	
AS
   UPDATE tbNetworkSettings SET Access = @Access,
							  NonAdminCanWrite= @NonAdminCanWrite,	
							  ShowGroupEvents = @ShowGroupEvents,
							  EnableDiscussionBoard = @EnableDiscussionBoard,
							  EnablePhotos = @EnablePhotos,
							  EnableVideos = @EnableVideos,
						      EnableLinks = @EnableLinks,
							  OnlyAllowAdminsToUploadPhotos = @OnlyAllowAdminsToUploadPhotos,
							  OnlyAllowAdminsToUploadVideos = @OnlyAllowAdminsToUploadVideos,
							  OnlyAllowAdminsToPostLinks = @OnlyAllowAdminsToPostLinks


     WHERE NetworkID = @NetworkID


GO
/****** Object:  StoredProcedure [dbo].[spUpdateNetworkVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateGroupVideo 1
-- Description:	update group video id 
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateNetworkVideo]
	
	@VideoID int,
    @Title varchar(100),
	@Desc varchar(200)
   	
AS
   UPDATE tbNetworkVideos SET VideoName = @Title, Description = @Desc
   WHERE VideoID = @VideoID 





GO
/****** Object:  StoredProcedure [dbo].[spUpdateNote]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateNote 
-- Description:	Update a note
-- =============================================

CREATE PROCEDURE [dbo].[spUpdateNote]
    @NoteID int,
	@MemberID int,
    @Title varchar(200),
	@NoteText Text,
	@PrivacyType int

AS   
   UPDATE  tbNotes set Title =@Title, NoteText = @NoteText, PrivacyType=@PrivacyType
   WHERE MemberID =@MemberID and NoteID = @NoteID
   
GO
/****** Object:  StoredProcedure [dbo].[spUpdateNotificationsSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spUpdateNotificationsSettings] 1, ...
-- Description: updates settings for member
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateNotificationsSettings]  
	  
      @MemberID int,
	  @LG_SendMsg bit,
      @LG_AddAsFriend bit,
      @LG_ConfirmFriendShipRequest bit,
      @LG_Poking bit,
      @LG_ConfirmFriendDetails bit,
      @LG_RequestToListAsFamily bit,
      @LG_AddsFriendYouSuggest bit,
      @LG_HasBirthDayComingUp bit,
      @PH_TagInPhoto bit,
      @PH_TagOneOfYourPhotos bit,
      @VI_TagsInVideo bit,
      @VI_TagsOneOfYourVideos bit,
      @VI_CommentOnVideo bit,
      @VI_CommentOnVideoOfYou bit,
      @VI_CommentAfterYouInVideo bit,
      @GP_InviteYouToJoin bit,
      @GP_PromoteToAdmin bit,
      @GP_MakesYouAGPAdmin bit,
      @GP_RequestToJoinGPYouAdmin bit,
      @GP_RepliesToYourDiscBooardPost bit,
      @GP_ChangesTheNameOfGroupYouBelong bit,
      @EV_InviteToEvent bit,
      @EV_DateChanged bit,
      @EV_MakeYouEventAdmin bit,
      @EV_RequestToJoinEventYouAdmin bit,
      @NO_TagsYouInNote bit,
      @NO_CommentYourNotes bit,
      @NO_CommentAfterYouInNote bit,
      @GI_SendYouGift bit,
      @HE_RepliesToYourHelpQuest bit
AS

UPDATE [sn].[dbo].[tbNotificationSettings]
   SET 
       [LG_SendMsg] = @LG_SendMsg
      ,[LG_AddAsFriend] = @LG_AddAsFriend
      ,[LG_ConfirmFriendShipRequest] = @LG_ConfirmFriendShipRequest
      ,[LG_Poking] = @LG_Poking
      ,[LG_ConfirmFriendDetails] = @LG_ConfirmFriendDetails
      ,[LG_RequestToListAsFamily] = @LG_RequestToListAsFamily
      ,[LG_AddsFriendYouSuggest] = @LG_AddsFriendYouSuggest
      ,[LG_HasBirthDayComingUp] = @LG_HasBirthDayComingUp
      ,[PH_TagInPhoto] = @PH_TagInPhoto
      ,[PH_TagOneOfYourPhotos] = @PH_TagOneOfYourPhotos
      ,[VI_TagsInVideo] = @VI_TagsInVideo
      ,[VI_TagsOneOfYourVideos] = @VI_TagsOneOfYourVideos
      ,[VI_CommentOnVideo] = @VI_CommentOnVideo
      ,[VI_CommentOnVideoOfYou] = @VI_CommentOnVideoOfYou
      ,[VI_CommentAfterYouInVideo] = @VI_CommentAfterYouInVideo
      ,[GP_InviteYouToJoin] = @GP_InviteYouToJoin
      ,[GP_PromoteToAdmin] = @GP_PromoteToAdmin
      ,[GP_MakesYouAGPAdmin] = @GP_MakesYouAGPAdmin
      ,[GP_RequestToJoinGPYouAdmin] = @GP_RequestToJoinGPYouAdmin
      ,[GP_RepliesToYourDiscBooardPost] = @GP_RepliesToYourDiscBooardPost
      ,[GP_ChangesTheNameOfGroupYouBelong] = @GP_ChangesTheNameOfGroupYouBelong
      ,[EV_InviteToEvent] = @EV_InviteToEvent
      ,[EV_DateChanged] = @EV_DateChanged
      ,[EV_MakeYouEventAdmin] = @EV_MakeYouEventAdmin
      ,[EV_RequestToJoinEventYouAdmin] = @EV_RequestToJoinEventYouAdmin
      ,[NO_TagsYouInNote] = @NO_TagsYouInNote
      ,[NO_CommentYourNotes] = @NO_CommentYourNotes
      ,[NO_CommentAfterYouInNote] = @NO_CommentAfterYouInNote
      ,[GI_SendYouGift] = @GI_SendYouGift
      ,[HE_RepliesToYourHelpQuest] = @HE_RepliesToYourHelpQuest
 WHERE 
       MemberID = @MemberID
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePrivacyProfileSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spUpdatePrivacyProfileSettings] 1,1,1,1,1,1,1,1,1,1,1,1,1
-- Description: updates settings for member
-- =============================================
CREATE PROCEDURE [dbo].[spUpdatePrivacyProfileSettings]  
	  
	  @MemberID  int,
      @Profile int,
      @BasicInfo  int,
      @PersonalInfo  int,
      @PhotosTagOfYou  int,
      @VideosTagOfYou  int,
      @Friends int,
      @Education  int,
      @WorkInfo int,
      @IMDisplayName int,
      @MobilePhone int,
      @OtherPhone int,
      @EmailAddress int
AS

UPDATE [tbMembersPrivacySettings]
   SET 
       
      [Profile] = @Profile
      ,BasicInfo = @BasicInfo
      ,PersonalInfo = @PersonalInfo
      ,PhotosTagOfYou = @PhotosTagOfYou
      ,VideosTagOfYou = @VideosTagOfYou
      ,ContactInfo = @Friends
      ,Education = @Education
      ,WorkInfo = @WorkInfo
      ,IMDisplayName = @IMDisplayName
      ,MobilePhone = @MobilePhone
      ,OtherPhone = @OtherPhone
      ,EmailAddress = @EmailAddress
     
 WHERE 
       MemberID = @MemberID




GO
/****** Object:  StoredProcedure [dbo].[spUpdatePrivacySearchSettings]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spUpdatePrivacySearchSettings] 1, 2, 0,1,0,1
-- Description: updates settings for member
-- =============================================
CREATE PROCEDURE [dbo].[spUpdatePrivacySearchSettings]  
	  
  @MemberID int,
  @Visibility  int,
  @ViewProfilePicture bit,
  @ViewFriendsList bit,
  @ViewLinkToRequestAddingYouAsFriend bit,
  @ViewLinkToSendYouMsg  bit
AS

UPDATE tbMembersPrivacySettings
   SET        
      Visibility  =@Visibility
	  ,ViewProfilePicture  = @ViewProfilePicture
	  ,ViewFriendsList =@ViewFriendsList
	  ,ViewLinkToRequestAddingYouAsFriend = @ViewLinkToRequestAddingYouAsFriend
	  ,ViewLinkToSendYouMsg  =@ViewLinkToSendYouMsg
     
 WHERE 
       MemberID = @MemberID


GO
/****** Object:  StoredProcedure [dbo].[spUpdateRSVPSStatus]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateRSVPSStatus 1...
-- Description:	updaete event status
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateRSVPSStatus]
    
   @EventID int,
   @MemberID int,
   @Status varchar(50)
   
AS
  UPDATE tbEventInvites SET RSVPStatus = @Status
     WHERE EventID = @EventID and MemberID = @MemberID
GO
/****** Object:  StoredProcedure [dbo].[spUpdateVideo]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec spUpdateVideo
-- Description:	update vid id
-- =============================================

CREATE PROCEDURE [dbo].[spUpdateVideo]
	@VideoID int,
	@VidName varchar(50),
    @VidDesc varchar(200),
    @VidCat	int
	
AS
   UPDATE tbVideos SET VideoName =@VidName,
					   Description =@VidDesc
					   --VidCategory = @VidCat
   WHERE 
         VideoID =@VideoID
GO
/****** Object:  StoredProcedure [dbo].[spValidateMemberFriend]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- example: exec [spValidateMemberFriend] 1,'test@testemail.com.com', '', 'email'
-- Description:	gets a member from tbmembers table
-- =============================================
CREATE PROCEDURE [dbo].[spValidateMemberFriend]
	
	@MemberID int,
    @Friend varchar(50),
    @LastName varchar(50),
	@SearchType varchar(20)
	
AS
     IF (@SearchType ='Email') BEGIN 
     
        select * from tbMembers s join  
			(select ContactID as friendid   from tbMemberProfile p
			   join tbMembers m on p.memberid = m.memberid
			   join tbContacts f on m.memberid = f.memberid
			   where m.memberid =@MemberID
			 ) t on s.memberid = t.friendid
		where  
			 email =@Friend
     END

     ELSE BEGIN     
       
	     select * from tbMemberProfile s join  
			(select ContactID as friendid  from tbMemberProfile p
				join tbMembers m on p.memberid = m.memberid
				join tbContacts f on m.memberid = f.memberid
				where m.memberid =@MemberID
			 ) t on s.memberid = t.friendid
			where 
				  firstname =@Friend and lastname =@LastName

     END 
     











GO
/****** Object:  StoredProcedure [dbo].[spValidateNewRegisteredUser]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		DB developer	
-- Create date: 05/2025
-- Description:	returns new member info if validated
-- example: exec [spValidateNewRegisteredUser] 'test@testemail.com.com', 2
-- =============================================
CREATE PROCEDURE [dbo].[spValidateNewRegisteredUser]
	
	@Email varchar(100),
	@Code int

AS

BEGIN
    SELECT M.MemberID, Email, FirstName, LastName  FROM tbMembers M left join tbMemberProfile P ON M.MemberID = P.MemberID 
	    INNER join  tbMembersRegistered  R ON M.MemberID = R.MemberID           
		   Where MemberCodeID = @Code and Email = @Email and Status = 1

END




GO
/****** Object:  StoredProcedure [dbo].[spWildCardSearchResults]    Script Date: 4/30/2025 2:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWildCardSearchResults]
	
	@MemberID int,	
   	@SearchText varchar(100)
   
AS 
 select * from (
    -- people search
	SELECT m.MemberID as EntityID, 
           t.FirstName + ' ' + t.LastName as EntityName, 
           CASE 
                WHEN picturePath is null THEN  'default.png'
                WHEN ps.ViewProfilePicture = 0 THEN 'default.png'
                ELSE picturepath
		   END as PicturePath, 
           --ISNULL('../members/images/' + picturepath,'../members/images/default.png') as PicturePath,    
		   CASE 
				WHEN m.memberID = @MemberID then 'View Profile' -- same person
				WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile'
				WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
				ELSE 'Add as Contact' 
		   END as LabelText, 
           m.Email,
           Cast(m.MemberID as varchar(20)) + ',' + t.FirstName + ',' + t.LastName as NameAndID,  
           Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' as Params,
	       Cast(m.MemberID as varchar(20)) + ',''' + t.FirstName + ''',''' + t.LastName + '''' +
             ',''' + CASE 
		     WHEN m.memberID = @MemberID then 'View Profile' -- same person
             WHEN m.memberID in (select toMemberID from tbContactRequests where FromMemberID= @MemberID) then 'View Profile' 
		     WHEN (m.memberID in (select ContactID from tbContacts where MemberID = @MemberID) and m.memberID <> @MemberID) then 'View Profile' -- already friends 
		     ELSE 'Add as Contact' 
	       END + ''''  as ParamsAV, 
            case when TitleDesc ='' then  ''
                when TitleDesc is null then '' 
                else City + ', ' + state end   as CityState, 
            case when TitleDesc ='' then  City + ', ' + state 
                when TitleDesc is null then City + ', ' + state 
                else TitleDesc end  as description, '' as MemberCount, 
           '01/01/1900' as CreatedDate,
           '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate,   
           '' as ShowCancel, 'people' as sType,
           'people' + '~' + cast(m.memberID as varchar(20)) + '~' +  t.FirstName + '~' + t.LastName as ParamsData        
	FROM tbMembers m JOIN tbMemberProfile t on m.memberid = t.memberid
         left join tbMemberProfileContactInfo c on m.memberid = c.memberId
         join tbMembersPrivacySettings ps on m.memberid = ps.memberid and (ps.visibility = 1 or (ps.visibility = 3 and m.memberID in (select cc.contactid from tbContacts cc where cc.memberid =@memberID) ) )
	WHERE 
        t.firstname like @SearchText + '%' or t.lastname like @SearchText + '%'

    UNION
    
    -- event search
    SELECT  E.eventid  as EntityID, 
       planningwhat  as EntityName,
       isnull(eventimg,'default.png') as PicturePath, 
       '' as LabelText, 
       '' as Email, 
       '' as NameAndID,
	   (CAST(e.eventid AS varchar(20)) + ';' + planningwhat + ';' + RSVPStatus + ';' +  isnull(eventimg,'default.png') + ';' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime)  as Params,
	   '' as ParamsAV, 
       '' as CityState, 
       'When: ' + CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime + '</br>Where: ' + location  as description, '' as MemberCount, 
       '01/01/1900' as CreatedDate,     
       location,        
       CAST (( DATENAME(MM, startdate) + RIGHT(CONVERT(VARCHAR(12), startdate, 107), 9))  AS varchar(50))  + ' at ' + startTime AS eventdate,
	   Case when i.MemberID = @MemberID then RSVPStatus else null end as RSVP, 	     
	   startdate, 
       enddate,	 
	   case when e.memberID = @MemberID then 'true' else 'false' end as ShowCancel, 'event' as sType,
       'event' + '~' + cast(e.eventiD as varchar(20)) + '~' +  planningWhat + '~' +  Cast(NetworkID as varchar(20)) as ParamsData 
	FROM tbEvents E left join tbEventInvites I on E.EventID = I.EventID  
	WHERE e.PlanningWhat like '%' + @SearchText + '%'   -- order by StartDate desc
	
    UNION

	-- network search
    SELECT n.NetworkID as EntityID, 
           n.NetworkName as EntityName, 
           ISNULL([Image],'default.png') as PicturePath,    
	CASE 		
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr where nr.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm where nm.MemberID = @MemberID) then 'View Network' 
		ELSE 'Join Network' 
	END as LabelText, 
    ISNULL(Email,'') as Email ,
    Cast(n.NetworkID as varchar(20)) + ',' + n.NetworkName as NameAndID  
    ,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName +  '''' as Params
	,Cast(n.NetworkID as varchar(20)) + ',''' + n.NetworkName  + '''' +
       ',''' + CASE 
		WHEN n.NetworkID in (select NetworkID from tbNetworkRequests nr2 where nr2.MemberID= @MemberID) then 'View Network'
		WHEN n.NetworkID in (select NetworkID from tbNetworkMembers nm2 where nm2.MemberID = @MemberID) then 'View Network'
		ELSE 'Join Network' 
	END + '''' as ParamsAV, 
    'Created On ' + Cast(isnull(createddate, '') as varchar(50)) + '</br>' + cast( (select count(s.networkID) from tbNetworkMembers s where s.networkid = n.networkid) as varchar(100)) + ' member(s)'  as CityState,
    Description, '0 Members' as MemberCount, 
    isnull(createddate, '') as CreatedDate, 
    
		'' as location,
		'' as eventdate,
		'' as rsvp,
		'' as startdate,
		'' as enddate, '' as ShowCancel, 'network' as sType,
        'network' + '~' + cast(n.NetworkID as varchar(20)) + '~' +  n.NetworkName as ParamsData  	        
	FROM tbNetworks n
	WHERE 
        n.NetworkName like @SearchText + '%' 
	
    UNION

    -- search schools
    select * from (
      select
           lgid as EntityID, 
           schoolName as EntityName, 
           ISNULL([ImageFile],'default.png') as PicturePath,    	
		   '' as LabelText, 
           '' as Email ,
           Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
		   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,
           '' as ParamsAV, 
		   '(' + SUBSTRING(phone, 1, 3) + ') ' + SUBSTRING(phone, 4, 3) + '-' + SUBSTRING(phone, 7, 4) as CityState,
		   city + ', ' + state as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'private' as sType, 
           
           'private' + '~' + cast(lgid as varchar(20)) + '~' + ISNULL(schoolname,'') + '~' + ISNULL(streetname,'') + '~' + ISNULL(city,'') + '~' + ISNULL(state,'') + '~' + ISNULL(zip,'') + '~' + ISNULL(county,'') + '~' + 
           ISNULL(phone,'') + '~' + ISNULL(PSS_Enroll_T,'') + '~' + ISNULL(PSS_Relig,'') + '~' + ISNULL(PSS_ASSOC_1,'') + '~' + ISNULL(PSS_Locale,'')           
           as ParamsData

      from dbo.tbPrivateSchools 

	  union

	  select 
           lgid as EntityID, 
           schoolName as EntityName, 
           ISNULL([ImageFile],'default.png') as PicturePath,    	
		   '' as LabelText, 
           '' as Email,
           Cast(lgid as varchar(20)) + ',' + schoolName as NameAndID,
		   Cast(lgid as varchar(20)) + ',''' + schoolName +  '''' as Params,
           '' as ParamsAV, 
		   '(' + SUBSTRING(phone, 1, 3) + ') ' + SUBSTRING(phone, 4, 3) + '-' + SUBSTRING(phone, 7, 4) as CityState,
		   City + ', ' + State as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
          'public' as sType , 

           'public' + '~' + cast(lgid as varchar(20)) + '~' + isnull(schoolName,'') + '~' + isnull(district,'') + '~' + isnull(StreetName,'') + '~' + isnull(city,'') + '~' + isnull(state,'') + '~' + isnull(zip,'') + '~' + 
           isnull(phone,'') + '~' + isnull(charter,'') + '~' + isnull(magnet,'') + '~' + isnull(Titlle1School,'') + '~' + isnull(countryName,'') + '~' + 
           cast(isnull(students,0) as varchar(20)) + '~' + cast(isnull(teachers,0) as varchar(20)) + '~' + isnull(locale,'') 
           as ParamsData
      from dbo.tbPublicSchools 

	  union

	  select 
           schoolid as EntityID,
           [name] as EntityName,
           ISNULL([ImageFile],'default.png') as PicturePath, 
		   '' as LabelText, 
           '' as Email,
           Cast(schoolid as varchar(20)) + ',' + [name] as NameAndID,
		   Cast(schoolid as varchar(20)) + ',''' + [name] +  '''' as Params,	           
		   '' as ParamsAV, 
		   phone as CityState,
		   address as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'college' as sType , 

           'college' + '~' + cast(schoolid as varchar(20)) + '~' + isnull([name],'') + '~' +  isnull(address,'') + '~' + isnull(phone,'') + '~' + isnull(website,'') + '~' + isnull([type],'') + '~' + isnull(awardsOffered,'') + '~' + isnull(CampusSetting,'') + '~' +  isnull(campusHousing,'')  + '~' + Cast(isnull(StudentPopulation,'') as varchar(20)) + '~' +
           Cast(isnull(UnderGradStudents,'') as varchar(20))  as ParamsData

       from tbColleges 
	  ) AS TB2
	  WHERE EntityName 	like @SearchText + '%' 
    
     UNION

     -- organizations
      select 
           id as EntityID,
           [name] as EntityName,
           ISNULL([ImageFile],'default.png') as PicturePath, 
		   '' as LabelText, 
           '' as Email,
           Cast(id as varchar(20)) + ',' + [name] as NameAndID,
		   Cast(id as varchar(20)) + ',''' + [name] +  '''' as Params,	           
		   '' as ParamsAV, 
		   '<a target="_blank" href="' + webSite + '">' + webSite + '</a>' as CityState,
		   sector + ' - ' + industry as Description, '0 Members' as MemberCount,
		   '' as CreatedDate,     
	       '' as location,
		   '' as eventdate,
		   '' as rsvp,
		   '' as startdate,
		   '' as enddate, '' as ShowCancel,
           'company' as sType , 
           'company' + '~' + cast(id as varchar(20)) + '~' + isnull([name],'') + '~' + isnull(sector,'') + '~' + isnull(industry,'') + '~' + isnull(IPOYear,'') + '~' + isnull(SummaryQuote,'') + '~' + isnull(website,'') + '~' +  Cast(isnull(description,'') as varchar(1000)) as ParamsData
       from tbCompanies where [name] like @SearchText + '%' 
     
) AS TB1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-waiting, 1-accepted, 2-rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbContactRequests', @level2type=N'COLUMN',@level2name=N'ToMemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' status (rejected=2, accepted=1, deleted=3, requested=0)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbContacts', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attending, May Attend, Not Attending, Not Yet Replied' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbEventInvites', @level2type=N'COLUMN',@level2name=N'RSVPStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1- full time, 2-part time; 3-contract, 4-temporary' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbJobs', @level2type=N'COLUMN',@level2name=N'JobType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1.executive, 2.Director, 3.Manager,4.Senior level, 5. Associate, 6. Entry Level, 7.Internship, 8. Not applicable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbJobs', @level2type=N'COLUMN',@level2name=N'ExperienceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'draft=1, open=2, close=3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbJobs', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'network or memberid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbLinks', @level2type=N'COLUMN',@level2name=N'OwnerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1- memberid,  2-groupid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbLinks', @level2type=N'COLUMN',@level2name=N'OwnerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 private , 2 contacts only, 0 public' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbLinks', @level2type=N'COLUMN',@level2name=N'PrivacyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-photo, 2-video, 3-liink' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbMemberPosts', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 pub, 2 priv, 3 col' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbMemberProfileEducationV2', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-NewlyRegistered,2-Active, 3-InActive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbMembers', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=available, 2=busy, 3=offline' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbMembers', @level2type=N'COLUMN',@level2name=N'ChatStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-everyone, 2-friends of firends, 3- only friends, 4-only you' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbMembersPrivacySettings', @level2type=N'COLUMN',@level2name=N'Profile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=waiting, 1=joined,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkMemberInvites', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = waiting, 1=Accepted, 2=rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkMemberRequests', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-active, 3-inactive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkMembers', @level2type=N'COLUMN',@level2name=N'JoinedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 not active, 1 active, 2 delete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkMembers', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-waiting; 1-Approve, 2-Rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkRequests', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - open (open to anyone to join), 2-close (must request from admins), 3 - secret (will not appear in search results)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbNetworkSettings', @level2type=N'COLUMN',@level2name=N'Access'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=flash; 2:wmv' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVideos', @level2type=N'COLUMN',@level2name=N'VidType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_GrpDescription', @value=N'1=flash; 2:wmv' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVideos', @level2type=N'COLUMN',@level2name=N'VidType'
GO
