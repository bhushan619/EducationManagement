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

public partial class admin_ViewCollege : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["adminid"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

    }

    string collegeid = string.Empty;
    protected void grdCollegeData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string colid = e.CommandArgument.ToString();
            if (collegeid != null)
            {
                collegeid = colid;
                Response.Redirect("~/admin/CollegeOther.aspx?id=" + collegeid + "");
            } 
        }
        else if (e.CommandName.Equals("upg"))
        {
            string colid = e.CommandArgument.ToString();
            if (collegeid != null)
            {
                collegeid = colid;
                Response.Redirect("~/admin/UpgradeCollege.aspx?id=" + collegeid + "");
            }
        }
    }
}