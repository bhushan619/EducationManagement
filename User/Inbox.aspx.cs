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
using System.Text.RegularExpressions;

public partial class User_Inbox : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    static string mem = string.Empty;
    static string memid = string.Empty;
    static string convid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                
                getDataInbox();
                getDataMessages();
                mem = string.Empty;
                memid = string.Empty;
                convid = string.Empty;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Unload(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mem = string.Empty;
            memid = string.Empty;
            convid = string.Empty;

        }
    }
   
    protected void lstInbox_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        { 
            string[] commandarguement = e.CommandArgument.ToString().Split(';');
            convid = commandarguement[0].ToString();

            SqlDataSourceConversation.SelectCommand = "SELECT tbluserdetails.varuserName as varMemberName, tblamconversation.varMsgFrom,tbluserdetails.varPhoto, tblamconversation.varMsgText, tblamconversation.varDate, tblamconversation.varTime FROM tblamconversation INNER JOIN tbluserdetails ON tblamconversation.varMsgFrom = tbluserdetails.intuserId WHERE (tblamconversation.varMessageId ='" + commandarguement[0].ToString() + "') ORDER BY tblamconversation.intId desc";
            
            mem = commandarguement[0].ToString();
            memid = commandarguement[1].ToString();
            MsgId = mem;
            if (e.CommandName == "Views")
            {
                dbc.con.Close();
                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblamconversation SET ex1='Read' WHERE varMessageId='" + mem + "' and varMsgFrom='" + memid + "'", dbc.con);
                cmd.ExecuteNonQuery();
                dbc.con.Close();
            }
            getDataMessages();
            getDataInbox();
          
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {

        try
        {
            if (memid == "")
            {

                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Please select an conversation');", true);
            }
            else
            {
                String input = txtMessage.Text.Replace("'", "''");
                String pattern = @"(\S*)@\S*\.\S*";
                String result = Regex.Replace(input, pattern, "(Omitted)");

                pattern = @"\d";

                result = Regex.Replace(result, pattern, "x");

                int idc = dbc.max_tblamconversation();
                idc = idc + 1;
                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmdc = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblamconversation VALUES (" + idc + ",'" + mem + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','" + result + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortDateString() + "','" + DateTimeOffset.UtcNow.AddHours(12).LocalDateTime.ToShortTimeString() + "','Unread')", dbc.con);
                cmdc.ExecuteNonQuery();
                dbc.con.Close();
                cmdc.Dispose();

                txtMessage.Text = string.Empty;

                SqlDataSourceConversation.SelectCommand = "SELECT tbluserdetails.varuserName as varMemberName, tbluserdetails.varPhoto,tblamconversation.varMsgFrom, tblamconversation.varMsgText, tblamconversation.varDate, tblamconversation.varTime FROM tblamconversation INNER JOIN tbluserdetails ON tblamconversation.varMsgFrom = tbluserdetails.intuserId WHERE (tblamconversation.varMessageId ='" + convid + "') ORDER BY tblamconversation.intId desc";
                convid = string.Empty;

                dbc.insert_tblnotifications("Page", rex.DecryptString(Request.Cookies["userid"].Value.ToString()), dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1], "User", memid, "User", " Message Reply from : " + dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1] + "", "~/User/Inbox.aspx", "NA", "Unread", string.Empty);
                //SqlDataSourceConversation.SelectCommand = "SELECT tbluserdetails.varuserName as varMemberName, tblamconversation.varMsgFrom,tbluserdetails.varPhoto, tblamconversation.varMsgText, tblamconversation.varDate, tblamconversation.varTime FROM tblamconversation INNER JOIN tbluserdetails ON tblamconversation.varMsgFrom = tbluserdetails.intuserId WHERE (tblamconversation.varMessageId ='" + commandarguement[0].ToString() + "') ORDER BY tblamconversation.intId desc";

                getDataMessages();
            }
        }
        catch (Exception ex)
        {
        }
    }
    string MsgId = string.Empty;
    string InboxMsgMember = string.Empty;
    string InboxMemName = string.Empty;
    string InboxMemPhoto = string.Empty;
    string UserAs = string.Empty;

    public void getDataInbox()
    {
        try
        {
            MySql.Data.MySqlClient.MySqlDataReader rdr1, rdr2, rdr3;

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("MsgId", typeof(string)),
                        new DataColumn("InboxMsgMember", typeof(string)),
                        new DataColumn("InboxMemName", typeof(string)),
                         new DataColumn("InboxMemPhoto", typeof(string)),
                          new DataColumn("UserAs", typeof(string)),

        });

            DataRow dr = dt.NewRow();

            MySql.Data.MySqlClient.MySqlConnection cnn1 = new MySql.Data.MySqlClient.MySqlConnection();
            cnn1.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
            cnn1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT DISTINCT tblamcommunication.intId AS MsgId, tblamcommunication.varMsgFrom, tblamcommunication.varMsgFromName, tbluserdetails.varPhoto as InboxMemPhoto,tbluserdetails.varuserType as UserAs  FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId INNER JOIN tbluserdetails ON tblamcommunication.varMsgFrom = tbluserdetails.intuserId WHERE (tblamcommunication.varMsgto = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "')  ORDER BY tblamconversation.intId DESC  ", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();
                    InboxMsgMember = rdr1["varMsgFrom"].ToString();
                    InboxMemName = rdr1["varMsgFromName"].ToString();
                    InboxMemPhoto = rdr1["InboxMemPhoto"].ToString();
                    UserAs = rdr1["UserAs"].ToString();
                    dt.Rows.Add(MsgId, InboxMsgMember, InboxMemName, InboxMemPhoto, UserAs);
                }

                // Empty strings
                MsgId = string.Empty;
                InboxMsgMember = string.Empty;
                InboxMemName = string.Empty;

            }
            cnn1.Close();
            cmd.Dispose();

            cnn1.Open();
            cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT DISTINCT tblamcommunication.intId AS MsgId, tblamcommunication.varMsgto, tblamcommunication.varMsgtoName, tbluserdetails.varPhoto as InboxMemPhoto,tbluserdetails.varuserType as UserAs  FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId INNER JOIN tbluserdetails ON tblamcommunication.varMsgto = tbluserdetails.intuserId WHERE (tblamcommunication.varMsgFrom = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "')  ORDER BY tblamconversation.intId DESC  ", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();
                    InboxMsgMember = rdr1["varMsgto"].ToString();
                    InboxMemName = rdr1["varMsgtoName"].ToString();
                    InboxMemPhoto = rdr1["InboxMemPhoto"].ToString();
                    UserAs = rdr1["UserAs"].ToString();
                    dt.Rows.Add(MsgId, InboxMsgMember, InboxMemName, InboxMemPhoto, UserAs);
                }

                // Empty strings
                MsgId = string.Empty;
                InboxMsgMember = string.Empty;
                InboxMemName = string.Empty;

            }
            cnn1.Close();
            lstInbox.DataSource = dt;
            lstInbox.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public void getDataMessages()
    {
        try
        {
            lblcountmsg.Text = "0";
            MySql.Data.MySqlClient.MySqlDataReader rdr1, rdr3;


            MySql.Data.MySqlClient.MySqlConnection cnn1 = new MySql.Data.MySqlClient.MySqlConnection();
            cnn1.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
            cnn1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgFrom, tblamcommunication.varMsgFromName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgto = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "') ", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();

                    // count unread //
                    MySql.Data.MySqlClient.MySqlConnection cnn3 = new MySql.Data.MySqlClient.MySqlConnection();
                    cnn3.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

                    MySql.Data.MySqlClient.MySqlCommand cmd3 = new MySql.Data.MySqlClient.MySqlCommand("SELECT COUNT(intId)as mycount FROM tblamconversation WHERE ex1='Unread' and varMessageId=" + Convert.ToInt32(MsgId) + " and varMsgFrom='" + rdr1["varMsgFrom"].ToString() + "'", cnn3);
                    cmd3.CommandType = CommandType.Text;

                    using (cnn3)
                    {
                        cnn3.Open();
                        rdr3 = cmd3.ExecuteReader();
                        if (rdr3.Read())
                        {

                            lblcountmsg.Text = (Convert.ToInt32(lblcountmsg.Text) + Convert.ToInt32(rdr3["mycount"].ToString())).ToString();


                        }
                        cnn3.Close();
                        rdr3.Close();

                    }
                }

                // Empty strings
                MsgId = string.Empty;


            }
            cnn1.Close();
            cmd.Dispose();

            cnn1.Open();
            cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgto, tblamcommunication.varMsgtoName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgFrom = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "')  ORDER BY tblamconversation.intId DESC  ", cnn1);
            using (cnn1)
            {
                //read data from the table to our data reader
                rdr1 = cmd.ExecuteReader();
                //loop through each row we have read
                while (rdr1.Read())
                {
                    MsgId = rdr1["MsgId"].ToString();
                    // count unread //
                    MySql.Data.MySqlClient.MySqlConnection cnn3 = new MySql.Data.MySqlClient.MySqlConnection();
                    cnn3.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;

                    MySql.Data.MySqlClient.MySqlCommand cmd3 = new MySql.Data.MySqlClient.MySqlCommand("SELECT COUNT(intId)as mycount FROM tblamconversation WHERE ex1='Unread' and varMessageId=" + Convert.ToInt32(MsgId) + " and varMsgFrom='" + rdr1["varMsgto"].ToString() + "'", cnn3);
                    cmd3.CommandType = CommandType.Text;

                    using (cnn3)
                    {
                        cnn3.Open();
                        rdr3 = cmd3.ExecuteReader();
                        if (rdr3.Read())
                        {

                            lblcountmsg.Text = (Convert.ToInt32(lblcountmsg.Text) + Convert.ToInt32(rdr3["mycount"].ToString())).ToString();


                        }
                        cnn3.Close();
                        rdr3.Close();

                    }
                }

                // Empty strings
                MsgId = string.Empty;


            }
            cnn1.Close();

        }
        catch (Exception ex)
        {

        }
    }

    protected void lstInbox_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Literal dd = (Literal)e.Item.FindControl("dd");
        Label ddf = (Label)e.Item.FindControl("ddf");
        LinkButton varMsgFromNameLabel = (LinkButton)e.Item.FindControl("varMsgFromNameLabel");
        if (dd.Text == memid)
        {
            Panel userBox = (Panel)e.Item.FindControl("userBox");
            userBox.BackColor = System.Drawing.ColorTranslator.FromHtml("#1b4969");
            varMsgFromNameLabel.ForeColor = System.Drawing.Color.White;
            ddf.ForeColor = System.Drawing.Color.White;
        }
    }
     
}