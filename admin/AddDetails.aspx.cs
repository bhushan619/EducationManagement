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

public partial class admin_AddDetails : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["adminid"] == null)
        {
            Response.Redirect("~/login.aspx");

            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/admin/login.aspx");
        }
        else
        {
            lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
            getImage();
        }
        if (!IsPostBack)
        {
            getdatacollege();
        }
    }
    public void getImage()
    {
        imgProfile.ImageUrl = "~/college/media/" + dbc.select_CollegeProfile(Convert.ToInt32(Request.QueryString["id"]));

    }
    public void getdatacollege()
    {
        dbc.con.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT intCollegeId,varAboutOne,varAboutTwo,varBrochure,varUniAns,varSpecialAchievements,varNAACAns,varPlacementRecordPer FROM tblcollegeotherdetails where intCollegeId = " + Convert.ToInt32(Request.QueryString["id"]) + "", dbc.con);
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        {
            txtVision.Text = dbc.dr["varAboutOne"].ToString();
            txtObjective.Text = dbc.dr["varAboutTwo"].ToString();
            txtUgc.Text = dbc.dr["varUniAns"].ToString();
            txtNaac.Text = dbc.dr["varNAACAns"].ToString();
            txtPlaceRecord.Text = dbc.dr["varPlacementRecordPer"].ToString();
            txtSpecialAchievements.Text= dbc.dr["varSpecialAchievements"].ToString();
        }
        dbc.con.Close();
    }
    protected void btnPanelOther_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = string.Empty;
            try
            {
                string ffileExt = System.IO.Path.GetExtension(fupFeeStruc.FileName);
                if (ffileExt == "")
                {
                    filename = string.Empty;
                }
                else if ((ffileExt == ".PDF") || (ffileExt == ".pdf") || (ffileExt == ".DOCX") || (ffileExt == ".docx"))
                {
                    filename = Convert.ToInt32(Request.QueryString["id"]) + "_" + fupFeeStruc.FileName.ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Please select proper file format');", true);
                    return;

                }
                int insert_ok = dbc.update_tblCollegeOtherFacilities(Convert.ToInt32(Request.QueryString["id"]), txtVision.Text.Replace("'", "''"), txtObjective.Text.Replace("'", "''"), txtUgc.Text.Replace("'", "''"), txtNaac.Text.Replace("'", "''"), txtPlaceRecord.Text.Replace("'", "''"), filename, txtSpecialAchievements.Text.Replace("'", "''"));
                if (insert_ok == 1)
                {
                    if (ffileExt == "")
                    {
                    }
                    else
                    {
                        fupFeeStruc.SaveAs(Server.MapPath("~/college/media/") + filename);
                    }
                    ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                         "alert('Updated');", true);
                    clear();
                    //ClientScript.RegisterStartupScript(this.GetType(),
                    //   "popup",
                    //   "window.location='" + "CollegeOther.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Not Updated');", true);
                    return;
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
        txtNaac.Text = "";
        txtObjective.Text = "";
        txtPlaceRecord.Text = "";
        txtUgc.Text = "";
        txtVision.Text = "";
        txtSpecialAchievements.Text = "";
        getdatacollege();
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
}