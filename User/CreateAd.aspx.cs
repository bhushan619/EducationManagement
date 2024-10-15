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

public partial class User_CreateAd : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            packag = Session["packid"].ToString().Split(';');
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int contentLength = fupProPic.PostedFile.ContentLength;//You may need it for validation
        string contentType = fupProPic.PostedFile.ContentType;//You may need it for validation
        string fileName = string.Empty;
        if (contentLength == 0)
        {
            fileName = ImgProduct.ImageUrl.Split('/')[3]; ;
             
            adHeader.Text = txtName.Text;
            adBase.Text = txtBottomLine.Text;
            adLink.Text = ddlButtons.Text;
            adLink.NavigateUrl = "http://" + txtLink.Text;
            AdImage.ImageUrl = "~/user/PreviewAds/" + fileName;
            ImgProduct.ImageUrl = "~/user/PreviewAds/" + fileName;
        }
        else
        {
            fileName =  "adx" + fupProPic.PostedFile.FileName;
            fupProPic.PostedFile.SaveAs(Server.MapPath("~/user/PreviewAds/") + fileName);//Or code to save in the DataBase.

            adHeader.Text = txtName.Text;
            adBase.Text = txtBottomLine.Text;
            adLink.Text = ddlButtons.Text;
            adLink.NavigateUrl = "http://" + txtLink.Text;
            AdImage.ImageUrl = "~/user/PreviewAds/" + fileName;
            ImgProduct.ImageUrl = "~/user/PreviewAds/" + fileName;
        }

        HttpCookie adContent = new HttpCookie("adContent");
        adContent.Value = txtName.Text + "^" + txtLink.Text + "^" + txtBottomLine.Text + "^" + ImgProduct.ImageUrl + "^" + ddlButtons.SelectedValue;
        Response.Cookies.Add(adContent);
    }

    protected void btnPayment_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["adContent"] == null)
        {
            ScriptManager.RegisterStartupScript(
              this,
              this.GetType(),
              "MessageBox",
              "alert('Please Create and Preview AD');", true);
        }
        else
        {
            dbc.con.Close();
            MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select varuserName,varuserEmail,varContactOne from tbluserdetails where (intuserId = " + res.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")", dbc.con);
            dbc.con.Open();
            dbc.dr = cmdc.ExecuteReader();
            if (dbc.dr.Read())
            {
                firstname = dbc.dr["varuserName"].ToString();
                email = dbc.dr["varuserEmail"].ToString();
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
            MySql.Data.MySqlClient.MySqlCommand cmdpa = new MySql.Data.MySqlClient.MySqlCommand("SELECT varuserCity,varuserState FROM tbluserdetails WHERE  (intuserId = " + res.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")", dbc.con);
            dbc.con.Open();
            dbc.dr = cmdpa.ExecuteReader();
            if (dbc.dr.Read())
            {
                state = dbc.dr["varuserCity"].ToString();
                city = dbc.dr["varuserState"].ToString();
                country = "India";
            }
            dbc.con.Close();
            dbc.dr.Close();
            if (!amount.Equals("0"))
            {
                int intid = dbc.max_tblammembertransactions();
                intid = intid + 1;
                MySql.Data.MySqlClient.MySqlCommand cmdo = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblammembertransactions VALUES (" + intid + ",'" + Session["orderid"].ToString() + "','" + res.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','" + firstname + "','" + city + "','','" + state + "','" + packageno + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','" + amount + "','Unpaid','','','NA','Started','User','" + mypackintid.ToString() + "')", dbc.con);
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
                parameters.Add("CUST_ID", res.DecryptString(Request.Cookies["userid"].Value.ToString()));
                parameters.Add("ORDER_ID", Session["orderid"].ToString());
                parameters.Add("TXN_AMOUNT", amount);
                parameters.Add("CALLBACK_URL", "http://coursekatta.com/user/SubscriptionStatusPaytm.aspx");
                parameters.Add("MERC_UNQ_REF", Session["orderid"].ToString() + "_" + packageno + "_" + packageduration + "_" + packagedurationtime + "_" + amount + "_" + pname);

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
        }
    }
}
