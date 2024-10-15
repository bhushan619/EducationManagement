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

public partial class User_CreatePage : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    { 
        try
        {
            if (!IsPostBack)
            {
                getImage();
                getData(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
            }
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
        SqlDataSource1.SelectCommand = "SELECT intCollegeId,varCollegeName, isTutor,intuserid FROM tblcollegedetails WHERE (intuserid = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ") and isTutor=1";
        ListView1.DataBind();

        SqlDataSource2.SelectCommand = "SELECT intCollegeId,varCollegeName, isTutor,intuserid FROM tblcollegedetails WHERE (intuserid = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ") and isTutor=0";
        ListView2.DataBind();

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
    protected void ssf_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_college(txtName.Text) != 1)
            {
                string userData = dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
                dbc.con.Open();
                dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblcollegedetails(varCollegeName,  varCollegeEmail, intuserid, isTutor,varPhoto,varCollegeState) VALUES ( '" + txtName.Text + "','" + userData.Split(';')[8] + "'," + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "," + rdbWhoAreYou.SelectedValue + ",'NoProfile.png','NA')", dbc.con);
                dbc.cmd.ExecuteScalar();
                string ids = dbc.cmd.LastInsertedId.ToString();
                dbc.con.Close();

                dbc.con.Open();
                dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblcollegeotherdetails (intCollegeId) VALUES(" + ids + ")", dbc.con);
                dbc.cmd.ExecuteNonQuery();
                dbc.con.Close();
                dbc.cmd.Dispose();

                dbc.insert_tblcollegesocials(ids, "http://www.fb.com", "http://plus.google.com", "http://www.twitter.com", "http://www.linkedin.com");


                HttpCookie collegeId = new HttpCookie("collegeId");
                collegeId.Value = rex.EncryptString(ids);
                Response.Cookies.Add(collegeId);
                if (rdbWhoAreYou.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Page Created Successfully..!!');window.location='../college/InstitituteSettings.aspx';",
                        true); //Response.Redirect("~/college/Profile.aspx", false);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                       "popup",
                       "alert('Page Created Successfully..!!');window.location='../college/ComSettings.aspx';",
                       true); //Response.Redirect("~/college/ComProfile.aspx", false);
                }
              
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                       "popup",
                       "alert('Page already exists..!!');window.location='CreatePage.aspx';",
                       true);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                  "popup",
                  "alert('Some error.. Please try again!!');window.location='CreatePage.aspx';",
                  true);
        }
    }
    protected void lnkEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewUserProfile.aspx?id=" + Request.Cookies["userid"].Value.ToString(), false);
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
}