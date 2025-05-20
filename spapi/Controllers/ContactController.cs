using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using spapi.Interfaces;
using Swashbuckle.AspNetCore.Annotations;

namespace spapi.Controllers
{
    [Route("services/[controller]/[action]")]
    [SwaggerTag("Contains API functionalities to manage and control member contacts.")]
    public class ContactController(IContactService contactService) : ControllerBase
    {
        readonly IContactService _contactService = contactService;

        /// <summary>
        /// Gets a list of member contacts by the given member ID and show type.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="show">Show could be "requests" or "RecentlyAdded".</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetMemberContacts([FromQuery] int memberID, [FromQuery] string show)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetMemberContacts(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets a list of member contact suggestoins by the given member ID and show type.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetMemberSuggestions([FromQuery] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetMemberSuggestions(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        /// <summary>
        /// Gets the list of member contact suggestions for a member ID.
        /// </summary>
        /// <returns>The member contact suggestions.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetMemberContactSuggestions([FromQuery] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetMemberContactSuggestions(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Sends the request to contact.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpPut]
        [Authorize]
        public IActionResult SendRequestContact([FromQuery] string memberID, [FromQuery] string contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.SendRequestContact(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }


        /// <summary>
        /// Searchs and return list of contacts for a given member ID and search Text.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        [HttpGet]
        [Authorize]
        public IActionResult SearchMemberContacts([FromQuery] int memberID, [FromQuery] string searchText)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.SearchMemberContacts(memberID, searchText));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the requests list.
        /// </summary>
        /// <returns>The requests list.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetRequestsList([FromQuery] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetRequestsList(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets members list by search type.
        /// </summary>
        /// <returns>The members by search type.</returns>        
        /// <param name="userID">User identifier.</param>
        /// <param name="searchType">Search type.</param>
        /// <param name="searchText">Search text.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetMembersBySearchType([FromQuery] int userID, [FromQuery] string searchType, [FromQuery] string searchText)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetMembersBySearchType(userID, searchType, searchText).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the search contacts.
        /// </summary>
        /// <returns>The search contacts.</returns>          
        /// <param name="userID">User identifier.</param>
        /// <param name="searchText">Search text.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetSearchContacts([FromQuery] int userID, [FromQuery] string searchText)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetSearchContacts(userID, searchText).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Searchs members by a gven type and member ID.
        /// </summary>
        /// <returns>The member by type.</returns>      
        /// <param name="userID">User identifier.</param>
        /// <param name="searchType">Search type.</param>
        /// <param name="searchString">Search string.</param>
        [HttpGet]
        [Authorize]
        public IActionResult SearchMemberByType([FromQuery] int userID, [FromQuery] string searchType, [FromQuery] string searchString)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetMembersBySearchType(userID, "1", searchString).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// member accepts request from contact 
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpPut]
        [Authorize]
        public IActionResult AcceptRequest([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.AcceptRequest(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }

        }

        /// <summary>
        /// Member rejects the request from contact.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpPut]
        [Authorize]
        public IActionResult RejectRequest([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.RejectRequest(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Deletes the contact.
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpDelete]
        [Authorize]
        public IActionResult DeleteContact([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.DeleteContact(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Gets the entity list by search type.
        /// </summary>
        /// <returns>The entity by search type.</returns>   
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        /// <param name="searchType">Search type.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetEntityBySearchType([FromQuery] int memberID, [FromQuery] string searchText, [FromQuery] string searchType)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetEntityBySearchType(memberID, searchText, searchType).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// reuturns the list of Contacts by search text.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        [HttpGet]
        [Authorize]
        public IActionResult SearchResults([FromQuery] int memberID, [FromQuery] string searchText)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.SearchResults(memberID, searchText).ToList());

            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// reuturns the list of contacts by search text.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        [HttpGet]
        [Authorize]
        public IActionResult SearchAllResults([FromQuery] int memberID, [FromQuery] string searchText)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.SearchAllResults(memberID, searchText).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// reuturns the list of members I am following
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetPeopleIFollow([FromQuery] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetPeopleIFollow(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// reuturns the list of whose following me.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult GetWhosFollowingMe([FromQuery] int memberID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.GetWhosFollowingMe(memberID).ToList());
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// follow member
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpPost]
        [Authorize]
        public IActionResult FollowMember([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.FollowMember(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Unfollow member
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpPost]
        [Authorize]
        public IActionResult UnfollowMember([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                _contactService.UnfollowMember(memberID, contactID);
                return Ok();
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// check tos if member is following contact
        /// </summary>
        /// <returns><c>true</c>, if mem is following, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        [HttpGet]
        [Authorize]
        public IActionResult IsFollowingContact([FromQuery] int memberID, [FromQuery] int contactID)
        {
            if (ModelState.IsValid)
            {
                return Ok(_contactService.IsFollowingContact(memberID, contactID));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

    }
}
