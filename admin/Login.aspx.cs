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
using MySql.Data.MySqlClient;

public partial class admin_Login : System.Web.UI.Page
{
     MySqlConnection con;
    public  MySqlDataReader dr;
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        con = new  MySqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
        //
        if (!IsPostBack)
        {
        }
        location();
    }
    public void location()
    {
        //  lblLocation.Text = "At " + "<script type='text/javascript'>locate();</script>";

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string uname = txtName.Text;
            string pass = txtPass.Text;
             MySqlCommand cmd = new  MySqlCommand("select intAdminId,varUsername,varPassword from tbladmin where varUsername='" + uname + "'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["varPassword"].ToString() == pass)
                {
                    HttpCookie adminId = new HttpCookie("adminId");
                    adminId.Value = rex.EncryptString(dr["intAdminId"].ToString());
                    Response.Cookies.Add(adminId);
                    
                    Response.Redirect("~/admin/");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Plese enter correct Credentials');", true);
            }
            con.Close();
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