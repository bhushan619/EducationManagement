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

public partial class User_CreateJob : System.Web.UI.Page
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
                JobsView.NavigateUrl = "~/User/ViewCompanyJobs.aspx?id=" + Request.QueryString["id"];
                ViewMyJobs.NavigateUrl = "~/User/ViewCompanyJobs.aspx?id=" + Request.QueryString["id"];
                createJob.NavigateUrl = "~/User/CreateJob.aspx?id=" + Request.QueryString["id"];
                lblCollegName.Text = dbc.select_CollegeName(Convert.ToInt32(Request.QueryString["id"]));
                // lblObjective.Text = dbc.select_CollegeObj(Convert.ToInt32(Request.QueryString["id"]));
                //lblVision.Text = dbc.select_CollegeVision(Convert.ToInt32(Request.QueryString["id"]));
                //lbluni.Text = dbc.select_Collegeuni(Convert.ToInt32(Request.QueryString["id"]));
                //lblnaac.Text = dbc.select_Collegenaac(Convert.ToInt32(Request.QueryString["id"]));
                ////lbllike.Text = dbc.select_CollegeLikes(Convert.ToInt32(Request.QueryString["id"]));
                //  lblviews.Text = String.IsNullOrEmpty(dbc.select_CollegeViews(Convert.ToInt32(Request.QueryString["id"])))?"15":"50";
                //  ltrlVideo.Text = YouTubeScript.Get(dbc.select_Video((Convert.ToInt32(Request.QueryString["id"]))), auto, _W, _H);

            }
        }
    }




    protected void OpenCollege(object sender, EventArgs e)
    {
        int collegeid = Convert.ToInt32((sender as LinkButton).CommandArgument);
        Response.Redirect("~/user/ViewCollege.aspx?id=" + collegeid + "");
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

}