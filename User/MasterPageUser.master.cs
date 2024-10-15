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
using System.Linq;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

public partial class User_MasterPageUser : System.Web.UI.MasterPage
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
                getImage();

            lblContactRequests.Text = dbc.requestsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblContactRequests.Visible = lblContactRequests.Text == "0" ? false : true;
            lblMessages.Text = dbc.msgsCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblMessages.Visible = lblMessages.Text == "0" ? false : true;
            lblNotifications.Text = dbc.notifCount(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            lblNotifications.Visible = lblNotifications.Text == "0" ? false : true;
            getData(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        }
        catch (Exception ex)
        {
            Response.Redirect("~/default.aspx", false);
        }
    }
   
    public void getImage()
    {
        string ImageUr = dbc.select_UserProfile(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
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
        SqlDataSource1.SelectCommand = "SELECT intCollegeId,varCollegeName, isTutor,intuserid FROM tblcollegedetails WHERE (intuserid = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ") ";
        ListView1.DataBind();

        
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        HttpCookie collegeId = new HttpCookie("collegeId");
        collegeId.Value = rex.EncryptString(e.CommandArgument.ToString().Split(';')[0]);
        Response.Cookies.Add(collegeId);
        if (e.CommandArgument.ToString().Split(';')[1] == "0")
            Response.Redirect("~/college/Profile.aspx", false);
        else
            Response.Redirect("~/college/ComProfile.aspx", false);
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
            
        }
        dbc.con.Close(); 
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Logout.aspx", false);
    }

    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
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
