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

public partial class User_Sent : System.Web.UI.Page
{
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
            getSentData(); 
        }
    }
    
   
    string MsgId = string.Empty;
    string ConId = string.Empty;
    string SentMemName = string.Empty;
    string SentMsg = string.Empty;
    string SentDate = string.Empty;
    string SentTime = string.Empty;
    string SentPhoto = string.Empty;

    public void getSentData()
    {
        try
        {
            MySql.Data.MySqlClient.MySqlDataReader rdr1, rdr2, rdr3;

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] {
                 new DataColumn("ConId", typeof(string)),
                        new DataColumn("SentMemName", typeof(string)),
                        new DataColumn("SentMsg", typeof(string)),
                        new DataColumn("SentDate", typeof(string)),
                          new DataColumn("SentTime", typeof(string)),
                            new DataColumn("SentPhoto", typeof(string)),


        });

            DataRow dr = dt.NewRow();

            MySql.Data.MySqlClient.MySqlConnection cnn1 = new MySql.Data.MySqlClient.MySqlConnection();
            cnn1.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
            cnn1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgFrom, tblamcommunication.varMsgFromName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgto = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "')  ", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd1.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();

                    MySql.Data.MySqlClient.MySqlConnection cnn2 = new MySql.Data.MySqlClient.MySqlConnection();
                    cnn2.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
                    cnn2.Open();
                    MySql.Data.MySqlClient.MySqlCommand cmd2 = new MySql.Data.MySqlClient.MySqlCommand("SELECT        tblamconversation.intId, tblamcommunication.varMsgFromName, tblamconversation.varMsgText, tblamconversation.varDate, tblamconversation.varTime, tblamcommunication.varMsgFrom AS Expr1, tbluserdetails.varPhoto FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId INNER JOIN tbluserdetails ON tblamcommunication.varMsgFrom = tbluserdetails.intuserId WHERE tblamcommunication.intId='" + Convert.ToInt32(MsgId) + "' AND tblamconversation.varMsgFrom='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "' ", cnn2);
                    using (cnn2)
                    {
                        //read data from the table to our data reader
                        rdr2 = cmd2.ExecuteReader();
                        //loop through each row we have read
                        while (rdr2.Read())
                        {
                            ConId = rdr2["intId"].ToString();
                            SentMemName = rdr2["varMsgFromName"].ToString();
                            SentDate = rdr2["varDate"].ToString();
                            SentTime = rdr2["varTime"].ToString();
                            SentMsg = rdr2["varMsgText"].ToString();
                            SentPhoto = rdr2["varPhoto"].ToString();
                        }
                        // Empty strings
                        MsgId = string.Empty;
                        ConId = string.Empty;
                        SentMemName = string.Empty;
                        SentMsg = string.Empty;
                        SentDate = string.Empty;
                        SentTime = string.Empty;

                    }
                    cnn2.Close();
                }
            }
            cnn1.Close();
            cmd1.Dispose();

            cnn1.Open();
            cmd1 = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgto, tblamcommunication.varMsgtoName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgFrom = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "')", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd1.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();

                    MySql.Data.MySqlClient.MySqlConnection cnn2 = new MySql.Data.MySqlClient.MySqlConnection();
                    cnn2.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
                    cnn2.Open();
                    MySql.Data.MySqlClient.MySqlCommand cmd2 = new MySql.Data.MySqlClient.MySqlCommand("SELECT tblamconversation.intId, tblamcommunication.varMsgFromName, tblamconversation.varMsgText, tblamconversation.varDate, tblamconversation.varTime, tblamcommunication.varMsgFrom AS Expr1, tbluserdetails.varPhoto FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId INNER JOIN tbluserdetails ON tblamcommunication.varMsgFrom = tbluserdetails.intuserId  WHERE tblamcommunication.intId='" + Convert.ToInt32(MsgId) + "' AND tblamconversation.varMsgFrom='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", cnn2);
                    using (cnn2)
                    {
                        //read data from the table to our data reader
                        rdr2 = cmd2.ExecuteReader();
                        //loop through each row we have read
                        while (rdr2.Read())
                        {
                            ConId = rdr2["intId"].ToString();
                            SentMemName = rdr2["varMsgFromName"].ToString();
                            SentDate = rdr2["varDate"].ToString();
                            SentTime = rdr2["varTime"].ToString();
                            SentMsg = rdr2["varMsgText"].ToString();
                            SentPhoto = rdr2["varPhoto"].ToString();
                            dt.Rows.Add(ConId, SentMemName, SentMsg, SentDate, SentTime, SentPhoto);
                                
                        }
                        cnn2.Close();
                        rdr2.Close();
                        // Empty strings
                        MsgId = string.Empty;
                        ConId = string.Empty;
                        SentMemName = string.Empty;
                        SentMsg = string.Empty;
                        SentDate = string.Empty;
                        SentTime = string.Empty;
                        SentPhoto = string.Empty;
                    }
                    cnn2.Close();
                }
            }
            cnn1.Close();
            cmd1.Dispose();

            lstSentMessages.DataSource = dt;
            lstSentMessages.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    
    protected void lstSentMessages_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "delet")
            {
                int insert_ok = dbc.delete_Message(e.CommandArgument.ToString());
                if (insert_ok == 1)
                {
                    ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "window.location='Send.aspx';", true);
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