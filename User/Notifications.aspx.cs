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


public partial class User_Notifications : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();

    string reqcount = 0.ToString();
    string msgcount = 0.ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        { 
            getNotifications();
        }
    }
   
    protected void lstNotification_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getNotifications();
    }
    protected void lstNotification_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

            string id = commandArgs[0];
            string link = commandArgs[1];
            string memberid = commandArgs[2];
            string sesson = commandArgs[3];
            string remark = commandArgs[4];
            string type = commandArgs[5];
            string textmatter = commandArgs[6];


            if (e.CommandName == "Views")
            {
                dbc.con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("update tblnotifications  set varStatus='Read' WHERE intId=" + id + "", dbc.con);
                cmd.ExecuteReader();
                dbc.con.Close();
                if (type == "Message")
                {
                    //Response.Write("<script>alert('" + textmatter + "');window.location='Notifications.aspx';</script>");
                    //Response.Write("<script>alert('" + textmatter + "');</script>");
                }
                else if (type == "Page")
                {
                    Response.Redirect(link);
                }
                //else if (type == "Session")
                //{
                //    Session.Add("SearchMemberId", memberid);
                //    Response.Redirect(link);

                //}
            }
            else if (e.CommandName == "Deletes")
            {
                dbc.delete_Notification(id.ToString());
                Response.Redirect("~/User/Notifications.aspx");
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void lstNotification_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Panel notifpanal;
        string notification = string.Empty;
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            notifpanal = (Panel)e.Item.FindControl("notificationpanel");
            System.Data.DataRowView rowView = e.Item.DataItem as System.Data.DataRowView;
            notification = rowView["varStatus"].ToString();
            if (notification == "Unread")
            {
                notifpanal.CssClass = "myborder notifBg";
            }
            else if (notification == "Read")
            {
                notifpanal.CssClass = "myborder";
            }

        }
    }
    public void getNotifications()
    {
        try
        {
            DataTable dt = new DataTable();
            dbc.con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT varNotType,varNotText, varLink, varSession, varStatus, intId,varRemark,intNotFromId FROM tblnotifications where (intNotToId = '" + rex.DecryptString(Request.Cookies["userid"].Value.ToString()) + "') order by intId desc", dbc.con);
            MySql.Data.MySqlClient.MySqlDataAdapter ad = new MySql.Data.MySqlClient.MySqlDataAdapter(cmd);
            ad.Fill(dt);
            lstNotification.DataSource = dt;
            lstNotification.DataBind();
            dbc.con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Please Try Again');</script>");
        }
    }
    protected void lnkDeleteAll_Click(object sender, EventArgs e)
    {
        dbc.deleteAll_Notification(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        Response.Redirect("~/User/Notifications.aspx");
    }
    protected void btnReadAll_Click(object sender, EventArgs e)
    {
        dbc.readAll_Notification(rex.DecryptString(Request.Cookies["userid"].Value.ToString()));
        Response.Redirect("~/User/Notifications.aspx");
    }

}