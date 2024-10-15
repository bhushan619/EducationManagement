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

public partial class college_AdminSetting : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    RegexUtilities rex = new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridAdmissionConf(grdAdmissionConfirmed);
            BindGridGridViewRecieved("varApplied=N'Yes'", GridViewRecieved);
            BindGridGridViewprocess(GridViewprocess);
            BindGridscheduled(GridViewscheduled);
            BindGridGridViewAppconfirmed(GridViewAppconfirmed);
            BindGridGridViewVisitdone(GridViewVisitdone);
            BindGridGridViewAdmissionrejected(GridViewAdmissionrejected);
        }
    }
    public void BindGridGridViewAdmissionrejected(GridView bind)
    {
        string CollegeName = string.Empty;
        string Course = string.Empty;
        string Reason = string.Empty;
        string StudentId = string.Empty;
        string Remark = string.Empty;

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

            BoundField ffield = new BoundField();
            ffield.HeaderText = "Comment";
            ffield.DataField = "Comment";
            bind.Columns.Add(ffield);

            BoundField gfield = new BoundField();
            gfield.HeaderText = "Remark";
            gfield.DataField = "Remark";
            bind.Columns.Add(gfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("Student", typeof(string)),
                        new DataColumn("Course", typeof(string)),
                        new DataColumn("Comment", typeof(string)),
                         new DataColumn("Remark", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a sql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT intCollegeId, intStudentId, varStatus, varCourse, varReason,varRemark FROM tblcollegeprocess WHERE intCollegeId = " + Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " AND (varStatus = N'Rejected')", cnnd);
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
                Reason = rdr2["varReason"].ToString();
                Remark = rdr2["varRemark"].ToString();
                dt.Rows.Add(CollegeName, Course, Reason, Remark, StudentId);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void GridViewAdmissionrejected_OnRowDataBound(object sender, GridViewRowEventArgs e)
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

    public void BindGridGridViewVisitdone(GridView bind)
    {
        string CollegeName = string.Empty;
        string Date = string.Empty;
        string Time = string.Empty;
        string StudentId = string.Empty;
        string Applied = string.Empty;
        string Schedule = string.Empty;
        ////data reader we will use to read data from our tables
        MySqlDataReader rdr2;
        if (!IsPostBack)
        {
            TemplateField bfield = new TemplateField();
            bfield.HeaderText = "Student Name";
            // bfield.DataField = "CollegeName";
            bind.Columns.Add(bfield);

            BoundField efield = new BoundField();
            efield.HeaderText = "Date";
            efield.DataField = "Date";
            bind.Columns.Add(efield);

            BoundField cfield = new BoundField();
            cfield.HeaderText = "Time";
            cfield.DataField = "Time";
            bind.Columns.Add(cfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);

            TemplateField tsfield = new TemplateField();
            tsfield.HeaderText = "Applied";
            tsfield.Visible = false;
            bind.Columns.Add(tsfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("CollegeName", typeof(string)),
                        new DataColumn("Date", typeof(string)),
                        new DataColumn("Time", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
                        new DataColumn("Applied", typeof(string)),

        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a sql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT DISTINCT intStudentId, varDate, varTime, varApplied, varScheduled FROM tblstudentschedule WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varScheduled=N'Done' ", cnnd);
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
                Date = rdr2["varDate"].ToString();
                Time = rdr2["varTime"].ToString();
                StudentId = rdr2["intStudentId"].ToString();
                Applied = rdr2["varApplied"].ToString();
                Schedule = rdr2["varScheduled"].ToString();

                dt.Rows.Add(CollegeName, Date, Time, StudentId, Applied);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void GridViewVisitdone_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "CollegeName";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["CollegeName"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["StudentId"].ToString();
        }
    }



    public void BindGridGridViewAppconfirmed(GridView bind)
    {
        string CollegeName = string.Empty;
        string Date = string.Empty;
        string Time = string.Empty;
        string StudentId = string.Empty;
        string Applied = string.Empty;
        string Schedule = string.Empty;
        ////data reader we will use to read data from our tables
        MySqlDataReader rdr2;
        if (!IsPostBack)
        {
            TemplateField bfield = new TemplateField();
            bfield.HeaderText = "Student Name";
            // bfield.DataField = "CollegeName";
            bind.Columns.Add(bfield);

            BoundField efield = new BoundField();
            efield.HeaderText = "Date";
            efield.DataField = "Date";
            bind.Columns.Add(efield);

            BoundField cfield = new BoundField();
            cfield.HeaderText = "Time";
            cfield.DataField = "Time";
            bind.Columns.Add(cfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);

            TemplateField tsfield = new TemplateField();
            tsfield.HeaderText = "Applied";
            tsfield.Visible = false;
            bind.Columns.Add(tsfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("CollegeName", typeof(string)),
                        new DataColumn("Date", typeof(string)),
                        new DataColumn("Time", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
                        new DataColumn("Applied", typeof(string)),

        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT DISTINCT intStudentId, varDate, varTime, varApplied, varScheduled FROM tblstudentschedule WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varScheduled=N'Confirmed'", cnnd);
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
                Date = rdr2["varDate"].ToString();
                Time = rdr2["varTime"].ToString();
                StudentId = rdr2["intStudentId"].ToString();
                Applied = rdr2["varApplied"].ToString();
                Schedule = rdr2["varScheduled"].ToString();

                dt.Rows.Add(CollegeName, Date, Time, StudentId, Applied);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void GridViewAppconfirmed_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "CollegeName";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["CollegeName"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["StudentId"].ToString();
        }
    }

    public void BindGridscheduled(GridView bind)
    {
        string CollegeName = string.Empty;
        string Date = string.Empty;
        string Time = string.Empty;
        string StudentId = string.Empty;
        string Applied = string.Empty;
        string Schedule = string.Empty;
        ////data reader we will use to read data from our tables
        MySqlDataReader rdr2;
        if (!IsPostBack)
        {
            TemplateField bfield = new TemplateField();
            bfield.HeaderText = "Student Name";
            // bfield.DataField = "CollegeName";
            bind.Columns.Add(bfield);

            BoundField efield = new BoundField();
            efield.HeaderText = "Date";
            efield.DataField = "Date";
            bind.Columns.Add(efield);

            BoundField cfield = new BoundField();
            cfield.HeaderText = "Time";
            cfield.DataField = "Time";
            bind.Columns.Add(cfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);

            TemplateField tsfield = new TemplateField();
            tsfield.HeaderText = "Applied";
            tsfield.Visible = false;
            bind.Columns.Add(tsfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("CollegeName", typeof(string)),
                        new DataColumn("Date", typeof(string)),
                        new DataColumn("Time", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
                        new DataColumn("Applied", typeof(string)),

        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT DISTINCT intStudentId, varDate, varTime, varApplied, varScheduled FROM tblstudentschedule WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varScheduled=N'Yes' ", cnnd);
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
                Date = rdr2["varDate"].ToString();
                Time = rdr2["varTime"].ToString();
                StudentId = rdr2["intStudentId"].ToString();
                Applied = rdr2["varApplied"].ToString();
                Schedule = rdr2["varScheduled"].ToString();

                dt.Rows.Add(CollegeName, Date, Time, StudentId, Applied);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void GridViewscheduled_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "CollegeName";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["CollegeName"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["StudentId"].ToString();
        }
    }

    public void BindGridGridViewprocess(GridView bind)
    {
        string CollegeName = string.Empty;
        string Course = string.Empty;
        string Reason = string.Empty;
        string StudentId = string.Empty;
        string Remark = string.Empty;

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

            BoundField ffield = new BoundField();
            ffield.HeaderText = "Comment";
            ffield.DataField = "Comment";
            bind.Columns.Add(ffield);

            BoundField gfield = new BoundField();
            gfield.HeaderText = "Remark";
            gfield.DataField = "Remark";
            bind.Columns.Add(gfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("Student", typeof(string)),
                        new DataColumn("Course", typeof(string)),
                        new DataColumn("Comment", typeof(string)),
                         new DataColumn("Remark", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT intCollegeId, intStudentId, varStatus, varCourse, varReason,varRemark FROM tblcollegeprocess WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " AND (varStatus = N'Hold')", cnnd);
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
                Reason = rdr2["varReason"].ToString();
                Remark = rdr2["varRemark"].ToString();
                dt.Rows.Add(CollegeName, Course, Reason, Remark, StudentId);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void GridViewprocess_OnRowDataBound(object sender, GridViewRowEventArgs e)
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
    public void BindGridGridViewRecieved(string what, GridView bind)
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

    protected void GridViewRecieved_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "Student";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["Student"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollegeRex;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["StudentId"].ToString();
        }
    }

    public void BindGridAdmissionConf(GridView bind)
    {
        string CollegeName = string.Empty;
        string Course = string.Empty;
        string Reason = string.Empty;
        string StudentId = string.Empty;
        string Remark = string.Empty;

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

            BoundField ffield = new BoundField();
            ffield.HeaderText = "Comment";
            ffield.DataField = "Comment";
            bind.Columns.Add(ffield);

            BoundField gfield = new BoundField();
            gfield.HeaderText = "Remark";
            gfield.DataField = "Remark";
            bind.Columns.Add(gfield);

            TemplateField tfield = new TemplateField();
            tfield.Visible = false;
            bind.Columns.Add(tfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("Student", typeof(string)),
                        new DataColumn("Course", typeof(string)),
                        new DataColumn("Comment", typeof(string)),
                         new DataColumn("Remark", typeof(string)),
                        new DataColumn("StudentId", typeof(string)),
        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT intCollegeId, intStudentId, varStatus, varCourse, varReason,varRemark FROM tblcollegeprocess WHERE intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " AND (varStatus = N'Confirmed')", cnnd);
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
                Reason = rdr2["varReason"].ToString();
                Remark = rdr2["varRemark"].ToString();
                dt.Rows.Add(CollegeName, Course, Reason, Remark, StudentId);
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }
    protected void grdAdmissionConfirmed_OnRowDataBound(object sender, GridViewRowEventArgs e)
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
            Response.Redirect("~/user/ViewUserProfile.aspx?id=" + res.EncryptString(id));

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
    protected void ViewCollegeRex(object sender, EventArgs e)
    {
        try
        {
            string url = string.Empty;
            LinkButton lnkView = (sender as LinkButton);
            string id = lnkView.CommandArgument;
            Response.Redirect("~/user/ViewUserProfile.aspx?id=" + res.EncryptString(id));

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


}