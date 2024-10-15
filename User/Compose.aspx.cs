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
using System.Text;
using System.Text.RegularExpressions;

public partial class User_Compose : System.Web.UI.Page
{
    static string memberid = string.Empty;
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userid"] == null)
        {
            Response.Write("<script>alert('Please Try Again');window.location='../Default.aspx';</script>");
            Response.Cache.SetExpires(DateTimeOffset.UtcNow.LocalDateTime.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        else if (!IsPostBack)
        { 
            memberid = rex.DecryptString(Request.Cookies["userid"].Value.ToString()); 
            dbc.dataAdapter= new MySqlDataAdapter("SELECT distinct varMsgTo as ID, varMsgToName as Names FROM tblamcommunication WHERE varMsgFrom='" + memberid + "'", dbc.con);
            DataTable dt = new DataTable();
            dbc.dataAdapter.Fill(dt);

            dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct varMsgFrom as ID, varMsgFromName as Names FROM tblamcommunication WHERE varMsgTo='" + memberid + "'", dbc.con);
         
            dbc.dataAdapter.Fill(dt);

            ddlMemberDetails.DataSource = dt;
            ddlMemberDetails.DataTextField = "Names";
            ddlMemberDetails.DataValueField = "ID";
            ddlMemberDetails.DataBind();

            if (Request.Cookies["msgToId"] ==null)
            {

            }
            else
            {
                ddlMemberDetails.SelectedValue = Request.Cookies["msgToId"].Value.ToString();
                Response.Cookies["msgToId"].Value = null;
                Response.Cookies["msgToId"].Expires = DateTime.Now.AddDays(-1);
            }
            
        }

    }


   
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {


            int ifmem = dbc.check_if_member(ddlMemberDetails.SelectedValue);
            if (ifmem == 1)
            {
                String input = txtMessage.Text.Replace("'", "''");
                String pattern = @"(\S*)@\S*\.\S*";
                String result = Regex.Replace(input, pattern, "(Omitted)");

                pattern = @"\d";

                result = Regex.Replace(result, pattern, "x");

                string already = dbc.check_already_msg( rex.DecryptString(Request.Cookies["userid"].Value.ToString()) , ddlMemberDetails.SelectedValue);
                if (already != 0.ToString())
                {
                    int idc = dbc.max_tblamconversation();
                    idc = idc + 1;
                    dbc.con.Open();
                    MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblamconversation VALUES (" + idc + ",'" + already + "','" +  rex.DecryptString(Request.Cookies["userid"].Value.ToString())  + "','" + result + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','Unread')", dbc.con);
                    cmdc.ExecuteNonQuery();
                    dbc.con.Close();
                    cmdc.Dispose();
                     ScriptManager.RegisterStartupScript(
                      this,
                      this.GetType(),
                      "MessageBox",
                      "alert('Message Sent');window.location='Compose.aspx'; ", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Please Enter Correct Member Details');", true);
            }
        }
        catch (Exception ex)
        {
        }
    }
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static List<string> GetCompletionList(string prefixText, int count, string contextKey)
    {
        String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

        MySql.Data.MySqlClient.MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(connStr);
        con.Open();
        MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct varMsgToName as varCompanyName FROM tblamcommunication WHERE varMsgFrom='" + memberid + "'", con);
        //     cmd.Parameters.AddWithValue("@Name", prefixText);
        MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter(cmd);
        DataTable dtc = new DataTable();
        da.Fill(dtc);

        List<string> CompanyName = new List<string>();
        for (int i = 0; i < dtc.Rows.Count; i++)
        {
            CompanyName.Add(dtc.Rows[i][0].ToString());
            //  CompanyName[j++] =dt.Rows[i][0].ToString();
        }
        con.Close();
        return CompanyName;
    }
   
    
}