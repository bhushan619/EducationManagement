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
using paytm;
using System.Text;

public partial class college_NewOrder : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

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
    static string[] packag;
    static int mypackintid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Cookies["collegeid"] == null)
            {
                Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
                Response.Cache.SetExpires(DateTimeOffset.UtcNow.LocalDateTime.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
            }
            else if (!IsPostBack)
            {
                packag = Session["packid"].ToString().Split(';');
                lblOrderNo.Text = Session["orderid"].ToString();
                getdata();
                //SqlDataSource1.SelectCommand = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + packag[0].ToString() + "' and tblampackagesdetails.varPackageDuration='" + packag[2].ToString() + "' and tblampackagesdetails.varPackageDurationTime='" + packag[3].ToString() + "'";

            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');window.location='../Default.aspx';", true);
        }

    }
    public void getdata()
    {
        try
        {
            DataTable dts = new DataTable();

            MySql.Data.MySqlClient.MySqlCommand cmde = new MySql.Data.MySqlClient.MySqlCommand("SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId = '" + packag[0].ToString() + "' and tblampackagesdetails.varPackageDuration = '" + packag[2].ToString() + "' and tblampackagesdetails.varPackageDurationTime = '" + packag[3].ToString() + "'", dbc.con);
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


    protected void lnkProceed_Click(object sender, EventArgs e)
    {

        try
        {
            dbc.con.Close();
            MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select varCollegeName,varCollegeEmail,varContactOne from tblcollegedetails where (intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + ")", dbc.con);
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
            MySql.Data.MySqlClient.MySqlCommand cmdp = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId,varPackageId, varPackageDescription, varPackageDuration, varPackagePrice, varBenifits, varPackageDurationTime FROM tblampackagesdetails  WHERE (varPackageId = '" + packag[0].ToString() + "') and varPackageDuration='" + packag[2].ToString() + "' and varPackageDurationTime='" + packag[3].ToString() + "'", dbc.con);
            dbc.con.Open();
            dbc.dr = cmdp.ExecuteReader();
            if (dbc.dr.Read())
            {
                mypackintid = Convert.ToInt16(dbc.dr["intId"]);
                packageno = dbc.dr["varPackageId"].ToString();
                pname = packag[1].ToString();
                amount = dbc.dr["varPackagePrice"].ToString();
                productinfo = dbc.dr["varPackageDescription"].ToString();
                packageduration = dbc.dr["varPackageDuration"].ToString();
                packagedurationtime = dbc.dr["varPackageDurationTime"].ToString();
            }
            dbc.con.Close();
            dbc.dr.Close();

            dbc.con.Close();
            MySql.Data.MySqlClient.MySqlCommand cmdpa = new MySql.Data.MySqlClient.MySqlCommand("SELECT varCollegeCity,varCollegeState FROM tblcollegedetails WHERE  (intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + ")", dbc.con);
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
            if (!amount.Equals("0"))
            {
                int intid = dbc.max_tblammembertransactions();
                intid = intid + 1;
                MySql.Data.MySqlClient.MySqlCommand cmdo = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblammembertransactions VALUES (" + intid + ",'" + lblOrderNo.Text + "','" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "','" + firstname + "','" + city + "','','" + state + "','" + packageno + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','" + amount + "','Unpaid','','','NA','Started','College','" + mypackintid.ToString() + "')", dbc.con);
                dbc.con.Open();
                cmdo.ExecuteNonQuery();
                dbc.con.Close();
                //Response.Redirect("ccavRequestHandler.aspx?&billing_address=" + address + "&billing_city=" + city + "&billing_state=" + state + "&billing_zip=" + pin + "&billing_country=" + country + "&merchant_id=53386&order_id=" + lblOrderNo.Text + "&currency=INR&amount=" + amount + "&redirect_url=http://swapnpurti.in/Members/Subscription/ccavResponseHandler.aspx&cancel_url=http://swapnpurti.in/Members/Subscription/ccavResponseHandler.aspx&billing_name=" + firstname + "&billing_email=" + email + "&billing_tel=" + phone + "&merchant_param1=" + packageno + "&merchant_param2=" + Request.Cookies["collegeid"].ToString() + "&merchant_param3=" + pname + "&merchant_param4=" + packageduration + "&merchant_param5=" + packagedurationtime + "");
                Response.Redirect("PaymentProcess.aspx?amount=" + amount + "&firstname=" + firstname + "&email=" + email + "&phone=" + phone + "&productinfo=" + packageno + "&udf1=" + lblOrderNo.Text + "&udf2=" + pname + "&udf3=" + packageduration + "&udf4=" + packagedurationtime + "");
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Please select another package.. Or contact support for free registration for 1 month..');", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        dbc.con.Close();
        MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select varCollegeName,varCollegeEmail,varContactOne from tblcollegedetails where (intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + ")", dbc.con);
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
        MySql.Data.MySqlClient.MySqlCommand cmdp = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId,varPackageId, varPackageDescription, varPackageDuration, varPackagePrice, varBenifits, varPackageDurationTime FROM tblampackagesdetails  WHERE (varPackageId = '" + packag[0].ToString() + "') and varPackageDuration='" + packag[2].ToString() + "' and varPackageDurationTime='" + packag[3].ToString() + "'", dbc.con);
        dbc.con.Open();
        dbc.dr = cmdp.ExecuteReader();
        if (dbc.dr.Read())
        {
            mypackintid = Convert.ToInt16(dbc.dr["intId"]);
            packageno = dbc.dr["varPackageId"].ToString();
            pname = packag[1].ToString();
            amount = dbc.dr["varPackagePrice"].ToString();
            productinfo = dbc.dr["varPackageDescription"].ToString();
            packageduration = dbc.dr["varPackageDuration"].ToString();
            packagedurationtime = dbc.dr["varPackageDurationTime"].ToString();
        }
        dbc.con.Close();
        dbc.dr.Close();

        dbc.con.Close();
        MySql.Data.MySqlClient.MySqlCommand cmdpa = new MySql.Data.MySqlClient.MySqlCommand("SELECT varCollegeCity,varCollegeState FROM tblcollegedetails WHERE  (intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + ")", dbc.con);
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
        if (!amount.Equals("0"))
        {
            //Label1.Text = mypackintid + "_" + packageno + "_" + pname + "_" + amount + "_" + productinfo + "_" + packageduration + "_" + packagedurationtime + "_" + state + "_" + city + "_" + country;
            int intid = dbc.max_tblammembertransactions();
            intid = intid + 1;
            MySql.Data.MySqlClient.MySqlCommand cmdo = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblammembertransactions VALUES (" + intid + ",'" + lblOrderNo.Text + "','" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "','" + firstname + "','" + city + "','','" + state + "','" + packageno + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','" + amount + "','Unpaid','','','NA','Started','College','" + mypackintid.ToString() + "')", dbc.con);
            dbc.con.Open();
            cmdo.ExecuteNonQuery();
            dbc.con.Close();

            String merchantKey = "lVaKPKowWN791ZtA";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("MID", "Anuvaa92658934271071");
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail109");
            parameters.Add("WEBSITE", "AnuvaaWEB");

            parameters.Add("EMAIL", email);
            parameters.Add("MOBILE_NO", phone);
            parameters.Add("CUST_ID", res.DecryptString(Request.Cookies["collegeid"].Value.ToString()));
            parameters.Add("ORDER_ID", lblOrderNo.Text);
            parameters.Add("TXN_AMOUNT", amount);
            parameters.Add("CALLBACK_URL", "http://coursekatta.com/college/SubscriptionStatusPaytm.aspx");
            parameters.Add("MERC_UNQ_REF", lblOrderNo.Text + "_" + packageno + "_" + packageduration + "_" + packagedurationtime + "_" + amount + "_" + pname);

            string checksum = CheckSum.generateCheckSum(merchantKey, parameters);

            string paytmURL = "https://secure.paytm.in/oltp-web/processTransaction";
            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant Check Out Page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);
        }
        else
        {
            ScriptManager.RegisterStartupScript(
               this,
               this.GetType(),
               "MessageBox",
               "alert('Please select another package.. Or contact support for free registration for 1 month..');", true);
        }
    }
}