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

public partial class admin_AddCourses : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex=new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["adminid"] == null)
        {
            Response.Redirect("~/admin/login.aspx");

            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (Request.QueryString["id"].ToString() == null)
        {
            Response.Redirect("~/admin/login.aspx");
        }
        else
        {
            lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
            getImage();
        }
    }
    public void getImage()
    {
        imgProfile.ImageUrl = "~/college/media/" + dbc.select_CollegeProfile(Convert.ToInt32(Request.QueryString["id"]));

    }
   


    public void clear()
    {
        txtAccre.Text = "";
        txtAddmision.Text = "";
        txtaffli.Text = "";
        txtCName.Text = "";
        txtDescription.Text = "";
        txtDuration.Text = "";
        txtFes.Text = "";
        ddlCourseType.Text = "--Select Course Type--";
    }

    protected void btnAddCourses_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_course(txtCName.Text, Convert.ToInt32(Request.QueryString["id"].ToString())) == 1)
            {
                int insert_ok1 = dbc.insert_tblColgCourse(Convert.ToInt32(Request.QueryString["id"].ToString()), ddlCourseType.SelectedItem.Text, txtCName.Text.Replace("'", "''"), txtDescription.Text.Replace("'", "''"), txtDuration.Text.Replace("'", "''"), txtFes.Text.Replace("'", "''"), txtaffli.Text.Replace("'", "''"), txtAccre.Text.Replace("'", "''"), txtAddmision.Text.Replace("'", "''"));
                if (insert_ok1 == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                            "popup",
                            "alert('Data Updated.');window.location='AddCourses.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                            true);
                    clear();
                }

                else
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Not Updated');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                           this,
                           this.GetType(),
                           "MessageBox",
                           "alert('Course Already Exists');", true);
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
    protected void btnCoordinates_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/CollegeOther.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void btnImages_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddImages.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('../~/../college/UploadPic.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "')</script>");
    }
    protected void btnFacilityDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddFacilities.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void btnLastsDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCourses.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void btnCompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCompany.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void btnMedia_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddVideo.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void lnkAddDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddDetails.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }

    static int fid = 0;
    protected void grdCollegeData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                setdata(fid);
            }
            btnAddCourses.Visible = false;
            UpdateCom.Visible = true;
        }
        else if (e.CommandName.Equals("deletes"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                deletedata(fid);
            }
        }
    }

    public void setdata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCourseType,varCourseName,varCourseDescription,varDuration,varFees,varAffliation,varAccredited,varAdmissionCriteria from tblcollegecourses where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                ddlCourseType.Text = dbc.dr["varCourseType"].ToString();
                txtCName.Text = dbc.dr["varCourseName"].ToString();
                txtDescription.Text = dbc.dr["varCourseDescription"].ToString();
                txtDuration.Text = dbc.dr["varDuration"].ToString();
                txtFes.Text = dbc.dr["varFees"].ToString();
                txtaffli.Text = dbc.dr["varAffliation"].ToString();
                txtAccre.Text = dbc.dr["varAccredited"].ToString();
                txtAddmision.Text = dbc.dr["varAdmissionCriteria"].ToString();
            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select course to edit')</script>");
        }
        dbc.con.Close();
    }

    public void deletedata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("delete from tblcollegecourses where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("~/admin/AddCourses.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select course to delete')</script>");
        }
        dbc.con.Close();
    }
    protected void UpdateCom_Click(object sender, EventArgs e)
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegecourses SET varCourseType=N'" + ddlCourseType.Text.Replace("'", "''") + "',varCourseName=N'" + txtCName.Text.Replace("'", "''") + "',varCourseDescription=N'" + txtDescription.Text.Replace("'", "''") + "',varDuration=N'" + txtDuration.Text + "',varFees=N'" + txtFes.Text.Replace("'", "''") + "',varAffliation=N'" + txtaffli.Text.Replace("'", "''") + "',varAccredited=N'" + txtAccre.Text.Replace("'", "''") + "',varAdmissionCriteria=N'" + txtAddmision.Text.Replace("'", "''") + "' WHERE intId=" + fid + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');window.location='AddCourses.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                    true);
            clear();
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

