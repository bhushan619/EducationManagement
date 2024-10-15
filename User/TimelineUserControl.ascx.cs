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

public partial class User_TimelineUserControl : System.Web.UI.UserControl
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
                BindTimeLine();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Default.aspx", false);
        }
    }

    public void BindTimeLine()
    {
        string query1 = " SELECT tbl_post.intStudentId, tbl_post.Post_Id, tbl_post.PostImage, tbl_post.Approve, tbl_post.Post_Description, tbl_post.Skill_Id, tbl_post.Dates, tbl_post.Times, tbl_post.Vote,  ";
        query1 += " tbluserdetails.intuserId, tbluserdetails.varuserName as Name, tbluserdetails.varPhoto ";
        query1 += " FROM tbl_post INNER JOIN ";
        query1 += " tbluserdetails ON tbl_post.intStudentId = tbluserdetails.intuserId ";
        query1 += " WHERE VOTE = '0' and  tbl_post.DeletePost='No' AND";
        query1 += " (tbl_post.Approve = 'Yes') ";
        
        cn.Open();
        DataTable dtt = new DataTable();

        MySqlDataAdapter cmd1 = new MySqlDataAdapter(query1, cn);

        cmd1.Fill(dtt);

        string query2 = "SELECT  tbl_post.intStudentId, tbl_post.Post_Id, tbl_post.PostImage, tbl_post.Approve, tbl_post.Post_Description, tbl_post.Skill_Id, tbl_post.Dates, tbl_post.Times, tbl_post.Vote,  ";
        query2 += " tblcollegedetails.intCollegeId AS intuserId, tblcollegedetails.varCollegeName AS Name, tblcollegedetails.varPhoto ";
        query2 += " FROM tbl_post INNER JOIN ";
        query2 += " tblcollegedetails ON tbl_post.intStudentId = tblcollegedetails.intCollegeId ";
        query2 += " WHERE VOTE = '1' and (tbl_post.DeletePost = 'No') AND ";
        query2 += " (tbl_post.Approve = 'Yes') ";
       

        MySqlDataAdapter cmd2 = new MySqlDataAdapter(query2, cn);

        cmd2.Fill(dtt);
        DataView view = dtt.DefaultView;
        view.Sort = "Post_Id DESC";
        DataTable sortedDate = view.ToTable();

        ListView1.DataSource = sortedDate;
        ListView1.DataBind();
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

        for (int i = 0; i <= ListView1.Items.Count - 1; i++)
        {
            HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
            p_id = p_i.Value;
            cn.Open();
            dbc.cmd = new MySqlCommand("select Like_Post from tbl_likecomment where Post_Id=" + p_id+ " and intuserid="+ rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", cn);
            dbc.dr = dbc.cmd.ExecuteReader();
            if(dbc.dr.Read())
            {
                if (dbc.dr["Like_Post"].ToString() == "Yes")
                {
                    LinkButton lkb = (LinkButton)ListView1.Items[i].FindControl("likeBtn");
                    lkb.Text = " Liked";
                    lkb.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1b4969");
                    lkb.CssClass = "fa fa-heart";
                }
            }
            cn.Close();
        }



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

            //HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
            //p_id = p_i.Value;
            //cn.Open();
            //MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment where Comment!='' and Post_Id=" + p_id, cn);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //if (ds.Tables[0].Rows.Count != 0)
            //{
            //    Label l = (Label)ListView1.Items[i].FindControl("LblComment");
            //    l.Text = ds.Tables[0].Rows[0][0].ToString();

            //}
            //cn.Close();


            Image img = (Image)ListView1.Items[i].FindControl("Image2");
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT intuserId, varuserName, varuserAddress, varuserCity, varuserState, varContactOne, varContactTwo, varContactThree, varuserEmail, varuserWeb, varPassword, varVerified, varPhoto FROM tbluserdetails WHERE intuserid = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", dbc.con);

            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                //lblStudentName.Text =;
                img.ImageUrl = "media/" + dbc.dr["varPhoto"].ToString();
            }
            dbc.con.Close();


        }
    }

 
     

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        try
        {
            #region init
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


            #endregion

            #region likepost
            if (e.CommandName == "LikePost")
            {
                LinkButton likeText = (LinkButton)e.Item.FindControl("likeBtn");
                if (likeText.Text == " Liked")
                {
                    cn.Open();
                    MySqlCommand cmd5 = new MySqlCommand("delete from tbl_likecomment where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                    cmd5.ExecuteNonQuery();
                    cn.Close();

                    likeText.Text = " Like";
                    likeText.ForeColor = System.Drawing.ColorTranslator.FromHtml("#4d4d4d");


                }
                else
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

                        likeText.Text = " Liked";
                        likeText.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1b4969");
                        likeText.CssClass = "fa fa-heart";
                    }
                    else
                    {
                        dr2.Close();
                        MySqlCommand cmd7 = new MySqlCommand();
                        cmd7.Connection = cn;
                        cmd7.CommandText = "insert into tbl_likecomment ( Post_Id, intuserid, Like_Post, Comment, Vote) values('" + e.CommandArgument + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','Yes',NULL,NULL)";
                        cmd7.ExecuteNonQuery();

                        //MySqlCommand cmd8 = new MySqlCommand();
                        //cmd8.Connection = cn;
                        // cmd8.CommandText = "INSERT INTO tblnotifications(varNotType, intNotFromId, varNotFromName, varNotFromDesig, intNotToId, varNotToDesig, varNotText, varLink, varSession, varStatus, varRemark) VALUES ([value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10],[value-11],[value-12]  )";
                        // cmd8.ExecuteNonQuery();
                        // Response.Redirect("VolunteerTimeline.aspx");
                        likeText.Text = " Liked";
                        likeText.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1b4969");
                        likeText.CssClass = "fa fa-heart";
                    }
                    cn.Close();
                    if (!vol_id.Equals(rex.DecryptString(Request.Cookies["userid"].Value.ToString())))
                    {
                        dbc.insert_tblnotifications("Page", rex.DecryptString(Request.Cookies["userid"].Value.ToString()), dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1], "User", vol_id, "User", dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1] + " Likes your Post", "~/user/default.aspx#" + e.CommandArgument.ToString(), "NA", "Unread", string.Empty);
                    }
                }

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
               // BindTimeLine();
            }

            #endregion

            #region SubmitComment
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
                     
                    Repeater rptcom = e.Item.FindControl("Repeater1") as Repeater;
                    rptcom.DataBind();
                    if (!vol_id.Equals(rex.DecryptString(Request.Cookies["userid"].Value.ToString())))
                    {
                        dbc.insert_tblnotifications("Page", rex.DecryptString(Request.Cookies["userid"].Value.ToString()), dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1], "User", vol_id, "User", dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1] + " Commented your Post", "http://coursekatta.com/user/default.aspx#"+ e.CommandArgument.ToString(), "NA", "Unread", string.Empty);
                    }
                }
                BindTimeLine();
            }
            #endregion

            #region deletePost
            if (e.CommandName == "deletePost")
            {
                cn.Open();
                MySqlCommand cmd = new MySqlCommand("update tbl_post set DeletePost='Yes' where Post_Id=" + e.CommandArgument + "", cn);
                cmd.ExecuteNonQuery();
                cn.Close();


                BindTimeLine();
                //cmd7 = new MySqlCommand();
                //cmd7.Connection = cn;
                //cmd7.CommandText = "delete from tbl_likecomment where Post_Id=" + e.CommandArgument + "";
                //cmd7.ExecuteNonQuery();

            }
            #endregion

            #region CommentPost
            if(e.CommandName== "CommentPost")
            {
                Repeater rptComments;
                SqlDataSource SqlDataSourceComments;
                HiddenField p_i = (HiddenField)e.Item.FindControl("postId");

                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    rptComments = (Repeater)e.Item.FindControl("Repeater1");
                    SqlDataSourceComments = (SqlDataSource)e.Item.FindControl("SqlDataSource1");
                    SqlDataSourceComments.SelectCommand = "SELECT tbl_likecomment.Id,tbl_likecomment.intuserid, tbl_likecomment.Comment, tbluserdetails.varuserName AS Name, tbluserdetails.varPhoto FROM tbl_likecomment INNER JOIN tbluserdetails ON tbl_likecomment.intuserId = tbluserdetails.intuserId where tbl_likecomment.Post_Id=" + p_i.Value + " and tbl_likecomment.Comment IS NOT NULL order by tbl_likecomment.Id desc LIMIT " +Convert.ToInt64((rptComments.Items.Count) + 3) + "";
                    rptComments.DataSource = SqlDataSourceComments;
                    rptComments.DataBind();
                }
            }
            #endregion

          
        }
        catch (Exception ex)
        {
        }
    }

    protected void ListView1_DataBound(object sender, ListViewItemEventArgs e)
    {
        Repeater rptComments;
        SqlDataSource SqlDataSourceComments;
        HiddenField p_i = (HiddenField)e.Item.FindControl("postId");
        HiddenField userId = (HiddenField)e.Item.FindControl("userId");
        HiddenField IsUser = (HiddenField)e.Item.FindControl("IsUser");
        LinkButton lnkDelete = (LinkButton)e.Item.FindControl("lnkDelete");
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            rptComments = (Repeater)e.Item.FindControl("Repeater1");
            SqlDataSourceComments=(SqlDataSource)e.Item.FindControl("SqlDataSource1");
            SqlDataSourceComments.SelectCommand = "SELECT tbl_likecomment.Id,tbl_likecomment.intuserid, tbl_likecomment.Comment, tbluserdetails.varuserName AS Name, tbluserdetails.varPhoto FROM tbl_likecomment INNER JOIN tbluserdetails ON tbl_likecomment.intuserId = tbluserdetails.intuserId where tbl_likecomment.Post_Id=" + p_i.Value + " and tbl_likecomment.Comment IS NOT NULL order by tbl_likecomment.Id desc LIMIT 3";
            rptComments.DataSource = SqlDataSourceComments;
            rptComments.DataBind();
            cn.Close();
            cn.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment where Comment!='' and Post_Id=" + p_i.Value, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                Label l = (Label)e.Item.FindControl("LblComment");
                l.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            cn.Close();

            if (IsUser.Value == "0")
            {
                if (userId.Value == rex.DecryptString(Request.Cookies["userid"].Value.ToString()))
                {
                    lnkDelete.Visible = true;
                }
            }
             if (IsUser.Value == "1")
            {
                if (Request.Cookies["collegeid"] != null)
                {
                    if (userId.Value == rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()))
                    {
                        lnkDelete.Visible = true;
                    }
                }
            }
        }
        
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        cn.Open();
        MySqlCommand cmd5 = new MySqlCommand("delete from tbl_likecomment where id='" + e.CommandArgument + "'", cn);
        cmd5.ExecuteNonQuery();
        cn.Close(); 

        BindTimeLine();
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)e.Item.FindControl("lnkDeletes");
        HiddenField userId = (HiddenField)e.Item.FindControl("userID");

        if (userId.Value == rex.DecryptString(Request.Cookies["userid"].Value.ToString()))
        {
            lnkDelete.Visible = true;
        }

    }
}