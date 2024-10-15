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
public partial class college_ViewOrders : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    string reqcount = 0.ToString();
    string msgcount = 0.ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["collegeid"]  == null)
        {
            Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
            Response.Cache.SetExpires(DateTimeOffset.UtcNow.LocalDateTime.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (!IsPostBack)
        { 
            getDataInGridview(); 
        }

    }
   
    public void getDataInGridview()
    {
        try
        {
            DataTable dtc = new DataTable();
            DataTable dt = new DataTable();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT varMemberId,varMemberName,varPaymentAmount,varPaymentStatus,(SELECT varPackageName FROM tblampackages WHERE varPackageId=tblammembertransactions.varPackageId) as PackageName,varOrderStatus FROM tblammembertransactions WHERE varMemberId='" +  Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "'", dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter ad = new MySql.Data.MySqlClient.MySqlDataAdapter(cmd);
            ad.Fill(dt);
            grdPaidMember.DataSource = dt;
            grdPaidMember.DataBind();

            dbc.con.Close();

            dt.Dispose();
            ad.Dispose();
            cmd.Dispose();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId, intAdvertiserId, varOrderId, date_format(varFromDate,'%d-%m-%Y') as varFromDate ,date_format(varToDate,'%d-%m-%Y') as varToDate, varDesignation, ex2 FROM tblsubscription WHERE intAdvertiserId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varDesignation='College'", dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter adc = new MySql.Data.MySqlClient.MySqlDataAdapter(cmdc);
            adc.Fill(dtc);
            grdContacts.DataSource = dtc;
            grdContacts.DataBind();

            dbc.con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
        }
    }

    protected void grdPaidMember_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // grdPaidMember.PageIndex = e.NewPageIndex;

    }
}