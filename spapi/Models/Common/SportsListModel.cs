namespace spapi.Models.Common
{
    /// <summary>
    /// Holds sports list data - used in
    /// </summary>
    public class SportsListModel {
        public int Id { get; set; } = 0;
        public string Name { get; set; } = string.Empty;
        public string Description  {get; set; } = string.Empty;
    }
}