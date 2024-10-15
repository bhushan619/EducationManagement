using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using MySql.Data.MySqlClient;

public partial class User_ViewUserEducation : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    MySqlConnection cn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString);
    RegexUtilities rex = new RegexUtilities();
    static string id;
    static string skillid;
    public static string html = "";
    static string imageUrl;
    static string PostmaxId;
    static string like;
    static string privious = "";
    static string Voteid;
    static string eventid;
    static string[] p_Ids;
    static int cnt = 0;
    string p_id;
    static int volunteerId = 0;
    static string Address, City, Occupation, Designation, Birthdate, varStudentPath, BloodGroup, Gender, Skill_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getData(rex.DecryptString(Request.QueryString["id"].ToString()));
           
        }

    }
    public void getData(string where)
    { 
        SqlDataSourceEdu.SelectCommand = "SELECT intId as id, intStudentId, varStudentClass, varStudentCollege, varStudentUniversity, varStudentPassingYear, varStudentMarks, varStudentPer, varStudentGrade FROM tblstudenteducationaldetails WHERE (intStudentId = " + where + ") order by varStudentPassingYear desc";
        userEdu.DataBind();
    }
  
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");

    }
    protected void btnOtherDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");

    }
    protected void btnDocs_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");
    }
    protected void btnApplied_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/appointment.aspx");

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('UploadPic.aspx')</script>");
    }

    protected void Label6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserEducation.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
    }

    protected void Label5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserCareer.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
    }
    protected void proName_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
    }
    public string ConvertDate(string dt)
    {
        string converted = "";
        try
        {
            string date1 = dt;
            if (date1.Contains('-'))
            {
                date1 = date1.Replace('-', '/');
            }

            DateTime dox = DateTime.ParseExact(date1, "M/dd/yyyy", CultureInfo.InvariantCulture);

            //Label27.Text = "LU :" + dox.ToShortDateString();
            converted = dox.ToShortDateString();
            return converted;
        }
        catch
        {
            return converted;
        }

    }
     
}