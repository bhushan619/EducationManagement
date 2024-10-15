using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class college_MasterPageCollege : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
    }
}
