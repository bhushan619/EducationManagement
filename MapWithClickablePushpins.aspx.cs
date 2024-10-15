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

public partial class Samples_SimpleMapWithBubble : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        //You must specify Google Map API Key for this component. You can obtain this key from http://code.google.com/apis/maps/signup.html
        //For samples to run properly, set GoogleAPIKey in Web.Config file.
        GoogleMapForASPNet1.GoogleMapObject.APIKey = ConfigurationManager.AppSettings["GoogleAPIKey"];
        //GoogleMapForASPNet1.GoogleMapObject.APIKey = "3.6";

        //Specify width and height for map. You can specify either in pixels or in percentage relative to it's container.
        GoogleMapForASPNet1.GoogleMapObject.Width = "1000px"; // You can also specify percentage(e.g. 80%) here
        GoogleMapForASPNet1.GoogleMapObject.Height = "400px";

        //Specify initial Zoom level.
        GoogleMapForASPNet1.GoogleMapObject.ZoomLevel = 10;

        //Specify Center Point for map. Map will be centered on this point.
        GoogleMapForASPNet1.GoogleMapObject.CenterPoint = new GooglePoint("9999", 20.1471488, 64.4488606);

        //Add pushpins for map. 
        //This should be done with intialization of GooglePoint class. 
        //ID is to identify a pushpin. It must be unique for each pin. Type is string.
        //Other properties latitude and longitude.
        int x = 0;
        GooglePoint[] GP = new GooglePoint[9999];

        dbc.con.Open();
        dbc.cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT  intCollegeId, varLatitude, varLongitude FROM tblcollegecoordinates WHERE 1 ", dbc.con);
        dbc.dr = dbc.cmd.ExecuteReader();
        if (dbc.dr.HasRows)
        {
            while (dbc.dr.Read())
            {
                GP[x] = new GooglePoint();
                GP[x].ID = dbc.dr["intCollegeId"].ToString();
                GP[x].Latitude = Convert.ToDouble(dbc.dr["varLatitude"].ToString());
                GP[x].Longitude = Convert.ToDouble(dbc.dr["varLongitude"].ToString());
                GP[x].InfoHTML = "this is college id no. " + dbc.dr["intCollegeId"].ToString();
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

        //GooglePoint GP1 = new GooglePoint();
        //GP1.ID = "1";
        //GP1.Latitude = 43.65669;
        //GP1.Longitude = -79.44268;
        //GP1.InfoHTML = "This is point 1";
        //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP1);

        //GooglePoint GP2 = new GooglePoint();
        //GP2.ID = "2";
        //GP2.Latitude = 43.66619;
        //GP2.Longitude = -79.44268;
        //GP2.InfoHTML = "This is point 2";
        //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP2);


        //GooglePoint GP3 = new GooglePoint();
        //GP3.ID = "3";
        //GP3.Latitude = 43.67689;
        //GP3.Longitude = -79.43270;
        //GP3.InfoHTML = "This is point 3";
        //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP3);

    }
}
