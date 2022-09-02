using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB1.DataTableContents
{
    public partial class UserContact : System.Web.UI.Page
    {

        string ConnectionStr = @"Data Source = LAPTOP-J4UO3SRU; Initial Catalog= DotNetDB; Integrated Security=true ";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                LoadData();
                AddUser.Text = "Save";
            }

            UserTxtContact.Attributes.Add("OnKeyUp", "numberCheck('" + UserTxtContact.ClientID + "')");
        }

        protected void AddUser_Click(object sender, EventArgs e)
        {

            if (AddUser.Text=="Save")
            {
                if (CheckFieldValue() == false)
                {
                    int save = AddContact(); ;

                    if (save > 0)
                    {
                        ClearFieldValue();
                        divMsg.Visible = true;
                        lblMsg.Text = " Contacted Added Successfully";
                    }
                    else
                    {
                        divMsg.Visible = true;
                        lblMsg.Text = "Add Failed";

                    }

                }
            }

            else
            {

                if (CheckFieldValue() == false)
                {
                    int save = UpdateContact(); 

                    if (save > 0)
                    {
                        ClearFieldValue();
                        divMsg.Visible = true;
                        lblMsg.Text = " Upadated Successfully";
                    }
                    else
                    {
                        divMsg.Visible = true;
                        lblMsg.Text = "Update Failed";

                    }
                }
            }
        }

        private int AddContact()
        {
            int save = 0;

            SqlConnection cnn;
            cnn = new SqlConnection(ConnectionStr);

            //SqlCommand cmd;


            string query = @"  Insert into UserContact(Name, Contact, Social, Email, EntryBy, EntryDate)
                                Values(@Name, @Contact, @Social, @Email, @EntryBy, GETDATE())";


            using (SqlCommand cmd = new SqlCommand(query, cnn))

            {
                cmd.Parameters.AddWithValue("@Name", UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", UserTxtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Social", UserSocial.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", UserEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@EntryBy", Session["UserId"].ToString());



                cnn.Open();
                save = cmd.ExecuteNonQuery();
                cnn.Close();


            };

            return save;
        }



        private int UpdateContact()
        {
            int saveUpdate = 0;

            SqlConnection cnn;
            cnn = new SqlConnection(ConnectionStr);

            //SqlCommand cmd;


            string query = @"Update [dbo].[UserContact]
                                                set 
                                                Name=@Name,
                                                Contact=@Contact,
                                                Email=@Email,
                                                UpdateBy=@UpdateBy,
                                                UpdateDate=GETDATE()
                                                where CID= @CID";


            using (SqlCommand cmd = new SqlCommand(query, cnn))

            {
                cmd.Parameters.AddWithValue("@Name", UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", UserTxtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Social", UserSocial.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", UserEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@UpdateBy", Session["UserId"].ToString());
                cmd.Parameters.AddWithValue("@CID", editCid.Value);


                cnn.Open();
                saveUpdate = cmd.ExecuteNonQuery();
                cnn.Close();


            };

            return saveUpdate;
        }





        private bool CheckFieldValue()
        {
            bool IsReq = false;

            if (UserName.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "Name can't be empty";


            }
            else if (UserTxtContact.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "Contact Number can't be empty";
            }
            else if (UserEmail.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "Email can't be empty";
            }

            if (IsReq == true)
            {
                divMsg.Visible = true;
            }
            else
            {
                divMsg.Visible = false;
            }

            return IsReq;
        }





        private void ClearFieldValue()
        {
            UserName.Text = "";
            UserTxtContact.Text = "";
            UserEmail.Text = "";
            UserSocial.Text = "";


        }




        private void LoadData()
        {
            DataTable dt = new DataTable();
            SqlConnection cnn;
            cnn = new SqlConnection(ConnectionStr);


            string query = @"SELECT CID,Name,UserContact.Email,Contact,Social from [dbo].[UserContact]";

            //string query = @"SELECT CID,Name,UserContact.Email,Contact,Social, (FirstName+' '+ISNULL(MiddleName,'')+''+LastName) as Entryby  from [dbo].[UserContact] 
            //INNER JOIN UserRegistration ON  [dbo].[UserContact].EntryBy =UserRegistration.UserId";





            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();

            using (SqlCommand cmd = new SqlCommand(query, cnn))

            {
                cnn.Open();
                sda.SelectCommand = cmd;
                sda.Fill(ds);

                dt = ds.Tables[0];


            };

            if (dt.Rows.Count > 0)
            {
                ContactInfo.DataSource = dt;
                ContactInfo.DataBind();
            }



        }

        protected void ContactInfo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditC")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                HiddenField HidCid = (HiddenField)ContactInfo.Rows[rowIndex].Cells[0].FindControl("HidCid");
                FillControl(int.Parse(HidCid.Value));
            }
        }



        private void FillControl(int CID)
        {

            DataTable dt = new DataTable();
            SqlConnection cnn;
            cnn = new SqlConnection(ConnectionStr);


            string query = @"SELECT CID,Name,Email,Contact,Social from [dbo].[UserContact]  where CID = " + CID + "";

            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();

            using (SqlCommand cmd = new SqlCommand(query, cnn))

            {
                cnn.Open();
                sda.SelectCommand = cmd;
                sda.Fill(ds);

                dt = ds.Tables[0];


            };

            if (dt.Rows.Count > 0)
            {
                UserName.Text = dt.Rows[0]["Name"].ToString();
                UserTxtContact.Text = dt.Rows[0]["Contact"].ToString();
                UserEmail.Text = dt.Rows[0]["Email"].ToString();
                UserSocial.Text = dt.Rows[0]["Social"].ToString();
                editCid.Value = dt.Rows[0]["CID"].ToString();
                AddUser.Text = "update";
            }

        }


    }
   

}