using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB1.auth
{
    public partial class RegistrationList : System.Web.UI.Page
    {

        string ConnectionStr = @"Data Source = DESKTOP-VHHBPK5; Initial Catalog= myDatabase; Integrated Security=true ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }


        private void LoadData()
        {
            DataTable dt = new DataTable();
            SqlConnection cnn;
            cnn = new SqlConnection(ConnectionStr);
            string Gender = ddlGender.SelectedValue;
            string Religion = ddlReligion.SelectedValue;

            string query = @"select UserId,UserName,
                        FirstName+' '+ISNULL(MiddleName,'')+' '+LastName as FullName,
                        Gender,convert(varchar(15),DateofBirth,103) as Birthday,ContactNo
                        from[dbo].[UserRegistration]
                        Where (ReligionId =" + Religion+" or "+Religion+@"=0)
                        AND (Gender="+Gender+" or "+Gender+"=0)";

            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();

            using (SqlCommand cmd = new SqlCommand(query, cnn))

            {
                cnn.Open();
                sda.SelectCommand = cmd;
                sda.Fill(ds);

                dt = ds.Tables[0];
                

            };

            if (dt.Rows.Count>0)
            {
                UserInfo.DataSource = dt;
                UserInfo.DataBind();
            }

       

        }


    }
}