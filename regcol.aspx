<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    DatabaseConnection dbc = new DatabaseConnection();
    public static System.Uri previousUri;
    protected void Page_Load(object sender, EventArgs e)
    {
        previousUri = Request.UrlReferrer;
        try
        {
            if (dbc.check_already_college(Request["eml"].ToString()) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Already Registered Please Login');window.location='login.aspx';",
                     true);
            }
            else
            {
                string verify = dbc.CreateRandomPassword(8);
                //                int insert_ok = dbc.insert_tblCollegeFirstDetail(Request["nm"].ToString(), Request["eml"].ToString(), Request["mob"].ToString(), Request["pas"].ToString(), verify, 0);

                //if (insert_ok == 1)
                //{
                //    sendmail(verify, "c");
                //    ClientScript.RegisterStartupScript(this.GetType(),
                //    "popup",
                //    "alert(''Registration completed please check email for verification'');window.location='" + previousUri.ToString() + "';",
                //    true);

                //}
            }
        }
        catch (Exception ass)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                      "popup",
                      "alert('" + ass.Message + "');window.location='" + previousUri.ToString() + "';",
                      true);
        }
    }
    private string PopulateBody(string Name, string EmailId, string VerifyLink)
    {
        string body = string.Empty;
        using (System.IO.StreamReader reader = new System.IO.StreamReader(Server.MapPath("~/admin/emails/register.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Name}", Name);
        body = body.Replace("{EmailId}", EmailId);
        body = body.Replace("{VerifyLink}", VerifyLink);
        return body;
    }
    protected void sendmail(string verify, string cos)
    {
        try
        {
            string mess = string.Empty;
            string email = string.Empty;
            mess = "http://coursekatta.com/admin/verify.aspx?cvid=";
            email = Request["eml"].ToString();

            using (System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(new System.Net.Mail.MailAddress("coursekatta <support@coursekatta.com>"), new System.Net.Mail.MailAddress(email)))
            {
                mm.Subject = "coursekatta : Verification Email";

                mm.Body = PopulateBody(Request["nm"].ToString(), email, mess + verify);

                mm.IsBodyHtml = true;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = "relay-hosting.secureserver.net";
                smtp.EnableSsl = false;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential("support@coursekatta.com", "supportck@17");
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;
                smtp.Send(mm);

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
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="regs" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
