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

public partial class college_ComCreateJob : System.Web.UI.Page
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
                //JobsView.NavigateUrl = "~/college/ViewCompanyJobs.aspx";
                ViewMyJobs.NavigateUrl = "~/college/ViewCompanyJobs.aspx";
                createJob.NavigateUrl = "~/college/ComCreateJob.aspx";
                ViewApplications.NavigateUrl= "~/college/ViewJobApplicaions.aspx";

                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                SqlDataSourceHomeCollege.SelectCommand = "SELECT DISTINCT intCollegeId,varCollegeName,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo,varCollegeEmail, varCollegeWeb, varPhoto FROM tblcollegedetails WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lnkWebsite.NavigateUrl = dbc.select_CollegeWebName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkVideo.NavigateUrl = dbc.select_CollegeVideo(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkFacebook.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[0];
                lnkGplus.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[1];
                lnkTwitter.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[2];
                lnkLinkedIn.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[3];
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
            }
        }
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
                       "alert('Brochure Not available');window.location='ComCreateJob.aspx'",
                       true);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/ComProfile.aspx", false);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        profileView.Visible = true;

        Button3.Visible = false;
        Button2.Visible = true;
    }


    protected void HyperLink2_Click(object sender, EventArgs e)
    {
        int insert_ok = dbc.insert_tbljobs(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtDesignation.Text, txtopportunity.Text, txtResponsibilities.Text, txtQualification.Text, txtSkills.Text, txtSalary.Text, txtDate.Text, txtListing.Text);
        if (insert_ok == 1)
        {
             
            ClientScript.RegisterStartupScript(this.GetType(),
             "popup",
             "alert('Data Updated.');window.location='ViewCompanyJobs.aspx'",
             true);
        }
    }
}