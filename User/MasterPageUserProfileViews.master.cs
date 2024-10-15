using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using MySql.Data.MySqlClient;

public partial class User_MasterPageUserProfileViews : System.Web.UI.MasterPage
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblContactRequests.Text = dbc.requestsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblContactRequests.Visible = lblContactRequests.Text == "0" ? false : true;
            lblMessages.Text = dbc.msgsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblMessages.Visible = lblMessages.Text == "0" ? false : true;
            lblNotifications.Text = dbc.notifCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblNotifications.Visible = lblNotifications.Text == "0" ? false : true;
        }
        catch (Exception ex)
        {
            Response.Redirect("~/default.aspx", false);
        }
    }
    
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Logout.aspx", false);
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetInstitute(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select distinct varuserName as UserName,'x' as UserId   from tbluserdetails where intuserId<>" + HttpContext.Current.Response.Cookies.Get("userid").Value.ToString() + " and varuserName like  '%" + prefixText + "%' and varVerified='true'", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        return CourseNames;
    }
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
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

    
}
