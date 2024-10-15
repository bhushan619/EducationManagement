using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

public partial class admin_verify : System.Web.UI.Page
{
    SqlConnection con;
    public SqlDataReader dr;
    DatabaseConnection dbc = new DatabaseConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["cvid"] != null)
        {
            coll();

        }
        else if (Request.QueryString["svid"] != null)
        {
            stu();
        }
        else if (Request.QueryString["avid"] != null)
        {
            adv();
        }
        else if (Request.QueryString["uvid"] != null)
        {
            user();
        }
    }
    public void user()
    {
        try
        {

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("select intuserId as newid from tbluserdetails where varVerified='" + Request.QueryString["uvid"].ToString() + "'", dbc.con);
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                int upd = Convert.ToInt32(dbc.dr["newid"].ToString());
                dbc.con.Close();
                dbc.con.Open();
                MySqlCommand cmd1 = new MySqlCommand("UPDATE tbluserdetails SET varVerified='true' where intuserId='" + upd + "'", dbc.con);
                cmd1.ExecuteNonQuery();
                dbc.con.Close();
                ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Verified now login');window.location='../Default.aspx';",
                        true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please try again');window.location='../default.aspx';",
                         true);
            }

        }
        catch (Exception s)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please contact support');window.location='../default.aspx';",
                         true);
        }
    }
    public void adv()
    {
        try
        {

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId as newid from tbladvertiser where varVerified='" + Request.QueryString["avid"].ToString() + "'", dbc.con);
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                int upd = Convert.ToInt32(dbc.dr["newid"].ToString());
                dbc.con.Close();
                dbc.con.Open();
                MySqlCommand cmd1 = new MySqlCommand("UPDATE tbladvertiser SET varVerified='true' where intId='" + upd + "'", dbc.con);
                cmd1.ExecuteNonQuery();
                dbc.con.Close();
                ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Verified now login as student');window.location='../login.aspx';",
                        true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please try again');window.location='../default.aspx';",
                         true);
            }

        }
        catch (Exception s)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please contact support');window.location='../default.aspx';",
                         true);
        }
    }
    public void stu()
    {
        try
        {

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("select intStudentId as newid from tblstudentdetail where varVerified='" + Request.QueryString["svid"].ToString() + "'", dbc.con);
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                int upd = Convert.ToInt32(dbc.dr["newid"].ToString());
                dbc.con.Close();
                dbc.con.Open();
                MySqlCommand cmd1 = new MySqlCommand("UPDATE tblstudentdetail SET varVerified='true' where intStudentId='" + upd + "'", dbc.con);
                cmd1.ExecuteNonQuery();
                dbc.con.Close();
                ClientScript.RegisterStartupScript(this.GetType(),
                        "popup",
                        "alert('Verified now login as student');window.location='../login.aspx';",
                        true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please try again');window.location='../default.aspx';",
                         true);
            }

        }
        catch (Exception s)
        {
            ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please contact support');window.location='../default.aspx';",
                         true);
        }
    }
    public void coll()
    {
        try
        {

            dbc.con.Open();
            MySqlCommand cmd = new MySqlCommand("select intCollegeId as newid from tblcollegedetails where varVerified='" + Request.QueryString["cvid"].ToString() + "'", dbc.con);
            dbc.dr = cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                int upd = Convert.ToInt32(dbc.dr["newid"].ToString());
                dbc.con.Close();
                dbc.con.Open();
                MySqlCommand cmd1 = new MySqlCommand("UPDATE tblcollegedetails SET varVerified='true' where intCollegeId='" + upd + "'", dbc.con);
                cmd1.ExecuteNonQuery();
                dbc.con.Close();
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Verified now login as college.');window.location='../login.aspx';",
                         true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                         "popup",
                         "alert('Please Try again');window.location='../default.aspx';",
                         true);
            }

        }
        catch (Exception s)
        {
            dbc.con.Close();
            ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Not Verified');", true);
        }
    }


}