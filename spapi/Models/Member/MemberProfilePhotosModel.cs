﻿namespace spapi.Models.Member
{
    /// <summary>
    /// Stores member profile photos info
    /// </summary>
    public class MemberProfilePhotosModel
    {        
        public string FileName  {get; set; } = string.Empty;
        public string IsDefault  {get; set; } = string.Empty;
        public string MemberID  {get; set; } = string.Empty;
        public string ProfileID  {get; set; } = string.Empty;
        public string Removed  {get; set; } = string.Empty;
    }

}
