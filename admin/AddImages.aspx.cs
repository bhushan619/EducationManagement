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
using MySql.Data.MySqlClient;
public partial class admin_AddImages : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
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
    protected void btnCoordinates_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
    protected void btnImagePanel_Click(object sender, EventArgs e)
    {
        string filename = string.Empty;
        try
        {
            if (dbc.check_imgcount(Convert.ToInt32(Request.QueryString["id"])) < 6)
            {
                string ffileExt = System.IO.Path.GetExtension(fupImage.FileName);

                if ((ffileExt == ".JPG") || (ffileExt == ".jpg") || (ffileExt == ".JPEG") || (ffileExt == ".jpeg") || (ffileExt == ".PNG") || (ffileExt == ".png"))
                {
                    filename = Convert.ToInt32(Request.QueryString["id"]) + "_" + txtImage.Text.Replace("'", "''") + "_" + fupImage.FileName.ToString();
                    int insert_ok = dbc.insert_tblcollegemedia(Convert.ToInt32(Request.QueryString["id"]), "Image", txtImage.Text.Replace("'", "''"), filename);
                    if (insert_ok == 1)
                    {
                        fupImage.SaveAs(Server.MapPath("~/college/media/") + filename);
                        ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Data Updated.');window.location='AddImages.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                     true);

                    }
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
                ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Six photos adready uploaded');", true);
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
            btnImagePanel.Visible = false;
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
            MySqlCommand cmd = new MySqlCommand("select varMediaName from tblcollegemedia where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtImage.Text = dbc.dr["varMediaName"].ToString();

            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select media to edit')</script>");
        }
        dbc.con.Close();
    }

    public void deletedata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("delete from tblcollegemedia where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("~/admin/AddImages.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select media to delete')</script>");
        }
        dbc.con.Close();
    }
    protected void UpdateCom_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = string.Empty;

            if (!fupImage.HasFile)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Please select a picture');", true);

                return;
            }
            else
            {
                string ffileExt = System.IO.Path.GetExtension(fupImage.FileName);
                if ((ffileExt == ".JPG") || (ffileExt == ".jpg") || (ffileExt == ".JPEG") || (ffileExt == ".jpeg") || (ffileExt == ".PNG") || (ffileExt == ".png"))
                {
                    filename = Convert.ToInt32(Request.QueryString["id"]) + "_" + txtImage.Text + "_" + fupImage.FileName.ToString();
                    int update_insp = dbc.update_PicCol(Convert.ToInt32(fid), txtImage.Text, filename);

                    if (update_insp == 1)
                    {
                        fupImage.SaveAs(Server.MapPath("~/college/media/") + filename);

                        ClientScript.RegisterStartupScript(this.GetType(),
                               "popup",
                               "alert('Data Updated.');window.location='AddImages.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
                               true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Data Not Inserted');", true);
                    }
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
}