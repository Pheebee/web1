using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WebApplication1.Classes
{
    public class TicketInfo : System.Web.UI.Page
    {
        private DataRow userInfo;
        public DataRow UserInfo
        {
            get
            {
                if (userInfo == null)
                {
                    userInfo = GetUserInfo();
                }
                return userInfo;
            }
        }

        public DataRow GetUserInfo()
        {
            string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ToString();
            SqlConnection conn = new SqlConnection(strConnection);
            conn.Open();

            
            string cmdText = String.Format("select * from dbo.[usvOKC_GetAll] where AccountID = '{0}'", Convert.ToInt32(User.Identity.GetUserName()));
            SqlCommand cmd = new SqlCommand(cmdText, conn);

            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            if (table.Rows.Count > 0)
                return table.Rows[0];
            return null;
        }


        private DataRow addInfo;
        public DataRow AddInfo
        {
            get
            {
                if (addInfo == null)
                {
                    addInfo = GetAddInfo();
                }
                return addInfo;
            }
        }

        public DataRow GetAddInfo()
        {
            string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ToString();
            SqlConnection conn = new SqlConnection(strConnection);
            conn.Open();


            string cmdText = String.Format("select * from dbo.[UserInformation] where AccountID = '{0}'", Convert.ToInt32(User.Identity.GetUserName()));
            SqlCommand cmd = new SqlCommand(cmdText, conn);

            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            if (table.Rows.Count > 0)
                return table.Rows[0];
            return null;
        }


        public int updateCIF(int accntID, string strTickets, string strPlayoffs, DateTime Date)
        {
            string strConnection = "";
            strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ToString();

            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                using (SqlCommand cmd = new SqlCommand("X_OKCVoice_CIFUpdate"))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@AccountID", accntID));
                    cmd.Parameters.Add(new SqlParameter("@SeasonPlan", strTickets));
                    cmd.Parameters.Add(new SqlParameter("@PlayoffOption", strPlayoffs));
                    cmd.Parameters.Add(new SqlParameter("@SubmitDate", Date));

                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (SqlException s)
                    {
                        Trace.Warn("DME Code Trace", s.Message);
                    }
                    return 0;
                }
            }
        }

        // Update Profile
        public int UpdateProfile(string UserName, string FullName, string Address, string City, string St, string Zip, string Phone, string Email)
        {
            string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                using (SqlCommand cmd = new SqlCommand("spUpdateUserInformation"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@AccountID", UserName));
                    cmd.Parameters.Add(new SqlParameter("@FullName", FullName));
                    cmd.Parameters.Add(new SqlParameter("@Address1", Address));
                    cmd.Parameters.Add(new SqlParameter("@City", City));
                    cmd.Parameters.Add(new SqlParameter("@State", St));
                    cmd.Parameters.Add(new SqlParameter("@Zip", Zip));
                    cmd.Parameters.Add(new SqlParameter("@Phone", Phone));
                    cmd.Parameters.Add(new SqlParameter("@Email", Email));

                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (SqlException s)
                    {
                        //Trace.Warn("DME Code Trace", s.Message);
                    }
                    return 0;
                }
            }
        }
    }
}