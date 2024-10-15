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
using System.Drawing;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;

public partial class college_InstitituteSettings : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities res = new RegexUtilities();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {


                TabName.Value = Request.Form[TabName.UniqueID];
                btnSubmit.Visible = true;
                btnEdit.Visible = false;
                //DetailsView1.Visible = false;
                edit.Visible = true;

                editbtns.Visible = true;
                getcollegedata();

                SqlDataSourceMedia.SelectCommand = "SELECT varLatitude, varLongitude FROM tblcollegecoordinates WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                grdMediaPanel.DataBind();
                SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
                GridView2.DataBind();
                SqlDataSourceVideo.SelectCommand = "SELECT DISTINCT varMediaName, varMediaPath FROM tblcollegemedia WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + " and varMediaType='Video')";
                GridViewVideo.DataBind();
                SqlDataSourceFacil.SelectCommand = "SELECT intId,intCollegeId, varFacility, varFacilityDescription FROM tblfacilities WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                GridViewFacil.DataBind();
                SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                GridViewCourse.DataBind();
                getdatacollege();
                getImage();


            }
            SqlDataSource2.SelectCommand = "SELECT intid, intCollegeId, varCompanyName FROM tblcollegecomp WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Default.aspx", false);
        }
    }
    public void getImage()
    {
        imgProfile.ImageUrl = "~/college/media/" + dbc.select_CollegeProfile(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())));
         
    }
    protected void btnMediaPanel_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_coordinates(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) != 1)
            {
                int insert_ok = dbc.insert_tblcollegecoordinates(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtLatitude.Text.Replace("'", "''"), txtLongitude.Text.Replace("'", "''"));
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Data Updated.');",
                     true);
                    txtLatitude.Text = "";
                    txtLongitude.Text = "";

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            else
            {
                int insert_ok = dbc.update_tblcollegecoordinate(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtLatitude.Text.Replace("'", "''"), txtLongitude.Text.Replace("'", "''"));
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');",
                    true);
                    txtLatitude.Text = "";
                    txtLongitude.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            SqlDataSourceMedia.SelectCommand = "SELECT varLatitude, varLongitude FROM tblcollegecoordinates WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            grdMediaPanel.DataBind();
            TabName.Value = "AddCoordinates";
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


    protected void AddComp_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_company(txtCompany.Text, Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) == 1)
            {
                int insert_ok1 = dbc.insert_tblColgCompany(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtCompany.Text.Replace("'", "''"));
                if (insert_ok1 == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');",
                    true);
                    txtCompany.Text = "";
                    TabName.Value = "AddCompany";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Not Updated');", true);
                }
                SqlDataSource2.SelectCommand = "SELECT intid, intCollegeId, varCompanyName FROM tblcollegecomp WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                GridView1.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                           this,
                           this.GetType(),
                           "MessageBox",
                           "alert('Already Exists');", true);
            }
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
    public void getcollegedata()
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT  intCollegeId, varCollegeName, varCollegePrincipal,varCollegeAdmissionIncharge,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo, varContactThree, varCollegeWeb from tblcollegedetails where intCollegeId = " + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "", dbc.con);

            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtName.Text = dbc.dr["varCollegeName"].ToString();
                txtAddress.Text = dbc.dr["varCollegeAddress"].ToString();
                txtCity.Text = dbc.dr["varCollegeCity"].ToString();
                string dd = dbc.dr["varCollegeState"].ToString();
                ddlState.SelectedValue = ddlState.Text = dd.Equals("NA") ? "-- Select State --" : dbc.dr["varCollegeState"].ToString();//dbc.dr["varCollegeState"].ToString();
                txtCnt1.Text = dbc.dr["varContactOne"].ToString();
                txtCnt2.Text = dbc.dr["varContactTwo"].ToString();
                txtCnt3.Text = dbc.dr["varContactThree"].ToString();
                txtWeb.Text = dbc.dr["varCollegeWeb"].ToString();
                txtPrincName.Text = dbc.dr["varCollegePrincipal"].ToString();
                txtAdminInch.Text = dbc.dr["varCollegeAdmissionIncharge"].ToString();
            }
            dbc.con.Close();
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
    protected void btnOtherDetail_Click(object sender, EventArgs e)
    {
        edit.Visible = false;
        editbtns.Visible = false;
        //DetailsView1.Visible = false;

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;
       // DetailsView1.Visible = false;
        edit.Visible = true;

        editbtns.Visible = true;
        getcollegedata();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            
            int contentLength = fupProPic.PostedFile.ContentLength;//You may need it for validation
            string contentType = fupProPic.PostedFile.ContentType;//You may need it for validation
            string fileName = string.Empty;

            string cid = res.DecryptString(Request.Cookies["collegeid"].Value.ToString());
            if (contentLength == 0)
            {
                fileName = imgProfile.ImageUrl.Split('/')[1];

                int insert_ok = dbc.update_tblCollegeDetail(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtName.Text.Replace("'", "''"), txtAddress.Text.Replace("'", "''"), txtCity.Text.Replace("'", "''"), ddlState.Text.Replace("'", "''"), txtCnt1.Text.Replace("'", "''"), txtCnt2.Text.Replace("'", "''"), txtCnt3.Text.Replace("'", "''"), txtWeb.Text.Replace("'", "''"), txtPrincName.Text.Replace("'", "''"), txtAdminInch.Text.Replace("'", "''"), fileName);
                if (insert_ok == 1)
                {
                    ScriptManager.RegisterStartupScript(
                                     this,
                                     this.GetType(),
                                     "MessageBox",
                                     "alert('Updated Successfully');", true);
                }
            }
            else
            {
                fileName = fupProPic.PostedFile.FileName;

                int insert_ok = dbc.update_tblCollegeDetail(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtName.Text.Replace("'", "''"), txtAddress.Text.Replace("'", "''"), txtCity.Text.Replace("'", "''"), ddlState.Text.Replace("'", "''"), txtCnt1.Text.Replace("'", "''"), txtCnt2.Text.Replace("'", "''"), txtCnt3.Text.Replace("'", "''"), txtWeb.Text.Replace("'", "''"), txtPrincName.Text.Replace("'", "''"), txtAdminInch.Text.Replace("'", "''"), fileName);
                if (insert_ok == 1)
                {
                    fupProPic.PostedFile.SaveAs(Server.MapPath("~/college/media/") + fileName);//Or code to save in the DataBase.

                    ScriptManager.RegisterStartupScript(
                                     this,
                                     this.GetType(),
                                     "MessageBox",
                                     "alert('Updated Successfully');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                      this,
                      this.GetType(),
                      "MessageBox",
                  "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            getcollegedata();
            getImage();
            TabName.Value = "Basic";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Error Please try again');", true);
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //btnSubmit.Visible = false;
        //btnEdit.Visible = true;
        //DetailsView1.Visible = true;
        //edit.Visible = false;
        Response.Redirect("~/college/InstituteSettings.aspx");

    }
    
    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        //DetailsView1.Visible = true;
        editbtns.Visible = true;
        edit.Visible = false;
    }


    static int fid = 0;
    protected void grdCollegeData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                setdata(fid);
            }
            btnImagePanel.Visible = false;
            UpdateCom.Visible = true;

        }
        else if (e.CommandName.Equals("deletes"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                deletedata(fid);
            }
        }
        SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
        GridView2.DataBind();
        TabName.Value = "AddImages";
    }

    public void setdata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varMediaName from tblcollegemedia where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtImage.Text = dbc.dr["varMediaName"].ToString();

            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select image to edit')</script>");
        }
        dbc.con.Close();
        SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
        GridView2.DataBind();
        TabName.Value = "AddImages"; 
    }

    public void deletedata(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("delete from tblcollegemedia where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select image to delete')</script>");
        }
        dbc.con.Close();
        TabName.Value = "AddImages";
    }
    protected void UpdateCom_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = string.Empty;

            if (!fupImage.HasFile)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Please select a picture');", true);

                return;
            }
            else
            {
                string ffileExt = System.IO.Path.GetExtension(fupImage.FileName);
                if ((ffileExt == ".JPG") || (ffileExt == ".jpg") || (ffileExt == ".JPEG") || (ffileExt == ".jpeg") || (ffileExt == ".PNG") || (ffileExt == ".png"))
                {
                    filename = Convert.ToInt32(Request.QueryString["id"]) + "_" + txtImage.Text + "_" + fupImage.FileName.ToString();
                    int update_insp = dbc.update_PicCol(Convert.ToInt32(fid), txtImage.Text, filename);

                    if (update_insp == 1)
                    {
                        fupImage.SaveAs(Server.MapPath("~/college/media/") + filename);

                        ClientScript.RegisterStartupScript(this.GetType(),
                               "popup",
                               "alert('Data Updated.');",
                               true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Data Not Inserted');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }

            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
        SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
        GridView2.DataBind();
        TabName.Value = "AddImages";
    }
    protected void btnImagePanel_Click(object sender, EventArgs e)
    {
        string filename = string.Empty;
        try
        {
            if (dbc.check_imgcount(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) < 8)
            {
                string ffileExt = System.IO.Path.GetExtension(fupImage.FileName);

                if ((ffileExt == ".JPG") || (ffileExt == ".jpg") || (ffileExt == ".JPEG") || (ffileExt == ".jpeg") || (ffileExt == ".PNG") || (ffileExt == ".png"))
                {
                    filename = Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "_" + txtImage.Text + "_" + fupImage.FileName.ToString();
                    int insert_ok = dbc.insert_tblcollegemedia(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), "Image", txtImage.Text, filename);
                    if (insert_ok == 1)
                    {
                        fupImage.SaveAs(Server.MapPath("~/college/media/") + filename);
                        ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Data Updated.');",
                     true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Six photos adready uploaded');", true);
                return;
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
        SqlDataSourceImg.SelectCommand = "SELECT intId, intCollegeId,varMediaType, varMediaName, varMediaPath FROM  tblcollegemedia where intCollegeId=" + Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + " and varMediaType='Image'";
        GridView2.DataBind();
        TabName.Value = "AddImages";
    }


    protected void btnVideo_Click(object sender, EventArgs e)
    {
        try
        {
            string[] vidId = Regex.Split(txtVideoLink.Text, @"v=");
            string[] vidLink = Regex.Split(vidId[1], @"&");
            if (dbc.check_already_video(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) != 1)
            {
                int insert_ok = dbc.insert_tblcollegemedia(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), "Video", txtMediaName.Text.Replace("'", "''"), vidLink[0].ToString());
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                     "popup",
                     "alert('Data Updated.');",
                     true);
                    txtMediaName.Text = "";
                    txtVideoLink.Text = "";

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
            else
            {
                int insert_ok = dbc.update_tblcollegemedia(Convert.ToInt32(res.DecryptString(Request.Cookies["collegeid"].Value.ToString())), "Video", txtMediaName.Text.Replace("'", "''"), vidLink[0].ToString());
                if (insert_ok == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');",
                    true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
        txtVideoLink.Text = "";
        txtMediaName.Text = "";
        SqlDataSourceVideo.SelectCommand = "SELECT DISTINCT varMediaName, varMediaPath FROM tblcollegemedia WHERE (intCollegeId = " + res.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + " and varMediaType='Video')";
        GridViewVideo.DataBind();
        TabName.Value = "AddVideo";
    }

 
    

    public void setdatafac(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varFacility,varFacilityDescription from tblfacilities where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                txtFName.Text = dbc.dr["varFacility"].ToString();
                txtFDescrip.Text = dbc.dr["varFacilityDescription"].ToString();
            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select facility to edit')</script>");
        }
        dbc.con.Close();
    }

    public void deletedatafac(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("delete from tblfacilities where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            cmd.ExecuteNonQuery();
           
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select facility to delete')</script>");
        }
        dbc.con.Close();
    }
    protected void btnUpdateFacility_Click(object sender, EventArgs e)
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblfacilities SET varFacility=N'" + txtFName.Text.Replace("'", "''") + "',varFacilityDescription=N'" + txtFDescrip.Text.Replace("'", "''") + "' WHERE intId=" + fid + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');",
                    true);
            
            TabName.Value = "AddFacilities";
            SqlDataSourceFacil.SelectCommand = "SELECT intId,intCollegeId, varFacility, varFacilityDescription FROM tblfacilities WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            GridViewFacil.DataBind();
            txtFDescrip.Text = "";
            txtFName.Text = "";
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
    protected void btnAddFacility_Click(object sender, EventArgs e)
    {
        string filename = string.Empty;
        try
        {

            int insert_ok1 = dbc.insert_tblColFacility(Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtFName.Text.Replace("'", "''"), txtFDescrip.Text.Replace("'", "''"));
            if (insert_ok1 == 1)
            {

                ClientScript.RegisterStartupScript(this.GetType(),
           "popup",
           "alert('Data Updated.');",
           true);
               

            }
            else
            {
                ScriptManager.RegisterStartupScript(
                this,
                this.GetType(),
                "MessageBox",
                "alert('Please select proper file format');", true);
                return;
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
        TabName.Value = "AddFacilities";
        SqlDataSourceFacil.SelectCommand = "SELECT intId,intCollegeId, varFacility, varFacilityDescription FROM tblfacilities WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
        GridViewFacil.DataBind();
        txtFDescrip.Text = "";
        txtFName.Text = "";
    }

    protected void GridViewFacil_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                setdatafac(fid);
            }
            btnAddFacility.Visible = false;
            UpdateCom.Visible = true;
        }
        else if (e.CommandName.Equals("deletes"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                deletedatafac(fid);
            }
        }
        TabName.Value = "AddFacilities";
      
        txtFDescrip.Text = "";
        txtFName.Text = "";
    }



    protected void btnAddCourses_Click(object sender, EventArgs e)
    {
        try
        {
            if (dbc.check_already_course(txtCName.Text, Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()))) == 1)
            {
                int insert_ok1 = dbc.insert_tblColgCourse(Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())), ddlCourseType.SelectedItem.Text, txtCName.Text.Replace("'", "''"), txtDescription.Text.Replace("'", "''"), txtDuration.Text.Replace("'", "''"), txtFes.Text.Replace("'", "''"), txtaffli.Text.Replace("'", "''"), txtAccre.Text.Replace("'", "''"), txtAddmision.Text.Replace("'", "''"));
                if (insert_ok1 == 1)
                {
                    txtAccre.Text = "";
                    txtAddmision.Text = "";
                    txtaffli.Text = "";
                    txtCName.Text = "";
                    txtDescription.Text = "";
                    txtDuration.Text = "";
                    txtFes.Text = "";
                    ddlCourseType.Text = "--Select Course Type--";
                    TabName.Value = "AddCourses";
                    SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
                    GridViewCourse.DataBind();

                    ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Updated');", true);

                }

                else
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Not Updated');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                           this,
                           this.GetType(),
                           "MessageBox",
                           "alert('Course Already Exists');", true);
            }
            

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
    protected void GridViewCourse_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                setdatacou(fid);
            }
            btnAddCourses.Visible = false;
            UpdateCom.Visible = true;
        }
        else if (e.CommandName.Equals("deletes"))
        {
            string colid = e.CommandArgument.ToString();
            if (fid != null)
            {
                fid = Convert.ToInt32(colid);
                deletedatacou(fid);
            }
        }
        txtAccre.Text = "";
        txtAddmision.Text = "";
        txtaffli.Text = "";
        txtCName.Text = "";
        txtDescription.Text = "";
        txtDuration.Text = "";
        txtFes.Text = "";
        ddlCourseType.Text = "--Select Course Type--";
        TabName.Value = "AddCourses";
        SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
        GridViewCourse.DataBind();

    }

    public void setdatacou(int fid)
    {
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCourseType,varCourseName,varCourseDescription,varDuration,varFees,varAffliation,varAccredited,varAdmissionCriteria from tblcollegecourses where intId =" + fid + "", dbc.con);
            dbc.con.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                ddlCourseType.Text = dbc.dr["varCourseType"].ToString();
                txtCName.Text = dbc.dr["varCourseName"].ToString();
                txtDescription.Text = dbc.dr["varCourseDescription"].ToString();
                txtDuration.Text = dbc.dr["varDuration"].ToString();
                txtFes.Text = dbc.dr["varFees"].ToString();
                txtaffli.Text = dbc.dr["varAffliation"].ToString();
                txtAccre.Text = dbc.dr["varAccredited"].ToString();
                txtAddmision.Text = dbc.dr["varAdmissionCriteria"].ToString();
            }
            dbc.dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select course to edit')</script>");
        }
        dbc.con.Close();
        txtAccre.Text = "";
        txtAddmision.Text = "";
        txtaffli.Text = "";
        txtCName.Text = "";
        txtDescription.Text = "";
        txtDuration.Text = "";
        txtFes.Text = "";
        ddlCourseType.Text = "--Select Course Type--";
        TabName.Value = "AddCourses";
        SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
        GridViewCourse.DataBind();

    }

    public void deletedatacou(int fid)
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("delete from tblcollegecourses where intId =" + fid + "", dbc.con);            
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            txtAccre.Text = "";
            txtAddmision.Text = "";
            txtaffli.Text = "";
            txtCName.Text = "";
            txtDescription.Text = "";
            txtDuration.Text = "";
            txtFes.Text = "";
            ddlCourseType.Text = "--Select Course Type--";
            TabName.Value = "AddCourses";
            SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            GridViewCourse.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please select course to delete')</script>");
        }
        dbc.con.Close();
    }
    protected void btnUpdateCourses_Click(object sender, EventArgs e)
    {
        try
        {
            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegecourses SET varCourseType=N'" + ddlCourseType.Text.Replace("'", "''") + "',varCourseName=N'" + txtCName.Text.Replace("'", "''") + "',varCourseDescription=N'" + txtDescription.Text.Replace("'", "''") + "',varDuration=N'" + txtDuration.Text.Replace("'", "''") + "',varFees=N'" + txtFes.Text.Replace("'", "''") + "',varAffliation=N'" + txtaffli.Text.Replace("'", "''") + "',varAccredited=N'" + txtAccre.Text.Replace("'", "''") + "',varAdmissionCriteria=N'" + txtAddmision.Text.Replace("'", "''") + "' WHERE intId=" + fid + "", dbc.con);
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            txtAccre.Text = "";
            txtAddmision.Text = "";
            txtaffli.Text = "";
            txtCName.Text = "";
            txtDescription.Text = "";
            txtDuration.Text = "";
            txtFes.Text = "";
            ddlCourseType.Text = "--Select Course Type--";
            TabName.Value = "AddCourses";
            SqlDataSourceCourse.SelectCommand = "SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE (intCollegeId = " + rex.DecryptString(Request.Cookies["collegeid"].Value.ToString()) + ")";
            GridViewCourse.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(),
                    "popup",
                    "alert('Data Updated.');",
                    true);
            
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

    public void getdatacollege()
    {



        dbc.con.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT intCollegeId, varAboutOne, varAboutTwo, varBrochure, varUniAns, varNAACAns, varPlacementRecordPer, varSpecialAchievements FROM tblcollegeotherdetails where intCollegeId = " + Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "", dbc.con);
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        {

            txtVision.Text = dbc.dr["varAboutOne"].ToString();
            txtObjective.Text = dbc.dr["varAboutTwo"].ToString();
            txtUgc.Text = dbc.dr["varUniAns"].ToString();
            txtNaac.Text = dbc.dr["varNAACAns"].ToString();
            txtPlaceRecord.Text = dbc.dr["varPlacementRecordPer"].ToString();
            txtSpecialAchievements.Text = dbc.dr["varSpecialAchievements"].ToString();
        }
        dbc.con.Close();

        dbc.con.Open();
        cmd = new MySqlCommand("SELECT intId, intCollegeId, fb, gp, tw, lnkd, ex1 FROM tblcollegesocials WHERE intCollegeId = " + Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "", dbc.con);
        dbc.dr = cmd.ExecuteReader();
        if (dbc.dr.Read())
        { 
            fbo.Text = dbc.dr["fb"].ToString();
            gpo.Text = dbc.dr["gp"].ToString();
            two.Text = dbc.dr["tw"].ToString();
            lnko.Text = dbc.dr["lnkd"].ToString(); 
        }
        dbc.con.Close();    

    }
    protected void btnPanelOther_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = string.Empty;
            try
            {
                string ffileExt = System.IO.Path.GetExtension(fupFeeStruc.FileName);
                if (ffileExt == "")
                {
                    filename = string.Empty;
                }
                else if ((ffileExt == ".PDF") || (ffileExt == ".pdf") || (ffileExt == ".DOCX") || (ffileExt == ".docx"))
                {
                    filename = Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())) + "_" + fupFeeStruc.FileName.ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Please select proper file format');", true);
                    return;

                }

                int insert_ok = dbc.update_tblCollegeOtherFacilities(Convert.ToInt32(rex.DecryptString(Request.Cookies["collegeid"].Value.ToString())), txtVision.Text.Replace("'", "''"), txtObjective.Text.Replace("'", "''"), txtUgc.Text, txtNaac.Text, txtPlaceRecord.Text, filename, txtSpecialAchievements.Text.Replace("'", "''"));
                insert_ok = dbc.update_tblcollegesocials(res.DecryptString(Request.Cookies["collegeid"].Value.ToString()), fbo.Text, gpo.Text, two.Text, lnko.Text);
                if (insert_ok == 1)
                {
                    if (ffileExt == "")
                    {
                    }
                    else
                    {
                        fupFeeStruc.SaveAs(Server.MapPath("~/college/media/") + filename);
                    }
                    ScriptManager.RegisterStartupScript(
                         this,
                         this.GetType(),
                         "MessageBox",
                         "alert('Updated');", true);
                 
                    //ClientScript.RegisterStartupScript(this.GetType(),
                    //   "popup",
                    //   "window.location='" + "CollegeOther.aspx?id=" + Convert.ToInt32(Request.QueryString["id"].ToString()) + "';", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Not Updated');", true);
                    return;
                }
                TabName.Value = "OtherDetails";
                getdatacollege();
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
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('" + ex.Message + "');", true);
        }
    }

    
}