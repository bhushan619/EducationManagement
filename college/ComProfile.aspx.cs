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

public partial class college_ComProfile : System.Web.UI.Page
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
            if (Request.Cookies["collegeid"] == null)
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
                SqlDataSourceFeedback.SelectCommand = "SELECT tbluserdetails.varuserName, tbluserdetails.varPhoto, tblfeedback.intRating, tblfeedback.varComment, tblfeedback.ex1 FROM tblfeedback INNER JOIN tbluserdetails ON tblfeedback.intuserId = tbluserdetails.intuserId where intCollegeId=" + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + " limit 5";
                lstRating.DataBind();
                SqlDataSource2.SelectCommand = "SELECT intId, intCollegeId, varFacultyName, varDegree, varIntro, fb, gp, tw, lnkd,ex1 FROM tblfacultymembers WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                ListView4.DataBind();
                SqlDataSourceHomeCollege.SelectCommand = "SELECT DISTINCT intCollegeId,varCollegeName,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo,varCollegeEmail, varCollegeWeb, varPhoto FROM tblcollegedetails WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                SqlDataSourceCollegeMedia.SelectCommand = "SELECT intCollegeId, varMediaPath, varMediaName FROM tblcollegemedia WHERE ((intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ") AND (varMediaType = 'Image')) LIMIT 5";
                sdsParent.SelectCommand = "SELECT distinct intCollegeId,varCourseType FROM tblcollegecourses where (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            //    SqlDataSourcecom.SelectCommand = "SELECT DISTINCT varCompanyName FROM tblcollegecomp WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lblObjective.Text = dbc.select_CollegeObj(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lblVision.Text = dbc.select_CollegeVision(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                lnkWebsite.NavigateUrl = dbc.select_CollegeWebName(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkVideo.NavigateUrl = dbc.select_CollegeVideo(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
                lnkFacebook.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[0];
                lnkGplus.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[1];
                lnkTwitter.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[2];
                lnkLinkedIn.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))).Split(';')[3];
                //lbllike.Text = dbc.select_CollegeLikes(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
                //  lblviews.Text = String.IsNullOrEmpty(dbc.select_CollegeViews(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())))))?"15":"50";
                //  ltrlVideo.Text = YouTubeScript.Get(dbc.select_Video((Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))))), auto, _W, _H);
                createAccordianUsingRepeaterFacility();
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
                addview();
            }
        }
    }

    public void addview()
    {
        if (dbc.check_already_View(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString())) != 0)
        {
            dbc.insert_tblViews(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString()));
        }
        else
        {
            // dbc.update_tblcollegeviews(Convert.ToInt32(lblviews.Text) + 1, Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString()));
            // lblviews.Text = dbc.select_CollegeViews(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
        }
    }
    public void createAccordianUsingRepeaterFacility()
    {
        repAccFacility.DataSource = createDataTableFacility();
        repAccFacility.DataBind();
    }

    public DataTable createDataTableFacility()
    {
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "Facility";
        dc.DataType = typeof(string);
        dt.Columns.Add(dc);

        dc = new DataColumn();
        dc.ColumnName = "FacilityDescription";
        dc.DataType = typeof(string);
        dt.Columns.Add(dc);

        dc = new DataColumn();
        dc.ColumnName = "id";
        dc.DataType = typeof(string);
        dt.Columns.Add(dc);

        dbc.con.Open();
        dbc.cmd = new MySqlCommand("SELECT intid ,intCollegeId,varFacility,varFacilityDescription FROM tblfacilities where intCollegeId='" + Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) + "'", dbc.con);
        dbc.dr = dbc.cmd.ExecuteReader();
        while (dbc.dr.Read())
        {
            dt.Rows.Add(new object[] { dbc.dr["varFacility"].ToString(), dbc.dr["varFacilityDescription"].ToString(), dbc.dr["intid"].ToString() });
        }
        dbc.con.Close();
        return dt;
    }

    protected void OpenCollege(object sender, EventArgs e)
    {
        int collegeid = Convert.ToInt32((sender as LinkButton).CommandArgument);
        Response.Redirect("~/user/ViewCollege.aspx?id=" + collegeid + "");
    }
    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/Profile.aspx");
    }


    protected void btnApply_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
            Response.Redirect("~/college/Apply.aspx?id=" + id + "");
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
    protected void btnVisit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/college/Visit.aspx?id=" + Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) + "");
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/student/View.aspx?id=" + rex.DecryptString(Request.Cookies["studentid"].Value.ToString()) + "");
    }

    protected void lblColgWeb_Click(object sender, EventArgs e)
    {
        string webpage = dbc.select_CollegeWebName(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))));
        Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('" + webpage + "','_newtab');", true);

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
                        "alert('Brochure Not available');window.location='ComProfile.aspx'",
                        true);
    }
    protected void btnlike_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["studentid"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            if (dbc.check_already_liked(Convert.ToInt32(rex.DecryptString(Request.Cookies["studentid"].Value.ToString())), Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString())) != 0)
            {
                int insert_ok1 = dbc.insert_tblLikes(Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString()), Convert.ToInt32(rex.DecryptString(Request.Cookies["studentid"].Value.ToString())));
                if (insert_ok1 == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Liked');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())).ToString()) + "';",
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
                ScriptManager.RegisterStartupScript(
                           this,
                           this.GetType(),
                           "MessageBox",
                           "alert('Already Liked');", true);
            }
        }
    }

    protected void fbLink_Click(object sender, EventArgs e)
    {

    }

    protected void twLink_Click(object sender, EventArgs e)
    {

    }

    protected void gpLink_Click(object sender, EventArgs e)
    {

    }

    protected void Btnsave_Click(object sender, EventArgs e)
    {
        dbc.con.Open();
        dbc.cmd = new MySqlCommand("INSERT INTO tblfeedback( intuserId, intCollegeId, intRating, varComment ) VALUES (" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "," + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + "," + txtRating.Text + ",'" + txtFeedback.Text.Replace("'", "''") + "')", dbc.con);
        dbc.cmd.ExecuteNonQuery();
        dbc.con.Close();

        ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                         "alert('Thank you for your feedback');", true);
        txtFeedback.Text = "";
        txtRating.Text = "1";
        SqlDataSourceFeedback.SelectCommand = "SELECT tbluserdetails.varuserName, tbluserdetails.varPhoto, tblfeedback.intRating, tblfeedback.varComment, tblfeedback.ex1 FROM tblfeedback INNER JOIN tbluserdetails ON tblfeedback.intuserId = tbluserdetails.intuserId where intCollegeId=" + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + " limit 5";
        lstRating.DataBind();
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
    //protected void btnPost_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        //if (!String.IsNullOrEmpty(TxtDescription.Text))
    //        //{
    //        string date = DateTime.Now.ToString("dd-MM-yyyy");
    //        string time = DateTime.UtcNow.ToShortTimeString();

    //        string extensin = System.IO.Path.GetExtension(FileUpload1.FileName);

    //        if (FileUpload1.HasFile)
    //        {

    //            if (extensin == ".jpg" || extensin == ".jpeg" || extensin == ".JPEG" || extensin == ".JPG" || extensin == ".png" || extensin == ".PNG" || extensin == ".gif")
    //            {
    //                string filename = Path.GetFileName(FileUpload1.FileName);
    //                FileUpload1.SaveAs(Server.MapPath("~/PostImages/") + filename);
    //                imageUrl = "PostImages/" + PostmaxId + filename;
    //            }
    //            else
    //            {
    //                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Invalid Image Filetype');", true);
    //            }
    //        }
    //        else
    //        {
    //            imageUrl = "PostImages/NoImage.png";
    //        }
    //        cn.Open();
    //        MySqlCommand cmd4 = new MySqlCommand();
    //        cmd4.Connection = cn;
    //        cmd4.CommandText = "select MAX(Post_Id) from tbl_post ";

    //        MySqlDataReader dr4 = cmd4.ExecuteReader();

    //        while (dr4.Read())
    //        {
    //            PostmaxId = dr4[0].ToString();
    //        }

    //        if (PostmaxId == "")
    //        {

    //            PostmaxId = "1";
    //        }
    //        else
    //        {
    //            PostmaxId = Convert.ToString(Convert.ToInt32(PostmaxId) + 1);
    //        }
    //        dr4.Close();
    //        cn.Close();

    //        cn.Open();
    //        string QuerysavePost = "insert into tbl_post values('" + PostmaxId + "','" + imageUrl + "','" + TxtDescription.Text.Replace("'", "''") + "','" + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + "','Everyone','" + date + "','" + time + "','No','Yes','1')";
    //        MySqlCommand cmd5 = new MySqlCommand(QuerysavePost, cn);
    //        cmd5.ExecuteNonQuery();
    //        cn.Close();

    //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Post Submitted successfully ');", true);
    //        TxtDescription.Text = "";
    //        TimelineUserControl.BindTimeLine();
    //        //}
    //        //else
    //        //{
    //        //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please enter post text matter');", true);
    //        //}
    //    }
    //    catch (Exception ex)
    //    {
    //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
    //    }
    //}
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

            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Post Submitted successfully ');", true);
            TxtDescription.Text = "";
            TimelineUserControl.BindTimeLine();
            //Response.Redirect("Profile.aspx", false);
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