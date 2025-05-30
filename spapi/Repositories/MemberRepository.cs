﻿using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using spapi.Models.Member;
using spapi.Interfaces;
using System.Data;
using System.Data.Common;
using Google.Apis.YouTube.v3;
using Google.Apis.Services;
using spapi.Models;
using spapi.Data;

namespace spapi.Repositories
{
    /// <summary>
    /// Describes the functionalities for accessing data for members
    /// </summary>
    public class MemberRepository(ICommonRepository commonRepo, DBContextModel context,
           IConfiguration configuration) : IMemberRepository
    {
        #region methods...
        private readonly IConfiguration _configuration = configuration;
        readonly ICommonRepository _commonRepo = commonRepo;
        public readonly DBContextModel _context = context;

        public string SavePosts(int memberID, int postID, String postMsg)
        {
            if (postID == 0)
                CreateMemberPost(memberID, postMsg);
            else
                CreatePostComment(memberID, postID, postMsg);
            return "success";
        }

        public void CreateMemberPost(int memberID, string postMsg)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pPostMsg = new SqlParameter("@PostMsg", postMsg);
            _context.Database.ExecuteSqlRaw("EXEC spCreateMemberPost @MemberID, @PostMsg", mID, pPostMsg);
        }

        public void CreatePostComment(int memberID, int postID, string postMsg)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pPostID = new SqlParameter("@PostID", postID);
            var pPostMsg = new SqlParameter("@PostMsg", postMsg);
            _context.Database.ExecuteSqlRaw(" EXEC spCreatePostComment @MemberID, @PostID, @PostMsg", mID, pPostID, pPostMsg);
        }

        public List<RecentPostChildModel> GetMemberPostResponses(int postID)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "spGetMemberChildPosts";

                // Add the input parameter and set its properties.
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@PostID";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Input;
                parameter.Value = postID;

                // Add the parameter to the Parameters collection. 
                command.Parameters.Add(parameter);

                List<RecentPostChildModel> cList = new List<RecentPostChildModel>();

                _context.Database.OpenConnection();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            RecentPostChildModel pc = new RecentPostChildModel();
                            pc.postID = reader.GetInt32(1);
                            pc.postResponseID = reader.GetInt32(0);
                            pc.description = reader.GetString(2);
                            pc.dateResponded = reader.GetString(3);
                            pc.memberID = reader.GetInt32(4);
                            pc.picturePath = reader.GetString(5);
                            pc.memberName = reader.GetString(6);
                            pc.firstName = reader.GetString(7);
                            cList.Add(pc);
                        }
                    }
                    reader.Close();
                }
                return cList;
            }
        }

        public List<MemberPostsModel> GetMemberPosts(int memberID)
        {
            var l = (from d in _context.TbContacts where d.MemberId == memberID select d.ContactId).ToList();
            l.Add(memberID);

            List<MemberPostsModel> lst;
            lst = (from mn in _context.TbMemberPosts
                   join mnn in _context.TbMemberProfiles on mn.MemberId equals mnn.MemberId
                   // where l.Contains((int)mn.MemberId!)
                   orderby mn.PostDate descending
                   select new MemberPostsModel()
                   {
                       PostID = mn.PostId.ToString(),
                       Title = mn.Title ?? "",
                       Description = mn.Description ?? "",
                       DatePosted = mn.PostDate.ToString() ?? "",
                       AttachFile = mn.AttachFile ?? "",
                       MemberID = mn.MemberId.ToString() ?? "",
                       PicturePath = mnn.PicturePath ?? "default.png",
                       MemberName = mnn.FirstName + " " + mnn.LastName,
                       FirstName = mnn.FirstName ?? "",
                       ChildPostCnt = "0"
                   }).Take(18).ToList();
            return lst;
        }

        public List<TbRecentNews> LGRecentNews()
        {
            List<TbRecentNews> lst = _commonRepo.GetRecentNews();
            return lst;
        }

        /// <summary>
        /// Get member dates
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<MemberDatesModel> GetMemberDates(int memberID)
        {
            List<MemberDatesModel> lst = (from m in _context.TbMemberProfiles
                                          where m.MemberId == memberID

                                          select new MemberDatesModel()
                                          {
                                              JoinedDate = m.JoinedDate.ToString() ?? "",
                                              PicturePath = string.IsNullOrEmpty(m.PicturePath) ? "default.png" : m.PicturePath,
                                              MemberName = m.FirstName + " " + m.LastName,
                                              CurrentCity = m.CurrentCity ?? "",
                                              BirthDate = m.Dobmonth + "/" + m.Dobday + "/" + m.Dobyear,
                                          }
                     ).ToList();
            return lst;
        }


        /// <summary>
        /// Get member general information
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public MemberProfileGenInfoModel GetMemberGeneralInfoV2(int memberID)
        {

            var mp = (from m in _context.TbMemberProfiles
                      join r in _context.TbInterests on m.InterestedInType equals r.InterestId into grp
                      from r in grp.DefaultIfEmpty()
                      where m.MemberId == memberID

                      select new MemberProfileGenInfoModel()
                      {

                          MemberID = m.MemberId.ToString(),
                          FirstName = m.FirstName ?? "",
                          MiddleName = m.MiddleName ?? "",
                          LastName = m.LastName ?? "",
                          Sex = m.Sex ?? "",
                          ShowSexInProfile = m.ShowSexInProfile ?? false,
                          DOBMonth = m.Dobmonth ?? "",
                          DOBDay = m.Dobday ?? "",
                          DOBYear = m.Dobyear ?? "",
                          ShowDOBType = m.ShowDobtype ?? false,
                          Hometown = m.Hometown ?? "",
                          HomeNeighborhood = m.HomeNeighborhood ?? "",
                          CurrentStatus = m.CurrentStatus!.ToString() ?? "",
                          InterestedInType = m.InterestedInType.ToString() ?? "",
                          LookingForEmployment = m.LookingForEmployment ?? false,
                          LookingForRecruitment = m.LookingForRecruitment ?? false,
                          LookingForPartnership = m.LookingForPartnership ?? false,
                          LookingForNetworking = m.LookingForNetworking ?? false,
                          Sport = m.Sport ?? "",
                          Bio = m.Bio ?? "",
                          Height = m.Height ?? "",
                          Weight = m.Weight ?? "",
                          LeftRightHandFoot = m.LeftRightHandFoot ?? "",
                          PreferredPosition = m.PreferredPosition ?? "",
                          SecondaryPosition = m.SecondaryPosition ?? "",
                          PicturePath = m.PicturePath ?? "",
                          JoinedDate = m.JoinedDate.ToString() ?? "",
                          CurrentCity = m.CurrentCity ?? "",
                          TitleDesc = m.TitleDesc ?? "",
                          InterestedDesc = r == null ? String.Empty : r.InterestDesc!
                      }).ToList();

            return mp[0];
        }


        /// <summary>
        /// Get member general information
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<TbMemberProfile> GetMemberGeneralInfo(int memberID)
        {
            var mp = (from m in _context.TbMemberProfiles where m.MemberId == memberID select m).ToList();
            return mp;
        }

        /// <summary>
        /// get interest description
        /// </summary>
        /// <param name="interestID"></param>
        /// <returns></returns>
        public string GetInterestDescription(int interestID)
        {
            var mp = (from m in _context.TbInterests where m.InterestId == interestID select m).ToList();

            if (mp.Count != 0)
            {
                return mp[0].InterestDesc ?? "";
            }
            else
                return "";
        }

        /// <summary>
        /// Get member personal information
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<TbMemberProfilePersonalInfo> GetMemberPersonalInfo(int memberID)
        {
            var mp = (from m in _context.TbMemberProfilePersonalInfos where m.MemberId == memberID select m).ToList();
            return mp;
        }

        /// <summary>
        /// Get member contact information
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<TbMemberProfileContactInfo> GetMemberConnectionInfo(int memberID)
        {
            var mp = (from m in _context.TbMemberProfileContactInfos where m.MemberId == memberID select m).ToList();
            return mp;
        }

        /// <summary>
        ///  Get member education information
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<MemberProfileEducationModel> GetMemberEducationInfo(int memberID)
        {
            _context.Database.OpenConnection();
            DbCommand cmd = _context.Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "spGetMemberSchools";
            cmd.CommandType = CommandType.StoredProcedure;

            DbParameter param1 = cmd.CreateParameter();
            param1.ParameterName = "@MemberID";
            param1.Value = memberID;

            cmd.Parameters.Add(param1);

            List<MemberProfileEducationModel> l = new List<MemberProfileEducationModel>();
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    MemberProfileEducationModel m = new MemberProfileEducationModel();
                    m.Degree = reader["DegreeTypeDesc"].ToString() ?? "";
                    m.DegreeTypeID = reader["DegreeType"].ToString() ?? "";
                    m.SchoolAddress = reader["Address"].ToString() ?? "";
                    m.SchoolID = reader["SchoolId"].ToString() ?? "";
                    m.SchoolImage = reader["fileImage"].ToString() ?? "";
                    m.SchoolName = reader["SchoolName"].ToString() ?? "";
                    m.YearClass = reader["ClassYear"].ToString() ?? "";
                    m.SchoolType = reader["SchoolType"].ToString() ?? "";
                    m.Major = reader["Major"].ToString() ?? ""; ;
                    m.SportLevelType = reader["SportLevelType"].ToString() ?? "";
                    l.Add(m);
                }
            }
            return l;
        }

        /// <summary>
        /// Get Member profile general info
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="saveInfo"></param>
        public void SaveMemberGeneralInfo(int memberID, MemberProfileGenInfoModel saveInfo)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pFirstName = new SqlParameter("@FirstName", saveInfo.FirstName);
            var pMidName = new SqlParameter("@MiddleName", saveInfo.MiddleName);
            var pLastName = new SqlParameter("@LastName", saveInfo.LastName);

            var pTitle = new SqlParameter("@Title", saveInfo.TitleDesc);
            var pInterest = new SqlParameter("@InterestIn", saveInfo.InterestedInType);
            var pStatus = new SqlParameter("@CurrentStatus", saveInfo.CurrentStatus);
            var pGender = new SqlParameter("@Gender", saveInfo.Sex);
            var pShowGender = new SqlParameter("@ShowGender", saveInfo.ShowSexInProfile);
            var pDOBMonth = new SqlParameter("@DOBMonth", saveInfo.DOBMonth);
            var pDOBDay = new SqlParameter("@DOBDay", saveInfo.DOBDay);
            var pDOBYear = new SqlParameter("@DOBYear", saveInfo.DOBYear);
            var pShowDOB = new SqlParameter("@ShowDOB", saveInfo.ShowDOBType);
            var pLookingForPartnership = new SqlParameter("@LookingForPartnership", saveInfo.LookingForPartnership);
            var pLookingForEmployment = new SqlParameter("@LookingForEmployment", saveInfo.LookingForEmployment);
            var pLookingForRecruitment = new SqlParameter("@LookingForRecruitment", saveInfo.LookingForRecruitment);
            var pLookingForNetworking = new SqlParameter("@LookingForNetworking", saveInfo.LookingForNetworking);

            var pSport = new SqlParameter("@Sport", saveInfo.Sport);
            var pBio = new SqlParameter("@Bio", saveInfo.Bio);
            var pHeight = new SqlParameter("@Height", saveInfo.Height);
            var pWeight = new SqlParameter("@Weight", saveInfo.Weight);
            var pLeftRightHandFoot = new SqlParameter("@LeftRightHandFoot", saveInfo.LeftRightHandFoot);
            var pPreferredPosition = new SqlParameter("@PreferredPosition", saveInfo.PreferredPosition);
            var pSecondaryPosition = new SqlParameter("@SecondaryPosition", saveInfo.SecondaryPosition);
            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberGeneralInfo @MemberID, @FirstName, @MiddleName, @LastName, @Title,@InterestIn, @CurrentStatus, @Gender, @ShowGender, @DOBMonth, @DOBDay, @DOBYear,@ShowDOB,@lookingForPartnership, @lookingForEmployment, @lookingForRecruitment, @lookingForNetworking, @Sport, @Bio, @Height, @Weight, @LeftRightHandFoot, @PreferredPosition, @SecondaryPosition ",
                                            mID, pFirstName, pMidName, pLastName, pTitle, pInterest, pStatus, pGender, pShowGender, pDOBMonth, pDOBDay, pDOBYear,
                                            pShowDOB, pLookingForPartnership, pLookingForEmployment, pLookingForRecruitment,
                                            pLookingForNetworking, pSport, pBio, pHeight, pWeight,
                                            pLeftRightHandFoot, pPreferredPosition, pSecondaryPosition);
        }


        /// <summary>
        /// Save member personal information
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="activities"></param>
        /// <param name="interests"></param>
        /// <param name="specialSkills"></param>
        /// <param name="aboutMe"></param>
        public void SaveMemberPersonalInfo(
                     int memberID,
                     string activities,
                     string interests,
                     string specialSkills,
                     string aboutMe)
        {
            if (String.IsNullOrEmpty(activities)) activities = "";
            if (String.IsNullOrEmpty(interests)) interests = "";
            if (String.IsNullOrEmpty(specialSkills)) specialSkills = "";
            if (String.IsNullOrEmpty(aboutMe)) aboutMe = "";

            var mID = new SqlParameter("@MemberID", memberID);
            var pActivities = new SqlParameter("@Activities", activities);
            var pInterests = new SqlParameter("@Interests", interests);
            var pSpecialSkills = new SqlParameter("@SpecialSkills", specialSkills);
            var pAboutMe = new SqlParameter("@AboutMe", aboutMe);

            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberPersonalInfo @MemberID, @Activities, @Interests, @SpecialSkills, @AboutMe",
                                               mID, pActivities, pInterests, pSpecialSkills, pAboutMe);
        }

        public void SaveMemberContactInfoV2(int memberID,
                              string email,
                              string otherEmail, string facebook, string instagram, string twitter,
                              string website, string homePhone, string cellPhone, string address, string city,
                              string neighborhood, string state, string zip,
                              string showAddress, string showEmailToMembers, string showCellPhone, string showHomePhone)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pEmail = new SqlParameter("@Email", string.IsNullOrEmpty(email) ? "" : email);

            bool s = false;
            if (showEmailToMembers == "true") s = true;
            var pShowEmailToMembers = new SqlParameter("@ShowEmailToMembers", s);
            var pOtherEmail = new SqlParameter("@OtherEmail", string.IsNullOrEmpty(otherEmail) ? "" : otherEmail);

            var pFacebook = new SqlParameter("@Facebook", string.IsNullOrEmpty(facebook) ? "" : facebook);
            var pInstagram = new SqlParameter("@Instagram", string.IsNullOrEmpty(instagram) ? "" : instagram);
            var pTwitter = new SqlParameter("@Twitter", string.IsNullOrEmpty(twitter) ? "" : twitter);
            var pWebsite = new SqlParameter("@Website", string.IsNullOrEmpty(website) ? "" : website);

            var pHomePhone = new SqlParameter("@HomePhone", string.IsNullOrEmpty(homePhone) ? "" : homePhone);
            bool p = false;
            if (showHomePhone == "true") p = true;
            var pShowHomePhone = new SqlParameter("@ShowHomePhone", p);
            var pCellPhone = new SqlParameter("@CellPhone", string.IsNullOrEmpty(cellPhone) ? "" : cellPhone);
            bool c = false;
            if (showCellPhone == "true") c = true;
            var pShowCellPhone = new SqlParameter("@ShowCellPhone", c);

            var pAddress = new SqlParameter("@Address", string.IsNullOrEmpty(address) ? "" : address);
            bool a = false;
            if (showAddress == "true") a = false;
            var pShowAddress = new SqlParameter("@ShowAddress", a);
            var pCity = new SqlParameter("@City", string.IsNullOrEmpty(city) ? "" : city);
            var pState = new SqlParameter("@State", string.IsNullOrEmpty(state) ? "" : state);
            var pZipCode = new SqlParameter("@ZipCode", string.IsNullOrEmpty(zip) ? "" : zip);

            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberContactInfo @MemberID, @Email, @ShowEmailToMembers, @OtherEmail, @Facebook, @Instagram, @Twitter, @Website, @HomePhone, @ShowHomePhone, @CellPhone, @ShowCellPhone, @Address, @ShowAddress, @City,@State,@ZipCode ",
                                                   mID, pEmail, pShowEmailToMembers, pOtherEmail, pFacebook, pInstagram, pTwitter, pWebsite,
                                                   pHomePhone, pShowHomePhone, pCellPhone, pShowCellPhone, pAddress, pShowAddress, pCity,
                                                   pState, pZipCode);
        }

        public void SaveMemberContactInfo(int memberID, MemberProfileContactInfoModel body)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pEmail = new SqlParameter("@Email", string.IsNullOrEmpty(body.Email) ? "" : body.Email);
            var pShowEmailToMembers = new SqlParameter("@ShowEmailToMembers", body.ShowEmailToMembers);
            var pOtherEmail = new SqlParameter("@OtherEmail", string.IsNullOrEmpty(body.OtherEmail) ? "" : body.OtherEmail);

            var pFacebook = new SqlParameter("@Facebook", string.IsNullOrEmpty(body.Facebook) ? "" : body.Facebook);
            var pInstagram = new SqlParameter("@Instagram", string.IsNullOrEmpty(body.Instagram) ? "" : body.Instagram);
            var pTwitter = new SqlParameter("@Twitter", string.IsNullOrEmpty(body.Twitter) ? "" : body.Twitter);
            var pWebsite = new SqlParameter("@Website", string.IsNullOrEmpty(body.Website) ? "" : body.Website);

            var pHomePhone = new SqlParameter("@HomePhone", string.IsNullOrEmpty(body.HomePhone) ? "" : body.HomePhone);
            var pShowHomePhone = new SqlParameter("@ShowHomePhone", body.ShowHomePhone);
            var pCellPhone = new SqlParameter("@CellPhone", string.IsNullOrEmpty(body.CellPhone) ? "" : body.CellPhone);
            var pShowCellPhone = new SqlParameter("@ShowCellPhone", body.ShowCellPhone);

            var pAddress = new SqlParameter("@Address", string.IsNullOrEmpty(body.Address) ? "" : body.Address);
            var pShowAddress = new SqlParameter("@ShowAddress", body.ShowAddress);
            var pCity = new SqlParameter("@City", string.IsNullOrEmpty(body.City) ? "" : body.City);
            var pState = new SqlParameter("@State", string.IsNullOrEmpty(body.State) ? "" : body.State);
            var pZipCode = new SqlParameter("@ZipCode", string.IsNullOrEmpty(body.Zip) ? "" : body.Zip);

            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberContactInfo @MemberID, @Email, @ShowEmailToMembers, @OtherEmail, @Facebook, @Instagram, @Twitter, @Website, @HomePhone, @ShowHomePhone, @CellPhone, @ShowCellPhone, @Address, @ShowAddress, @City,@State,@ZipCode ",
                                                   mID, pEmail, pShowEmailToMembers, pOtherEmail, pFacebook, pInstagram, pTwitter, pWebsite,
                                                   pHomePhone, pShowHomePhone, pCellPhone, pShowCellPhone, pAddress, pShowAddress, pCity,
                                                   pState, pZipCode);
        }


        /// <summary>
        /// Save member education information
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="highSchool"></param>
        /// <param name="highSchoolClassYear"></param>
        /// <param name="college1"></param>
        /// <param name="college1ClassYear"></param>
        /// <param name="college1Major"></param>
        /// <param name="college1DegreeType"></param>
        /// <param name="college1Societies"></param>
        /// <param name="college2"></param>
        /// <param name="college2ClassYear"></param>
        /// <param name="college2Major"></param>
        /// <param name="college2DegreeType"></param>
        /// <param name="college2Societies"></param>
        public void SaveMemberEducationInfo(int memberID,
                                    string highSchool,
                                    string highSchoolClassYear,
                                    string college1,
                                    string college1ClassYear,
                                    string college1Major,
                                    int college1DegreeType,
                                    string college1Societies,
                                    string college2,
                                    string college2ClassYear,
                                    string college2Major,
                                    int college2DegreeType,
                                    string college2Societies)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pHighSchool = new SqlParameter("@HighSchool", highSchool);
            var pHighSchoolClassYear = new SqlParameter("@HighSchoolClassYear", highSchoolClassYear);
            var pCollege1 = new SqlParameter("@College1", college1);
            var pCollege1ClassYear = new SqlParameter("@College1ClassYear", college1ClassYear);
            var pCollege1Major = new SqlParameter("@College1Major", college1Major);
            var pCollege1DegreeType = new SqlParameter("@College1DegreeType", college1DegreeType);
            var pCollege1Societies = new SqlParameter("@College1Societies", college1Societies);
            var pCollege2 = new SqlParameter("@College2", college2);
            var pCollege2ClassYear = new SqlParameter("@College2ClassYear", college2ClassYear);
            var pCollege2Major = new SqlParameter("@College2Major", college2Major);
            var pCollege2DegreeType = new SqlParameter("@College2DegreeType", college2DegreeType);
            var pCollege2Societies = new SqlParameter("@College2Societies", college2Societies);

            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberEducationInfo @MemberID,@HighSchool, @HighSchoolClassYear, @College2, @College2ClassYear, @College2Major, @College2DegreeType, @College2Societies,",
                                               mID, pHighSchool, pHighSchoolClassYear, pCollege1, pCollege1ClassYear, pCollege1Major, pCollege1DegreeType,
                                               pCollege1Societies, pCollege2, pCollege2ClassYear, pCollege2Major, pCollege2DegreeType, pCollege2Societies);

        }


        /// <summary>
        /// save member employment information
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="employer"></param>
        /// <param name="emp1Position"></param>
        /// <param name="emp1JobDesc"></param>
        /// <param name="emp1City"></param>
        /// <param name="emp1State"></param>
        /// <param name="emp1StartMonth"></param>
        /// <param name="emp1StartYear"></param>
        /// <param name="emp1EndMonth"></param>
        /// <param name="emp1EndYear"></param>
        /// <param name="employer2"></param>
        /// <param name="emp2Position"></param>
        /// <param name="emp2JobDesc"></param>
        /// <param name="emp2City"></param>
        /// <param name="emp2State"></param>
        /// <param name="emp2StartMonth"></param>
        /// <param name="emp2StartYear"></param>
        /// <param name="emp2EndMonth"></param>
        /// <param name="emp2EndYear"></param>
        /// <param name="employer3"></param>
        /// <param name="emp3Position"></param>
        /// <param name="emp3JobDesc"></param>
        /// <param name="emp3City"></param>
        /// <param name="emp3State"></param>
        /// <param name="emp3StartMonth"></param>
        /// <param name="emp3StartYear"></param>
        /// <param name="emp3EndMonth"></param>
        /// <param name="emp3EndYear"></param>
        public void SaveMemberEmploymentInfo(int memberID,
                              string employer,
                              string emp1Position,
                              string emp1JobDesc,
                              string emp1City,
                              string emp1State,
                              string emp1StartMonth,
                              string emp1StartYear,
                              string emp1EndMonth,
                              string emp1EndYear,

                              string employer2,
                              string emp2Position,
                              string emp2JobDesc,
                              string emp2City,
                              string emp2State,
                              string emp2StartMonth,
                              string emp2StartYear,
                              string emp2EndMonth,
                              string emp2EndYear,

                              string employer3,
                              string emp3Position,
                              string emp3JobDesc,
                              string emp3City,
                              string emp3State,
                              string emp3StartMonth,
                              string emp3StartYear,
                              string emp3EndMonth,
                              string emp3EndYear)
        {
            var mID = new SqlParameter("@MemberID", memberID);

            var pEmployer = new SqlParameter("@Employer", employer);
            var pEmp1Position = new SqlParameter("@Emp1Position", emp1Position);
            var pEmp1JobDesc = new SqlParameter("@Emp1JobDesc", emp1JobDesc);
            var pEmp1City = new SqlParameter("@Emp1City", emp1City);
            var pEmp1State = new SqlParameter("@Emp1State", emp1State);
            var pEmp1StartMonth = new SqlParameter("@Emp1StartMonth", emp1StartMonth);
            var pEmp1EndMonth = new SqlParameter("@Emp1EndMonth", emp1EndMonth);
            var pEmp1StartYear = new SqlParameter("@Emp1StartYear", emp1StartYear);
            var pEmp1EndYear = new SqlParameter("@Emp1EndYear", emp1EndYear);

            var pEmployer2 = new SqlParameter("@Employer2", employer2);
            var pEmp2Position = new SqlParameter("@Emp2Position", emp2Position);
            var pEmp2JobDesc = new SqlParameter("@Emp2JobDesc", emp2JobDesc);
            var pEmp2City = new SqlParameter("@Emp2City", emp2City);
            var pEmp2State = new SqlParameter("@Emp2State", emp2State);
            var pEmp2StartMonth = new SqlParameter("@Emp2StartMonth", emp2StartMonth);
            var pEmp2EndMonth = new SqlParameter("@Emp2EndMonth", emp2EndMonth);
            var pEmp2StartYear = new SqlParameter("@Emp2StartYear", emp2StartYear);
            var pEmp2EndYear = new SqlParameter("@Emp2EndYear", emp2EndYear);

            var pEmployer3 = new SqlParameter("@Employer2", employer3);
            var pEmp3Position = new SqlParameter("@Emp3Position", emp3Position);
            var pEmp3JobDesc = new SqlParameter("@Emp3JobDesc", emp3JobDesc);
            var pEmp3City = new SqlParameter("@Emp3City", emp3City);
            var pEmp3State = new SqlParameter("@Emp3State", emp3State);
            var pEmp3StartMonth = new SqlParameter("@Emp3StartMonth", emp3StartMonth);
            var pEmp3EndMonth = new SqlParameter("@Emp3EndMonth", emp3EndMonth);
            var pEmp3StartYear = new SqlParameter("@Emp3StartYear", emp3StartYear);
            var pEmp3EndYear = new SqlParameter("@Emp3EndYear", emp3EndYear);

            _context.Database.ExecuteSqlRaw("EXEC spSaveMemberEmploymentInfo @MemberID, @Employer, @Emp1Position, @Emp1JobDesc, @Emp1City, @Emp1State, @Emp1StartMonth, @Emp1StartYear, @Emp1EndMonth, @Emp1EndYear,@Employer2, @Emp2Position, @Emp2JobDesc, @Emp2City, @Emp2State, @Emp2StartMonth, @Emp2StartYear, @Emp2EndMonth, @Emp2EndYear,@Employer3, @Emp3Position, @Emp3JobDesc, @Emp3City, @Emp3State, @Emp3StartMonth, @Emp3StartYear, @Emp3EndMonth, @Emp3EndYear",
                              mID, pEmployer, pEmp1Position, pEmp1JobDesc, pEmp1City, pEmp1State, pEmp1StartMonth, pEmp1StartYear, pEmp1EndMonth, pEmp1EndYear,
                              pEmployer2, pEmp2Position, pEmp2JobDesc, pEmp2City, pEmp2State, pEmp2StartMonth, pEmp2StartYear, pEmp2EndMonth, pEmp2EndYear,
                              pEmployer3, pEmp3Position, pEmp3JobDesc, pEmp3City, pEmp3State, pEmp3StartMonth, pEmp3StartYear, pEmp3EndMonth, pEmp3EndYear);

        }

        /// <summary>
        /// Save contact or friend request
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="email"></param>
        public void SendFriendRequest(int memberID, string email)
        {
            var mID = new SqlParameter("@MemberID", memberID);
            var pEmail = new SqlParameter("@Email", email);
            _context.Database.ExecuteSqlRaw("EXEC spSendFriendRequest @memberID, @Email", mID, pEmail);

        }

        /// <summary>
        /// check to see if a contact request was sent for mebmer id
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="toMemberiD"></param>
        /// <returns></returns>
        public bool IsContactRequestSent(int memberID, int toMemberiD)
        {
            List<TbContactRequest> mbr = (from m in _context.TbContactRequests where m.FromMemberId == memberID && m.ToMemberId == toMemberiD select m).ToList();
            if (mbr.Count == 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// check to seem if email is alread a member of LG
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool IsMember(string email)
        {
            List<TbMember> mbr = (from m in _context.TbMembers where m.Email == email select m).ToList();
            if (mbr.Count == 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// Check to see if membeid or email is friend.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool IsFriend(int memberID, string email)
        {
            var clist = (from m in _context.TbMembers join c in _context.TbContacts on m.MemberId equals c.ContactId where c.MemberId == memberID && m.Email == email select m).ToList();
            if (clist.Count == 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// Check to see if membeid or email is friend.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="contactID"></param>
        /// <returns></returns>
        public bool IsFriend(int memberID, int contactID)
        {
            var clist = (from m in _context.TbMembers join c in _context.TbContacts on m.MemberId equals c.ContactId where c.MemberId == memberID && c.ContactId == contactID select m).ToList();
            if (clist.Count == 0)
                return false;
            else
                return true;
        }


        /// <summary>
        /// get member email and other info
        /// </summary>
        /// <param name="memberID"></param>
        /// <returns></returns>
        public List<TbMember> GetMemberEmail(int memberID)
        {
            var clist = (from m in _context.TbMembers join p in _context.TbMemberProfiles on m.MemberId equals p.MemberId where p.MemberId == memberID select m).ToList();
            return clist;
        }

        /// <summary>
        /// Save member basic profile information
        /// </summary>
        /// <param name="email"></param>
        /// <param name="highSchool"></param>
        /// <param name="highSchoolYear"></param>
        /// <param name="college"></param>
        /// <param name="collegeYear"></param>
        /// <param name="company"></param>
        public void SaveBasicProfileInfo(string email,
                                    string highSchool,
                                    string highSchoolYear,
                                    string college,
                                    string collegeYear,
                                    string company)
        {

            var pEmail = new SqlParameter("@Email", email);
            var pHighSchool = new SqlParameter("@HighSchool", highSchool);
            var pHighSchoolYear = new SqlParameter("@HighSchoolYear", highSchoolYear);
            var pCollege = new SqlParameter("@College", college);
            var pCollegeYear = new SqlParameter("CollegeYear", collegeYear);
            var pCompany = new SqlParameter("@Company", company);

            _context.Database.ExecuteSqlRaw("EXEC spSaveBasicProfileInfo @Email, @HighSchool, @HighSchoolYear, @College, @CollegeYear, @Company",
                                                pEmail, pHighSchool, pHighSchoolYear, pCollege, pCollegeYear, pCompany);
        }

        /// <summary>
        /// Get member information by email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public List<MemberInfoByEmailModel> GetMemberInfoByEmail(string email)
        {

            List<MemberInfoByEmailModel> lst = (from m in _context.TbMembers
                                                join mp in _context.TbMemberProfiles on m.MemberId equals mp.MemberId
                                                where m.Email == email
                                                select new MemberInfoByEmailModel()
                                                {
                                                    FriendID = m.MemberId.ToString(),
                                                    PicturePath = (string.IsNullOrEmpty(mp.PicturePath)) ? "default.png" : mp.PicturePath,
                                                    Email = m.Email ?? "",
                                                    Name = mp.FirstName + " " + mp.LastName
                                                }

                      ).ToList();
            return lst;
        }

        /// <summary>
        /// Update profile picture for member id
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="fileName"></param>
        public void UpdateProfilePicture(int memberID, string fileName)
        {
            //update tb meber profile with new profile picture
            var mbr = (from m in _context.TbMemberProfiles where m.MemberId == memberID select m).First();
            mbr.PicturePath = fileName;
            _context.SaveChanges();
        }

        /// <summary>
        /// Remove photo id
        /// </summary>
        /// <param name="photoID"></param>
        public void RemovePhotoID(int photoID)
        {
            var pPhotoID = new SqlParameter("@PhotoID", photoID);
            _context.Database.ExecuteSqlRaw("EXEC spRemovePhoto @AlbumID", pPhotoID);
        }

        /// <summary>
        /// Get member's interests
        /// </summary>
        /// <returns></returns>
        public List<TbInterest> GetMemberInterests()
        {
            List<TbInterest> intList = (from i in _context.TbInterests orderby i.InterestDesc select i).ToList();
            return intList;
        }

        /// <summary>
        /// Add member school attended
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="instID"></param>
        /// <param name="instType"></param>
        /// <param name="school"></param>
        /// <param name="classYear"></param>
        /// <param name="major"></param>
        /// <param name="degree"></param>
        /// <param name="societies"></param>
        /// <param name="sportLevelType"></param>
        public void AddMemberSchool(int memberID, long instID, int instType, string school, string classYear, string major, int degree, string societies, string sportLevelType)
        {
            TbMemberProfileEducationV2 mp = new TbMemberProfileEducationV2();
            mp.MemberId = memberID;
            mp.SchoolId = (Int32)instID;
            mp.SchoolType = instType;
            mp.SchoolName = school;
            mp.ClassYear = classYear;
            mp.Major = major;
            mp.DegreeType = degree;
            mp.Societies = societies;
            mp.SportLevelType = sportLevelType;
            _context.TbMemberProfileEducationV2s.Add(mp);
            _context.SaveChanges();
        }

        /// <summary>
        /// edit school attended.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="instID"></param>
        /// <param name="instType"></param>
        /// <param name="classYear"></param>
        /// <param name="major"></param>
        /// <param name="degree"></param>
        /// <param name="societies"></param>
        /// <param name="sportLevelType"></param>
        public void UpdateMemberSchool(int memberID, int instID, int instType, string classYear, string major, int degree, string societies, string sportLevelType)
        {
            //update tb meber profile with new profile picture
            var lst = (from m in _context.TbMemberProfileEducationV2s where m.MemberId == memberID && m.SchoolId == instID && m.SchoolType == instType select m).ToList();

            if (lst.Count != 0)
            {
                var mbr = lst.First();
                mbr.ClassYear = classYear;
                mbr.Major = major;
                mbr.DegreeType = degree;
                mbr.Societies = societies;
                mbr.SportLevelType = sportLevelType;
                _context.SaveChanges();
            }
        }

        /// <summary>
        /// remove school attended.
        /// </summary>
        /// <param name="memberID"></param>
        /// <param name="instID"></param>
        /// <param name="instType"></param>
        public void RemoveMemberSchool(int memberID, int instID, int instType)
        {
            var s = (from c in _context.TbMemberProfileEducationV2s where c.SchoolId == instID && c.MemberId == memberID && c.SchoolType == instType select c).First();
            _context.TbMemberProfileEducationV2s.Remove(s);
            _context.SaveChanges();
        }

        /// <summary>
        /// Checks to see if the member active.
        /// </summary>
        /// <returns><c>true</c>, if member active was ised, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        public bool IsMemberActive(int memberID)
        {
            List<TbMember> mbr = (from m in _context.TbMembers where m.MemberId == memberID && m.Status != 3 select m).ToList();
            if (mbr.Count == 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// Gets the registered members.
        /// </summary>
        /// <returns>The registered members.</returns>
        /// <param name="status">Status.</param>
        public List<RegisteredMembersModel> GetRegisteredMembers(int status)
        {
            List<RegisteredMembersModel> dat = (from m in _context.TbMembers
                                                join mp in _context.TbMemberProfiles on m.MemberId equals mp.MemberId
                                                join r in _context.TbMembersRegistereds on m.MemberId equals r.MemberId
                                                //into matchGroup
                                                where //matchGroup.Count() > 0 && 
                                                m.Status == (int?)status
                                                //orderby r.registeredDate descending
                                                select new RegisteredMembersModel()
                                                {
                                                    MemberID = m.MemberId.ToString(),
                                                    Email = m.Email ?? "",
                                                    Status = m.Status.ToString() ?? "",
                                                    FirstName = mp.FirstName ?? "",
                                                    LastName = mp.LastName ?? "",
                                                    Sex = mp.Sex ?? "",
                                                    PicturePath = mp.PicturePath ?? "",
                                                    JoinedDate = mp.JoinedDate.ToString() ?? "",
                                                    TitleDesc = mp.TitleDesc ?? "",
                                                    Sport = mp.Sport ?? "",
                                                    RegisteredDate = r.RegisteredDate.ToString() ?? ""
                                                }).ToList();

            return dat;
        }

        public string GetYoutubeChannel(int memberID)
        {
            var s = (from m in _context.TbMembers where m.MemberId == memberID select m).ToList();
            if (s != null)
                return s[0].YoutubeChannel ?? "";
            else
                return "";
        }

        public string GetInstagramURL(int memberID)
        {
            var s = (from m in _context.TbMemberProfileContactInfos where m.MemberId == memberID select m).ToList();
            if (s != null)
                return s[0].Instagram ?? "";
            else
                return "";
        }

        public void SetYoutubeChannel(string memberID, string channel)
        {
            var mbr = (from m in _context.TbMembers where m.MemberId == Convert.ToInt32(memberID) select m).First();
            if (mbr != null)
            {
                mbr.YoutubeChannel = channel;
                _context.SaveChanges();
            }
        }

        public void SetInstagramURL(string memberID, string instagramURL)
        {
            var mbr = (from m in _context.TbMemberProfileContactInfos where m.MemberId == Convert.ToInt32(memberID) select m).First();
            if (mbr != null)
            {
                mbr.Instagram = instagramURL;
                _context.SaveChanges();
            }
        }

        public List<YoutubePlayListModel> GetVideoPlayList(string memberID)
        {
            List<YoutubePlayListModel> lst = new List<YoutubePlayListModel>();
            try
            {
                string channelId = GetYoutubeChannel(Convert.ToInt32(memberID));

                if (!string.IsNullOrEmpty(channelId))
                {

                    string apiKey = _configuration.GetValue<string>("YoutubeAPIkey") ?? "";

                    YouTubeService yt = new YouTubeService(new BaseClientService.Initializer() { ApiKey = apiKey });
                    var pl = yt.Playlists.List("snippet");
                    pl.ChannelId = channelId;
                    var plResult = pl.Execute();
                    foreach (var item in plResult.Items)
                    {
                        YoutubePlayListModel plModel = new YoutubePlayListModel();
                        plModel.Id = item.Id;
                        plModel.Title = item.Snippet.Title;
                        plModel.Description = item.Snippet.Description;
                        plModel.Etag = item.ETag;
                        plModel.DefaultThumbnail = item.Snippet.Thumbnails.Default__.Url;
                        plModel.DefaultThumbnailHeight = item.Snippet.Thumbnails.Default__.Height.ToString() ?? "";
                        plModel.DefaultThumbnailWidth = item.Snippet.Thumbnails.Default__.Width.ToString() ?? "";
                        lst.Add(plModel);
                    }
                }
                return lst;
            }
            catch (Exception)
            {
                return lst;
            }
        }

        [Obsolete]
        public List<YoutubeVideosListModel> GetVideosList(string playerListID)
        {
            List<YoutubeVideosListModel> lst = new List<YoutubeVideosListModel>();
            string apiKey = _configuration.GetValue<string>("YoutubeAPIkey") ?? "";
            YouTubeService yt = new(new BaseClientService.Initializer() { ApiKey = apiKey });
            var vids = yt.PlaylistItems.List("snippet");
            vids.PlaylistId = playerListID;
            var vidResult = vids.Execute();
            foreach (var item in vidResult.Items)
            {
                YoutubeVideosListModel vidModel = new YoutubeVideosListModel();
                vidModel.Id = item.Snippet.ResourceId.VideoId;
                vidModel.Title = item.Snippet.Title;
                vidModel.Description = item.Snippet.Description;
                vidModel.Etag = item.ETag;
                vidModel.PublishedAt = Convert.ToDateTime(item.Snippet.PublishedAt).ToShortDateString();
                vidModel.DefaultThumbnail = item.Snippet.Thumbnails.Default__.Url;
                vidModel.DefaultThumbnailHeight = item.Snippet.Thumbnails.Default__.Height.ToString() ?? "0";
                vidModel.DefaultThumbnailWidth = item.Snippet.Thumbnails.Default__.Width.ToString() ?? "0";
                lst.Add(vidModel);
            }
            return lst;
        }
        #endregion
    }
}
