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

public partial class admin_CollegeOther : System.Web.UI.Page
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
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCity(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString "].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select * from tbledmitracity where varCity like '%'+@Name+'%'", con);
        cmd.Parameters.AddWithValue("@Name", prefixText);
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(dt.Rows[i][1].ToString());
        }
        return CourseNames;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCourses(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select * from tbledmitracourses where varCourses like '%'+@Name+'%'", con);
        cmd.Parameters.AddWithValue("@Name", prefixText);
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(dt.Rows[i][1].ToString());
        }
        return CourseNames;
    }
    public void getcollegedata()
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT  intCollegeId, varCollegeName, varCollegePrincipal,varCollegeAdmissionIncharge,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo, varContactThree, varCollegeWeb from tblcollegedetails where intCollegeId = " + Convert.ToInt32(Request.QueryString["id"].ToString()) + "", dbc.con);

            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtName.Text = dbc.dr["varCollegeName"].ToString();
                txtAddress.Text = dbc.dr["varCollegeAddress"].ToString();
                txtCity.Text = dbc.dr["varCollegeCity"].ToString();
                ddlState.SelectedValue = dbc.dr["varCollegeState"].ToString();
                txtCnt1.Text = dbc.dr["varContactOne"].ToString();
                txtCnt2.Text = dbc.dr["varContactTwo"].ToString();
                txtCnt3.Text = dbc.dr["varContactThree"].ToString();
                txtWeb.Text = dbc.dr["varCollegeWeb"].ToString();
                txtPrincName.Text = dbc.dr["varCollegePrincipal"].ToString();
                txtAdminInch.Text = dbc.dr["varCollegeAdmissionIncharge"].ToString();

            }
            dbc.con.Close();
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


    protected void btnOtherDetail_Click(object sender, EventArgs e)
    {
        edit.Visible = false;
        editbtns.Visible = false;
        DetailsView1.Visible = false;

    }


   

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;
        DetailsView1.Visible = false;
        edit.Visible = true;

        editbtns.Visible = true;
        getcollegedata();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //int insert_ok = dbc.update_tblCollegeDetail(Convert.ToInt32(Request.QueryString["id"].ToString()), txtName.Text, txtAddress.Text, txtCity.Text, ddlState.Text, txtCnt1.Text, txtCnt2.Text, txtCnt3.Text, txtWeb.Text, txtPrincName.Text, txtAdminInch.Text);
            //if (insert_ok == 1)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(),
            //      "popup",
            //      "alert('Updated successfully.');window.location='" + "CollegeOther.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
            //      true);
            //}
            clear();
            btnSubmit.Visible = false;
            btnEdit.Visible = false;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Error Please try again');", true);
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
        DetailsView1.Visible = true;
        edit.Visible = false;
    }
    public void clear()
    {
        txtName.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        ddlState.Text = "";
        txtCnt1.Text = "";
        txtCnt2.Text = "";
        txtCnt3.Text = "";
        txtWeb.Text = "";
        txtAdminInch.Text = "";
        txtAdminInch.Text = "";
    }


    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetUniversity(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString "].ConnectionString;


        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select * from tbledmitrauniversity where varUniversity like '%'+@Name+'%'", con);
        cmd.Parameters.AddWithValue("@Name", prefixText);
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(dt.Rows[i][1].ToString());
        }
        return CourseNames;
    }
    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        DetailsView1.Visible = true;
        editbtns.Visible = true;
        edit.Visible = false;
    }
    protected void btnCoordinates_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/AddCoordinates.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
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
