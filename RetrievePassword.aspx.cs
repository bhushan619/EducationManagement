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
using System.Net.Mail;
using System.Net;
using System.IO;
using MySql.Data.MySqlClient;

public partial class RetrievePassword : System.Web.UI.Page
{

    MySqlConnection con;
    public MySqlDataReader dr;
    DatabaseConnection dbc = new DatabaseConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        con = new MySqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
        //
        if (!IsPostBack)
        {
        }
        location();
    }
    public void location()
    {
        //  lblLocation.Text = "At " + "<script type='text/javascript'>locate();</script>";

    }

    private string PopulateBody(string pass)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/emails/forget.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Password}", pass);
        return body;
    }
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        try
        {
            string pass = string.Empty;
            
                pass = dbc.getpass(txtEmail.Text, "u");
           
            if (pass == "")
            {
                ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                         "alert('Please Check Email');", true);
            }
            else
            {
                using (MailMessage mm = new MailMessage(new MailAddress("coursekatta <support@coursekatta.com>"), new MailAddress(txtEmail.Text)))
                {
                    mm.Subject = "coursekatta : Password retrieve Email";

                    mm.Body = PopulateBody(pass);

                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "relay-hosting.secureserver.net";
                    smtp.EnableSsl = false;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    NetworkCredential NetworkCred = new NetworkCredential("support@coursekatta.com", "supportck@17");
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;
                    smtp.Send(mm);
                    txtEmail.Text = "";
                    ScriptManager.RegisterStartupScript(
                            this,
                            this.GetType(),
                            "MessageBox",
                             "alert('Email sent please check your Inbox');", true);
                }
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
}