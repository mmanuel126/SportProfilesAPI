using System;
using System.Collections.Generic;

namespace spapi.Data;

public partial class TbForgotPwdCode
{
    public int CodeId { get; set; }

    public string? Email { get; set; }

    public DateTime? CodeDate { get; set; }

    public int? Status { get; set; }
}
