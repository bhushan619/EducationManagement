<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    DatabaseConnection dbc = new DatabaseConnection();
    public static System.Uri previousUri;
    protected void Page_Load(object sender, EventArgs e)
    {
        previousUri = Request.UrlReferrer;

        try
        {
            sendmail();
            ClientScript.RegisterStartupScript(this.GetType(),
            "popup",
            "alert('Enquiry Submitted Successfully..!!');window.location='" + previousUri.ToString() + "';",
            true);
        }
        catch (Exception ass)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                      "popup",
                      "alert('" + ass.Message + "');window.location='" + previousUri.ToString() + "';",
                      true);
        }
    }

    protected void sendmail()
    {
        try
        {
            string mess = string.Empty;
            string email = string.Empty;
            
            email = Request["eml"].ToString();

            using (System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(new System.Net.Mail.MailAddress("coursekatta <support@coursekatta.com>"), new System.Net.Mail.MailAddress("coursekatta <support@coursekatta.com>")))
            {
                mm.Subject = "coursekatta : Enquiry Email";

                mm.Body = "Name :" + Request["nm"].ToString() + "/n Email Id: " + Request["eml"].ToString() + "/n Mobile : " + Request["mob"].ToString() + "/n Enruiry about: " + Request["enq"].ToString();

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
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
