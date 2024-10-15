using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class college_UploadPic : System.Web.UI.Page
{
    DatabaseConnection dbc = new DatabaseConnection();
    RegexUtilities rex = new RegexUtilities();
    static int count = 0;
    static Uri previousUri;
    protected void Page_Load(object sender, EventArgs e)
    {
        count++;
        if (count == 1)
        {
            previousUri = Request.UrlReferrer;
        }
    }
    protected void btnUploadPro_Click(object sender, EventArgs e)
    {

        string filename = string.Empty;
        string cid = string.Empty;
        if (Request.Cookies["collegeid"] == null)
        {
            cid = Request.QueryString["id"].ToString();
        }
        else
        {
            cid = rex.DecryptString(Request.Cookies["collegeid"].Value.ToString());
        }
        try
        {
            if (!fupProPic.HasFile)
            {
                ScriptManager.RegisterStartupScript(
                   this,
                   this.GetType(),
                   "MessageBox",
                   "alert('Please select a picture');", true);

                return;
            }
            else
            {
                string ffileExt = System.IO.Path.GetExtension(fupProPic.FileName);
                if ((ffileExt == ".JPG") || (ffileExt == ".jpg") || (ffileExt == ".JPEG") || (ffileExt == ".jpeg") || (ffileExt == ".PNG") || (ffileExt == ".png"))
                {
                    filename = cid + fupProPic.FileName.ToString();
                    int update_insp = dbc.update_ProfilePicCol(Convert.ToInt32(cid), filename);

                    if (update_insp == 1)
                    {
                        fupProPic.SaveAs(Server.MapPath("~/college/media/") + filename);
                        count = 0;
                        //ClientScript.RegisterStartupScript(this.GetType(),
                        //       "popup",
                        //       "alert('Data Updated.');window.location='" + previousUri + "';",
                        //       true);
                        string js = string.Empty;
                        js += "window.opener.location.href='" + previousUri + "';";
                        js += "window.close();";
                        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", js, true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "MessageBox",
                        "alert('Data Not Inserted');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                  this,
                  this.GetType(),
                  "MessageBox",
                  "alert('Please select proper image as .jpg or .png');", true);
                    return;
                }

            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(
                this,
                this.GetType(),
                "MessageBox",
                "alert('"+ex.Message+"');", true);
            return;
        }
    }
}