using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class student_Search : System.Web.UI.Page
{
    public static Uri previousUri;
    DatabaseConnection dbc = new DatabaseConnection();
    static int intid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] == null)
            {
                Response.Redirect("~/login.aspx");
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
            }
            else
            {
                loadsearch();
            }
        }

    }
    public void loadsearch()
    {
        previousUri = Request.UrlReferrer;
        try
        {
            if (Request.QueryString["institute"] != null)
            {
                SqlDataSourceHomeCollege.SelectCommand = "SELECT intCollegeId,isTutor, varCollegeName,varCollegeAddress,varCollegeCity,varCollegeState,varContactOne,varContactTwo,varCollegeEmail,varCollegeWeb,varPhoto FROM tblcollegedetails where varCollegeName like '%" + Request.QueryString["institute"].ToString() + "%'";
                LoadMap("SELECT  tblcollegedetails.intCollegeId, tblcollegedetails.isTutor,tblcollegedetails.varCollegeName, tblcollegedetails.varCollegeAddress, tblcollegecoordinates.varLatitude, tblcollegecoordinates.varLongitude FROM tblcollegecoordinates INNER JOIN tblcollegedetails ON tblcollegecoordinates.intCollegeId = tblcollegedetails.intCollegeId where tblcollegedetails.varCollegeName like '%" + Request.QueryString["institute"].ToString() + "%' and isTutor=0");
            } 
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Please try again');window.location='Default.aspx'", true);
        }
    }
    protected void LoadMap(string query)
    {
        //You must specify Google Map API Key for this component. You can obtain this key from http://code.google.com/apis/maps/signup.html
        //For samples to run properly, set GoogleAPIKey in Web.Config file.
        GoogleMapForASPNet1.GoogleMapObject.APIKey = ConfigurationManager.AppSettings["GoogleAPIKey"];
        //GoogleMapForASPNet1.GoogleMapObject.APIKey = "3.6";

        //Specify width and height for map. You can specify either in pixels or in percentage relative to it's container.
        GoogleMapForASPNet1.GoogleMapObject.Width = "100%"; // You can also specify percentage(e.g. 80%) here
                                                            // GoogleMapForASPNet1.GoogleMapObject.Height = "400px";

        //Specify initial Zoom level.
        GoogleMapForASPNet1.GoogleMapObject.ZoomLevel = 10;

        //Specify Center Point for map. Map will be centered on this point.
      //  GoogleMapForASPNet1.GoogleMapObject.CenterPoint = new GooglePoint("9999", 20.1471488, 64.4488606);

        //Add pushpins for map. 
        //This should be done with intialization of GooglePoint class. 
        //ID is to identify a pushpin. It must be unique for each pin. Type is string.
        //Other properties latitude and longitude.
        int x = 0;
        GooglePoint[] GP = new GooglePoint[9999];

        dbc.con.Open();
        dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand(query, dbc.con);
        dbc.dr = dbc.cmd.ExecuteReader();
        if (dbc.dr.HasRows)
        {
            while (dbc.dr.Read())
            {
                GP[x] = new GooglePoint();
                GP[x].ID = dbc.dr["intCollegeId"].ToString();
                GP[x].Latitude = Convert.ToDouble(dbc.dr["varLatitude"].ToString());
                GP[x].Longitude = Convert.ToDouble(dbc.dr["varLongitude"].ToString());
                GP[x].InfoHTML = dbc.dr["varCollegeName"].ToString() + " " + dbc.dr["varCollegeAddress"].ToString();
                GoogleMapForASPNet1.GoogleMapObject.CenterPoint = new GooglePoint(GP[x].ID, GP[x].Latitude, GP[x].Longitude);
                GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP[x]);
                x++;
            }
        }
        else
        {
            dbc.con.Close();
        }
        dbc.con.Close();
    } 
}