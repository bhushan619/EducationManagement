using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Globalization;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for DatabaseConnection
/// </summary>
public class DatabaseConnection
{
    public MySqlConnection con, con1, con2;
    public MySqlCommand cmd, cmd1;
    public MySqlDataReader dr, dr1;

    public MySqlDataAdapter dataAdapter = new MySqlDataAdapter();
    public DataTable oDt;
    public DataRow oDr;

    string tdt = string.Empty;

    public string begindate = new DateTime(DateTime.UtcNow.Year, DateTime.UtcNow.Month, 1).ToShortDateString();
    public string enddate = DateTime.UtcNow.ToShortDateString();

    public DatabaseConnection()
    {
        //
        con = new MySqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
        //
        //
        con1 = new MySqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
        //
        //
        con2 = new MySqlConnection();
        con2.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
        //
    }

    public string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "123456789";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }
    //Advertiser
    public int insert_tblAdvertiser(string name, string email, string mob, string pass, string verify)
    {
        try
        {

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tbladvertiser(varName, varEmail, varMobile, varPassword, varVerified)  VALUES('" + name + "','" + email + "','" + mob + "','" + pass + "','" + verify + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }

    // Student //
    public int insert_tblstudentdetail(string name, string email, string mob, string pass, string verify)
    {
        try
        {
            int id = max_tblstudentdetail();
            id = id + 1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblstudentdetail VALUES(" + id + ",'" + name + "','" + mob + "','','" + email + "','','','','','','','','','','','','','" + pass + "','" + verify + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblstudentdocuments (intStudentId,varStudentDocumentName) VALUES(" + id + ",'ProfilePhoto')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblstudentans (intStudentId) VALUES(" + id + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int insert_tblStudentEduDetail(string sid, string course, string coll, string uni, string pass, string mark, string perc, string grade)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblstudenteducationaldetails (intStudentId, varStudentClass, varStudentCollege, varStudentUniversity, varStudentPassingYear, varStudentMarks, varStudentPer, varStudentGrade)  VALUES(" + sid + ",'" + course + "','" + coll + "','" + uni + "','" + pass + "','" + mark + "','" + perc + "','" + grade + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblStudentEduDetail(int sid, string course, string coll, string uni, string pass, string mark, string perc, string grade)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("update tblstudenteducationaldetails set varStudentClass='" + course + "',varStudentCollege='" + coll + "',varStudentUniversity='" + uni + "',varStudentPassingYear='" + pass + "',varStudentMarks='" + mark + "',varStudentPer='" + perc + "',varStudentGrade='" + grade + "' where intId=" + sid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblCollegeDetail(int id, string name, string address, string city, string state, string cnt1, string cnt2, string cnt3, string url, string principal, string admin, string picture)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("update tblcollegedetails set varPhoto='" + picture + "', varCollegeName ='" + name + "', varCollegeAddress ='" + address + "', varCollegeCity ='" + city + "', varCollegeState ='" + state + "', varContactOne ='" + cnt1 + "', varContactTwo ='" + cnt2 + "', varContactThree ='" + cnt3 + "', varCollegeWeb ='" + url + "', varCollegePrincipal ='" + principal + "', varCollegeAdmissionIncharge ='" + admin + "' where intCollegeId=" + id + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }

    public int update_tblcollegeviews(int id, int cid)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("update tblcollegeviews set  intViews ='" + id + "' where intCollegeId=" + cid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }

    public int update_tblstudentdetail(string id, string name, string mob1, string mob2, string dob, string addes, string fname, string focc, string fcon1, string fcon2, string femail, string mname, string mocc, string mcon1, string mcon2, string memail, string state, string city)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblstudentdetail SET  varState='" + state + "', varCity='" + city + "', varStudentName ='" + name + "', varStudentMobileOne ='" + mob1 + "', varStudentMobileTwo ='" + mob2 + "', varStudentAddress ='" + addes + "', varStudentFatherName ='" + fname + "', varStudentFatherOccupation ='" + focc + "', varStudentFatherContactOne ='" + fcon1 + "', varStudentFatherContactTwo ='" + fcon2 + "', varStudentFatherEmail ='" + femail + "', varStudentMotherName ='" + mname + "', varStudentMotherOccupation ='" + mocc + "', varStudentMotherContactOne ='" + mcon1 + "', varStudentMotherContactTwo ='" + mcon2 + "', varStudentMotherEmail ='" + memail + "',varDob='" + dob + "' where intStudentId=" + id + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tbluserdetail(string id, string name, string dob, string addes, string state, string city, string filename, string users, string about, string marstatus, string gender)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tbluserdetails SET varAbout='" + about + "',varMaritalStatus='" + marstatus + "', varuserType='" + users + "',varGender='" + gender + "', varuserName='" + name + "',varuserAddress='" + addes + "',varuserCity='" + city + "',varuserState='" + state + "', varContactTwo='" + dob + "', varPhoto='" + filename + "' WHERE intuserId=" + id + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int insert_tblstudentdocuments(int id, string docname, string path)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblstudentdocuments VALUES(" + id + ",'" + docname + "','" + path + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int max_tblColFacility()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblfacilities", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int insert_tblColFacility(int cid, string fname, string fdesc)
    {
        try
        {
            int id = max_tblColFacility();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblfacilities VALUES(" + id + "," + cid + ",'" + fname + "','" + fdesc + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int max_tblColcompany()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegecomp", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int check_already_company(string cname, int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varCompanyName FROM tblcollegecomp WHERE varCompanyName= '" + cname + "' and intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 0;
            }
            else
            {
                schId = 1;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_Facility(string cname, int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varFacility FROM tblfacilities WHERE varFacility= '" + cname + "' and intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 0;
            }
            else
            {
                schId = 1;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public string check_already_brochure(int cid)
    {
        string schId = string.Empty;
        try
        {

            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varBrochure FROM tblcollegeotherdetails WHERE intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = dr["varBrochure"].ToString();
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return schId;
        }
    }
    public int insert_tblColgCompany(int cid, string cname)
    {
        try
        {
            int id = max_tblColcompany();
            id = id + 1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegecomp VALUES(" + id + "," + cid + ",'" + cname + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int insert_tblUserProDetail(string intUserId, string varCompany, string varDesignation, string varExperience, string varFromMonth, string varFromYear, string varToMonth, string varToYear, string varResponsibilities, string varCTC)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("INSERT INTO tbluserprofessionaldetails(intUserId, varCompany, varDesignation, varExperience, varFromMonth, varFromYear, varToMonth, varToYear, varResponsibilities, varCTC) VALUES (" + intUserId + ",'" + varCompany + "','" + varDesignation + "','" + varExperience + "','" + varFromMonth + "','" + varFromYear + "','" + varToMonth + "','" + varToYear + "','" + varResponsibilities + "','" + varCTC + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblUserProDetail(string intUserId, string varCompany, string varDesignation, string varExperience, string varFromMonth, string varFromYear, string varToMonth, string varToYear, string varResponsibilities, string varCTC)
    {
        try
        {
            con.Open();
            cmd = new MySqlCommand("UPDATE tbluserprofessionaldetails SET varCompany='" + varCompany + "',varDesignation='" + varDesignation + "',varExperience='" + varExperience + "',varFromMonth='" + varFromMonth + "',varFromYear='" + varFromYear + "',varToMonth='" + varToMonth + "',varToYear='" + varToYear + "',varResponsibilities='" + varResponsibilities + "',varCTC='" + varCTC + "' WHERE intId=" + intUserId + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int insert_tblLikes(int cid, int sid)
    {
        try
        {
            int id = max_tblLikes();
            id = id + 1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegelikes VALUES(" + id + "," + cid + "," + sid + ",'yes')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int insert_tblViews(int cid)
    {
        try
        {
            int id = max_tblviews();
            id = id + 1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegeviews VALUES(" + id + "," + cid + ",'1')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int max_tblLikes()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegelikes", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;

    }
    public int max_tblviews()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegeviews", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;

    }
    public int check_imgcount(int cid)
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select Count(intCollegeId) as newid from tblcollegemedia where intCollegeId=" + cid + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;

    }

    public int check_already_liked(int sid, int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * FROM tblcollegelikes WHERE intStudentId= '" + sid + "' and intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 0;
            }
            else
            {
                schId = 1;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_View(int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * FROM tblcollegeviews WHERE  intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 0;
            }
            else
            {
                schId = 1;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_course(string cname, int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varCourseName FROM tblcollegecourses WHERE varCourseName= '" + cname + "' and intCollegeId= '" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 0;
            }
            else
            {
                schId = 1;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int max_tblColcourse()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegecourses", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int insert_tblColgCourse(int cid, string ctype, string cname, string cdescr, string dura, string fees, string aff, string accr, string admision)
    {
        try
        {
            int id = max_tblColcourse();
            id = id + 1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegecourses VALUES(" + id + "," + cid + ",'" + ctype + "','" + cname + "','" + cdescr + "','" + dura + "','" + fees + "','" + aff + "','" + accr + "','" + admision + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int insert_tblFaculty(int cid, string fname, string degree, string intro)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblfacultymembers( intCollegeId, varFacultyName, varDegree, varIntro) VALUES ('" + cid + "','" + fname + "','" + degree + "','" + intro + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            return 0;
            con.Close();
        }
    }
    public int check_applied(int studentid, int collegeid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId as newid from tblstudentschedule where intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = Convert.ToInt32(dr["newid"].ToString());
            }
            else
            {

            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_schedule(int studentid, int collegeid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId as newid from tblstudentschedule where intStudentId=" + studentid + " and intCollegeId=" + collegeid + " and varScheduled='No' and varApplied='Yes'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = Convert.ToInt32(dr["newid"].ToString());
            }
            else
            {

            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_status(int studentid, int collegeid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId as newid from tblcollegeprocess where intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = Convert.ToInt32(dr["newid"].ToString());
            }
            else
            {

            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public string getpass(string email, string cos)
    {
        string schId = string.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            if (cos == "c")
            {
                cmd = new MySqlCommand("select varPassword FROM tblcollegedetails WHERE varCollegeEmail= '" + email + "'", con);
            }
            else if (cos == "s")
            {
                cmd = new MySqlCommand("select varPassword FROM tblstudentdetail WHERE varStudentEmail= '" + email + "'", con);
            }
            else if (cos == "u")
            {
                cmd = new MySqlCommand("select varPassword FROM tbluserdetails WHERE varuserEmail= '" + email + "'", con);
            }
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = dr["varPassword"].ToString();
            }
            else
            {

            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return schId;
        }
    }


    public int check_already_student(string email)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varStudentEmail FROM tblstudentdetail WHERE varStudentEmail= '" + email + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_advertiser(string email)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select varEmail FROM tbladvertiser WHERE varEmail= '" + email + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }

    public int check_already_jobapplied(string jid, string uid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId FROM tbljobapplications WHERE intJobId= " + jid + " and intuserId=" + uid + "", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }

    public int check_already_user(string email)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT varuserEmail FROM tbluserdetails WHERE varuserEmail ='" + email + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_college(string name)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT varCollegeEmail FROM tblcollegedetails WHERE varCollegeName ='" + name + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_video(int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM tblcollegemedia WHERE intCollegeId ='" + cid + "' and varMediaType='Video'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int check_already_coordinates(int cid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM tblcollegecoordinates WHERE intCollegeId ='" + cid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblstudentscheduleConfirm(int studentid, int collegeid)
    {
        try
        {
            //int schedule = check_applied(studentid, collegeid);
            //int process = check_status(studentid, collegeid);

            con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set varScheduled='Confirmed' where intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();

            //con.Open();
            //MySqlCommand cmd1 = new MySqlCommand("update tblcollegeprocess set varStatus='Confirmed' where  intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            //cmd1.ExecuteNonQuery();
            //con.Close();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblStudentVisitDone(int studentid, int collegeid)
    {
        try
        {
            //int schedule = check_applied(studentid, collegeid);
            //int process = check_status(studentid, collegeid);

            con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set varScheduled='Done' where intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();

            //con.Open();
            //MySqlCommand cmd1 = new MySqlCommand("update tblcollegeprocess set varStatus='Confirmed' where  intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            //cmd1.ExecuteNonQuery();
            //con.Close();

            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblstudentscheduleApply(int studentid, int collegeid, string page, string date, string time, string course)
    {
        try
        {
            int value = check_applied(studentid, collegeid);
            if (value == 0)
            {
                string where = string.Empty;
                if (page == "a")
                {
                    where = "'Yes','No'";
                }
                else if (page == "v")
                {
                    where = "'No','Yes'";
                }
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into tblstudentschedule (intStudentId, intCollegeId, varCourse, varDate, varTime, varApplied, varScheduled) values(" + studentid + "," + collegeid + ",'" + course + "','" + date + "','" + time + "'," + where + ")", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string where = string.Empty;
                if (page == "a")
                {
                    where = "varApplied= 'Yes'";
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set " + where + " where intId=" + value + "", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                else if (page == "v")
                {
                    where = "varScheduled= 'Yes'";
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set " + where + ",varDate='" + date + "',varTime='" + time + "' where intId=" + value + "", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int update_tblstudentscheduleVisit(int studentid, int collegeid, string page, string date, string time, string course)
    {
        try
        {
            int value = check_applied(studentid, collegeid);
            if (value == 0)
            {
                string where = string.Empty;
                if (page == "a")
                {
                    where = "'Yes','No'";
                }
                else if (page == "v")
                {
                    where = "'No','Yes'";
                }
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into tblstudentschedule (intStudentId, intCollegeId, varCourse, varDate, varTime, varApplied, varScheduled) values(" + studentid + "," + collegeid + ",'" + course + "','" + date + "','" + time + "'," + where + ")", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string where = string.Empty;
                if (page == "a")
                {
                    where = "varApplied= 'Yes'";
                }
                else if (page == "v")
                {
                    where = "varScheduled= 'Yes'";
                }
                con.Open();
                MySqlCommand cmd = new MySqlCommand("update tblstudentschedule set " + where + ",varDate='" + date + "',varTime='" + time + "' where intId=" + value + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }

    public int max_tblstudentdetail()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intStudentID) as newid from tblstudentdetail", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }

    public String select_StudentName(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varStudentName from tblstudentdetail where intStudentId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varStudentName"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_StudentMobile(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varStudentMobileOne from tblstudentdetail where intStudentId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varStudentMobileOne"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_StudentEmail(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varStudentEmail from tblstudentdetail where intStudentId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varStudentEmail"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_StudentAppliedCourse(int sid, int cid)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCourse from tblstudentschedule where intStudentId =" + sid + " and intCollegeId = " + cid + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varCourse"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_StudentProfile(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varStudentPath from tblstudentdocuments where intStudentId =" + id + " and varStudentDocumentName='ProfilePhoto'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varStudentPath"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_UserProfile(string id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varuserType AS UserAs, varuserName as Names, varPhoto from tbluserdetails where intuserId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["UserAs"].ToString() + ";" + dr["Names"].ToString() + ";" + dr["varPhoto"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }

    public int update_ProfilePicStu(int studentid, string fname)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblstudentdocuments SET varStudentPath='" + fname + "' WHERE intStudentId=" + studentid + " and varStudentDocumentName='ProfilePhoto'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    // Student end //

    // College //
    public String select_CollegeProfile(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varPhoto from tblcollegedetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varPhoto"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public int update_ProfilePicCol(int collegeid, string fname)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegedetails SET varPhoto='" + fname + "' WHERE intCollegeId=" + collegeid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int update_PicCol(int fid, string fname, string imgpath)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegemedia SET varMediaName='" + fname + "',varMediaPath='" + imgpath + "' WHERE intId=" + fid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int insert_tblCollegeDetailAdmin(string name, string address, string city, string state, string cnt1, string cnt2, string cnt3, string email, string web, string pass, string photo, string principal, string incharge, string isTutor)
    {
        try
        {
            int id = max_tblcollegedetails();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegedetails VALUES(" + id + ",'" + name + "','" + address + "','" + city + "','" + state + "','" + cnt1 + "','" + cnt2 + "','" + cnt3 + "','" + email + "','" + web + "','" + pass + "','true','" + photo + "','" + principal + "','" + incharge + "'," + isTutor + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            //

            //
            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblcollegeotherdetails (intCollegeId) VALUES(" + id + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int insert_tblCollegeDetail(string name, string address, string city, string state, string cnt1, string cnt2, string cnt3, string email, string web, string pass, string photo, string principal, string incharge)
    {
        try
        {
            int id = max_tblcollegedetails();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegedetails VALUES(" + id + ",'" + name + "','" + address + "','" + city + "','" + state + "','" + cnt1 + "','" + cnt2 + "','" + cnt3 + "','" + email + "','" + web + "','" + pass + "','true','NoProfile.png','" + principal + "','" + incharge + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblcollegeotherdetails (intCollegeId) VALUES(" + id + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    public int insert_tblCollegeFirstDetail(string name, string email, string mob, string pass, Int16 isTutor)
    {
        try
        {
            int id = max_tblcollegedetails();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegedetails VALUES(" + id + ",'" + name + "','','','','','" + mob + "','','" + email + "','','" + pass + "','true','NoProfile.png','',''," + isTutor + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            con.Open();
            cmd = new MySqlCommand("INSERT INTO tblcollegeotherdetails (intCollegeId) VALUES(" + id + ")", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int insert_tbluserFirstDetail(string name, string email, string mob, string pass, string verify)
    {
        try
        {
            int id = max_tbluserdetails();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tbluserdetails VALUES(" + id + ",'" + name + "','NA','NA','NA','" + mob + "','','','" + email + "','','" + pass + "','" + verify + "','NoProfile.png','User','','','')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();

            return id;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }   /*................................Conversation................................*/
    public int max_tblamconversation()
    {
        int chk = 0;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select max(intId) as newid from tblamconversation", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public string check_already_msg(string inOfid, string inInid)
    {
        string chk = string.Empty;
        try
        {
            con.Close();
            con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId FROM tblamcommunication WHERE varMsgFrom='" + inOfid + "' AND varMsgto='" + inInid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = dr["intId"].ToString();
            }
            else
            {
                con.Close();
                con.Open();
                MySql.Data.MySqlClient.MySqlCommand cmd2 = new MySql.Data.MySqlClient.MySqlCommand("SELECT intId FROM tblamcommunication WHERE varMsgto='" + inOfid + "' AND varMsgFrom='" + inInid + "'", con);
                dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    chk = dr["intId"].ToString();
                }
                else
                {
                    chk = 0.ToString();
                }
            }
            con.Close();
            return chk;
        }
        catch (Exception s)
        {
            con.Close();
            return chk;
        }
    }
    public int check_if_member(string fid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT intuserId FROM tbluserdetails WHERE intuserId='" + fid + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = 1;
            }
            else
            {
                schId = 0;
            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int max_tblcollegedetails()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intCollegeID) as newid from tblcollegedetails", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int max_tbluserdetails()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intuserID) as newid from tbluserdetails", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int update_tblcollegecoordinate(int cid, string Latitude, string Longitude)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegecoordinates SET varLatitude ='" + Latitude + "', varLongitude ='" + Longitude + "' where intCollegeId=" + cid + " ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }

    public int update_tblcollegemedia(int cid, string mediatype, string medianame, string path)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblcollegemedia set varMediaName='" + medianame + "', varMediaPath='" + path + "' where intCollegeId=" + cid + " and varMediaType='Video'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int max_tblcollegemedia()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegemedia", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int insert_tblcollegecoordinates(int cid, string Latitude, string Longitude)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegecoordinates (intCollegeId, varLatitude, varLongitude) VALUES (" + cid + ",'" + Latitude + "','" + Longitude + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int insert_tblcollegesocials(string cid, string fb, string gp, string tw, string ln)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegesocials( intCollegeId, fb, gp, tw, lnkd ) VALUES (" + cid + ",'" + fb + "','" + gp + "','" + tw + "','" + ln + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int update_tblcollegesocials(string cid, string fb, string gp, string tw, string ln)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE tblcollegesocials set fb='" + fb + "', gp='" + gp + "', tw='" + tw + "', lnkd='" + ln + "' where intCollegeId=" + cid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int insert_tblfacultymembers(int cid, string name, string degree, string desc, string fb, string gp, string tw, string ln, string fname)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblfacultymembers( intCollegeId, varFacultyName, varDegree, varIntro, fb, gp, tw, lnkd,ex1 ) VALUES ('" + cid + "','" + name + "','" + degree + "','" + desc + "','" + fb + "','" + gp + "','" + tw + "','" + ln + "','" + fname + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int insert_tbljobs(int cid, string des, string app, string res, string qua, string ski, string sal, string date, string list)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tbljobs( intCollegeID, varDesignation, varopportunity, varResponsibilities, varQualification, varSkills, varSalary, varDate, varListing) VALUES (" + cid + ",'" + des + "','" + app + "','" + res + "','" + qua + "','" + ski + "','" + sal + "','" + date + "','" + list + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int insert_tblcollegemedia(int cid, string mediatype, string medianame, string path)
    {
        try
        {
            int id = max_tblcollegemedia();
            id = id + 1;

            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegemedia VALUES(" + id + "," + cid + ",'" + mediatype + "','" + medianame + "','" + path + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int update_tblCollegeOtherFacilities(int cid, string vision, string objective, string univ, string naac, string placement, string fee, string spachievement)
    {
        try
        {
            string broc = string.Empty;
            if (fee == "")
            {
                broc = check_already_brochure(cid);
            }
            else
            {
                broc = fee;
            }
            con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblcollegeotherdetails SET varSpecialAchievements='" + spachievement + "', varBrochure ='" + broc + "', varAboutOne='" + vision + "',varAboutTwo='" + objective + "',varUniAns ='" + univ + "',varNAACAns ='" + naac + "',varPlacementRecordPer ='" + placement + "' WHERE intCollegeId=" + cid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    public int insert_tblCollegeOtherFacilities(int cid, string vision, string objective, string univ, string naac, string placement, string fee)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO tblcollegeotherdetails values(" + cid + ",'" + vision + "','" + objective + "','" + univ + "','" + naac + "','" + placement + "','" + fee + "' )", con);//[varBrochure] ='" + fee + "', varAboutOne='" + vision + "',varAboutTwo='" + objective + "',[varUniAns] ='" + univ + "',[varNAACAns] ='" + naac + "',[varPlacementRecordPer] ='" + placement + "' WHERE intCollegeId=" + cid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }

    }
    public int update_tblCollegeOther(int cid, string fee)
    {
        try
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("update tblcollegeotherdetails SET varBrochure ='" + fee + "' WHERE intCollegeId=" + cid + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }

    }
    public String select_CollegeName(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCollegeName from tblcollegedetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varCollegeName"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_isTutor(string id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select isTutor from tblcollegedetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["isTutor"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_CollegeWebName(int id)
    {
        String colweb = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCollegeWeb from tblcollegedetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                colweb = dr["varCollegeWeb"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return colweb;
    }
    public String select_CollegeVideo(int id)
    {
        String colweb = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varMediaPath from tblcollegedetails where intCollegeId =" + id + " and varMediaType='Video'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                colweb = "https://www.youtube.com/watch?v=" + dr["varCollegeWeb"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return colweb;
    }
    public String select_CollegeWebBrochure(int id)
    {
        String colweb = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varBrochure from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                colweb = dr["varBrochure"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return colweb;
    }
    public String select_CollegeVision(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varAboutTwo,varUniAns,varNAACAns,varSpecialAchievements from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varAboutTwo"].ToString() + ";" + dr["varSpecialAchievements"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return name;
    }
    public String select_CollegeCourse(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select varCourses from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                naac = dr["varCourses"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }
    public String select_Collegenaac(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select varNAACAns from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                naac = dr["varNAACAns"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }

    public String select_CollegeLinks(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("SELECT  fb, gp, tw, lnkd FROM tblcollegesocials WHERE intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                naac = dr["fb"].ToString() + ";" + dr["gp"].ToString() + ";" + dr["tw"].ToString() + ";" + dr["lnkd"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }
    public String select_CollegeLikes(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select Count(intLikes) as likes from tblcollegelikes where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                naac = dr["likes"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }
    public String select_CollegeViews(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select intViews as views from tblcollegeviews where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                naac = dr["views"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }
    public String select_Video(int id)
    {
        String naac = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select varMediaPath from tblcollegemedia where intCollegeId =" + id + " and varMediaType='Video'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                naac = dr["varMediaPath"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return naac;
    }
    public String select_Collegeuni(int id)
    {

        String uni = String.Empty;

        try
        {
            MySqlCommand cmd = new MySqlCommand("select varUniAns from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                uni = dr["varUniAns"].ToString();

            }
            con.Close();
        }
        catch (Exception ex)
        {

        }

        return uni;
    }
    public String select_CollegeObj(int id)
    {
        String name = String.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select varAboutOne from tblcollegeotherdetails where intCollegeId =" + id + "", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["varAboutOne"].ToString();
            }
            con.Close();
        }
        catch (Exception ex)
        {

        }

        return name;
    }
    //College end //


    public string count_totol(string tal)
    {
        string chk = string.Empty;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select count(intId) as number from tblInspection where varDateofInspection BETWEEN  (SELECT CAST('" + begindate + "' AS datetime)) and (SELECT CAST('" + enddate + "' AS datetime)) and varTaluka='" + tal + "'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = dr["number"].ToString();
            }
            con.Close();
            return chk;
        }
        catch (Exception ex)
        {
            con.Close();
            return chk;
        }
    }
    public int max_tblstudentschedule()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intId) as newid from tblstudentschedule", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int max_tblcollegeprocess()
    {
        int chk = 0;
        try
        {
            MySqlCommand cmd = new MySqlCommand("select max(intID) as newid from tblcollegeprocess", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }

    public int check_ProcessStatus(int studentid, int collegeid)
    {
        try
        {
            int schId = 0;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select intId as newid from tblcollegeprocess where intStudentId=" + studentid + " and intCollegeId=" + collegeid + "", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                schId = Convert.ToInt32(dr["newid"].ToString());
            }
            else
            {

            }
            con.Close();
            return schId;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int update_tblcollegeprocess(int studentid, int collegeid, string status, string course, string reason, string remark)
    {
        try
        {
            int value = check_ProcessStatus(studentid, collegeid);
            if (value == 0)
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into tblcollegeprocess (intCollegeId, intStudentId, varStatus, varCourse, varReason, varRemark) values(" + collegeid + "," + studentid + ",'" + status + "','" + course + "','" + reason + "','" + remark + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("update tblcollegeprocess set   varStatus ='" + status + "', varReason ='" + reason + "',varRemark='" + remark + "' where intId=" + value + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }

    }
    /* Packages */
    //.............................................................packages
    public int max_tblampackages()
    {
        int chk = 0;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select max(intId) as newid from tblampackages", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int max_tblampackagesdetails()
    {
        int chk = 0;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select max(intId) as newid from tblampackagesdetails", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public string get_tblampackagesId(string pname)
    {
        string nme = string.Empty;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select varPackageId as pid from tblampackages where varPackageName='" + pname + "'", con2);
            con2.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nme = dr["pid"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con2.Close();
        return nme;
    }
    public string get_tblampackagesname(string id)
    {
        string nme = string.Empty;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select  varPackageName  from tblampackages where varPackageId='" + id + "'", con2);
            con2.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nme = dr["varPackageName"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
        con2.Close();
        return nme;
    }
    public int insert_tblampackages(string pname, string pduration, string pdurtime, string pprice, string pdescri, string pbenefit, string contacts)
    {
        try
        {
            string pac = get_tblampackagesId(pname);
            int id = max_tblampackagesdetails();
            id = id + 1;
            con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblampackagesdetails VALUES(" + id + ",N'" + pac + "',N'" + pdescri + "',N'" + pduration + "',N'" + pdurtime + "',N'" + pprice + "',N'" + pbenefit + "','" + contacts + "','')", con);

            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }

    public int insert_package_single(string package_name)
    {
        try
        {
            int id = max_tblampackages();
            id = id + 1;
            con.Open();
            string packageId = CreateRandomPassword(3);
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblampackages VALUES(" + id + ",N'" + packageId + "',N'" + package_name + "','')", con);

            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception ex)
        {
            con.Close();
            return 0;
        }
    }
    // update_tblampackagesdetails
    public int update_tblampackagesdetails(string id, string descr, string dur, string durtime, string price, string benefit, string contacts)
    {
        try
        {
            con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("UPDATE tblampackagesdetails SET varPackageDescription = '" + descr + "',varPackageDuration = '" + dur + "',varPackageDurationTime = '" + durtime + "',varPackagePrice = '" + price + "' ,varBenifits='" + benefit + "',ex1='" + contacts + "' WHERE varPackageId = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public int max_tblammembertransactions()
    {
        int chk = 0;
        try
        {
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select max(intId) as newid from tblammembertransactions", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chk = Convert.ToInt32(dr["newid"].ToString());
            }
        }
        catch (Exception ex)
        {

        }
        con.Close();
        return chk;
    }
    public int delete_Message(string convid)
    {
        try
        {

            con.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("delete from tblamconversation where intId=" + convid + "", con);

            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return 1;
        }
        catch (Exception s)
        {
            con.Close();
            return 0;
        }
    }
    public string getUserDataForPage(string userId)
    {
        try
        {
            string retun = string.Empty;

            con1.Open();
            cmd1 = new MySql.Data.MySqlClient.MySqlCommand("SELECT intuserId, varuserName, varuserAddress, varuserCity, varuserState, varContactOne, varContactTwo, varContactThree, varuserEmail, varuserWeb, varPassword, varVerified, varPhoto, varuserType, varAbout, varMaritalStatus, varGender FROM tbluserdetails WHERE intuserId=" + userId + "", con1);
            dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                retun = dr1["intuserId"].ToString() + ";" + dr1["varuserName"].ToString() + ";" + dr1["varuserAddress"].ToString() + ";" + dr1["varuserCity"].ToString() + ";" + dr1["varuserState"].ToString() + ";" + dr1["varContactOne"].ToString() + ";" + dr1["varContactTwo"].ToString() + ";" + dr1["varContactThree"].ToString() + ";" + dr1["varuserEmail"].ToString() + ";" + dr1["varuserWeb"].ToString() + ";" + dr1["varPassword"].ToString() + ";" + dr1["varVerified"].ToString() + ";" + dr1["varPhoto"].ToString() + ";" + dr1["varuserType"].ToString() + ";" + dr1["varAbout"].ToString() + ";" + dr1["varMaritalStatus"].ToString() + ";" + dr1["varGender"].ToString();
            }
            else
            {

            }
            con1.Close();

            return retun;
        }
        catch (Exception s)
        {
            con.Close();
            return "0";
        }
    }

    public string requestsCount(string userId)
    {
        string sendBack = string.Empty;
        con.Close();
        con.Open();
        cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT count(tblconnections.intId) as requests FROM tbluserdetails INNER JOIN tblconnections ON tbluserdetails.intuserId = tblconnections.intConnectionMe WHERE (tblconnections.intRequested = 1) AND (tblconnections.intConnected = " + userId + ")", con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            sendBack = dr["requests"].ToString() == string.Empty ? "0" : dr["requests"].ToString();
        }
        con.Close();

        return sendBack;
    }
    public string msgsCount(string userId)
    {
        string sendBack = "0";
        string MsgId = string.Empty;
        try
        {
            MySql.Data.MySqlClient.MySqlDataReader rdr1, rdr3;


            MySql.Data.MySqlClient.MySqlConnection cnn1 = new MySql.Data.MySqlClient.MySqlConnection();
            cnn1.ConnectionString = ConfigurationManager.ConnectionStrings["coursekattaConnectionString"].ConnectionString;
            cnn1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgFrom, tblamcommunication.varMsgFromName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgto = '" + userId + "')  ORDER BY tblamconversation.intId DESC  ", cnn1);
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

                            sendBack = (Convert.ToInt32(sendBack) + Convert.ToInt32(rdr3["mycount"].ToString())).ToString();


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
            cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT distinct tblamcommunication.intId AS MsgId, tblamcommunication.varMsgto, tblamcommunication.varMsgtoName FROM tblamcommunication INNER JOIN tblamconversation ON tblamcommunication.intId = tblamconversation.varMessageId WHERE (tblamcommunication.varMsgFrom = '" + userId + "')  ORDER BY tblamconversation.intId DESC  ", cnn1);
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

                            sendBack = (Convert.ToInt32(sendBack) + Convert.ToInt32(rdr3["mycount"].ToString())).ToString();


                        }
                        cnn3.Close();
                        rdr3.Close();

                    }
                }

                // Empty strings
                MsgId = string.Empty;


            }
            cnn1.Close();
            return sendBack;
        }
        catch (Exception ex)
        {
            return sendBack;
        }

    }

    public string notifCount(string userId)
    {
        string sendBack = string.Empty;
        con.Close();
        con.Open();
        cmd = new MySql.Data.MySqlClient.MySqlCommand("SELECT count(intNotToId) as notifCounts FROM tblnotifications where intNotToId = '" + userId + "' and varStatus='Unread'", con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            sendBack = dr["notifCounts"].ToString() == string.Empty ? "0" : dr["notifCounts"].ToString();
        }
        con.Close();

        return sendBack;
    }

    /* notifications */
    
    public void insert_tblnotifications(string type, string fromid, string fromName, string fromDesig, string toId, string toDesig, string text, string link, string sesson, string status, string remark)
    {
        try
        {
           
            con1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO tblnotifications (varNotType, intNotFromId, varNotFromName, varNotFromDesig, intNotToId, varNotToDesig, varNotText, varLink, varSession, varStatus, varRemark) VALUES('" + type + "','" + fromid + "','" + fromName + "','" + fromDesig + "','" + toId + "','" + toDesig + "','" + text + "','" + link + "','" + sesson + "','" + status + "','" + remark + "')", con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
            cmd1.Dispose();

        }
        catch (Exception ex)
        {

        }
    }
    public void delete_Notification(string idDel)
    {
        try
        {

            con1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("delete from tblnotifications where intId=" + idDel + "", con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
            cmd1.Dispose();

        }
        catch (Exception ex)
        {

        }
    }
    public void deleteAll_Notification(string memId)
    {
        try
        {

            con1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("delete from tblnotifications where intNotToId='" + memId + "'", con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
            cmd1.Dispose();

        }
        catch (Exception ex)
        {

        }
    }
    public void readAll_Notification(string memId)
    {
        try
        {

            con1.Open();
            MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("update tblnotifications set varStatus='Read' where intNotToId='" + memId + "'", con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
            cmd1.Dispose();

        }
        catch (Exception ex)
        {

        }
    }
}
