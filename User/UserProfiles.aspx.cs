using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections;

public partial class User_UserProfiles : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                bindData();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/default.aspx", false);
        }
    }

    public void bindData()
    {
        DataTable dt3 = new DataTable();
        dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct varuserName, varuserCity, varPhoto, intuserId, varuserType FROM tbluserdetails WHERE (intuserId NOT IN (SELECT intConnected FROM tblconnections WHERE(intConnectionMe = " + rex.DecryptString(Request.Cookies["userid"].Value) + "))) AND(intuserId NOT IN (SELECT intConnectionMe FROM tblconnections tblconnections_1 WHERE(intConnected = " + rex.DecryptString(Request.Cookies["userid"].Value) + "))) AND(intuserId <> " + rex.DecryptString(Request.Cookies["userid"].Value) + ") LIMIT 6", dbc.con);
        dbc.dataAdapter.Fill(dt3);
        //SqlDataSource1.SelectCommand = ;
        lstPoepleYoumayKnow.DataSource = RemoveDuplicateRows(dt3, "intuserId");
        lstPoepleYoumayKnow.DataBind();

        SqlDataSource2.SelectCommand = "SELECT distinct  tblconnections.intId, tblconnections.intConnected ,tblconnections.intConnectionMe ,tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType, tblconnections.intRequested FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnectionMe WHERE (tblconnections.intRequested = 1) AND (tblconnections.intConnected = " + rex.DecryptString(Request.Cookies["userid"].Value) + ")";
        lstConnectRequest.DataBind(); 
    
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        
        dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct  tblconnections.intId, tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnectionMe WHERE (tblconnections.intRequested = 2) AND (tblconnections.intConnected = " + rex.DecryptString(Request.Cookies["userid"].Value) + ")", dbc.con);
        dbc.dataAdapter.Fill(dt);

        dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct  tblconnections.intId, tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnected WHERE (tblconnections.intRequested = 2) AND (tblconnections.intConnectionMe = " + rex.DecryptString(Request.Cookies["userid"].Value) + ")", dbc.con);
        dbc.dataAdapter.Fill(dt2);

        dt2.Merge(dt);
        dt2.AcceptChanges();

        lstConnectFriends.DataSource = RemoveDuplicateRows( dt2, "intuserId");
        lstConnectFriends.DataBind();

        myNetwork.Text = lstConnectFriends.Items.Count.ToString();
        cntReq.Text=lstConnectRequest.Items.Count.ToString();
    }

    public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    {
        Hashtable hTable = new Hashtable();
        ArrayList duplicateList = new ArrayList();

        foreach (DataRow drow in dTable.Rows)
        {
            if (hTable.Contains(drow[colName]))
                duplicateList.Add(drow);
            else
                hTable.Add(drow[colName], string.Empty);
        }

        foreach (DataRow dRow in duplicateList)
            dTable.Rows.Remove(dRow);

        return dTable;
    }



    protected void lstConnectFriends_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            string msgId = string.Empty;
            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblconnections where intId=" + e.CommandArgument.ToString().Split(';')[0] + "", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("select intId from tblamcommunication where varMsgFrom='" + e.CommandArgument.ToString().Split(';')[1] + "' and varMsgto='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", dbc.con);
            dbc.dr= dbc.cmd.ExecuteReader();
            if(dbc.dr.Read())
            {
                msgId = dbc.dr["intId"].ToString();
            }
            dbc.con.Close();

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("select intId from tblamcommunication where varMsgto='" + e.CommandArgument.ToString().Split(';')[1] + "' and varMsgFrom='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", dbc.con);
            dbc.dr = dbc.cmd.ExecuteReader();
            if (dbc.dr.Read())
            {
                msgId = dbc.dr["intId"].ToString();
            }
            dbc.con.Close();

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblamcommunication where varMsgFrom='" + e.CommandArgument.ToString().Split(';')[1] + "' and varMsgto='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblamcommunication where varMsgto='" + e.CommandArgument.ToString().Split(';')[1] + "' and varMsgFrom='" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "'", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();
           
            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblamconversation where varMessageId='" + msgId + "'", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();

            ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Deleted successfully');", true);
        }
        bindData();
    }
    protected void lstPoepleYoumayKnow_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        dbc.con.Open();
        dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblconnections(intConnectionMe, intConnected, intRequested) VALUES (" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "," + e.CommandArgument.ToString() + ",1)",dbc.con);
        dbc.cmd.ExecuteNonQuery();
        dbc.con.Close();
        ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "MessageBox",
                    "alert('Invited successfully');", true);
        bindData();
    }

    protected void lstConnectRequest_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "ok")
        {
            string userNames = dbc.getUserDataForPage(e.CommandArgument.ToString().Split(';')[1]);

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("update tblconnections set intRequested=2 where intId=" + e.CommandArgument.ToString().Split(';')[0] + "", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();
            dbc.cmd.Dispose();

         
            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblamcommunication(varMsgFrom, varMsgFromDesig, varMsgFromName, varMsgto, varMsgToDesig, varMsgtoName) VALUES('"+rex.DecryptString(Request.Cookies["userid"].Value.ToString())+"','User','"+dbc.getUserDataForPage(rex.DecryptString(Request.Cookies["userid"].Value.ToString())).Split(';')[1] + "','" + e.CommandArgument.ToString().Split(';')[1] + "','User','" + userNames.Split(';')[1] +"')", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            string msgId = dbc.cmd.LastInsertedId.ToString();
            dbc.con.Close();
            dbc.cmd.Dispose();

            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblamconversation(varMessageId, varMsgFrom, varMsgText, varDate, varTime) VALUES ('" + msgId + "','" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "','Thank you for request','" + DateTime.UtcNow.ToString("yyyy-dd-mm") + "','" + DateTime.UtcNow.ToString("hh:mm:ss") + "')", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();

            ScriptManager.RegisterStartupScript(
                        this,


                        this.GetType(),
                        "MessageBox",
                        "alert('Accepted successfully');", true);

            
        }
        else if (e.CommandName == "del")
        {
            dbc.con.Open();
            dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblconnections where intId=" + e.CommandArgument.ToString().Split(';')[0] + "", dbc.con);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();
            ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Deleted successfully');", true);
        }
        bindData();
    }
}