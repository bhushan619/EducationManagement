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

public partial class college_SubscriptionStatus : System.Web.UI.Page
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
            string[] merc_hash_vars_seq;
            string merc_hash_string = string.Empty;
            string merc_hash = string.Empty;
            string order_id = string.Empty;
            string transactionid = string.Empty;
            string productinfo = string.Empty;
            string orderid = string.Empty;
            string amt = string.Empty;
            string pname = string.Empty;
            string duration = string.Empty;
            string time = string.Empty;

            string hash_seq = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";

            if (Request.Form["status"] == "success")
            {

                merc_hash_vars_seq = hash_seq.Split('|');
                Array.Reverse(merc_hash_vars_seq);
                merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];


                foreach (string merc_hash_var in merc_hash_vars_seq)
                {
                    merc_hash_string += "|";
                    merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");


                }
                //Response.Write(merc_hash_string);//exit;
                merc_hash = Generatehash512(merc_hash_string).ToLower();

                if (merc_hash != Request.Form["hash"])
                {
                    //Response.Write("Hash value did not matched");

                }
                else
                {
                    order_id = Request.Form["txnid"];

                    string[] arry = merc_hash_string.Split(new char[] { '|' });

                    transactionid = arry[16].ToString();
                    productinfo = arry[14].ToString();
                    orderid = arry[11].ToString();
                    amt = arry[15].ToString();
                    pname = arry[10].ToString();
                    duration = arry[9].ToString();
                    time = arry[8].ToString();
                    //OK Done

                    SqlDataSource1.SelectCommand = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                    //   Label1.Text = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                    ListView1.DataBind();
                    // Response.Write("value matched") 

                    lblOrderStatus.Text = "Confirmed";

                    dbc.con.Open();
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblammembertransactions SET varTransactionId = '" + transactionid + "',varTransactionStatus = 'Success',varPaymode = 'Online Payment',varPaymentStatus ='Paid' ,varOrderStatus='" + lblOrderStatus.Text + "' WHERE varOrderNo = '" + orderid + "'", dbc.con);
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

                    //Hash value did not matched
                }

            }

            else
            {
                merc_hash_vars_seq = hash_seq.Split('|');
                Array.Reverse(merc_hash_vars_seq);
                merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];


                foreach (string merc_hash_var in merc_hash_vars_seq)
                {
                    merc_hash_string += "|";
                    merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");


                }
                //Response.Write(merc_hash_string);//exit;
                merc_hash = Generatehash512(merc_hash_string).ToLower();

                if (merc_hash != Request.Form["hash"])
                {
                    //Response.Write("Hash value did not matched");

                }
                else
                {
                    order_id = Request.Form["txnid"];

                    string[] arry = merc_hash_string.Split(new char[] { '|' });

                    transactionid = arry[16].ToString();
                    productinfo = arry[14].ToString();
                    orderid = arry[11].ToString();
                    amt = arry[15].ToString();
                    pname = arry[10].ToString();
                    duration = arry[9].ToString();
                    time = arry[8].ToString();
                    //OK Done

                    SqlDataSource1.SelectCommand = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                    //   Label1.Text = "SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId where tblampackages.varPackageId='" + productinfo + "' and tblampackagesdetails.varPackageDuration='" + duration + "' and tblampackagesdetails.varPackageDurationTime='" + time + "'";
                    ListView1.DataBind();
                    // Response.Write("value matched") 

                    lblOrderStatus.Text = "Cancelled";

                    dbc.con.Open();
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblammembertransactions SET varTransactionId = '" + transactionid + "',varTransactionStatus = 'Cancelled',varPaymode = 'NA',varPaymentStatus ='Unpaid' ,varOrderStatus='" + lblOrderStatus.Text + "' WHERE varOrderNo = '" + orderid + "'", dbc.con);
                    cmd.ExecuteNonQuery();
                    dbc.con.Close();
                     
                    //Hash value did not matched
                }
            }

            lblOrderNo.Text = orderid;

        }

    }
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

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