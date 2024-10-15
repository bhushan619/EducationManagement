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

public partial class User_SearchUsers : System.Web.UI.Page
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
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();

        dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct varuserName, varuserCity, varPhoto, intuserId, varuserType FROM tbluserdetails  WHERE    varuserName like  '%" + Request.QueryString["us"].ToString() + "%' and varVerified='true' LIMIT 6", dbc.con);
        dbc.dataAdapter.Fill(dt);

        //dbc.dataAdapter = new MySqlDataAdapter("SELECT distinct  tblconnections.intId, tbluserdetails.varuserName, tbluserdetails.varuserCity, tbluserdetails.varPhoto, tbluserdetails.intuserId, tbluserdetails.varuserType FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnected WHERE (tblconnections.intRequested = 2) AND (tblconnections.intConnectionMe = " + rex.DecryptString(Request.Cookies["userid"].Value) + ")", dbc.con);
        //dbc.dataAdapter.Fill(dt2);

        //dt2.Merge(dt);
        //dt2.AcceptChanges();

        lstConnectFriends.DataSource =dt;
        lstConnectFriends.DataBind();
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

     
}