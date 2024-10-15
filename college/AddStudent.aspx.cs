using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Linq;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

public partial class college_AddStudent : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["collegeid"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
    }
    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/Profile.aspx");
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/CollegeOther.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}