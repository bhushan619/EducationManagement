using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;
using paytm;
using System.Text;

public partial class User_Care : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    MySqlConnection cn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString);
    RegexUtilities rex = new RegexUtilities();
    static string id;

    static string imageUrl;
    static string PostmaxId;

    static string amount = string.Empty;
    static string firstname = string.Empty;
    static string email = string.Empty;
    static string phone = string.Empty;
    static string productinfo = string.Empty;
    static string packageno = string.Empty;
    static string packageduration = string.Empty;
    static string packagedurationtime = string.Empty;
    static string state = string.Empty;
    static string city = string.Empty;
    static string address = string.Empty;
    static string pin = string.Empty;
    static string country = string.Empty;
    static string orderid = string.Empty;
    static string pname = string.Empty;
    static string[] packag;
    static int mypackintid = 0;

    static string skillid;
    public static string html = "";
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
    protected void btnPost_Click(object sender, EventArgs e)
    {
        try
        {
           // orderid = dbc.CreateRandomPassword(6) + rex.DecryptString(Request.Cookies["userid"].Value.ToString());
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
            string QuerysavePost = "insert into tbl_post (Post_Id, PostImage, Post_Description, intStudentId, Skill_Id, Dates, Times, DeletePost, Approve, Vote) values('" + PostmaxId + "','" + imageUrl + "','" + TxtDescription.Text.Replace("'", "''") + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','ShareCare','" + date + "','" + time + "','No','No','0')";
            MySqlCommand cmd5 = new MySqlCommand(QuerysavePost, cn);
            cmd5.ExecuteNonQuery();
            cn.Close();


            //dbc.con.Close();
            //MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("select varuserName,varuserEmail,varContactOne from tbluserdetails where (intuserId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")", dbc.con);
            //dbc.con.Open();
            //dbc.dr = cmdc.ExecuteReader();
            //if (dbc.dr.Read())
            //{
            //    firstname = dbc.dr["varuserName"].ToString();
            //    email = dbc.dr["varuserEmail"].ToString();
            //    phone = dbc.dr["varContactOne"].ToString();
            //}
            //dbc.con.Close();
            //dbc.dr.Close();


            //mypackintid = 0;
            //packageno = "PostAd";
            //pname = "PostAd";
            //amount = "500";
            //productinfo = "PostAd";
            //packageduration = "1";
            //packagedurationtime = "Month";


            //dbc.con.Close();
            //MySql.Data.MySqlClient.MySqlCommand cmdpa = new MySql.Data.MySqlClient.MySqlCommand("SELECT varuserCity,varuserState FROM tbluserdetails WHERE  (intuserId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")", dbc.con);
            //dbc.con.Open();
            //dbc.dr = cmdpa.ExecuteReader();
            //if (dbc.dr.Read())
            //{
            //    state = dbc.dr["varuserCity"].ToString();
            //    city = dbc.dr["varuserState"].ToString();
            //    country = "India";
            //}
            //dbc.con.Close();
            //dbc.dr.Close();
            //if (!amount.Equals("0"))
            //{
            //    int intid = dbc.max_tblammembertransactions();
            //    intid = intid + 1;
            //    MySql.Data.MySqlClient.MySqlCommand cmdo = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblammembertransactions VALUES (" + intid + ",'" + orderid + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','" + firstname + "','" + city + "','','" + state + "','" + packageno + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','" + amount + "','Unpaid','','','NA','Started','User','" + mypackintid.ToString() + "')", dbc.con);
            //    dbc.con.Open();
            //    cmdo.ExecuteNonQuery();
            //    dbc.con.Close();

            //    String merchantKey = "lVaKPKowWN791ZtA";
            //    Dictionary<string, string> parameters = new Dictionary<string, string>();
            //    parameters.Add("MID", "Anuvaa92658934271071");
            //    parameters.Add("CHANNEL_ID", "WEB");
            //    parameters.Add("INDUSTRY_TYPE_ID", "Retail109");
            //    parameters.Add("WEBSITE", "AnuvaaWEB");

            //    parameters.Add("EMAIL", email);
            //    parameters.Add("MOBILE_NO", phone);
            //    parameters.Add("CUST_ID", rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            //    parameters.Add("ORDER_ID", orderid);
            //    parameters.Add("TXN_AMOUNT", amount);
            //    parameters.Add("CALLBACK_URL", "http://coursekatta.com/user/AdStatus.aspx");
            //    parameters.Add("MERC_UNQ_REF", orderid + "_" + packageno + "_" + packageduration + "_" + packagedurationtime + "_" + amount + "_" + pname + "_" + PostmaxId);

            //    string checksum = CheckSum.generateCheckSum(merchantKey, parameters);

            //    string paytmURL = "https://secure.paytm.in/oltp-web/processTransaction";
            //    string outputHTML = "<html>";
            //    outputHTML += "<head>";
            //    outputHTML += "<title>Merchant Check Out Page</title>";
            //    outputHTML += "</head>";
            //    outputHTML += "<body>";
            //    outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
            //    outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            //    outputHTML += "<table border='1'>";
            //    outputHTML += "<tbody>";
            //    foreach (string key in parameters.Keys)
            //    {
            //        outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
            //    }
            //    outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            //    outputHTML += "</tbody>";
            //    outputHTML += "</table>";
            //    outputHTML += "<script type='text/javascript'>";
            //    outputHTML += "document.f1.submit();";
            //    outputHTML += "</script>";
            //    outputHTML += "</form>";
            //    outputHTML += "</body>";
            //    outputHTML += "</html>";
            //    Response.Write(outputHTML);
            //}
            BindTimeLine();
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
        }
    }

    public void BindTimeLine()
    {
        string query1 = " SELECT tbl_post.intStudentId, tbl_post.Post_Id, tbl_post.PostImage, tbl_post.Approve, tbl_post.Post_Description, tbl_post.Skill_Id, tbl_post.Dates, tbl_post.Times, tbl_post.Vote,  ";
        query1 += " tbluserdetails.intuserId, tbluserdetails.varuserName as Name, tbluserdetails.varPhoto";
        query1 += " FROM tbl_post INNER JOIN ";
        query1 += " tbluserdetails ON tbl_post.intStudentId = tbluserdetails.intuserId ";
        query1 += " WHERE (tbluserdetails.intuserId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ") and  VOTE = '0' and  tbl_post.DeletePost='No' AND ";
        query1 += " (tbl_post.Skill_Id = 'ShareCare') ";

        cn.Open();
        DataTable dtt = new DataTable();

        MySqlDataAdapter cmd1 = new MySqlDataAdapter(query1, cn);

        cmd1.Fill(dtt);


        ListView1.DataSource = dtt;
        ListView1.DataBind();
        cn.Close();

        for (int i = 0; i <= ListView1.Items.Count - 1; i++)
        {
            HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
            p_id = p_i.Value;
            cn.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Like_Post='Yes' and Comment is NULL and Post_Id=" + p_id, cn);
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
            dbc.cmd = new MySqlCommand("select Like_Post from tbl_likecomment_forads where Post_Id=" + p_id + " and intuserid=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", cn);
            dbc.dr = dbc.cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                if (dbc.dr["Like_Post"].ToString() == "Yes")
                {
                    LinkButton lkb = (LinkButton)ListView1.Items[i].FindControl("likeBtn");
                    lkb.Text = " Liked";
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
            MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Comment!='' and Post_Id=" + p_id, cn);
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
            //MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Comment!='' and Post_Id=" + p_id, cn);
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
                    MySqlCommand cmd5 = new MySqlCommand("delete from tbl_likecomment_forads where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                    cmd5.ExecuteNonQuery();
                    cn.Close();

                    likeText.Text = " Like";
                }
                else
                {
                    cn.Open();
                    MySqlCommand cmd6 = new MySqlCommand("select * from tbl_likecomment_forads where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                    MySqlDataReader dr2 = cmd6.ExecuteReader();
                    if (dr2.Read())
                    {
                        dr2.Close();
                        MySqlCommand cmd5 = new MySqlCommand("update tbl_likecomment_forads set Like_Post='Yes' where Post_Id='" + e.CommandArgument + "' and intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cn);
                        cmd5.ExecuteNonQuery();
                        cn.Close();

                        //   Response.Redirect("VolunteerTimeline.aspx");

                        for (int i = 0; i <= ListView1.Items.Count - 1; i++)
                        {
                            HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
                            p_id = p_i.Value;
                            cn.Open();
                            MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Like_Post='Yes' and Comment is NULL and Post_Id=" + p_id, cn);
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
                        likeText.CssClass = "fa fa-heart";
                    }
                    else
                    {
                        dr2.Close();
                        MySqlCommand cmd7 = new MySqlCommand();
                        cmd7.Connection = cn;
                        cmd7.CommandText = "insert into tbl_likecomment_forads ( Post_Id, intuserid, Like_Post, Comment, Vote) values('" + e.CommandArgument + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','Yes',NULL,NULL)";
                        cmd7.ExecuteNonQuery();
                        // Response.Redirect("VolunteerTimeline.aspx");
                        likeText.Text = " Liked";
                        likeText.CssClass = "fa fa-heart";
                    }
                    cn.Close();

                }

                for (int i = 0; i <= ListView1.Items.Count - 1; i++)
                {
                    HiddenField p_i = (HiddenField)ListView1.Items[i].FindControl("postId");
                    p_id = p_i.Value;
                    cn.Open();
                    MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Like_Post='Yes' and Comment is NULL and Post_Id=" + p_id, cn);
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
                    MySqlCommand cmd6 = new MySqlCommand("select * from tbl_likecomment_forads where Post_Id=" + e.CommandArgument, cn);
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


                    string QuerySaveComment = "insert into tbl_likecomment_forads ( Post_Id, intuserid, Like_Post, Comment, Vote) values(" + e.CommandArgument + "," + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ",'" + like + "','" + comment.Text + "',NULL)";
                    cn.Open();
                    MySqlCommand cmd = new MySqlCommand(QuerySaveComment, cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    comment.Text = "";

                    Repeater rptcom = e.Item.FindControl("Repeater1") as Repeater;
                    rptcom.DataBind();
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
                //cmd7.CommandText = "delete from tbl_likecomment_forads where Post_Id=" + e.CommandArgument + "";
                //cmd7.ExecuteNonQuery();

            }
            #endregion

            #region CommentPost
            if (e.CommandName == "CommentPost")
            {
                Repeater rptComments;
                SqlDataSource SqlDataSourceComments;
                HiddenField p_i = (HiddenField)e.Item.FindControl("postId");

                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    rptComments = (Repeater)e.Item.FindControl("Repeater1");
                    SqlDataSourceComments = (SqlDataSource)e.Item.FindControl("SqlDataSource1");
                    SqlDataSourceComments.SelectCommand = "SELECT tbl_likecomment_forads.Id,tbl_likecomment_forads.intuserid, tbl_likecomment_forads.Comment, tbluserdetails.varuserName AS Name, tbluserdetails.varPhoto FROM tbl_likecomment_forads INNER JOIN tbluserdetails ON tbl_likecomment_forads.intuserId = tbluserdetails.intuserId where tbl_likecomment_forads.Post_Id=" + p_i.Value + " and tbl_likecomment_forads.Comment IS NOT NULL order by tbl_likecomment_forads.Id desc LIMIT " + Convert.ToInt64((rptComments.Items.Count) + 3) + "";
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
            SqlDataSourceComments = (SqlDataSource)e.Item.FindControl("SqlDataSource1");
            SqlDataSourceComments.SelectCommand = "SELECT tbl_likecomment_forads.Id,tbl_likecomment_forads.intuserid, tbl_likecomment_forads.Comment, tbluserdetails.varuserName AS Name, tbluserdetails.varPhoto FROM tbl_likecomment_forads INNER JOIN tbluserdetails ON tbl_likecomment_forads.intuserId = tbluserdetails.intuserId where tbl_likecomment_forads.Post_Id=" + p_i.Value + " and tbl_likecomment_forads.Comment IS NOT NULL order by tbl_likecomment_forads.Id desc LIMIT 3";
            rptComments.DataSource = SqlDataSourceComments;
            rptComments.DataBind();
            cn.Close();
            cn.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("select count(id) as cnt from tbl_likecomment_forads where Comment!='' and Post_Id=" + p_i.Value, cn);
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
        MySqlCommand cmd5 = new MySqlCommand("delete from tbl_likecomment_forads where id='" + e.CommandArgument + "'", cn);
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

