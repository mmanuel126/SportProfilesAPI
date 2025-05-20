namespace spapi.Models.Member
{
    /// <summary>
    /// stores the youtube playlist info obtained from youtube API
    /// </summary>
    public class YoutubePlayListModel
    { 
        public string Etag  {get; set; } = string.Empty;
        public string Id  {get; set; } = string.Empty;
        public string Title {get; set;} = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string DefaultThumbnail  {get; set; } = string.Empty;
        public string DefaultThumbnailHeight  {get; set; } = string.Empty;
        public string DefaultThumbnailWidth  {get; set; } = string.Empty;
    }

    /// <summary>
    /// Stores utube videos list from Google API 
    /// </summary>
    public class YoutubeVideosListModel 
    { 
        public string Etag  {get; set; } = string.Empty;
        public string Id  {get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Description {get; set;} = string.Empty ;
        public string DefaultThumbnail  {get; set; } = string.Empty;
        public string DefaultThumbnailHeight  {get; set; } = string.Empty;
        public string DefaultThumbnailWidth  {get; set; } = string.Empty;
        public string PublishedAt  {get; set; } = string.Empty;
    }

}
