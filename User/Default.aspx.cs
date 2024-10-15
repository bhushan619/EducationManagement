using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using MySql.Data.MySqlClient;

public partial class User_Default : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    MySqlConnection cn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString);
    RegexUtilities rex = new RegexUtilities();
    static string id;
    static string skillid;
    public static string html = "";
    static string imageUrl;
    static string PostmaxId;
    static string like;
    static string privious = "";
    static string Voteid;
    static string eventid;
    static string[] p_Ids;
    static int cnt = 0;
    string p_id;
    static int volunteerId = 0;
    static string Address, City, Occupation, Designation, Birthdate, varStudentPath, BloodGroup, Gender, Skill_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Default.aspx", false);
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetInstitute(string prefixText)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        HttpCookie reader = HttpContext.Current.Request.Cookies["userid"];
        MySqlConnection con = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmd = new MySqlCommand("select distinct varuserName as UserName,'x' as UserId   from tbluserdetails where intuserId<>" + RegExForAspx.regPass.DecryptStringPass(reader.Value.ToString()) + " and varuserName like  '%" + prefixText + "%' and varVerified='true'", con);

        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CourseNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
        con.Close();
        MySqlConnection conc = new MySqlConnection(connStr);
        con.Open();
        MySqlCommand cmdc = new MySqlCommand("select distinct varCollegeName as UserName,'x' as UserId   from tblcollegedetails where varCollegeName like  '%" + prefixText + "%' ", con);

        MySqlDataAdapter dac = new MySqlDataAdapter(cmd);
        DataTable dtc = new DataTable();
        dac.Fill(dtc);
        
        for (int i = 0; i < dtc.Rows.Count; i++)
        {
            CourseNames.Add(string.Format("{0}/{1}", dtc.Rows[i][0].ToString(), dtc.Rows[i][1].ToString()));
        }
        return CourseNames;
    }

    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");

    }
    protected void btnOtherDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");

    }
    protected void btnDocs_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/");
    }
    protected void btnApplied_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/appointment.aspx");

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('UploadPic.aspx')</script>");
    }

    public string ConvertDate(string dt)
    {
        string converted = "";
        try
        {
            string date1 = dt;
            if (date1.Contains('-'))
            {
                date1 = date1.Replace('-', '/');
            }

            DateTime dox = DateTime.ParseExact(date1, "M/dd/yyyy", CultureInfo.InvariantCulture);

            //Label27.Text = "LU :" + dox.ToShortDateString();
            converted = dox.ToShortDateString();
            return converted;
        }
        catch
        {
            return converted;
        }

    }

    protected void btnPost_Click(object sender, EventArgs e)
    {
        try
        {
            //if (!String.IsNullOrEmpty(TxtDescription.Text))
            //{
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string time = DateTime.UtcNow.ToShortTimeString();

            string extensin = System.IO.Path.GetExtension(FileUpload1.FileName);

            cn.Open();
            MySqlCommand cmd4 = new MySqlCommand();
            cmd4.Connection = cn;
            cmd4.CommandText = "select MAX(Post_Id) from tbl_post ";

            MySqlDataReader dr4 = cmd4.ExecuteReader();

            while (dr4.Read())
            {
                PostmaxId = dr4[0].ToString();
            }

            if (PostmaxId == "")
            {

                PostmaxId = "1";
            }
            else
            {
                PostmaxId = Convert.ToString(Convert.ToInt32(PostmaxId) + 1);
            }
            dr4.Close();
            cn.Close();
            if (FileUpload1.HasFile)
            {

                if (extensin == ".jpg" || extensin == ".jpeg" || extensin == ".JPEG" || extensin == ".JPG" || extensin == ".png" || extensin == ".PNG" || extensin == ".gif")
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/PostImages/") + PostmaxId + filename);
                    imageUrl = "PostImages/" + PostmaxId + filename;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Invalid Image Filetype');", true);
                }
            }
            else
            {
                imageUrl = "PostImages/NoImage.png";
            }
            cn.Open();
            string QuerysavePost = "insert into tbl_post values('" + PostmaxId + "','" + imageUrl + "','" + TxtDescription.Text.Replace("'", "''") + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','Everyone','" + date + "','" + time + "','No','Yes','0')";
            MySqlCommand cmd5 = new MySqlCommand(QuerysavePost, cn);
            cmd5.ExecuteNonQuery();
            cn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Post Submitted successfully ');", true);
            TxtDescription.Text = "";
            Response.Redirect("Default.aspx", false);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please enter post text matter');", true);
            //}
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
        }
    }


}