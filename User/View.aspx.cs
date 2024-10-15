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
using MySql.Data.MySqlClient;

public partial class user_View : System.Web.UI.Page
{
    MySqlConnection con;
    public MySqlDataReader dr;
    DatabaseConnection dbc = new DatabaseConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Cookies["userid"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();


        }
        catch (Exception ex)
        {
            Response.Redirect("~/default.aspx", false);
        }
        location();
    }
    public void location()
    {

        //lblLocation.Text = "At " + "<script type='text/javascript'>locate();</script>";

    }


    protected void btnSearchTabOne_Click(object sender, EventArgs e)
    {
        if (txtCourse.Text == "")
        {
            ScriptManager.RegisterStartupScript(
               this,
               this.GetType(),
               "MessageBox",
               "alert('Please select Course');", true);
        }
        else if (txtCity.Text == "")
        {
            ScriptManager.RegisterStartupScript(
               this,
               this.GetType(),
               "MessageBox",
               "alert('Please select City.');", true);
        }
        else
        {
            Response.Redirect("~/user/search.aspx?institute=" + txtCourse.Text + "&city=" + txtCity.Text + "");
        }
    }
   
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCourses(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select distinct varCollegeName as UserName, 'x' as UserId   from tblcollegedetails where varCollegeName like  '%" + prefixText + "%' and isTutor = 0", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        return CourseNames;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCity(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open(); //"select * from tblcoursekattaCity where varCity like  '%" + prefixText + "%' "
        MySqlCommand cmd = new MySqlCommand("select distinct varCollegeCity as UserName,'x' as UserId  from tblcollegedetails where varCollegeCity like  '%" + prefixText + "%' ", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        return CourseNames;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetInstitute(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select distinct varCollegeName as UserName,'x' as UserId   from tblcollegedetails where varCollegeName like  '%" + prefixText + "%' and isTutor=0", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        return CourseNames;
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetUniversity(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select distinct varCollegeName as UserName,'x' as UserId   from tblcollegedetails where varCollegeName like  '%" + prefixText + "%' and isTutor=1", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        return CourseNames;
    }
}