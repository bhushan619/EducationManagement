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

public partial class admin_AddFacilities : System.Web.UI.Page
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
    protected void btnAddFacility_Click(object sender, EventArgs e)
    {
        // string filename = string.Empty;
        try
        {

            int insert_ok1 = dbc.insert_tblColFacility(Convert.ToInt32(Request.QueryString["id"]), txtFName.Text.Replace("'", "''"), txtFDescrip.Text.Replace("'", "''"));
            if (insert_ok1 == 1)
            {

                ClientScript.RegisterStartupScript(this.GetType(),
           "popup",
           "alert('Data Updated.');window.location='AddFacilities.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
           true);
                clear();

            }
            else
            {
                ScriptManager.RegisterStartupScript(
                this,
                this.GetType(),
                "MessageBox",
                "alert('Data Updated');", true);
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
    
    public void clear()
    {
        txtFName.Text = "";
        txtFDescrip.Text = "";
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
            btnAddFacility.Visible = false;
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
            MySqlCommand cmd = new MySqlCommand("select varFacility,varFacilityDescription from tblfacilities where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtFName.Text = dbc.dr["varFacility"].ToString();
                txtFDescrip.Text = dbc.dr["varFacilityDescription"].ToString();
            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select facility to edit')</script>");
        }
        dbc.con.Close();
    }

    public void deletedata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("delete from tblfacilities where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("~/admin/AddFacilities.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select facility to delete')</script>");
        }
        dbc.con.Close();
    }
    protected void UpdateCom_Click(object sender, EventArgs e)
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblfacilities SET varFacility='" + txtFName.Text.Replace("'", "''") + "',varFacilityDescription='" + txtFDescrip.Text.Replace("'", "''") + "' WHERE intId=" + fid + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');window.location='AddFacilities.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "';",
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