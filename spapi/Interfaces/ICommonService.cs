using spapi.Data;
using spapi.Models.Common;

namespace spapi.Interfaces
{
    public interface ICommonService
    {
        List<TbRecentNews> GetRecentNews();
        List<TbState> GetStates();
        List<SportsListModel> GetSportsList();
        List<SchoolByStateModel> GetSchoolsByState(string state, string institutionType);
        List<AdsModel> GetAds(string type);
        string Logs(string message, string stack);
        string SendAdvertisementInfo(string firstName, string lastName, string company, string email, string phone, string country, string title);
    }
}