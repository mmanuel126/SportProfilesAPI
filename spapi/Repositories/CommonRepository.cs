using spapi.Models;
using spapi.Interfaces;
using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using spapi.Data;
using spapi.Models.Common;

namespace spapi.Repositories
{
    /// <summary>
    /// describes the functionalities to manage the business and data requirements for Site Common usage needs
    /// </summary>
    public class CommonRepository(DBContextModel context, IConfiguration configuration) : ICommonRepository
    {
        public readonly DBContextModel _context = context;
        private readonly IConfiguration _configuration = configuration;

        /// <summary>
        /// Get Recent news 
        /// </summary>
        /// <returns></returns>
        public List<TbRecentNews> GetRecentNews()
        {
            var q = (from r in _context.TbRecentNews orderby r.PostingDate descending select r).Take(8).ToList();
            return q;
        }

        /// <summary>
        /// Get states listing
        /// </summary>
        /// <returns></returns>
        public List<TbState> GetStates()
        {
            var q = (from s in _context.TbStates orderby s.Name ascending select s).ToList();
            return q;
        }

        /// <summary>
        /// Get the list of all sports
        /// </summary>
        /// <returns></returns>
        public List<SportsListModel> GetSportsList()
        {
            // List<SportsListModel> sp = new List<SportsListModel>();

            var result = _context.Set<SportsListModel>().FromSqlRaw("exec spGetSportsList");
            return new List<SportsListModel>(result);
        }

        /// <summary>
        /// Get schools by state
        /// </summary>
        /// <param name="state"></param>
        /// <param name="institutionType"></param>
        /// <returns></returns>
        public List<SchoolByStateModel> GetSchoolsByState(string state, string institutionType)
        {
            List<SchoolByStateModel> sM = new();
            if (institutionType == "1") //public
            {
                sM = (from s in _context.TbPublicSchools
                      where s.State == state
                      orderby s.SchoolName ascending

                      select new SchoolByStateModel()
                      {
                          SchoolId = s.Lgid.ToString(),
                          SchoolName = s.SchoolName ?? ""
                      }
                        ).Distinct().ToList();
            }
            else if (institutionType == "2") //private
            {
                sM = (from s in _context.TbPrivateSchools
                      where s.State == state
                      orderby s.SchoolName ascending

                      select new SchoolByStateModel()
                      {
                          SchoolId = s.Lgid.ToString(),
                          SchoolName = s.SchoolName ?? ""
                      }
                        ).Distinct().ToList();
            }
            else if (institutionType == "3") //colleges
            {
                sM = (from s in _context.TbColleges
                      where s.State == state
                      orderby s.Name ascending

                      select new SchoolByStateModel()
                      {
                          SchoolId = s.SchoolId.ToString(),
                          SchoolName = s.Name ?? ""
                      }
                        ).Distinct().ToList();
            }
            return sM;
        }

        /// <summary>
        /// Returns the list of ads for the site.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public List<AdsModel> GetAds(string type)
        {
            var result = _context.Set<AdsModel>().FromSqlRaw("exec spGetAds @AdType ", new SqlParameter("@AdType", type));
            return new List<AdsModel>(result);
        }
    }

}
