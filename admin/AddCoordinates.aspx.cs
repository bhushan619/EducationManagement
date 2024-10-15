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
using System.Drawing;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;

public partial class admin_AddCoordinates : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
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
        SqlDataSourceMedia.SelectCommand = "SELECT varLatitude, varLongitude FROM tblcollegecoordinates WHERE (intCollegeId = " + Convert.ToInt32(Request.QueryString["id"]) + ")";
        SqlDataSourceMedia.DataBind();
    }

    protected void btnMediaPanel_Click(object sender, EventArgs e)
        {
        try
        { 
            if (dbc.check_already_coordinates(Convert.ToInt32(Request.QueryString["id"].ToString())) != 1)
            {
                int insert_ok = dbc.insert_tblcollegecoordinates(Convert.ToInt32(Request.QueryString["id"].ToString()), txtLatitude.Text.Replace("'", "''"), txtLongitude.Text.Replace("'", "''"));
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Data Updated.');window.location='AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                     true);
                    txtLatitude.Text = "";
                    txtLongitude.Text = "";

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            else
            {
                int insert_ok = dbc.update_tblcollegecoordinate(Convert.ToInt32(Request.QueryString["id"].ToString()), txtLatitude.Text.Replace("'", "''"), txtLongitude.Text.Replace("'", "''"));
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                      "alert('Data Updated.');window.location='AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                    true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
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
        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('../college/UploadPic.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "')</script>");
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
    protected void btnCoordinates_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
}