using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.IO;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;

public partial class college_SubscriptionStatusPaytm : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    string reqcount = 0.ToString();
    string msgcount = 0.ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["collegeid"] == null)
        {
            // Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
            Response.Cache.SetExpires(DateTimeOffset.UtcNow.LocalDateTime.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (!IsPostBack)
        {  
            string transactionid = string.Empty;
            string productinfo = string.Empty;
            string orderid = string.Empty;
            string amt = string.Empty;
            string pname = string.Empty;
            string duration = string.Empty;
            string time = string.Empty;

            orderid = Request.Form["MERC_UNQ_REF"].Split('_')[0].ToString();
            productinfo = Request.Form["MERC_UNQ_REF"].Split('_')[1].ToString();
            duration = Request.Form["MERC_UNQ_REF"].Split('_')[2].ToString();
            time = Request.Form["MERC_UNQ_REF"].Split('_')[3].ToString();
            amt = Request.Form["MERC_UNQ_REF"].Split('_')[4].ToString();
            pname= Request.Form["MERC_UNQ_REF"].Split('_')[5].ToString();

            lblOrderNo.Text = orderid;

            if (Request.Form["Respcode"] == "01" && Request.Form["Respmsg"] == "Txn Successful.")
            {
                string value = "https://secure.paytm.in/oltp/HANDLER_INTERNAL/getTxnStatus?JsonData=";

                Dictionary<string, string> innerrequest = new Dictionary<string, string>();
                Dictionary<string, string> outerrequest = new Dictionary<string, string>();



                innerrequest.Add("MID", "Anuvaa92658934271071");

                innerrequest.Add("ORDERID", orderid);


                String first_jason = new JavaScriptSerializer().Serialize(innerrequest);


                first_jason = first_jason.Replace("\\", "").Replace(":\"{", ":{").Replace("}\",", "},");

                string Check = paytm.CheckSum.generateCheckSum("lVaKPKowWN791ZtA", innerrequest);
                string correct_check = Server.UrlEncode(Check);

                innerrequest.Add("CHECKSUMHASH", correct_check);


                String final = new JavaScriptSerializer().Serialize(innerrequest);
                final = final.Replace("\\", "").Replace(":\"{", ":{").Replace("}\",", "},");

                String url = value + final;

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);



                request.Headers.Add("ContentType", "application/json");
                request.Method = "POST";

                using (StreamWriter requestWriter2 = new StreamWriter(request.GetRequestStream()))
                {
                    requestWriter2.Write(final);

                }

                string responseData = string.Empty;



                using (StreamReader responseReader = new StreamReader(request.GetResponse().GetResponseStream()))
                {
                    responseData = responseReader.ReadToEnd();

                    // Response.Write(responseData);
                    // Response.Write("Requested Json= " + final);

                }

                SqlDataSource1.SelectCommand = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                 ListView1.DataBind();
                // Response.Write("value matched") 

                lblOrderStatus.Text = "Confirmed";

                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblammembertransactions SET varTransactionId = '" + transactionid + "',varTransactionStatus = 'Success',varPaymode = 'Paytm Payment',varPaymentStatus ='Paid' ,varOrderStatus='" + lblOrderStatus.Text + "' WHERE varOrderNo = '" + orderid + "'", dbc.con);
                cmd.ExecuteNonQuery();
                dbc.con.Close();

                dbc.con.Close();
                MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select intCollegeId,varCollegeName,varCollegeEmail,varContactOne from tblcollegedetails where (intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + ")", dbc.con);
                dbc.con.Open();
                dbc.dr = cmdc.ExecuteReader();
                if (dbc.dr.Read())
                {
                    sendmail(dbc.dr["intCollegeId"].ToString(), dbc.dr["varCollegeName"].ToString(), dbc.dr["varCollegeEmail"].ToString(), orderid, orderid, pname, amt, duration, time);

                }
                dbc.con.Close();
                dbc.dr.Close();

                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmds = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblsubscription(intAdvertiserId, varOrderId, varFromDate, varToDate,varDesignation) VALUES (" + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ",'" + orderid + "','" + DateTime.UtcNow.ToString("yyyy-MM-dd") + "','" + DateTime.UtcNow.AddMonths(Convert.ToInt32(duration)).ToString("yyyy-MM-dd") + "','College')", dbc.con);
                cmds.ExecuteNonQuery();
                dbc.con.Close();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                //   Label1.Text = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                ListView1.DataBind();
                // Response.Write("value matched") 

                lblOrderStatus.Text = "Cancelled";

                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblammembertransactions SET varTransactionId = '" + transactionid + "',varTransactionStatus = 'Cancelled',varPaymode = 'NA',varPaymentStatus ='Unpaid' ,varOrderStatus='" + lblOrderStatus.Text + "' WHERE varOrderNo = '" + orderid + "'", dbc.con);
                cmd.ExecuteNonQuery();
                dbc.con.Close();
            }

           
         }

    }
   
    private string PopulateBody(string memid, string Name, string EmailId, string trans, string order, string pname, string amt, string date, string duration, string time)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Admin/emails/Upgrade.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{memid}", memid);
        body = body.Replace("{Name}", Name);
        body = body.Replace("{EmailId}", EmailId);
        body = body.Replace("{date}", date);
        body = body.Replace("{trans}", trans);
        body = body.Replace("{order}", order);
        body = body.Replace("{pname}", pname);
        body = body.Replace("{amt}", amt);
        body = body.Replace("{duration}", duration);
        body = body.Replace("{time}", time);


        return body;
    }
    protected void sendmail(string memid, string name, string email, string trans, string order, string pname, string amt, string duration, string time)
    {
        try
        {
            using (MailMessage mm = new MailMessage(new MailAddress("coursekatta <support@coursekatta.com>"), new MailAddress(email)))
            {
                mm.Subject = "coursekatta : Upgradation Status";
                string datenow = DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString();
                mm.Body = PopulateBody(memid, name, email, trans, order, pname, amt, datenow, duration, time);

                mm.IsBodyHtml = true;

                System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient();
                // for server

                SmtpServer.Host = "relay-hosting.secureserver.net";
                SmtpServer.EnableSsl = false;
                //for server
                SmtpServer.Port = 25;


                //for local 

                //SmtpServer.Host = "smtp.gmail.com";
                //SmtpServer.EnableSsl = true;

                //SmtpServer.Port = 587;


                SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                NetworkCredential NetworkCred = new NetworkCredential("support@coursekatta.com", "supportck@17");
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = NetworkCred;

                SmtpServer.Send(mm);


            }
        }
        catch (Exception rx)
        {
            //ScriptManager.RegisterStartupScript(
            //             this,
            //             this.GetType(),
            //             "MessageBox",
            //              "alert('not sent');", true);

        }
    }
}