using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using BLL;
using DAL;


namespace RealProjectB1.auth
{
    public partial class Rgister : System.Web.UI.Page
    {
        AuthBLL objAuthBLL = new AuthBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                CommonDAL.Fillddl(txtReligion,"SELECT ReligionId,ReligionName From Conf_Religion","ReligionName", "ReligionId");
                
            }
        }

    
        private int SaveReg()
        {

                int save = 0;

               EURegistration objUR = new EURegistration();



                objUR.UserName= txtUserName.Text.Trim();
                objUR.FirstName = txtFirstName.Text.Trim();
                objUR.MiddleName = txtMiddleName.Text.Trim();
                objUR.LastName = txtLastName.Text.Trim();
                objUR.Gender = int.Parse(ddlGender.SelectedValue);
                objUR.DateofBirth = txtDateOfBirth.Text;
                objUR.Email = txtEmail.Text.Trim();
                objUR.ContactNo = txtContactNumber.Text.Trim();
                objUR.Nationality = txtNationality.Text.Trim();
                objUR.Address = txtAddress.Text.Trim();
                objUR.ReligionId = Convert.ToInt32(txtReligion.SelectedValue);
                /*cmd.Parameters.AddWithValue("@EntryDate", txtUserName.Text.Trim()); */
                objUR.UserImage = "1.png";

                save = objAuthBLL.Insert_URegistrationInfo(objUR);



            return save;
        }



        private bool CheckFieldValue()
        {
            bool IsReq = false;

            if (txtUserName.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "Username can't be empty";


            }
            else if (txtFirstName.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "First Name can't be empty";
            }
            else if (txtLastName.Text == "")
            {
                IsReq = true;
                lblMsg.Text = "Last Name can't be empty";
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
            txtUserName.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtDateOfBirth.Text = "";
            txtEmail.Text = "";
            ddlGender.SelectedValue = "0";
            txtContactNumber.Text = "";
            txtNationality.Text = "";
            txtReligion.SelectedValue = "0";
            txtAddress.Text = "";
            UserImage.PostedFile.InputStream.Dispose();

        }



        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            if (CheckFieldValue()==false)
            {
                int save = SaveReg();

                if (save > 0)
                {
                    ClearFieldValue();
                    divMsg.Visible = true;
                    lblMsg.Text = " Data save successully";
                }
                else
                {
                    divMsg.Visible = true;
                    lblMsg.Text = "Save Failed";

                }
            }
        }
    }




}