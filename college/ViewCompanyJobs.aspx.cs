
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
using System.Net;
using System.IO;
using MySql.Data.MySqlClient;

public partial class college_ViewCompanyJobs : System.Web.UI.Page
{
    #region init settings
    // player width
    private int _W = 100;

    // player height
    private int _H = 100;

    // autoplay disabled
    bool auto = false;
    #endregion
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();

    MySqlConnection cn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString);

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
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] == null)
            {
                Response.Redirect("~/Default.aspx");
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
            }

            else
            {
                 
                ViewMyJobs.NavigateUrl = "~/college/ViewCompanyJobs.aspx";
                createJob.NavigateUrl = "~/college/ComCreateJob.aspx";
                 
                if (dbc.select_isTutor(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) == "1")
                {
                    forCompany.Visible = true;
                    OverView.PostBackUrl = "~/college/ComProfile.aspx#about";
                    Services.PostBackUrl = "~/college/ComProfile.aspx#courses";
                    Team.PostBackUrl = "~/college/ComProfile.aspx#facility";
                    Reviews.PostBackUrl = "~/college/ComProfile.aspx#media";
                }
                else
                {
                    forCollege.Visible = true;
                    OverView.PostBackUrl = "~/college/Profile.aspx#about";
                    Services.PostBackUrl = "~/college/Profile.aspx#courses";
                    Team.PostBackUrl = "~/college/Profile.aspx#facility";
                    Reviews.PostBackUrl = "~/college/Profile.aspx#media";
                }
                ViewApplications.NavigateUrl = "~/college/ViewJobApplicaions.aspx";
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                SqlDataSourceHomeCollege.SelectCommand = "SELECT DISTINCT intCollegeId,varCollegeName,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo,varCollegeEmail, varCollegeWeb, varPhoto FROM tblcollegedetails WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                SqlDataSource1.SelectCommand = "SELECT tbljobs.* FROM tbljobs where (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                GridView1.DataBind();
                lnkWebsite.NavigateUrl = dbc.select_CollegeWebName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkVideo.NavigateUrl = dbc.select_CollegeVideo(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkFacebook.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[0];
                lnkGplus.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[1];
                lnkTwitter.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[2];
                lnkLinkedIn.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[3];
            }
        }
    } 

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (dbc.select_isTutor(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) == "0")
        {
            Response.Redirect("~/college/Profile.aspx", false);
        }
        else
        {
            Response.Redirect("~/college/ComProfile.aspx", false);
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        profileView.Visible = true;
      
        Button3.Visible = false;
        Button2.Visible = true;
    } 
     
    protected void lnkbtnbroucher_Click(object sender, EventArgs e)
    {
        string webpage = dbc.select_CollegeWebBrochure(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
        bool isaAvailable = String.IsNullOrEmpty(webpage);
        if (!isaAvailable)
            Response.Redirect("~/college/media/" + webpage + "");
        else
            ClientScript.RegisterStartupScript(this.GetType(),
                      "popup",
                      "alert('Brochure Not available');window.location='ViewCompanyJobs.aspx'",
                      true);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (dbc.select_isTutor(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) == "0")
        {
            Response.Redirect("~/college/InstitituteSettings.aspx", false);
        }
        else
        {
            Response.Redirect("~/college/ComSettings.aspx", false);
        }
    }

    protected void GridView1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deletes")
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("delete from tbljobs where intId=" + e.CommandArgument + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();

            ClientScript.RegisterStartupScript(this.GetType(),
                "popup",
                "alert('Data Updated.');window.location='ViewCompanyJobs.aspx'",
                true);


        }
    }
}