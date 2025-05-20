using Microsoft.AspNetCore.Mvc;
using spapi.Models.Member;
using Microsoft.AspNetCore.Authorization;
using Swashbuckle.AspNetCore.Annotations;
using spapi.Interfaces;

namespace spapi.Controllers
{
    [Route("services/[controller]")]
    [SwaggerTag("Contains member management API functionalities.")]
    public class MemberController(IWebHostEnvironment hostingEnvironment, IMemberService memberService,
                               IAccountRepository loggingRepository, ICommonRepository commonRepository,
                               IConfiguration configuration) : ControllerBase
    {
        private readonly IMemberService _mbrService = memberService;
        private readonly IAccountRepository _logRepo = loggingRepository;
        private readonly ICommonRepository _commonRepo = commonRepository;
        private readonly IWebHostEnvironment _hostingEnvironment = hostingEnvironment;
        private readonly IConfiguration _configuration = configuration;

        /// <summary>
        /// Validates the new registered user.
        /// </summary>
        /// <returns>The new registered user.</returns>
        /// <param name="email">Email.</param>
        /// <param name="code">Code.</param>
        [HttpGet]
        [Authorize]
        [Route("ValidateNewRegisteredUser")]
        public IActionResult ValidateNewRegisteredUser([FromQuery] string email, [FromQuery] string code)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.ValidateNewRegisteredUser(email, code));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the posts.
        /// </summary>
        /// <returns>The posts.</returns>
        /// <param name="memberID"></param>
        /// <param name="postID"></param>
        /// <param name="postMsg"></param>
        [HttpPost]
        [Authorize]
        [Route("SavePosts/{memberID}/{postID}")]
        public IActionResult SavePosts([FromRoute] int memberID, [FromRoute] int postID, [FromQuery] string postMsg)
        {
            if (ModelState.IsValid)
            {
                if (postID == 0)
                    _mbrService.CreateMemberPost(memberID, postMsg);
                else
                    _mbrService.CreatePostComment(memberID, postID, postMsg);
                return Ok("success");
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// LGRs the recent post responses.
        /// </summary>
        /// <returns>The recent post responses.</returns>
        /// <param name="postID">Post identifier.</param>
        [Authorize]
        [HttpGet]
        [Route("GetRecentPostResponses/{postID}")]
        public IActionResult GetRecentPostResponses([FromRoute] int postID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberPostResponses(postID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Get the recent posts.
        /// </summary>
        /// <returns>The recent posts.</returns>
        /// <param name="memberID">Member identifier.</param>
        [Authorize]
        [HttpGet]
        [Route("getRecentPosts/{memberID}")]
        public IActionResult GetRecentPosts([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberPosts(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member general info v2.
        /// </summary>
        /// <returns>The member general info v2.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberGeneralInfoV2/{memberID}")]
        public IActionResult GetMemberGeneralInfoV2([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberGeneralInfoV2(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets list of member dates.
        /// </summary>
        /// <returns>The member dates.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberDates/{memberID}")]
        public IActionResult GetMemberDates([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberDates(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets member interest description.
        /// </summary>
        /// <returns>The interest description.</returns>
        /// <param name="interestID">Interest identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetInterestDescription/{interestID}")]
        public IActionResult GetInterestDescription([FromRoute] int interestID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetInterestDescription(interestID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets member personal information.
        /// </summary>
        /// <returns>The member personal info.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberPersonalInfo/{memberID}")]
        public IActionResult GetMemberPersonalInfo([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberPersonalInfo(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets member contact information.
        /// </summary>
        /// <returns>The member contact info.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberContactInfo/{memberID}")]
        public IActionResult GetMemberContactInfo([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberContactInfo(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets member education information.
        /// </summary>
        /// <returns>The member education info.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberEducationInfo/{memberID}")]
        public IActionResult GetMemberEducationInfo([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberEducationInfo(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves or update the member general info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">input data of the MemberProfileGenInfo Model.</param>
        [HttpPost]
        [Authorize]
        [Route("SaveMemberGeneralInfo/{memberID}")]
        public IActionResult SaveMemberGeneralInfo([FromRoute] int memberID, [FromBody] MemberProfileGenInfoModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SaveMemberGeneralInfo(memberID, body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves or update the member personal info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="activities">Activities.</param>
        /// <param name="interests">Interests.</param>
        /// <param name="specialSkills">Special skills.</param>
        /// <param name="aboutMe">About me.</param>
        [HttpPost]
        [Authorize]
        [Route("SaveMemberPersonalInfo")]
        public IActionResult SaveMemberPersonalInfo(
                     [FromQuery] int memberID,
                     [FromQuery] string activities,
                     [FromQuery] string interests,
                     [FromQuery] string specialSkills,
                     [FromQuery] string aboutMe)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SaveMemberPersonalInfo(memberID, activities, interests, specialSkills, aboutMe);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves or update the member contact information.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">model input data.</param>
        [HttpPost]
        [Authorize]
        [Route("SaveMemberContactInfo/{memberID}")]
        public IActionResult SaveMemberContactInfo([FromRoute] int memberID, [FromBody] MemberProfileContactInfoModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SaveMemberContactInfo(memberID, body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves or update the member contact information.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="Email"></param>
        /// <param name="OtherEmail"></param>
        /// <param name="Facebook"></param>
        /// <param name="Instagram"></param>
        /// <param name="Twitter"></param>
        /// <param name="Website"></param>
        /// <param name="HomePhone"></param>
        /// <param name="CellPhone"></param>
        /// <param name="Address"></param>
        /// <param name="City"></param>
        /// <param name="Neighborhood"></param>
        /// <param name="State"></param>
        /// <param name="Zip"></param>
        /// <param name="ShowAddress"></param>
        /// <param name="ShowEmailToMembers"></param>
        /// <param name="ShowCellPhone"></param>
        /// <param name="ShowHomePhone"></param>
        [HttpPost]
        [Authorize]
        [Route("SaveMemberContactInfoV2/{memberID}")]
        public IActionResult SaveMemberContactInfoV2([FromRoute] int memberID,
            [FromQuery] string Email,
            [FromQuery] string OtherEmail,
            [FromQuery] string Facebook,
            [FromQuery] string Instagram,
            [FromQuery] string Twitter,
            [FromQuery] string Website,
            [FromQuery] string HomePhone,
            [FromQuery] string CellPhone,
            [FromQuery] string Address,
            [FromQuery] string City,
            [FromQuery] string Neighborhood,
            [FromQuery] string State,
            [FromQuery] string Zip,
            [FromQuery] string ShowAddress,
            [FromQuery] string ShowEmailToMembers,
            [FromQuery] string ShowCellPhone,
            [FromQuery] string ShowHomePhone
            )
        {
            if (ModelState.IsValid)
            {
                _mbrService.SaveMemberContactInfoV2(memberID, Email, OtherEmail, Facebook, Instagram,
                                                  Twitter, Website, HomePhone, CellPhone,
                                                  Address, City, Neighborhood, State, Zip, ShowAddress, ShowEmailToMembers,
                                                  ShowCellPhone, ShowHomePhone);

                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Sends the friend request.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="email">Email.</param>
        [HttpPost]
        [Authorize]
        [Route("SendFriendRequest/{memberID}")]
        public IActionResult SendFriendRequest([FromRoute] int memberID, [FromQuery] string email)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SendFriendRequest(memberID, email);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// checks if contact request was sent to member id.
        /// </summary>
        /// <returns><c>true</c>, if contact request sent was ised, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="toMemberID">To member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("IsContactRequestSent/{memberID}/{toMemberID}")]
        public IActionResult IsContactRequestSent([FromRoute] int memberID, [FromRoute] int toMemberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.IsContactRequestSent(memberID, toMemberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
            ;
        }

        /// <summary>
        /// checks if member exists for an email".
        /// </summary>
        /// <returns><c>true</c>, if member was ised, <c>false</c> otherwise.</returns>
        /// <param name="email">Email.</param>
        [HttpGet]
        [Authorize]
        [Route("IsMember")]
        public IActionResult IsMember([FromQuery] string email)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.IsMember(email));
            }
            else
            {
                return BadRequest(ModelState);
            }
            ;
        }

        /// <summary>
        /// checks if member is a contact by contact's email.
        /// </summary>
        /// <returns><c>true</c>, if friend by email was used, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="email">Email.</param>
        [HttpGet]
        [Authorize]
        [Route("IsFriendByEmail/{memberID}")]
        public IActionResult IsFriendByEmail([FromRoute] int memberID, [FromQuery] string email)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.IsFriendByEmail(memberID, email));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// checks if member is a contact by contact id
        /// </summary>
        /// <returns><c>true</c>, if friend by contact identifier was ised, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("IsFriendByContactID/{memberID}/{contactID}")]
        public IActionResult IsFriendByContactID([FromRoute] int memberID, [FromRoute] int contactID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.IsFriendByContactID(memberID, contactID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the member basic profile info.
        /// </summary>
        /// <param name="email">Email.</param>
        /// <param name="highSchool">High school.</param>
        /// <param name="highSchoolYear">High school year.</param>
        /// <param name="college">College.</param>
        /// <param name="collegeYear">College year.</param>
        /// <param name="company">Company.</param>
        [HttpPost]
        [Authorize]
        [Route("SaveBasicProfileInfo")]
        public IActionResult SaveBasicProfileInfo([FromQuery] string email,
                                    [FromQuery] string highSchool,
                                    [FromQuery] string highSchoolYear,
                                    [FromQuery] string college,
                                    [FromQuery] string collegeYear,
                                    [FromQuery] string company)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SaveBasicProfileInfo(email, highSchool, highSchoolYear, college, collegeYear, company);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member info by email.
        /// </summary>
        /// <returns>The member info by email.</returns>
        /// <param name="email">Email.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberInfoByEmail")]
        public IActionResult GetMemberInfoByEmail([FromQuery] string email)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberInfoByEmail(email));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member posts.
        /// </summary>
        /// <returns>The member posts.</returns>
        /// <param name="memberID">Member identifier.</param>
        [Authorize]
        [HttpGet]
        [Route("GetMemberPosts/{memberID}")]
        public IActionResult GetMemberPosts([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberPosts(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member post responses.
        /// </summary>
        /// <returns>The member post responses.</returns>\
        /// <param name="postID">Post identifier.</param>
        [Authorize]
        [HttpGet]
        [Route("GetMemberPostResponses/{postID}")]
        public IActionResult GetMemberPostResponses([FromRoute] int postID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberPostResponses(postID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        /// <summary>
        /// Creates the member post.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="postMsg">Post message.</param>
        [HttpPost]
        [Authorize]
        [Route("CreateMemberPost/{memberID}")]
        public IActionResult CreateMemberPost([FromRoute] int memberID, [FromQuery] string postMsg)
        {
            if (ModelState.IsValid)
            {
                _mbrService.CreateMemberPost(memberID, postMsg);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        /// <summary>
        /// Creates the post comment.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="postID">Post identifier.</param>
        /// <param name="postMsg">Post message.</param>
        [HttpGet]
        [Authorize]
        [Route("CreatePostComment/{memberID}/{postID}")]
        public IActionResult CreatePostComment([FromRoute] int memberID, [FromRoute] int postID, [FromQuery] string postMsg)
        {
            if (ModelState.IsValid)
            {
                _mbrService.CreatePostComment(memberID, postID, postMsg);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member interests.
        /// </summary>
        /// <returns>The member interests.</returns>
        [HttpGet]
        [Authorize]
        [Route("GetMemberInterests")]
        public IActionResult GetMemberInterests()
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberInterests());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Adds the member school to db.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        [HttpPost]
        [Authorize]
        [Route("AddMemberSchool/{memberID}")]
        public IActionResult AddMemberSchool([FromRoute] int memberID, [FromBody] MemberProfileEducationModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.AddMemberSchool(memberID, body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Updates the member school.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        [HttpPut]
        [Authorize]
        [Route("UpdateMemberSchool/{memberID}")]
        public IActionResult UpdateMemberSchool([FromRoute] int memberID, [FromBody] MemberProfileEducationModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.UpdateMemberSchool(memberID, body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Removes the member school.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="instID">Inst identifier.</param>
        /// <param name="instType">Inst type.</param>
        [HttpDelete]
        [Authorize]
        [Route("RemoveMemberSchool")]
        public IActionResult RemoveMemberSchool([FromQuery] int memberID, [FromQuery] int instID, [FromQuery] int instType)
        {
            if (ModelState.IsValid)
            {
                _mbrService.RemoveMemberSchool(memberID, instID, instType);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// checks to see if the member is active.
        /// </summary>
        /// <returns><c>true</c>, if member active was used, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("IsMemberActive/{memberID}")]
        public IActionResult IsMemberActive([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.IsMemberActive(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member email.
        /// </summary>
        /// <returns>The member email.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberEmail/{memberID}")]
        public IActionResult GetMemberEmail([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetMemberEmail(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the registered members.
        /// </summary>
        /// <returns>The registered members.</returns>
        /// <param name="status">Status.</param>
        [HttpGet]
        [Authorize]
        [Route("GetRegisteredMembers/{status}")]
        public IActionResult GetRegisteredMembers([FromRoute] int status)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetRegisteredMembers(status));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [HttpGet]
        [Authorize]
        [Route("GetYoutubeChannel/{memberID}")]
        public IActionResult GetYoutubeChannel([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetYoutubeChannel(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [HttpPut]
        [Authorize]
        [Route("SetYoutubeChannel")]
        public IActionResult SetYoutubeChannel([FromBody] YoutubeChannelModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SetYoutubeChannel(body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        [HttpGet]
        [Authorize]
        [Route("GetInstagramURL/{memberID}")]
        public IActionResult GetInstagramURL([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetInstagramURL(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [HttpPut]
        [Authorize]
        [Route("SetInstagramURL")]
        public IActionResult SetInstagramURL([FromBody] InstagramURLModel body)
        {
            if (ModelState.IsValid)
            {
                _mbrService.SetInstagramURL(body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }



        /// <summary>
        /// Uploads the profile photo.
        /// </summary>
        /// <returns>The profile photo.</returns>
        /// <param name="memberId">Member identifier.</param>
        [HttpPost]
        [Authorize]
        [Route("UploadProfilePhoto/{memberID}")]
        public IActionResult UploadProfilePhoto([FromRoute] string memberId)
        {
            var file = Request.Form.Files[0];
            var ext = file.FileName.Split(".")[1];

            string folderName = "images/members/";
            string webRootPath = _hostingEnvironment.WebRootPath;
            string newPath = Path.Combine(webRootPath, folderName);
            if (!Directory.Exists(newPath))
            {
                Directory.CreateDirectory(newPath);
            }

            if (file.Length > 0)
            {
                string fileName = memberId + "." + ext;
                string fullPath = Path.Combine(newPath, fileName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                //update table with file name
                if (ModelState.IsValid)
                {
                    _mbrService.UploadProfilePhoto(memberId, fileName);
                    return Ok();
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// set member status
        /// </summary>
        /// <param name="memberId">Member identifier.</param>
        /// <param name="status">member status</param>
        [HttpGet]
        //[Authorize]
        [Route("SetMemberStatus")]
        public IActionResult SetMemberStatus([FromQuery] int memberId, [FromQuery] int status)
        {
            if (ModelState.IsValid)
            {
                _logRepo.SetMemberStatus(memberId, status);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Get utube video playlist
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        [Route("GetVideoPlayList/{memberId}")]
        public IActionResult GetVideoPlayList([FromRoute] string memberId)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetVideoPlayList(memberId));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Get videos list for a player list.
        /// </summary>
        /// <param name="playerListID"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        [Route("GetVideosList/{playerListID}")]
        public IActionResult GetVideosList([FromRoute] string playerListID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_mbrService.GetVideosList(playerListID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

    }
}
