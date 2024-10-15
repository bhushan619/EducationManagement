using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        if (!IsPostBack)
        {

        }
        location();
    }
    public void location()
    {
        //lblLocation.Text = "At " + "<script type='text/javascript'>locate();</script>";
        // sendmail();
    }
    private string PopulateBody(string Name, string EmailId, string VerifyLink)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/emails/register.htm")))
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
            if (cos == "c")
            {
                mess = "http://coursekatta.com/admin/verify.aspx?cvid=";
                email = txtEmail.Text;
            }
            else if (cos == "a")
            {
                mess = "http://coursekatta.com/admin/verify.aspx?avid=";
                email = txtEmail.Text;
            }
            else if (cos == "s")
            {
                mess = "http://coursekatta.com/admin/verify.aspx?svid=";
                email = txtEmail.Text;
            }
            else if (cos == "u")
            {
                mess = "http://coursekatta.com/admin/verify.aspx?uvid=";
                email = txtEmail.Text;
            }
            using (MailMessage mm = new MailMessage(new MailAddress("coursekatta <support@coursekatta.com>"), new MailAddress(email)))
            {
                mm.Subject = "coursekatta : Verification Email";

                mm.Body = PopulateBody(txtName.Text, email, mess + verify);

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

    static string OTP, Password;

    protected void btnRegStudent_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_user(txtEmail.Text) == 1)
            {

                lblError.Text = "This Email is already registered. Did You forget password? ";
            }
            else if (!(txtPassOne.Text).Equals(txtPassTwo.Text))
            {

                lblError.Text = "The Passwords are not same please try again..!!";
            }
            else
            {
                //pas.Text = txtPassOne.Text;
                //char[] charArr = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
                //string strrandom = string.Empty;
                //Random objran = new Random();
                //int noofcharacters = 6;
                //for (int i = 0; i < noofcharacters; i++)
                //{
                //    //It will not allow Repetation of Characters
                //    int pos = objran.Next(1, charArr.Length);
                //    if (!strrandom.Contains(charArr.GetValue(pos).ToString()))
                //        strrandom += charArr.GetValue(pos);
                //    else
                //        i--;
                //}
                //OTP = strrandom;

                //string mobile = txtPhone.Text;
                //string msg = "Dear " + txtName.Text + " OTP for coursekatta registration :  " + OTP;
                //string strUrl = "http://client.smsbazz.com/api/sendmsg.php?user=course&pass=CourseKatta@2017&sender=CRSKTA&phone=" + mobile + "&text=" + msg + "&priority=ndnd&stype=normal";
                //WebRequest request = HttpWebRequest.Create(strUrl);
                //HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                //Stream s = (Stream)response.GetResponseStream();
                //StreamReader readStream = new StreamReader(s);
                //string dataString = readStream.ReadToEnd();
                //response.Close();
                //s.Close();
                //readStream.Close();

                //reg.Visible = false;
                //otp.Visible = true;
                user();
            }
        }
        catch (Exception ex)
        {
            lblError.Visible = true;
            lblError.Text = "Please select College or Student";

            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
    }
    public void user()
    {
        try
        {
            int insert_ok=0;
            string verify = dbc.CreateRandomPassword(8);
            if (dbc.check_already_user(txtEmail.Text) == 0)
            {
                insert_ok = dbc.insert_tbluserFirstDetail(txtName.Text.Replace("'", "''") + " " + txtLastName.Text.Replace("'", "''"), txtEmail.Text.Replace("'", "''"), txtPhone.Text.Replace("'", "''"), txtPassTwo.Text.Replace("'", "''"), verify);
            }
            if (insert_ok != 0)
            {
                sendmail(verify, "u");
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Registration completed please check email for verification');window.location='Login.aspx'", true);
                clear();
            }
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

    public void clear()
    {
        txtEmail.Text = "";
        txtName.Text = "";
        txtPhone.Text = "";

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        stu.Visible = false;

        clear();

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        stu.Visible = true;
        clear();
    }



    protected void BtnComplete_Click(object sender, EventArgs e)
    {

        if (OTP == TxtOTP.Text)
        {
            //user();
        }
    }
}
    //protected void sendmail(string verify, string cos)
    //{
    //    try
    //    {
    //        string mess = string.Empty;
    //        string email = string.Empty;
    //        if (cos == "c")
    //        {
    //            mess = "http://coursekatta.com/admin/verify.aspx?cvid=";
    //            email = txtEmail.Text;
    //        }
    //        else if (cos == "a")
    //        {
    //            mess = "http://coursekatta.com/admin/verify.aspx?avid=";
    //            email = txtEmail.Text;
    //        }
    //        else if(cos == "s")
    //        {
    //            mess = "http://coursekatta.com/admin/verify.aspx?svid=";
    //            email = txtEmail.Text;
    //        }
    //        using (MailMessage mm = new MailMessage(new MailAddress("coursekatta <support@coursekatta.com>"), new MailAddress(email)))
    //        {
    //            mm.Subject = "coursekatta : Verification Email";

    //            mm.Body = PopulateBody(txtName.Text, email, mess + verify);

    //            mm.IsBodyHtml = true;
    //            SmtpClient smtp = new SmtpClient();
    //            smtp.Host = "relay-hosting.secureserver.net";
    //            smtp.EnableSsl = false;
    //            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
    //            NetworkCredential NetworkCred = new NetworkCredential("support@coursekatta.com", "supportck@17");
    //            smtp.UseDefaultCredentials = false;
    //            smtp.Credentials = NetworkCred;
    //            smtp.Port = 25;
    //            smtp.Send(mm);

    //        }
    //    }
    //    catch (Exception rx)
    //    {
    //        ScriptManager.RegisterStartupScript(
    //                     this,
    //                     this.GetType(),
    //                     "MessageBox",
    //                      "alert('not sent');", true);

    //    }
    //}
    //protected void btnRegStudent_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (rdbCollege.Checked == true)
    //        {
    //            college(0);
    //        }
    //        else if (rdbTutor.Checked == true)
    //        {
    //            college(1);
    //        }
    //        else if (rdbStudent.Checked == true)
    //        {
    //            student();
    //        }
    //        else if (rdbAdvertiser.Checked == true)
    //        {
    //            advertiser();
    //        }
    //        else
    //        {
    //            lblError.Visible = true;
    //            lblError.Text = "Please select College or Student";
    //        }
           
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(
    //               this,
    //               this.GetType(),
    //               "MessageBox",
    //               "alert('" + ex.Message + "');", true);
    //    }
    //}
    //public void college(Int16 isTutor)
    //{
    //    try
    //    {
    //        if (dbc.check_already_college(txtEmail.Text) == 1)
    //        {
                 
    //            lblError.Text = "This Email is already registered. Did You forget password? If yes please ";
    //        }
    //        else
    //        {
    //            string verify = dbc.CreateRandomPassword(8);
    //            //int insert_ok = dbc.insert_tblCollegeFirstDetail(txtName.Text.Replace("'", "''"), txtEmail.Text.Replace("'", "''"), txtPhone.Text.Replace("'", "''"), txtPassOne.Text.Replace("'", "''"), verify, isTutor);

    //            //if (insert_ok == 1)
    //            //{
    //            //    sendmail(verify, "c");
    //            //    ScriptManager.RegisterStartupScript(
    //            //       this,
    //            //       this.GetType(),
    //            //       "MessageBox",
    //            //       "alert('Registration completed please check email for verification');", true);
    //            //    clear();
    //            //}
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(
    //               this,
    //               this.GetType(),
    //               "MessageBox",
    //               "alert('" + ex.Message + "');", true);
    //    }
    //}
    //public void advertiser()
    //{
    //    try
    //    {
    //        if (dbc.check_already_advertiser(txtEmail.Text) == 1)
    //        {
    //            lblError.Text = "This Email is already registered. Did You forget password? If yes please ";
    //        }
    //        else
    //        {
    //            string verify = dbc.CreateRandomPassword(8);
    //            int insert_ok = dbc.insert_tblAdvertiser(txtName.Text.Replace("'", "''"), txtEmail.Text.Replace("'", "''"), txtPhone.Text.Replace("'", "''"), txtPassOne.Text.Replace("'", "''"), verify);

    //            if (insert_ok == 1)
    //            {
    //                sendmail(verify, "a");
    //                ScriptManager.RegisterStartupScript(
    //                   this,
    //                   this.GetType(),
    //                   "MessageBox",
    //                   "alert('Registration completed please check email for verification');", true);
    //                clear();
    //            }
    //            else
    //            {
    //                ScriptManager.RegisterStartupScript(
    //              this,
    //              this.GetType(),
    //              "MessageBox",
    //              "alert('Some problem Please try again');", true);
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(
    //               this,
    //               this.GetType(),
    //               "MessageBox",
    //               "alert('" + ex.Message + "');", true);
    //    }
    //}
    //public void student()
    //{
    //    try
    //    {
    //        if (dbc.check_already_student(txtEmail.Text) == 1)
    //        {
    //            lblError.Text = "This Email is already registered. Did You forget password? If yes please ";
    //        }
    //        else
    //        {
    //            string verify = dbc.CreateRandomPassword(8);
    //            int insert_ok = dbc.insert_tblstudentdetail(txtName.Text.Replace("'", "''"), txtEmail.Text.Replace("'", "''"), txtPhone.Text.Replace("'", "''"), txtPassOne.Text.Replace("'", "''"), verify);

    //            if (insert_ok == 1)
    //            {
    //                sendmail(verify, "s");
    //                ScriptManager.RegisterStartupScript(
    //                   this,
    //                   this.GetType(),
    //                   "MessageBox",
    //                   "alert('Registration completed please check email for verification');", true);
    //                clear();
    //            }
    //            else
    //            {
    //                ScriptManager.RegisterStartupScript(
    //              this,
    //              this.GetType(),
    //              "MessageBox",
    //              "alert('Some problem Please try again');", true);
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(
    //               this,
    //               this.GetType(),
    //               "MessageBox",
    //               "alert('" + ex.Message + "');", true);
    //    }
    //}
    //public void clear()
    //{
    //    txtEmail.Text = "";
    //    txtName.Text = "";
    //    txtPhone.Text = "";
        
    //}
    //protected void LinkButton2_Click(object sender, EventArgs e)
    //{
    //    stu.Visible = false;
       
    //    clear();

    //}
    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    stu.Visible = true;
      
    //    clear();
    //}
   

//}