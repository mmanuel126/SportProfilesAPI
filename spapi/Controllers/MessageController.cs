using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using spapi.Interfaces;
using Swashbuckle.AspNetCore.Annotations;

namespace spapi.Controllers
{
    [Route("services/[controller]")]
    [SwaggerTag("Contains API functionalities for messaging or communication between members.")]
    public class MessageController(IMessageService msgSvc, IConfiguration config) : ControllerBase
    {
        readonly IMessageService _msgSvc = msgSvc;
        readonly IConfiguration _config = config;

        /// <summary>
        /// Gets the member notifications.
        /// </summary>
        /// <returns>The member notifications.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="showType">Show type.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberNotifications/{memberID}")]
        public IActionResult GetMemberNotifications([FromRoute] int memberID, [FromQuery] string showType)
        {
            if (ModelState.IsValid)
            {
                return Ok( _msgSvc.GetMemberNotifications(memberID, showType));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the member messages.
        /// </summary>
        /// <returns>The member messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="showType">Show type.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMemberMessages/{memberID}")]
        public IActionResult GetMemberMessages([FromRoute] int memberID, [FromQuery] string showType)
        {
            if (ModelState.IsValid) {
                return Ok( _msgSvc.GetMemberMessages(memberID, showType));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the total unread messages.
        /// </summary>
        /// <returns>The total unread messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetTotalUnreadMessages/{memberID}")]
        public IActionResult GetTotalUnreadMessages([FromRoute] int memberID)
        {
            if (ModelState.IsValid) {
                return Ok( _msgSvc.GetTotalUnreadMessages(memberID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Creates a message.
        /// </summary>
        /// <param name="to">To.</param>
        /// <param name="from">From.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="body">Body.</param>
        /// <param name="attachment">Attachment.</param>
        /// <param name="original">Original.</param>
        [HttpPost]
        [Authorize]
        [Route("CreateMessage")]
        public IActionResult CreateMessage([FromQuery]  int to, [FromQuery]  int from, [FromQuery] string subject, [FromQuery] string body, [FromQuery] string attachment, [FromQuery]  string original)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.CreateMessage(to, from, subject, body, attachment, original);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Creates the message by source.
        /// </summary>
        /// <param name="to">To.</param>
        /// <param name="from">From.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="body">Body.</param>
        /// <param name="attachment">Attachment.</param>
        /// <param name="source">Source.</param>
        /// <param name="original">Original.</param>
        [HttpPost]
        [Authorize]
        [Route("CreateMessageBySource")]
        public IActionResult CreateMessageBySource([FromQuery] string to, [FromQuery] string from, [FromQuery] string subject, [FromQuery] string body, [FromQuery] string attachment, [FromQuery] string source, [FromQuery]  string original)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.CreateMessageBySource(to, from, subject, body, attachment, source, original);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Toggles the state of the notification.
        /// </summary>
        /// <param name="status">If set to <c>true</c> status.</param>
        /// <param name="notificationID">Notification identifier.</param>
        [HttpPut]
        [Authorize]
        [Route("ToggleNotificationState")]
        public IActionResult ToggleNotificationState([FromQuery] bool status, [FromQuery] int notificationID)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.ToggleNotificationState(status, notificationID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Deletes the notification.
        /// </summary>
        /// <param name="notificationID">Notification identifier.</param>
        /// <param name="memberID">Member identifier.</param>
        [HttpDelete]
        [Authorize]
        [Route("DeleteNotification/{notificationID}/{memberID}")]
        public IActionResult DeleteNotification([FromRoute] int notificationID, [FromRoute] int memberID)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.DeleteNotification(notificationID, memberID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Toggles the state of the message.
        /// </summary>
        /// <param name="status">Status.</param>
        /// <param name="msgID">Message identifier.</param>
        [HttpPut]
        [Route("ToggleMessageState")]
        public IActionResult ToggleMessageState([FromQuery] int status, [FromQuery]  int msgID)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.ToggleMessageState(status, msgID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets list of notifications by identifier.
        /// </summary>
        /// <returns>The notification by identifier.</returns>
        /// <param name="nid">Nid.</param>
        [HttpGet]
        [Authorize]
        [Route("GetNotificationByID/{nid}")]
        public IActionResult GetNotificationByID([FromRoute] int nid)
        {
            if (ModelState.IsValid) {
                return Ok( _msgSvc.GetNotificationByID(nid));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the message info by identifier.
        /// </summary>
        /// <returns>The message info by identifier.</returns>
        /// <param name="msgID">Message identifier.</param>
        [HttpGet]
        [Authorize]
        [Route("GetMessageInfoByID/{msgID}")]
        public IActionResult GetMessageInfoByID([FromRoute] int msgID)
        {
            if (ModelState.IsValid) {
                return Ok( _msgSvc.GetMessageInfoByID(msgID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        /// <summary>
        /// Deletes the message.
        /// </summary>
        /// <param name="msgID">Message identifier.</param>
        [HttpDelete]
        [Authorize]
        [Route("DeleteMessage/{msgID}")]
        public IActionResult DeleteMessage([FromRoute] int msgID)
        {
            if (ModelState.IsValid)
            {
                _msgSvc.DeleteMessage(msgID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Searchs messages given search key for member id.
        /// </summary>
        /// <returns>The messages.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchKey">Search key.</param>
        [HttpGet]
        [Authorize]
        [Route("SearchMessages/{memberID}")]
        public IActionResult SearchMessages([FromRoute]  int memberID, [FromQuery]  string searchKey)
        {
            if (ModelState.IsValid)
            {
                return Ok( _msgSvc.SearchMessages(memberID, searchKey));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

    }
}
