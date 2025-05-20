
namespace spapi.Models.Common
{
    /// <summary>
    /// stores a list of ads depending on type - used in Common API controller
    /// </summary>
    public class AdsModel {
        public int ID  {get; set; } 
        public string Name  {get; set; } = string.Empty;
        public string HeaderText  {get; set; } = string.Empty;
        public DateTime PostingDate  {get; set; }
        public string TextField  {get; set; } = string.Empty;
        public string NavigateUrl  {get; set; } = string.Empty;
        public string ImageUrl  {get; set; } = string.Empty;
        public string Type  {get; set; } = string.Empty;
    }
}