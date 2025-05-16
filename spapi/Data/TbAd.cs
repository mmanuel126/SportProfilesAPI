using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbAd
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? HeaderText { get; set; }

    public DateTime? PostingDate { get; set; }

    public string? TextField { get; set; }

    public string? NavigateUrl { get; set; }

    public string? ImageUrl { get; set; }

    public string? Type { get; set; }
}
