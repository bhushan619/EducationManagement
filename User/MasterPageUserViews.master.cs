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
 
using System.Collections;


public partial class User_MasterPageUserViews : System.Web.UI.MasterPage
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
        if (!IsPostBack)
        {
            getData(rex.DecryptString(Request.QueryString["id"].ToString()));
            getImage();
            if(rex.DecryptString(Request.QueryString["id"].ToString())== rex.DecryptString(Request.Cookies["userid"].Value.ToString()))
            {
                lbllike.Visible = false;
                lnkSetting.Visible = true;
                fontaw.CssClass = "fa fa-cog";
            }
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();

            dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct  tblconnections.intId, tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnectionMe WHERE (tblconnections.intRequested = 2) AND (tblconnections.intConnected = " + rex.DecryptString(Request.QueryString["id"].ToString()) + ") LIMIT 3", dbc.con);
            dbc.dataAdapter.Fill(dt);

            dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct  tblconnections.intId, tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnected WHERE (tblconnections.intRequested = 2) AND (tblconnections.intConnectionMe = " + rex.DecryptString(Request.QueryString["id"].ToString()) + ") LIMIT 3", dbc.con);
            dbc.dataAdapter.Fill(dt2);

            dt2.Merge(dt);
            dt2.AcceptChanges();

            lstConnectFriends.DataSource = RemoveDuplicateRows(dt2, "intuserId");
            lstConnectFriends.DataBind();

            lstFollow.DataSource = RemoveDuplicateRows(dt2, "intuserId");
            lstFollow.DataBind();

            DataTable dtPages = new DataTable();
            dbc.dataAdapter = new MySqlDataAdapter("SELECT tblcollegedetails.intCollegeId, tblcollegedetails.varCollegeName, tblcollegedetails.isTutor, tbluserdetails.intuserId FROM tblcollegelikes INNER JOIN tbluserdetails ON tblcollegelikes.intStudentId = tbluserdetails.intuserId INNER JOIN tblcollegedetails ON tblcollegelikes.intCollegeId = tblcollegedetails.intCollegeId WHERE(tbluserdetails.intuserId = " + rex.DecryptString(Request.QueryString["id"].ToString()) + ") LIMIT 3", dbc.con);
            dbc.dataAdapter.Fill(dtPages);
            lstPages.DataSource = dtPages;
            lstPages.DataBind();
        }
        lblContactRequests.Text = dbc.requestsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblContactRequests.Visible = lblContactRequests.Text == "0" ? false : true;
        lblMessages.Text = dbc.msgsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblMessages.Visible = lblMessages.Text == "0" ? false : true;
        lblNotifications.Text = dbc.notifCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        lblNotifications.Visible = lblNotifications.Text == "0" ? false : true;
    }
    public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    {
        Hashtable hTable = new Hashtable();
        ArrayList duplicateList = new ArrayList();

        foreach (DataRow drow in dTable.Rows)
        {
            if (hTable.Contains(drow[colName]))
                duplicateList.Add(drow);
            else
                hTable.Add(drow[colName], string.Empty);
        }

        foreach (DataRow dRow in duplicateList)
            dTable.Rows.Remove(dRow);

        return dTable;
    }

    public void getData(string where)
    {
        string query = "SELECT intuserId, varuserName, varuserAddress, varuserCity, varuserState, varContactOne, varContactTwo, varContactThree, varuserEmail, varuserWeb, varPassword,  ";
        query += " varVerified, varPhoto, varuserType, varAbout, varMaritalStatus, varGender,(SELECT varCompany ";
        query += " FROM tbluserprofessionaldetails ";
        query += " WHERE(intUserId = " + where + ") order by intId asc limit 1) as CompanyDetails,(SELECT varStudentCollege ";
        query += " FROM tblstudenteducationaldetails ";
        query += " WHERE(intStudentId = " + where + ") ";
        query += " ORDER BY intId limit 1) as EducationDetails ";
        query += " FROM tbluserdetails ";
        query += " WHERE(intuserId = " + where + ") ";
        MySqlCommand cmd = new MySqlCommand(query, dbc.con);
        dbc.con.Open();
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        {
            aboutUser.InnerText = dbc.dr["varAbout"].ToString();
            From.InnerText = dbc.dr["varuserCity"].ToString();
            LiveIn.InnerText = dbc.dr["varuserCity"].ToString();
            WorkingWith.InnerText = dbc.dr["CompanyDetails"].ToString();
            StudiedAt.InnerText = dbc.dr["EducationDetails"].ToString();
            GenderPage.InnerText = dbc.dr["varGender"].ToString();
            MaritalStatus.InnerText = dbc.dr["varMaritalStatus"].ToString();
        }
        dbc.con.Close();

        dbc.con.Open();
        dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("select * from tblconnections where intConnectionMe=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + " and intConnected=" + rex.DecryptString(Request.QueryString["id"].ToString()) + "", dbc.con);
        dbc.dr=dbc.cmd.ExecuteReader();
        if(dbc.dr.Read())
        {
            if (dbc.dr["intRequested"].ToString() == "1")
            {
                lbllike.Text = "Requested";
                lblFollow.Text = "Follow";
                lbllike.Enabled = false;
            }
            if (dbc.dr["intRequested"].ToString() == "2")
            {
                lbllike.Text = "Connected";
                lblFollow.Text = "Followed";
                lbllike.Enabled = false;
            }
        }
        else
        {
            dbc.con1.Open();
            dbc.cmd1 = new MySql.Data.MySqlClient.MySqlCommand("select * from tblconnections where intConnected=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + " and intConnectionMe=" + rex.DecryptString(Request.QueryString["id"].ToString()) + "", dbc.con1);
            dbc.dr1 = dbc.cmd1.ExecuteReader();
            if (dbc.dr1.Read())
            {
                if (dbc.dr1["intRequested"].ToString() == "1")
                {
                    lbllike.Text = "Requested";
                    lblFollow.Text = "Follow";
                    lbllike.Enabled = false;
                }
                if (dbc.dr1["intRequested"].ToString() == "2")
                {
                    lbllike.Text = "Connected";
                    lblFollow.Text = "Followed";
                    lbllike.Enabled = false;
                }
            }
            else
            {

            }
            dbc.con1.Close();
        }
        dbc.con.Close();
        //dbc.con.Open();
        //dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("select intFollow from tblpageconnections where intUserId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + " and intPageId=" + rex.DecryptString(Request.QueryString["id"].ToString()) + "", dbc.con);
        //dbc.dr = dbc.cmd.ExecuteReader();
        //if (dbc.dr.Read())
        //{
        //    if(dbc.dr["intFollow"].ToString().Equals("1"))
        //    {
        //        lblFollow.Text = "Unfollow";
        //    }
        //    else
        //    {
        //        lblFollow.Text = "Follow";
        //    }
            
        //}
        //dbc.con.Close();

    }
    public void getImage()
    {
        string ImageUr = dbc.select_UserProfile(rex.DecryptString(Request.QueryString["id"].ToString()));
        if (ImageUr.Split(';')[2].ToString() == "")
        {
            imgProfile.ImageUrl = "~/user/media/NoProfile.png";
        }
        else
        {
            imgProfile.ImageUrl = "~/user/media/" + ImageUr.Split(';')[2].ToString();

        }
        //joinedAs.Text = ImageUr.Split(';')[0].ToString();
        proName.Text = ImageUr.Split(';')[1].ToString();

    }
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
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
        //ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('UploadPic.aspx')</script>");
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


    protected void Label6_Click(object sender, EventArgs e)
    {
        HttpCookie msgToId = new HttpCookie("msgToId");
        msgToId.Value = rex.DecryptString(Request.QueryString["id"].ToString());
        Response.Cookies.Add(msgToId);
        Response.Redirect("~/user/Compose.aspx", false);
    }

    protected void Label5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserCareer.aspx?id=" + Request.QueryString["id"].ToString(), false);
    }
    protected void proName_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.QueryString["id"].ToString(), false);
    }

    protected void lbllike_Click(object sender, EventArgs e)
    {
        
            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblconnections(intConnectionMe, intConnected,intRequested) VALUES (" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "," + rex.DecryptString(Request.QueryString["id"].ToString()) + ",1)", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();
            ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Requested successfully');window.location='ViewUserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "'", true);
        
    }

     

    protected void Label6_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserEducation.aspx?id=" + Request.QueryString["id"].ToString(), false);
    }

    protected void lstConnectFriends_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        HyperLink lnk = (HyperLink)e.Item.FindControl("proName");
        Literal usId = (Literal)e.Item.FindControl("userId");
        lnk.NavigateUrl = "~/user/ViewUserProfile.aspx?id=" + rex.EncryptString(usId.Text);
    }

    protected void lstPages_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        HyperLink lnk = (HyperLink)e.Item.FindControl("proName");
        Literal usId = (Literal)e.Item.FindControl("userId");
        Literal isTutor = (Literal)e.Item.FindControl("isTutor");
        if (isTutor.Text == "0")
        {
            lnk.NavigateUrl = "~/user/ViewCollege.aspx?id=" +  usId.Text;
        }
        else
        {
            lnk.NavigateUrl = "~/user/ViewCompany.aspx?id=" +usId.Text;
        }
    }

    protected void headSearch_Click(object sender, EventArgs e)
    {
        if (TxtComment.Text == "")
        {
            ScriptManager.RegisterStartupScript(
               this,
               this.GetType(),
               "MessageBox",
               "alert('Please enter Name..!!');", true);
        }
        else
        {
            Response.Redirect("~/user/SearchUsers.aspx?us=" + TxtComment.Text + "");
        }
    }
}
