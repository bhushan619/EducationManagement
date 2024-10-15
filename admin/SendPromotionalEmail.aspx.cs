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
using System.IO;
using System.Net;
using System.Net.Mail;
using MySql.Data.MySqlClient;


public partial class admin_SendPromotionalEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddpack_Click(object sender, EventArgs e)
    {
        try
        {
            string[] emails = txtEmail.Text.Split(',');
            for (int i = 0; i < emails.Count(); i++)
            {

                using (MailMessage mm = new MailMessage(new MailAddress("coursekatta Promotions <enquiry@coursekatta.com>"), new MailAddress(emails[i])))
                {
                    mm.Subject = "coursekatta : Promotional Email";

                    mm.Body = PopulateBody(emails[i]);

                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "relay-hosting.secureserver.net";
                    smtp.EnableSsl = false;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    NetworkCredential NetworkCred = new NetworkCredential("enquiry@coursekatta.com", "ck@2017");
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;
                    smtp.Send(mm);


                }
                ScriptManager.RegisterStartupScript(
                           this,
                           this.GetType(),
                           "MessageBox",
                            "alert('Email sent');", true);
            }
        }
        catch (Exception rx)
        {
            ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                          "alert('not sent');", true);

        }
    }
    private string PopulateBody(string Email)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/emails/Promotional.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{email}", Email); 
        return body;
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}