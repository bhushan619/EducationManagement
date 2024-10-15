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
using MySql.Data.MySqlClient;

public partial class college_Default : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["collegeid"] == null)
        {
            Response.Redirect("~/login.aspx");
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }


        if (!IsPostBack)
        {

        }
        lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
        BindGrid("varApplied=N'Yes'", grdAppointment);
    }
    public void BindGrid(string what, GridView bind)
    {
        string CollegeName = string.Empty;
        string Course = string.Empty;
        string StudentId = string.Empty;

        ////data reader we will use to read data from our tables
        MySqlDataReader rdr2;
        if (!IsPostBack)
        {
            TemplateField bfield = new TemplateField();
            bfield.HeaderText = "Student Name";
            // bfield.DataField = "CollegeName";
            bind.Columns.Add(bfield);

            BoundField efield = new BoundField();
            efield.HeaderText = "Course";
            efield.DataField = "Course";
            bind.Columns.Add(efield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] {
                        new DataColumn("Student", typeof(string)),
                        new DataColumn("Course", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT DISTINCT intStudentId, varDate, varTime, varApplied, varScheduled, varCourse FROM  tblstudentschedule WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and " + what + "", cnnd);
        cmdd.CommandType = CommandType.Text;

        using (cnnd)
        {
            //open connection
            cnnd.Open();
            //read data from the table to our data reader
            rdr2 = cmdd.ExecuteReader();
            //loop through each row we have read
            while (rdr2.Read())
            {
                CollegeName = dbc.select_StudentName(Convert.ToInt32(rdr2["intStudentId"].ToString()));
                Course = rdr2["varCourse"].ToString();
                StudentId = rdr2["intStudentId"].ToString();
                dt.Rows.Add(CollegeName, Course, StudentId);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "Student";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["Student"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["StudentId"].ToString();
        }
    }
    protected void ViewCollege(object sender, EventArgs e)
    {
        try
        {
            string url = string.Empty;
            LinkButton lnkView = (sender as LinkButton);
            string id = lnkView.CommandArgument;
            Response.Redirect("~/student/ViewProfile.aspx?id=" + id + "");

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


    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/CollegeOther.aspx");
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/Profile.aspx");
    }
}