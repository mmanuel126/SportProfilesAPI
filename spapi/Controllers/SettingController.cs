using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using spapi.Models.Member;
using spapi.Models.Setting;
using spapi.Interfaces;
using Swashbuckle.AspNetCore.Annotations;

namespace spapi.Controllers
{
    [Route("services/[controller]")]
    [SwaggerTag("This is a list of interfaces to manage application settings and user preferences.")]
    public class SettingController(ISettingService setSvc) : ControllerBase
    {
        private readonly ISettingService _setSvc = setSvc;

        /// <summary>
        /// Gets the member name information.
        /// </summary>
        /// <returns>The member name info.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberNameInfo/{memberID}")]
        public IActionResult GetMemberNameInfo([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_setSvc.GetMemberNameInfo(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the member name info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="fName">First name.</param>
        /// <param name="mName">Middle name.</param>
        /// <param name="lName">Last name.</param>
        [HttpPut]
        [Authorize]
        [Route("SaveMemberNameInfo/{memberID}")]
        public IActionResult SaveMemberNameInfo([FromRoute] int memberID, [FromQuery] string fName, [FromQuery] string mName, [FromQuery] string lName)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SaveMemberNameInfo(memberID, fName, mName, lName);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the member email information.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="email">Email.</param>
        [HttpPut]
        [Authorize]
        [Route("SaveMemberEmailInfo/{memberID}")]
        public IActionResult SaveMemberEmailInfo([FromRoute] int memberID, [FromQuery] string email)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SaveMemberEmailInfo(memberID, email);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the password information.
        /// </summary>
        /// <param name="body"></param>
        [HttpPut]
        [Authorize]
        [Route("SavePasswordInfo")]
        public IActionResult SavePasswordInfo([FromBody] PasswordDataModel body)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SavePasswordInfo(body);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the security question info.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="questionID">Question identifier.</param>
        /// <param name="answer">Answer.</param>
        [HttpPut]
        [Authorize]
        [Route("SaveSecurityQuestionInfo/{memberID}")]
        public IActionResult SaveSecurityQuestionInfo([FromRoute] int memberID, [FromQuery] int questionID, [FromQuery] string answer)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SaveSecurityQuestionInfo(memberID, questionID, answer);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Deactivates the account.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="reason">Reason.</param>
        /// <param name="explanation">Explanation.</param>
        /// <param name="futureEmail">Future email.</param>
        [HttpPut]
        [Authorize]
        [Route("DeactivateAccount/{memberID}")]
        public IActionResult DeactivateAccount([FromRoute] int memberID, [FromQuery] int reason, [FromQuery] string explanation, [FromQuery] bool? futureEmail)
        {
            if (ModelState.IsValid)
            {
                _setSvc.DeactivateAccount(memberID, reason, explanation, futureEmail);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member notifications.
        /// </summary>
        /// <returns>The member notifications.</returns>
        /// <param name="memberId">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberNotifications/{memberID}")]
        public IActionResult GetMemberNotifications([FromRoute] int memberId)
        {
            if (ModelState.IsValid) {
                return Ok(_setSvc.GetMemberNotifications(memberId));
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the notification settings.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        [HttpPut]
        [Authorize]
        [Route("SaveNotificationSettings/{memberID}")]
        public IActionResult SaveNotificationSettings([FromRoute] int memberID, [FromBody] NotificationsSettingModel body)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SaveNotificationSettings(memberID, body);
                return Ok();
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the profile settings.
        /// </summary>
        /// <returns>The profile settings.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetProfileSettings/{memberID}")]
        public IActionResult GetProfileSettings([FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_setSvc.GetProfileSettings(memberID));
            }
            else
            {
                return BadRequest(ModelState);    
            }
        }

        /// <summary>
        /// Saves the profile settings.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="body">Body.</param>
        [HttpPut]
        [Authorize]
        [Route("SaveProfileSettings/{memberID}")]
        public IActionResult SaveProfileSettings([FromRoute] int memberID, [FromBody] PrivacySearchSettingsModel body)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SaveProfileSettings(memberID, body);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the privacy search settings.
        /// </summary>
        /// <returns>The privacy search settings.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetPrivacySearchSettings/{memberID}")]
        public IActionResult GetPrivacySearchSettings([FromRoute]int memberID)
        {
                if (ModelState.IsValid) {
                    return Ok(_setSvc.GetPrivacySearchSettings(memberID));
             }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Saves the privacy search settings.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="visibility">Visibility.</param>
        /// <param name="viewProfilePicture">If set to <c>true</c> view profile picture.</param>
        /// <param name="viewFriendsList">If set to <c>true</c> view friends list.</param>
        /// <param name="viewLinkToRequestAddingYouAsFriend">If set to <c>true</c> view link to request adding you as friend.</param>
        /// <param name="viewLinkToSendYouMsg">If set to <c>true</c> view link to send you message.</param>
        [HttpPut]
        [Authorize]
        [Route("SavePrivacySearchSettings/{memberID}")]
        public IActionResult SavePrivacySearchSettings(
              [FromRoute] int memberID,
              [FromQuery] int visibility,
              [FromQuery] bool viewProfilePicture,
              [FromQuery] bool viewFriendsList,
              [FromQuery] bool viewLinkToRequestAddingYouAsFriend,
              [FromQuery] bool viewLinkToSendYouMsg)
        {
            if (ModelState.IsValid)
            {
                _setSvc.SavePrivacySearchSettings(memberID, visibility, viewProfilePicture, viewFriendsList, viewLinkToRequestAddingYouAsFriend,
                                                 viewLinkToSendYouMsg);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }
    }
}
