using Microsoft.EntityFrameworkCore;
using spapi.Models.Contact;
using Microsoft.Data.SqlClient;
using System.Data;
using spapi.Models;
using System.Dynamic;
using spapi.Interfaces;

namespace spapi.Services
{
    /// <summary>
    /// Contact service functionality code
    /// </summary>
    public class ContactService(IContactRepository contactRepository) : IContactService
    {
        readonly IContactRepository _contactRepo = contactRepository;

         /// <summary>
        /// Gets a list of member contacts by the given member ID and show type.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetMemberContacts(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetMemberContacts(memberID).ToList();
            return lst;
        }

        /// <summary>
        /// Gets a list of member contact suggestoins by the given member ID and show type.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetMemberSuggestions(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetMemberSuggestions(memberID).ToList();
            return lst;
        }


        /// <summary>
        /// Gets the list of member contact suggestions for a member ID.
        /// </summary>
        /// <returns>The member contact suggestions.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetMemberContactSuggestions(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetMemberContactSuggestions(memberID).ToList();
            return lst;
        }

        /// <summary>
        /// Sends the request to contact.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void SendRequestContact(string memberID, string contactID)
        {
            _contactRepo.SendRequestContact(memberID, contactID);
        }


        /// <summary>
        /// Searchs and return list of contacts for a given member ID and search Text.
        /// </summary>
        /// <returns>The member contacts.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        public List<MemberContactsModel> SearchMemberContacts(int memberID, string searchText)
        {
            List<MemberContactsModel> lst = _contactRepo.SearchMemberContacts(memberID, searchText);
            return lst;
        }

        /// <summary>
        /// Gets the requests list.
        /// </summary>
        /// <returns>The requests list.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetRequestsList(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetRequestsList(memberID).ToList();
            return lst;
        }

        /// <summary>
        /// Gets members list by search type.
        /// </summary>
        /// <returns>The members by search type.</returns>        
        /// <param name="userID">User identifier.</param>
        /// <param name="searchType">Search type.</param>
        /// <param name="searchText">Search text.</param>
        public List<MemberContactsModel> GetMembersBySearchType(int userID, string searchType, string searchText)
        {
            List<MemberContactsModel> lst = _contactRepo.GetMembersBySearchType(userID, searchType, searchText).ToList();
            return lst;
        }

        /// <summary>
        /// Gets the search contacts.
        /// </summary>
        /// <returns>The search contacts.</returns>          
        /// <param name="userID">User identifier.</param>
        /// <param name="searchText">Search text.</param>
        public List<MemberContactsModel> GetSearchContacts(int userID, string searchText)
        {
            List<MemberContactsModel> lst = _contactRepo.GetSearchContacts(userID, searchText).ToList();
            return lst;
        }

        /// <summary>
        /// Searchs members by a gven type and member ID.
        /// </summary>
        /// <returns>The member by type.</returns>      
        /// <param name="userID">User identifier.</param>
        /// <param name="searchType">Search type.</param>
        /// <param name="searchString">Search string.</param>
        public List<MemberByTypeModel> SearchMemberByType(int userID, int searchType, string searchString)
        {
            searchType = 1;
            List<MemberByTypeModel> lst = _contactRepo.SearchMemberByType(userID, searchType, searchString).ToList();
            return lst;
        }

        /// <summary>
        /// member accepts request from contact 
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void AcceptRequest(int memberID, int contactID)
        {
            _contactRepo.AcceptRequest(memberID, contactID);
        }

        /// <summary>
        /// Member rejects the request from contact.
        /// </summary>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void RejectRequest(int memberID, int contactID)
        {
            _contactRepo.RejectRequest(memberID, contactID);
        }

        /// <summary>
        /// Deletes the contact.
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void DeleteContact(int memberID, int contactID)
        {
            _contactRepo.DeleteContact(memberID, contactID);
        }

        /// <summary>
        /// Gets the entity list by search type.
        /// </summary>
        /// <returns>The entity by search type.</returns>   
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        /// <param name="searchType">Search type.</param>
        public List<EntityModel> GetEntityBySearchType(int memberID, string searchText, string searchType)
        {
            List<EntityModel> lst = _contactRepo.GetEntityBySearchType(memberID, searchText, searchType).ToList();
            return lst;
        }

        /// <summary>
        /// reuturns the list of Contacts by search text.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        public List<SearchModel> SearchResults(int memberID, string searchText)
        {
            List<SearchModel> lst = _contactRepo.SearchResults(memberID, searchText).ToList();
            return lst;
        }

        /// <summary>
        /// reuturns the list of contacts by search text.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="searchText">Search text.</param>
        public List<SearchModel> SearchAllResults(int memberID, string searchText)
        {
            List<SearchModel> lst = _contactRepo.SearchAllResults(memberID, searchText).ToList();
            return lst;
        }

        /// <summary>
        /// reuturns the list of members I am following
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetPeopleIFollow(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetPeopleIFollow(memberID).ToList();
            return lst;
        }

        /// <summary>
        /// reuturns the list of whose following me.
        /// </summary>
        /// <returns>The results.</returns>
        /// <param name="memberID">Member identifier.</param>
        public List<MemberContactsModel> GetWhosFollowingMe(int memberID)
        {
            List<MemberContactsModel> lst = _contactRepo.GetWhosFollowingMe(memberID).ToList();
            return lst;
        }

        /// <summary>
        /// follow member
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void FollowMember(int memberID, int contactID)
        {
            _contactRepo.FollowMember(memberID, contactID);
        }

        /// <summary>
        /// Unfollow member
        /// </summary>  
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public void UnfollowMember(int memberID, int contactID)
        {
            _contactRepo.UnfollowMember(memberID, contactID);
        }

        /// <summary>
        /// check tos if member is following contact
        /// </summary>
        /// <returns><c>true</c>, if mem is following, <c>false</c> otherwise.</returns>
        /// <param name="memberID">Member identifier.</param>
        /// <param name="contactID">Contact identifier.</param>
        public bool IsFollowingContact(int memberID, int contactID)
        {
            bool b = _contactRepo.IsFollowingContact(memberID, contactID);
            return b;
        }
    }
}