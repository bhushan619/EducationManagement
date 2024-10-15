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

public partial class student_ViewCollege : System.Web.UI.Page
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
                SqlDataSourceFeedback.SelectCommand = "SELECT tbluserdetails.varuserName, tbluserdetails.varPhoto, tblfeedback.intRating, tblfeedback.varComment, tblfeedback.ex1 FROM tblfeedback INNER JOIN tbluserdetails ON tblfeedback.intuserId = tbluserdetails.intuserId where intCollegeId=" + Request.QueryString["id"] + " limit 5";
                lstRating.DataBind();
                Jobss.NavigateUrl = "~/user/viewcompanyjobs.aspx?id=" + Request.QueryString["id"];
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
                lblObjective.Text = dbc.select_CollegeObj(Convert.ToInt32(Request.QueryString["id"]));
                lblVision.Text = dbc.select_CollegeVision(Convert.ToInt32(Request.QueryString["id"]));
                lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(Request.QueryString["id"]));
                lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(Request.QueryString["id"]));
                lnkWebsite.NavigateUrl = dbc.select_CollegeWebName(Convert.ToInt32(Request.QueryString["id"]));
                lnkVideo.NavigateUrl=dbc.select_CollegeVideo(Convert.ToInt32(Request.QueryString["id"]));
                lnkFacebook.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[0];
                lnkGplus.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[1];
                lnkTwitter.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[2];
                lnkLinkedIn.NavigateUrl = dbc.select_CollegeLinks(Convert.ToInt32(Request.QueryString["id"])).Split(';')[3];   //lbllike.Text = dbc.select_CollegeLikes(Convert.ToInt32(Request.QueryString["id"]));
                //  lblviews.Text = String.IsNullOrEmpty(dbc.select_CollegeViews(Convert.ToInt32(Request.QueryString["id"])))?"15":"50";
                //  ltrlVideo.Text = YouTubeScript.Get(dbc.select_Video((Convert.ToInt32(Request.QueryString["id"]))), auto, _W, _H);
                createAccordianUsingRepeaterFacility();
                addview();

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
            }
        }
    } 
  
    public void addview()
    {
        if (dbc.check_already_View(Convert.ToInt32(Request.QueryString["id"].ToString())) != 0)
        {
            dbc.insert_tblViews(Convert.ToInt32(Request.QueryString["id"].ToString()));
        }
        else
        {
            // dbc.update_tblcollegeviews(Convert.ToInt32(lblviews.Text) + 1, Convert.ToInt32(Request.QueryString["id"].ToString()));
            // lblviews.Text = dbc.select_CollegeViews(Convert.ToInt32(Request.QueryString["id"]));
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
        dbc.cmd = new MySqlCommand("SELECT intid ,intCollegeId,varFacility,varFacilityDescription FROM tblfacilities where intCollegeId='" + Convert.ToInt32(Request.QueryString["id"]) + "'", dbc.con);
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
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("~/User/Apply.aspx?id=" + id + "");
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
        Response.Redirect("~/User/Visit.aspx?id=" + Convert.ToInt32(Request.QueryString["id"]) + "");
    }
  
    protected void lblColgWeb_Click(object sender, EventArgs e)
    {
        string webpage = dbc.select_CollegeWebName(Convert.ToInt32(Request.QueryString["id"]));
        Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('" + webpage + "','_newtab');", true);

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
                        "alert('Brochure Not available');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
                        true);
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
                    "alert('Liked');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
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
                      "alert('UnLiked');window.location='ViewCollege.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';",
                      true);
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
    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {


        try
        {

            string postname = "", vol_id = "", vol_name = "";

            MySqlCommand cmdPostDetail = new MySqlCommand("Select * from tbl_post where Post_Id=" + e.CommandArgument.ToString(), cn);
            cn.Open();
            MySqlDataReader drPostDetail = cmdPostDetail.ExecuteReader();
            if (drPostDetail.Read())
            {
                postname = drPostDetail[2].ToString();
                vol_id = drPostDetail[3].ToString();
            }
            drPostDetail.Close();
            cn.Close();
            string date = "", time = "";
            date = DateTime.Now.ToString("dd-MM-yyyy");
            time = DateTime.Now.ToShortTimeString();

            MySqlCommand cmdPostVol = new MySqlCommand("SELECT  varuserName FROM tbluserdetails WHERE intuserid=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()), cn);
            cn.Open();
            MySqlDataReader drPostVol = cmdPostVol.ExecuteReader();
            if (drPostVol.Read())
            {
                vol_name = drPostVol[0].ToString();
            }
            drPostVol.Close();
            cn.Close();


            eventid = e.CommandArgument.ToString();


            MySqlCommand cmd4 = new MySqlCommand("Select * from tbl_post where Post_Id='" + eventid + "'", cn);
            cn.Open();
            MySqlDataReader dr4 = cmd4.ExecuteReader();
            if (dr4.Read())
            {

                privious = dr4[9].ToString();

            }
            cn.Close();
            dr4.Close();
            //if (privious != "" || privious == null)
            //{

            //    id = privious + "," + id;
            //}

            Voteid = privious + "," + id;





            if (e.CommandName == "LikePost")
            {
                cn.Open();
                MySqlCommand cmd6 = new MySqlCommand("select * from tbl_likecomment where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                MySqlDataReader dr2 = cmd6.ExecuteReader();
                if (dr2.Read())
                {
                    dr2.Close();
                    MySqlCommand cmd5 = new MySqlCommand("update tbl_likecomment set Like_Post='Yes' where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                    cmd5.ExecuteNonQuery();
                    cn.Close();



                    //   Response.Redirect("VolunteerTimeline.aspx");

                    for (int i = 0; i <= ListView1.Items.Count - 1; i++)
                    {
                        HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
                        p_id = p_i.Value;
                        cn.Open();
                        MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment where Like_Post='Yes' and Comment is NULL and Post_Id=" + p_id, cn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            Label l = (Label)ListView1.Items[i].FindControl("lblLikes");
                            l.Text = ds.Tables[0].Rows[0][0].ToString();
                        }
                        cn.Close();
                    }


                }
                else
                {
                    dr2.Close();
                    MySqlCommand cmd7 = new MySqlCommand();
                    cmd7.Connection = cn;
                    cmd7.CommandText = "insert into tbl_likecomment ( Post_Id, intuserid, Like_Post, Comment, Vote) values('" + e.CommandArgument + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','Yes',NULL,NULL)";
                    cmd7.ExecuteNonQuery();
                    // Response.Redirect("VolunteerTimeline.aspx");

                }
                cn.Close();



                for (int i = 0; i <= ListView1.Items.Count - 1; i++)
                {
                    HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
                    p_id = p_i.Value;
                    cn.Open();
                    MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment where Like_Post='Yes' and Comment is NULL and Post_Id=" + p_id, cn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        Label l = (Label)ListView1.Items[i].FindControl("lblLikes");
                        l.Text = ds.Tables[0].Rows[0][0].ToString();
                    }
                    cn.Close();
                }
            }


            if (e.CommandName.ToString() == "SubmitComment")
            {
                TextBox comment = e.Item.FindControl("TxtComment") as TextBox;
                //Response.Write(comment.Text);



                if (String.IsNullOrEmpty(comment.Text))
                {

                }
                else
                {
                    cn.Open();
                    MySqlCommand cmd6 = new MySqlCommand("select * from tbl_likecomment where Post_Id=" + e.CommandArgument, cn);
                    MySqlDataReader dr2 = cmd6.ExecuteReader();
                    if (dr2.Read())
                    {
                        if (dr2[3].ToString() == "")
                        {
                            like = "NULL";
                        }
                        else
                        {
                            like = "Yes";
                        }
                        dr2.Close();


                    }
                    cn.Close();


                    string QuerySaveComment = "insert into tbl_likecomment ( Post_Id, intuserid, Like_Post, Comment, Vote) values(" + e.CommandArgument + "," + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ",'" + like + "','" + comment.Text + "',NULL)";
                    cn.Open();
                    MySqlCommand cmd = new MySqlCommand(QuerySaveComment, cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    comment.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Commented');", true);


                    for (int i = 0; i <= ListView1.Items.Count - 1; i++)
                    {
                        HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
                        p_id = p_i.Value;
                        cn.Open();
                        MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment where Comment!='' and Post_Id=" + p_id, cn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            Label l = (Label)ListView1.Items[i].FindControl("LblComment");
                            l.Text = ds.Tables[0].Rows[0][0].ToString();
                        }
                        cn.Close();
                    }

                    Repeater rptcom = e.Item.FindControl("Repeater1") as Repeater;
                    rptcom.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
        }

    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/Appointments.aspx?id=" + Request.QueryString["id"] + "");
    }
}