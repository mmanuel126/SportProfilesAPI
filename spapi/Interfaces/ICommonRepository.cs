using spapi.Data;
using spapi.Models.Common;

namespace spapi.Interfaces
{
    public interface ICommonRepository
    {
        List<TbRecentNews> GetRecentNews();
        List<TbState> GetStates();
        List<SportsListModel> GetSportsList();
        List<SchoolByStateModel> GetSchoolsByState(string state, string institutionType);
        List<AdsModel> GetAds(string type);
    }
}