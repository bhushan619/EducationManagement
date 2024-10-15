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
public partial class User_Appointments : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
        Button4.PostBackUrl = "~/User/Appointments.aspx?id=" + Request.QueryString["id"].ToString();
        BindGrid("varApplied='Yes' or varApplied='Confirmed'", grdApplied);
        BindGrid("varScheduled='Yes'", grdAppointment);
    }
    public void BindGrid(string what, GridView bind)
    {
        string CollegeName = string.Empty;
        string Date = string.Empty;
        string Time = string.Empty;
        string CollegeId = string.Empty;
        string Applied = string.Empty;
        string Schedule = string.Empty;
        ////data reader we will use to read data from our tables
        MySqlDataReader rdr2;
        if (!IsPostBack)
        {
            TemplateField bfield = new TemplateField();
            bfield.HeaderText = "College Name";
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

            tfield = new TemplateField();
            bind.Columns.Add(tfield);

            TemplateField tsfield = new TemplateField();
            tsfield.HeaderText = "Applied";
            tsfield.Visible = false;
            bind.Columns.Add(tsfield);

            BoundField idfield = new BoundField();
            idfield.DataField = "id";
            idfield.Visible = false;
            bind.Columns.Add(idfield);
        }
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[6] {
                        new DataColumn("CollegeName", typeof(string)),
                        new DataColumn("Date", typeof(string)),
                        new DataColumn("Time", typeof(string)),
                        new DataColumn("CollegeId", typeof(string)),
                        new DataColumn("Applied", typeof(string)),
                           new DataColumn("id", typeof(string)),

        });

        DataRow dr = dt.NewRow();

        MySqlConnection cnnd = new MySqlConnection();
        cnnd.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        //send a MySql command to select everything from the first tabl
        MySqlCommand cmdd = new MySqlCommand("SELECT DISTINCT intId,intCollegeId, varDate, varTime, varApplied,varScheduled FROM tblstudentschedule WHERE intStudentId = " + Convert.ToInt32(rex.DecryptString(Request.Cookies["userid"].Value.ToString())) + " and " + what + "", cnnd);
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
                CollegeName = dbc.select_CollegeName(Convert.ToInt32(rdr2["intCollegeId"].ToString()));
                Date = rdr2["varDate"].ToString();
                Time = rdr2["varTime"].ToString();
                CollegeId = rdr2["intCollegeId"].ToString();
                Applied = rdr2["varApplied"].ToString();
                Schedule = rdr2["varScheduled"].ToString();

                if (grdApplied == bind)
                {
                    bind.Columns[1].Visible = false;
                    bind.Columns[2].Visible = false;
                }

                dt.Rows.Add(CollegeName, Date, Time, CollegeId, Applied, rdr2["intId"].ToString());
            }
            cnnd.Close();
            rdr2.Close();
        }
        bind.DataSource = dt;
        bind.DataBind();
    }

    protected void OnRowDataBoundAppointment(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "CollegeName";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["CollegeName"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["CollegeId"].ToString();

            LinkButton lnkView = new LinkButton();
            lnkView.ID = "lnkView";
            lnkView.Text = "Cancel";
            e.Row.Cells[4].Controls.Add(lnkView);

            lnkView.Click += WhatToDoAppointment;
            lnkView.CommandArgument = (e.Row.DataItem as DataRowView).Row["id"].ToString(); ;

        }
    }

    protected void OnRowDataBoundApplied(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton CollegeName = new LinkButton();
            CollegeName.ID = "CollegeName";
            CollegeName.Text = (e.Row.DataItem as DataRowView).Row["CollegeName"].ToString();
            e.Row.Cells[0].Controls.Add(CollegeName);
            CollegeName.Click += ViewCollege;
            CollegeName.CommandArgument = (e.Row.DataItem as DataRowView).Row["CollegeId"].ToString();

            LinkButton lnkView = new LinkButton();
            lnkView.ID = "lnkView";
            lnkView.Text = "Cancel";
            e.Row.Cells[4].Controls.Add(lnkView);

            lnkView.Click += WhatToDoApplied;
            lnkView.CommandArgument = (e.Row.DataItem as DataRowView).Row["id"].ToString(); ;

        }
    }

    protected void ViewCollege(object sender, EventArgs e)
    {
        try
        {
            string url = string.Empty;
            LinkButton lnkView = (sender as LinkButton);
            string id = lnkView.CommandArgument;
            Response.Redirect("~/user/ViewCollege.aspx?id=" + id + "");

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

    protected void WhatToDoApplied(object sender, EventArgs e)
    {
        try
        {
            string url = string.Empty;
            LinkButton lnkView = (sender as LinkButton);
            string id = lnkView.CommandArgument;
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set varApplied='No' where intId=" + id + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Cancelled');window.location='Appointment.aspx';",
                         true);
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
    protected void WhatToDoAppointment(object sender, EventArgs e)
    {
        try
        {
            string url = string.Empty;
            LinkButton lnkView = (sender as LinkButton);
            string id = lnkView.CommandArgument;
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set varScheduled='No' where intId=" + id + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Cancelled');window.location='Appointment.aspx';",
                         true);
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
    protected void btnApply_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("~/User/Apply.aspx?id=" + id + "");
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
    protected void btnVisit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Visit.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }

    protected void lblColgWeb_Click(object sender, EventArgs e)
    {
        string webpage = dbc.select_CollegeWebName(Convert.ToInt32(Request.QueryString["id"]));
        Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('" + webpage + "','_newtab');", true);

    }
    protected void lnkbtnbroucher_Click(object sender, EventArgs e)
    {
        string webpage = dbc.select_CollegeWebBrochure(Convert.ToInt32(Request.QueryString["id"]));
        bool isaAvailable = String.IsNullOrEmpty(webpage);
        if (!isaAvailable)
            Response.Redirect("~/college/media/" + webpage + "");
        else
            ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Brochure Not available');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
                        true);
    }
    protected void btnlike_Click(object sender, EventArgs e)
    {

        if (dbc.check_already_liked(Convert.ToInt32(rex.DecryptString(Request.Cookies["userid"].Value.ToString())), Convert.ToInt32(Request.QueryString["id"].ToString())) != 0)
        {
            int insert_ok1 = dbc.insert_tblLikes(Convert.ToInt32(Request.QueryString["id"].ToString()), Convert.ToInt32(rex.DecryptString(Request.Cookies["userid"].Value.ToString())));
            if (insert_ok1 == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Liked');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
                    true);
            }

            else
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Some Error Please try later');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Already Liked');", true);
        }
    }


    protected void fbLink_Click(object sender, EventArgs e)
    {

    }

    protected void twLink_Click(object sender, EventArgs e)
    {

    }

    protected void gpLink_Click(object sender, EventArgs e)
    {

    }

    protected void Btnsave_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                         "alert('Thank you for your feedback');", true);
        txtFeedback.Text = "";
        txtRating.Text = "1";
    }

}