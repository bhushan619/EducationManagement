using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;

using System.Text;

public partial class User_ViewPackage : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        getdata();
    }
    public void getdata()
    {
        try
        {
            DataTable dts = new DataTable();

            MySql.Data.MySqlClient.MySqlCommand cmde = new MySql.Data.MySqlClient.MySqlCommand("SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId", dbc.con);
            dbc.con.Open();
            MySqlDataAdapter ad = new MySqlDataAdapter(cmde);
            ad.Fill(dts);
            ListView1.DataSource = dts;
            ListView1.DataBind();
            dbc.con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            Session.Add("orderid", dbc.CreateRandomPassword(6) + rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            Session.Add("packid", e.CommandArgument.ToString());
            Response.Redirect("~/user/CreateAd.aspx", false);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please Try Again');window.location='../login.aspx';</script>");
        }
    }
}