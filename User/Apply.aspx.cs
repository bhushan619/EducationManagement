using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


public partial class User_Apply : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    RegexUtilities rex = new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
        SqlDataSourceCourse.SelectCommand = "SELECT intid, intCollegeId, varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE intCollegeId=" + Request.QueryString["id"] + " ORDER BY varCourseName";
        ddlCourse.DataBind();
        Button4.PostBackUrl = "~/User/Appointments.aspx?id=" + Request.QueryString["id"].ToString();
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

    protected void btnVisit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Visit.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
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

    protected void btnApply_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int insert_ok = dbc.update_tblstudentscheduleApply(Convert.ToInt32(res.DecryptString(Request.Cookies["userid"].Value.ToString())), id, "a", "NULL", "NULL", ddlCourse.SelectedValue);
            if (insert_ok == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Applied');",
                         true);
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

    protected void Button1_Click(object sender, EventArgs e)
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
}