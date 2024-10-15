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
using System.Text;

public partial class admin_PackageRegister : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["adminid"] == null)
        {
            Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
            Response.Cache.SetExpires(DateTimeOffset.UtcNow.LocalDateTime.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (!IsPostBack)
        { 
            getPackage(); 
        }
    }
    
       protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            txtDescription.Text.Replace("'", "\'");
            txtBenefit.Text.Replace("'", "\'");

            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select intId from tblampackagesdetails where varPackageId='" + dbc.get_tblampackagesId(ddlPackageName.Text) + "' and varPackageDuration='" + txtDuration.Text + "' and varPackageDurationTime='" + ddlDuration.Text + "'", dbc.con1);
            dbc.con1.Open();
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                ScriptManager.RegisterStartupScript(
                     this,
                     this.GetType(),
                     "MessageBox",
                     "alert('Package already added');", true);

            }

            else
            {
                int insert_ok = dbc.insert_tblampackages(ddlPackageName.Text.Replace("'", "''"), txtDuration.Text.Replace("'", "''"), ddlDuration.Text.Replace("'", "''"), txtPrice.Text.Replace("'", "''"), txtDescription.Text.Replace("'", "''"), txtBenefit.Text.Replace("'", "''"), txtContact.Text.Replace("'", "''"));

                if (insert_ok == 1)
                {
                   
                    ScriptManager.RegisterStartupScript(
                       this,
                       this.GetType(),
                       "MessageBox",
                       "alert('Package Details Added Successfully...!!!');window.location='PackageRegister.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Some problem Please try again...!!!');", true);
                }
            }

            dbc.con1.Close();
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
    public void clear()
    {
        txtBenefit.Text = "";
        txtDescription.Text = "";
        txtDuration.SelectedIndex = 0;
        ddlPackageName.SelectedIndex = 0;
        txtPrice.Text = "";
        ddlDuration.SelectedIndex = 0;
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            other.Visible = false;
            packtext.Visible = true;

        }
        catch (Exception s)
        {

        }
    }
    public void getPackage()
    {
        try
        {

            string query = "SELECT distinct varPackageName FROM tblampackages";
            dbc.con.Close();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(query, dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter ad = new MySql.Data.MySqlClient.MySqlDataAdapter(cmd);
            ad.Fill(dt);

            ddlPackageName.DataSource = dt;
            ddlPackageName.DataTextField = "varPackageName";
            ddlPackageName.DataValueField = "varPackageName";
            ddlPackageName.DataBind();
            dbc.con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                         "alert('Some Problem Please try again later...!!!');", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("PackageRegister.aspx");
    }
    protected void btnAddpack_Click(object sender, EventArgs e)
    {
        try
        {

            int insert_ok = dbc.insert_package_single(txtpackage.Text.Replace("'", "''"));

            if (insert_ok == 1)
            {
                ScriptManager.RegisterStartupScript(
                            this,
                            this.GetType(),
                            "MessageBox",
                             "alert('Package Added');window.location='PackageRegister.aspx';", true);
                other.Visible = true;
                packtext.Visible = false;

            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterStartupScript(
                      this,
                      this.GetType(),
                      "MessageBox",
                       "alert('Some Problem Please try again later...!!!');", true);
            dbc.con.Close();

        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            Session.Add("packid", e.CommandArgument.ToString());
           Response.Redirect("EditPackage.aspx",false);
        }
        catch (Exception ex)
        {
           // Response.Write("<script>alert('Please Try Again');</script>");
        }
    }
}