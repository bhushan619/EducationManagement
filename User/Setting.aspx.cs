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
using System.IO;
using MySql.Data.MySqlClient;

public partial class User_Setting : System.Web.UI.Page
{
    DatabaseConnection dbcs = new DatabaseConnection();
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();


    static int intid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
            getuserdata();
        }
    }
    public void getuserdata()
    {
        try
        {
            SqlDataSourceState.SelectCommand = "SELECT DISTINCT varState FROM tbledmitrastate ORDER BY varState";
            ddlState.DataBind();

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT intuserId,varuserType,varAbout,varMaritalStatus, varuserName, varuserAddress, varuserCity, varuserState, varContactOne, varContactTwo, varContactThree, varuserEmail, varuserWeb, varPassword, varVerified, varPhoto,varGender FROM tbluserdetails WHERE intuserid = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "", dbc.con);

            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtName.Text = dbc.dr["varuserName"].ToString();
                txtDob.Text = dbc.dr["varContactTwo"].ToString();
                txtAddress.Text = dbc.dr["varuserAddress"].ToString();
                ddlGender.SelectedValue= dbc.dr["varGender"].ToString();
                string dd = dbc.dr["varuserState"].ToString();
                ddlState.Text = dd.Equals("NA") ? "--Select State--" : dbc.dr["varuserState"].ToString();
                txtCity.Text = dbc.dr["varuserCity"].ToString();
                ImgProduct.ImageUrl = "media/" + dbc.dr["varPhoto"].ToString();
                txtAbout.Text = dbc.dr["varAbout"].ToString();
                ddlMaritalStatus.SelectedValue= dbc.dr["varMaritalStatus"].ToString();
                
            }
            dbc.con.Close();
            SqlDataSource1.SelectCommand = "SELECT tbluserprofessionaldetails.intId,tbluserprofessionaldetails.varCompany AS Company, tbluserprofessionaldetails.varDesignation AS Desig, tbluserprofessionaldetails.varExperience AS Exp, CONCAT(tbluserprofessionaldetails.varFromMonth, ' ', tbluserprofessionaldetails.varFromYear) AS WorkingFrom, CONCAT(tbluserprofessionaldetails.varToMonth, ' ', tbluserprofessionaldetails.varToYear) AS WorkingTill, tbluserprofessionaldetails.varResponsibilities AS Responsibilities, tbluserprofessionaldetails.varCTC AS CTC FROM tbluserdetails INNER JOIN tbluserprofessionaldetails ON tbluserdetails.intuserId = tbluserprofessionaldetails.intUserId where tbluserprofessionaldetails.intUserId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "";
            GridView1.DataBind();
            SqlDataSourceed.SelectCommand = "SELECT intId, intStudentId, varStudentClass, varStudentCollege, varStudentUniversity, varStudentPassingYear, varStudentMarks, varStudentPer, varStudentGrade FROM tblstudenteducationaldetails WHERE (intStudentId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")";
            grdEdus.DataBind();
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/login.aspx");
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int ok = 0;
            string user = "User";
            int contentLength = fupProPic.PostedFile.ContentLength;//You may need it for validation
            string contentType = fupProPic.PostedFile.ContentType;//You may need it for validation
            string fileName = string.Empty;

            if (contentLength == 0)
            {
                fileName = ImgProduct.ImageUrl.Split('/')[1];
                int insert_ok = dbc.update_tbluserdetail(rex.DecryptString(Request.Cookies["userid"].Value.ToString()), txtName.Text, txtDob.Text, txtAddress.Text, ddlState.Text, txtCity.Text, fileName, user, txtAbout.Text, ddlMaritalStatus.SelectedValue, ddlGender.SelectedValue);
                if (insert_ok != 0)
                {
                    ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Profile Updated');window.location='Setting.aspx'", true);
                }
            }
            else
            {
                fileName = fupProPic.PostedFile.FileName;
                int insert_ok = dbc.update_tbluserdetail(rex.DecryptString(Request.Cookies["userid"].Value.ToString()), txtName.Text, txtDob.Text, txtAddress.Text, ddlState.Text, txtCity.Text, fileName, user, txtAbout.Text, ddlMaritalStatus.SelectedValue,ddlGender.SelectedValue);
                if (insert_ok != 0)
                {
                    fupProPic.PostedFile.SaveAs(Server.MapPath("~/user/media/") + fileName);//Or code to save in the DataBase.

                    ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Profile Updated');window.location='Setting.aspx'", true);
                }
            } 
        }
        catch (Exception ex)
        {

        }
    }
    protected void brnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("editpro"))
        {
            intid = Convert.ToInt32(e.CommandArgument.ToString());
            btnSubmitProf.Visible = false;
            btnEditProf.Visible = true;
            getdata(intid);
            TabName.Value = "Professional";
        }
        else
        {
        }
    }
    public void getdata(int id)
    {

        dbc.con.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT intId, intUserId, varCompany, varDesignation, varExperience, varFromMonth, varFromYear, varToMonth, varToYear, varResponsibilities, varCTC, ex1, ex2 FROM tbluserprofessionaldetails WHERE intId=" + id + "", dbc.con);
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        {
            txtCompany.Text = dbc.dr["varCompany"].ToString();
            txtDesignation.Text = dbc.dr["varDesignation"].ToString();
            txtExperience.Text = dbc.dr["varExperience"].ToString();
            txtResponsibilities.Text = dbc.dr["varResponsibilities"].ToString();
            txtCTC.Text = dbc.dr["varCTC"].ToString();
            ddlFromMonth.SelectedValue = dbc.dr["varFromMonth"].ToString();
            ddlFromYear.SelectedValue = dbc.dr["varFromYear"].ToString();
            ddlToMonth.SelectedValue = dbc.dr["varToMonth"].ToString();
            ddlToYear.SelectedValue = dbc.dr["varToYear"].ToString();
        }
        dbc.con.Close();
    }
    protected void btnSubmitEdu_Click(object sender, EventArgs e)
    {
        try
        {
            int insert_ok = dbc.insert_tblStudentEduDetail(rex.DecryptString(Request.Cookies["userid"].Value.ToString()), txtCourses.Text.Replace("'", "''"), txtCollege.Text.Replace("'", "''"), txtUniversity.Text.Replace("'", "''"), txtPassingYear.Text.Replace("'", "''"), txtMarks.Text.Replace("'", "''"), txtPercent.Text.Replace("'", "''"), txtGrade.Text.Replace("'", "''"));
            if (insert_ok == 1)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Data Inserted');", true);

            }
            txtCourses.Text = "";
            txtCollege.Text = "";
            txtUniversity.Text = "";
            txtPassingYear.Text = "";
            txtMarks.Text = "";
            txtPercent.Text = "";
            txtGrade.Text = "";
            SqlDataSourceed.SelectCommand = "SELECT intId, intStudentId, varStudentClass, varStudentCollege, varStudentUniversity, varStudentPassingYear, varStudentMarks, varStudentPer, varStudentGrade FROM tblstudenteducationaldetails WHERE (intStudentId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")";
            grdEdus.DataBind();
            TabName.Value = "Educational";
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
    protected void btnEditEdu_Click(object sender, EventArgs e)
    {
        btnSubmitEdu.Visible = true;
        btnEditEdu.Visible = false;
        try
        {
            int insert_ok = dbc.update_tblStudentEduDetail(intid, txtCourses.Text.Replace("'", "''"), txtCollege.Text.Replace("'", "''"), txtUniversity.Text.Replace("'", "''"), txtPassingYear.Text.Replace("'", "''"), txtMarks.Text.Replace("'", "''"), txtPercent.Text.Replace("'", "''"), txtGrade.Text.Replace("'", "''"));
            if (insert_ok == 1)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Data Inserted');", true);

            }
            txtCourses.Text = "";
            txtCollege.Text = "";
            txtUniversity.Text = "";
            txtPassingYear.Text = "";
            txtMarks.Text = "";
            txtPercent.Text = "";
            txtGrade.Text = "";
            SqlDataSourceed.SelectCommand = "SELECT intId, intStudentId, varStudentClass, varStudentCollege, varStudentUniversity, varStudentPassingYear, varStudentMarks, varStudentPer, varStudentGrade FROM tblstudenteducationaldetails WHERE (intStudentId = " + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + ")";
            grdEdus.DataBind();
            TabName.Value = "Educational";
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

    string pass = string.Empty;
    public string getOldPassCustomer()
    {
        try
        {
            dbcs.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT varPassword FROM tbluserdetails WHERE intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value) + "'", dbcs.con);
            // cmd.ExecuteNonQuery(); 

            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                pass = reader["varPassword"].ToString();
            }

            dbcs.con.Close();
            return pass;

        }
        catch (Exception ex)
        {
            dbcs.con.Close();
            return "NA";
        }
    }
    protected void Change_Click(object sender, EventArgs e)
    {
        if (getOldPassCustomer().Equals(TxtOldPassword.Text))
        {
            if (TxtNewPassword.Text.Equals(TxtConfirmPassword.Text))
            {
                dbcs.con.Open();
                dbcs.cmd = new MySqlCommand("update tbluserdetails set varPassword= '" + TxtConfirmPassword.Text.Replace("'", "\\'") + "' where intuserid='" + rex.DecryptString(Request.Cookies["userid"].Value) + "'", dbcs.con);
                dbcs.cmd.ExecuteNonQuery();
                dbcs.con.Close();

                ScriptManager.RegisterStartupScript(
                      this,
                      this.GetType(),
                      "MessageBox",
                      "alert('Password Updated');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Please enter same new passwords');", true);
            }
            TabName.Value = "Password";
        }
        else
        {
            ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please enter proper old password');", true);
        }

    }


    protected void btnSubmitProf_Click(object sender, EventArgs e)
    {
        try
        {
            int insert_ok = dbc.insert_tblUserProDetail(rex.DecryptString(Request.Cookies["userid"].Value.ToString()), txtCompany.Text.Replace("'", "''"), txtDesignation.Text.Replace("'", "''"), txtExperience.Text.Replace("'", "''"), ddlFromMonth.SelectedValue, ddlFromYear.SelectedValue, ddlToMonth.SelectedValue, ddlToYear.SelectedValue, txtResponsibilities.Text.Replace("'", "''"), txtCTC.Text.Replace("'", "''"));
            if (insert_ok == 1)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Data Inserted');", true);

            }
            txtCTC.Text = "";
            txtResponsibilities.Text = "";
            ddlToYear.SelectedIndex = 0;
            ddlToMonth.SelectedIndex = 0;
            ddlFromMonth.SelectedIndex = 0;
            ddlFromYear.SelectedIndex = 0;
            txtExperience.Text = "";
            txtDesignation.Text = "";
            txtCompany.Text = "";
            SqlDataSource1.SelectCommand = "SELECT tbluserprofessionaldetails.intId,tbluserprofessionaldetails.varCompany AS Company, tbluserprofessionaldetails.varDesignation AS Desig, tbluserprofessionaldetails.varExperience AS Exp, CONCAT(tbluserprofessionaldetails.varFromMonth, ' ', tbluserprofessionaldetails.varFromYear) AS WorkingFrom, CONCAT(tbluserprofessionaldetails.varToMonth, ' ', tbluserprofessionaldetails.varToYear) AS WorkingTill, tbluserprofessionaldetails.varResponsibilities AS Responsibilities, tbluserprofessionaldetails.varCTC AS CTC FROM tbluserdetails INNER JOIN tbluserprofessionaldetails ON tbluserdetails.intuserId = tbluserprofessionaldetails.intUserId where tbluserprofessionaldetails.intUserId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "";
            GridView1.DataBind();
            TabName.Value = "Professional";
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

    protected void btnEditProf_Click(object sender, EventArgs e)
    {
        btnSubmitProf.Visible = true;
        btnEditProf.Visible = false;
        try
        {
            int insert_ok = dbc.update_tblUserProDetail(rex.DecryptString(Request.Cookies["userid"].Value.ToString()), txtCompany.Text.Replace("'", "''"), txtDesignation.Text.Replace("'", "''"), txtExperience.Text.Replace("'", "''"), ddlFromMonth.SelectedValue, ddlFromYear.SelectedValue, ddlToMonth.SelectedValue, ddlToYear.SelectedValue, txtResponsibilities.Text.Replace("'", "''"), txtCTC.Text.Replace("'", "''"));
            if (insert_ok == 1)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Data Updated');", true);

            }
            txtCTC.Text = "";
            txtResponsibilities.Text = "";
            ddlToYear.SelectedIndex = 1;
            ddlToMonth.SelectedIndex = 1;
            ddlFromMonth.SelectedIndex = 1;
            ddlFromYear.SelectedIndex = 1;
            txtExperience.Text = "";
            txtDesignation.Text = "";
            txtCompany.Text = "";
            SqlDataSource1.SelectCommand = "SELECT tbluserprofessionaldetails.intId,tbluserprofessionaldetails.varCompany AS Company, tbluserprofessionaldetails.varDesignation AS Desig, tbluserprofessionaldetails.varExperience AS Exp, CONCAT(tbluserprofessionaldetails.varFromMonth, ' ', tbluserprofessionaldetails.varFromYear) AS WorkingFrom, CONCAT(tbluserprofessionaldetails.varToMonth, ' ', tbluserprofessionaldetails.varToYear) AS WorkingTill, tbluserprofessionaldetails.varResponsibilities AS Responsibilities, tbluserprofessionaldetails.varCTC AS CTC FROM tbluserdetails INNER JOIN tbluserprofessionaldetails ON tbluserdetails.intuserId = tbluserprofessionaldetails.intUserId where tbluserprofessionaldetails.intUserId=" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "";
            GridView1.DataBind();
            TabName.Value = "Professional";
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

    protected void grdEdus_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName.Equals("editedu"))
        {
            intid = Convert.ToInt32(e.CommandArgument.ToString());
            btnSubmitEdu.Visible = false;
            btnEditEdu.Visible = true;
            getdataEd(intid);
            TabName.Value = "Educational";
        }
        else
        {
        }
    }
    public void getdataEd(int id)
    {
        dbc.con.Open();
        MySqlCommand cmd = new MySqlCommand("select * from tblstudenteducationaldetails where intId=" + id + "", dbc.con);
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        {
            txtCourses.Text = dbc.dr["varStudentClass"].ToString();
            txtCollege.Text = dbc.dr["varStudentCollege"].ToString();
            txtUniversity.Text = dbc.dr["varStudentUniversity"].ToString();
            txtPassingYear.Text = dbc.dr["varStudentPassingYear"].ToString();
            txtMarks.Text = dbc.dr["varStudentMarks"].ToString();
            txtPercent.Text = dbc.dr["varStudentPer"].ToString();
            txtGrade.Text = dbc.dr["varStudentGrade"].ToString(); 
        }
        dbc.con.Close();
    }

    protected void ddlToMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlToMonth.SelectedValue== "Currently Working")
        {
            ddlToYear.SelectedValue = "2017";
            ddlToYear.Enabled = false;
        }
        else
        {
            ddlToYear.SelectedIndex = 0;
            ddlToYear.Enabled = true;
        }
    }
}