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

public partial class admin_UpgradeCollege : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["adminid"] == null)
        {
            Response.Redirect("~/admin/login.aspx");

            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (Request.QueryString["id"].ToString() == null)
        {
            Response.Redirect("~/admin/login.aspx");
        }
        else
        {
            lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
        }

    }
     static string amount = string.Empty;
    static string firstname = string.Empty;
    static string email = string.Empty;
    static string phone = string.Empty;
    static string productinfo = string.Empty;
    static string packageno = string.Empty;
    static string packageduration = string.Empty;
    static string packagedurationtime = string.Empty;
    static string state = string.Empty;
    static string city = string.Empty;
    static string address = string.Empty;
    static string pin = string.Empty;
    static string country = string.Empty;
    static string orderid = string.Empty;
    static string pname = string.Empty;
 
    static int mypackintid = 0;

    protected void btnUpgrade_Click(object sender, EventArgs e)
    {
        orderid = dbc.CreateRandomPassword(6);

        dbc.con.Close();
        MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select varCollegeName,varCollegeEmail,varContactOne from tblcollegedetails where (intCollegeId = " +Request.QueryString["id"].ToString() + ")", dbc.con);
        dbc.con.Open();
        dbc.dr = cmdc.ExecuteReader();
        if (dbc.dr.Read())
        {
            firstname = dbc.dr["varCollegeName"].ToString();
            email = dbc.dr["varCollegeEmail"].ToString();
            phone = dbc.dr["varContactOne"].ToString();
        }
        dbc.con.Close();
        dbc.dr.Close();

        dbc.con.Close();
        MySql.Data.MySqlClient.MySqlCommand cmdp = new MySql.Data.MySqlClient.MySqlCommand("SELECT tblampackages.intId,tblampackages.varPackageName, tblampackagesdetails.varPackageId, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackageDurationTime, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId  WHERE (tblampackagesdetails.varPackageId = '111')", dbc.con);
        dbc.con.Open();
        dbc.dr = cmdp.ExecuteReader();
        if (dbc.dr.Read())
        {
            mypackintid = Convert.ToInt32(dbc.dr["intId"]);
            packageno = dbc.dr["varPackageId"].ToString();
            pname = dbc.dr["varPackageId"].ToString();
            amount = dbc.dr["varPackagePrice"].ToString();
            productinfo = dbc.dr["varPackageDescription"].ToString();
            packageduration = dbc.dr["varPackageDuration"].ToString();
            packagedurationtime = dbc.dr["varPackageDurationTime"].ToString();
        }
        dbc.con.Close();
        dbc.dr.Close();

        dbc.con.Close();
        MySql.Data.MySqlClient.MySqlCommand cmdpa = new MySql.Data.MySqlClient.MySqlCommand("SELECT varCollegeCity,varCollegeState FROM tblcollegedetails WHERE  (intCollegeId = " + Request.QueryString["id"].ToString() + ")", dbc.con);
        dbc.con.Open();
        dbc.dr = cmdpa.ExecuteReader();
        if (dbc.dr.Read())
        {
            state = dbc.dr["varCollegeState"].ToString();
            city = dbc.dr["varCollegeCity"].ToString();
            country = "India";
        }
        dbc.con.Close();
        dbc.dr.Close();

        int intid = dbc.max_tblammembertransactions();
        intid = intid + 1;
        MySql.Data.MySqlClient.MySqlCommand cmdo = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblammembertransactions VALUES (" + intid + ",'" + orderid + "','" +  Request.QueryString["id"].ToString() + "','" + firstname + "','" + city + "','','" + state + "','" + packageno + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','" + amount + "','Unpaid','','','NA','Started','','" + mypackintid.ToString() + "')", dbc.con);
        dbc.con.Open();
        cmdo.ExecuteNonQuery();
        dbc.con.Close();

        dbc.con.Open();
        MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblammembertransactions SET varTransactionId = 'By Admin',varTransactionStatus = 'Success',varPaymode = 'Free',varPaymentStatus ='Paid' ,varOrderStatus='By Admin' WHERE varOrderNo = '" + orderid + "'", dbc.con);
        cmd.ExecuteNonQuery();
        dbc.con.Close();
         

        dbc.con.Open();
        MySql.Data.MySqlClient.MySqlCommand cmds = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblsubscription(intAdvertiserId, varOrderId, varFromDate, varToDate,varDesignation) VALUES (" + Request.QueryString["id"].ToString() + ",'" + orderid + "','" + DateTime.UtcNow.ToString("yyyy-MM-dd") + "','" + DateTime.UtcNow.AddMonths(Convert.ToInt32(packageduration)).ToString("yyyy-MM-dd") + "','College')", dbc.con);
        cmds.ExecuteNonQuery();
        dbc.con.Close();

        ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Upgraded Successfully');", true);
    }
}