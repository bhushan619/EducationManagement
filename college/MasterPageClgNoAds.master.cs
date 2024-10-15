using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class college_MasterPageClgNoAds : System.Web.UI.MasterPage
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblContactRequests.Text = dbc.requestsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblContactRequests.Visible = lblContactRequests.Text == "0" ? false : true;
        lblMessages.Text = dbc.msgsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblMessages.Visible = lblMessages.Text == "0" ? false : true;
        lblNotifications.Text = dbc.notifCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblNotifications.Visible = lblNotifications.Text == "0" ? false : true;
    }

    protected void headSearch_Click(object sender, EventArgs e)
    {
        if (TxtComment.Text == "")
        {
            ScriptManager.RegisterStartupScript(
               this,
               this.GetType(),
               "MessageBox",
               "alert('Please enter Name..!!');", true);
        }
        else
        {
            Response.Redirect("~/user/SearchUsers.aspx?us=" + TxtComment.Text + "");
        }
    }
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
    }
}
