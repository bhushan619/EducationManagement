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
using MySql.Data.MySqlClient;

public partial class SiteLogin : System.Web.UI.Page
{
    MySqlConnection con;
    public MySqlDataReader dr;
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            con = new MySqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
            user();

        }
    }



    public void user()
    {
        try
        {
            string uname = Request["unamee"].ToString();
            string pass = Request["passe"].ToString(); ;
            MySqlCommand cmd = new MySqlCommand("select intuserId,varuserEmail,varPassword from tbluserdetails where varuserEmail='" + uname + "' and varVerified='true'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["varPassword"].ToString() == pass)
                {
                    HttpCookie userId = new HttpCookie("userId");
                    userId.Value = rex.EncryptString(dr["intuserId"].ToString());
                    Response.Cookies.Add(userId);

                    Response.Redirect("~/user/", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                          "alert('Password incorrect or you have not verified yourself.');window.location='Default.aspx'", true);


                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                          "alert('Password incorrect or you have not verified yourself.');window.location='Default.aspx'", true);
            }
            con.Close();
        }
        catch (Exception ss)
        {
            ScriptManager.RegisterStartupScript(
                          this,
                          this.GetType(),
                          "MessageBox",
                           "alert('Password incorrect or you have not verified yourself.');window.location='Default.aspx'", true);
        }
    }

    //public void studentd()
    //{
    //    try
    //    {
    //         MySqlCommand cmd = new  MySqlCommand("select intStudentId,varStudentEmail,varPassword from tblstudentdetail where varStudentEmail='" + Request["txtName"].ToString() + "' and varVerified='true'", con);
    //        con.Open();
    //        dr = cmd.ExecuteReader();
    //        if (dr.Read())
    //        {
    //            if (dr["varPassword"].ToString() == Request["txtPass"].ToString())
    //            {
    //                HttpCookie studentid = new HttpCookie("studentid");
    //                studentid.Value = rex.EncryptString(dr["intStudentId"].ToString());
    //                Response.Cookies.Add(studentid);

    //                Response.Redirect("~/student/");
    //            }
    //            else
    //            {
    //                lblError.Visible = true;
    //                lblError.Text = "Password incorrect or you have not verified yourself.";
    //            }
    //        }
    //        else
    //        {
    //            lblError.Visible = true;
    //            lblError.Text = "Password incorrect or you have not verified yourself.";
    //        }

    //    }
    //    catch (Exception ss)
    //    {
    //        lblError.Visible = true;
    //        lblError.Text = "Password incorrect or you have not verified yourself.";
    //    }
    //}

    //public void colleged()
    //{
    //    try
    //    {
    //        string uname = txtName.Text;
    //        string pass = txtPass.Text;
    //         MySqlCommand cmd = new  MySqlCommand("select intCollegeId,varCollegeEmail,varPassword from tblcollegedetails where varCollegeEmail='" + Request["txtName"].ToString() + "' and varVerified='true'", con);
    //        con.Open();
    //        dr = cmd.ExecuteReader();
    //        if (dr.Read())
    //        {
    //            if (dr["varPassword"].ToString() == Request["txtPass"].ToString())
    //            {
    //                HttpCookie collegeId = new HttpCookie("collegeId");
    //                collegeId.Value = rex.EncryptString(dr["intCollegeId"].ToString());
    //                Response.Cookies.Add(collegeId);

    //                Response.Redirect("~/college/");
    //            }
    //            else
    //            {
    //                lblError.Visible = true;
    //                lblError.Text = "Password incorrect or you have not verified yourself.";
    //            }
    //        }
    //        else
    //        {
    //            lblError.Visible = true;
    //            lblError.Text = "Password incorrect or you have not verified yourself.";
    //        }
    //        con.Close();
    //    }
    //    catch (Exception ss)
    //    {
    //        lblError.Visible = true;
    //        lblError.Text = "Password incorrect or you have not verified yourself.";
    //    }
    //}
}