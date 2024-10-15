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

public partial class User_ViewCompanyJobs : System.Web.UI.Page
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
    RegexUtilities rex = new RegexUtilities();

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
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("~/default.aspx");
            }
            else if (Request.Cookies["userid"] == null)
            {
                Response.Redirect("~/Default.aspx");
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
            }

            else
            {
                lnkVideo.NavigateUrl = dbc.select_CollegeVideo(Convert.ToInt32(Request.QueryString["id"]));
                Jobss.NavigateUrl = "~/User/ViewCompanyJobs.aspx?id=" + Request.QueryString["id"];
              
                lnkWebsite.NavigateUrl = dbc.select_CollegeWebName(Convert.ToInt32(Request.QueryString["id"]));
                lnkFacebook.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[0];
                lnkGplus.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[1];
                lnkTwitter.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[2];
                lnkLinkedIn.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[3];
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));

              
                if (dbc.select_isTutor(Request.QueryString["id"].ToString()) == "1")
                {
                    forCompany.Visible = true;
                    OverView.PostBackUrl = "~/User/ViewCompany.aspx?id=" + Request.QueryString["id"].ToString() + "#about";
                    Services.PostBackUrl = "~/User/ViewCompany.aspx?id=" + Request.QueryString["id"].ToString() + "#courses";
                    Team.PostBackUrl = "~/User/ViewCompany.aspx?id=" + Request.QueryString["id"].ToString() + "#facility";
                    Reviews.PostBackUrl = "~/User/ViewCompany.aspx?id=" + Request.QueryString["id"].ToString() + "#media";
                }
                else
                {
                    forCollege.Visible = true;
                    OverView.PostBackUrl = "~/User/ViewCollege.aspx?id=" + Request.QueryString["id"].ToString() + "#about";
                    Services.PostBackUrl = "~/User/ViewCollege.aspx?id=" + Request.QueryString["id"].ToString() + "#courses";
                    Team.PostBackUrl = "~/User/ViewCollege.aspx?id=" + Request.QueryString["id"].ToString() + "#facility";
                    Reviews.PostBackUrl = "~/User/ViewCollege.aspx?id=" + Request.QueryString["id"].ToString() + "#media";
                }
                //lblVision.Text = dbc.select_CollegeVision(Convert.ToInt32(Request.QueryString["id"]));
                //lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(Request.QueryString["id"]));
                //lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(Request.QueryString["id"]));
                ////lbllike.Text = dbc.select_CollegeLikes(Convert.ToInt32(Request.QueryString["id"]));
                //  lblviews.Text = String.IsNullOrEmpty(dbc.select_CollegeViews(Convert.ToInt32(Request.QueryString["id"])))?"15":"50";
                //  ltrlVideo.Text = YouTubeScript.Get(dbc.select_Video((Convert.ToInt32(Request.QueryString["id"]))), auto, _W, _H);
                dbc.con.Open();
                dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT intid, intCollegeId, intStudentId, intLikes FROM tblcollegelikes WHERE  intStudentId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + " and intCollegeId=" + Request.QueryString["id"].ToString() + "", dbc.con);
                dbc.dr = dbc.cmd.ExecuteReader();
                if (dbc.dr.Read())
                {
                    if (dbc.dr["intLikes"].ToString().Equals("yes"))
                    {
                        lbllike.Text = "Liked";
                    }
                }
                dbc.con.Close();
                SqlDataSource1.SelectCommand = "SELECT tbljobs.* FROM tbljobs where (intCollegeId = " + Request.QueryString["id"].ToString()+ ")";
                vacancies.DataBind();
            }
        }
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
                        "alert('Brochure Not available');window.location='ViewCompanyJobs.aspx?id=" + Request.QueryString["id"].ToString() + "';",
                        true);
    }
    protected void OpenCollege(object sender, EventArgs e)
    {
        int collegeid = Convert.ToInt32((sender as LinkButton).CommandArgument);
        Response.Redirect("~/user/ViewCollege.aspx?id=" + collegeid + "");
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
                    "alert('Liked');window.location='ViewCompanyJobs.aspx?id=" + Request.QueryString["id"].ToString() + "';",
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

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("delete from tblcollegelikes where intCollegeId=" + Request.QueryString["id"].ToString() + " and intStudentId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();

            ClientScript.RegisterStartupScript(this.GetType(),
                      "popup",
                      "alert('UnLiked');window.location='ViewCompanyJobs.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
                      true);
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        profileView.Visible = false;
        timelineView.Visible = true;
        Button3.Visible = true;
        Button2.Visible = false;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        profileView.Visible = true;
        timelineView.Visible = false;
        Button3.Visible = false;
        Button2.Visible = true;
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void vacancies_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName=="apply")
        {
            if (dbc.check_already_jobapplied(e.CommandArgument.ToString(), rex.DecryptString(Request.Cookies["userid"].Value.ToString())) == 0)
            {
                dbc.con.Open();
                dbc.cmd = new MySqlCommand("INSERT INTO tbljobapplications (intCollegeId, intuserId, intJobId, varStatus) VALUES (" + Request.QueryString["id"].ToString() + "," + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + " ," + e.CommandArgument.ToString() + ",'Applied')", dbc.con);
                dbc.cmd.ExecuteNonQuery();
                dbc.con.Close();

                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Applied Successfully');window.location='ViewCompanyJobs.aspx?id=" + Request.QueryString["id"].ToString() + "';",
                         true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Already Applied');window.location='ViewCompanyJobs.aspx?id=" + Request.QueryString["id"].ToString() + "';",
                        true);
            }
        }
        else
        {

        }
    }
}