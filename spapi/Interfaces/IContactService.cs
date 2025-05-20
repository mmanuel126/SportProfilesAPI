using spapi.Models.Contact;

namespace spapi.Interfaces
{
  public interface IContactService
  {
    List<MemberContactsModel> GetMemberContacts(int memberID);
    List<MemberContactsModel> GetMemberSuggestions(int memberID);
    List<MemberContactsModel> GetMemberContactSuggestions(int memberID);
    void SendRequestContact(string memberID, string contactID);
    List<MemberContactsModel> SearchMemberContacts(int memberID, string searchText);
    List<MemberContactsModel> GetRequestsList(int memberID);
    List<MemberContactsModel> GetMembersBySearchType(int userID, string searchType, string searchText);
    List<MemberContactsModel> GetSearchContacts(int userID, string searchText);
    List<MemberByTypeModel> SearchMemberByType(int userID, int searchType, string searchString);
    void AcceptRequest(int memberID, int contactID);
    void RejectRequest(int memberID, int contactID);
    void DeleteContact(int memberID, int contactID);
    List<EntityModel> GetEntityBySearchType(int memberID, string searchText, string searchType);
    List<SearchModel> SearchResults(int memberID, string searchText);
    List<SearchModel> SearchAllResults(int memberID, string searchText);
    List<MemberContactsModel> GetWhosFollowingMe(int memberID);
    void UnfollowMember(int memberID, int contactID);
    void FollowMember(int memberID, int contactID);
    List<MemberContactsModel> GetPeopleIFollow(int memberID);
    bool IsFollowingContact(int memberID, int contactID);
  }
}