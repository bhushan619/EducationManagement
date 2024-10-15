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

public partial class User_ViewOrders : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        getDataInGridview();
    }

    public void getDataInGridview()
    {
        try
        {
            DataTable dtc = new DataTable();
            DataTable dt = new DataTable();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT varMemberId,varMemberName,varPaymentAmount,varPaymentStatus,(SELECT varPackageName FROM tblampackages WHERE varPackageId=tblammembertransactions.varPackageId) as PackageName,varOrderStatus FROM tblammembertransactions WHERE varMemberId='" + res.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter ad = new MySql.Data.MySqlClient.MySqlDataAdapter(cmd);
            ad.Fill(dt);
            grdPaidMember.DataSource = dt;
            grdPaidMember.DataBind();

            dbc.con.Close();

            dt.Dispose();
            ad.Dispose();
            cmd.Dispose();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId, intUserId, varAdHeader, varBtnText, varLink, varImageUrl, varBottomText, varPackageId, varOrderId, varFrom, varTo, ex1, ex2 FROM tbl_adsbyusers WHERE intUserId=" + res.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter adc = new MySql.Data.MySqlClient.MySqlDataAdapter(cmdc);
            adc.Fill(dtc);
            grdContacts.DataSource = dtc;
            grdContacts.DataBind();

            dbc.con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"');window.location='../Default.aspx';</script>");
        }
    }

    protected void grdPaidMember_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // grdPaidMember.PageIndex = e.NewPageIndex;

    }
}