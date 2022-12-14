using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace RealProjectB1.auth
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        AuthBLL ObjAuthBLL = new AuthBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                RememberCookie();
            }
           
        }

        private void RememberCookie()
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                txtUsername.Text = Request.Cookies["UserName"].Value;
                txtPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
            }
        }
     

      
        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            if (CheckFieldValue()==false)
            {
                DataTable dtUserInfo = ObjAuthBLL.CheckUserInfo(txtUsername.Text.Trim(), txtPassword.Text);
                if (dtUserInfo.Rows.Count>0)
                {
                    Session["UserId"] = dtUserInfo.Rows[0]["UserId"].ToString();
                    Session["UserName"] = dtUserInfo.Rows[0]["FulName"].ToString();
                    Session["UserImage"] = dtUserInfo.Rows[0]["UserImage"].ToString();
                    SetCookie();
                    Response.Redirect("~/AdminHome.aspx");
                }
                else
                {
                    lblMsg.Text = "Incorrect Username or Password";
                    divMsg.Visible = true;
                }
   
            }
            
        }

        private void SetCookie()
        {
            HttpCookie mycookie = new HttpCookie("mycookie");
            //mycookie["UserName"] = txtUsername.Text.Trim();
            //mycookie["Password"] = txtPassword.Text.Trim();
            mycookie["UserName"] = "";
            mycookie["Password"] = "";

            Response.Cookies.Add(mycookie);

            if (chkRememberMe.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(3);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(3);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Cookies["UserName"].Value = txtUsername.Text.Trim();
            Response.Cookies["Password"].Value = txtPassword.Text.Trim();

        }

        private bool CheckFieldValue()
        {
            bool IsReq = false;

            if (txtUsername.Text=="")
            {
                IsReq = true;
                lblMsg.Text = "Username can't be empty";

            }
            else if (txtPassword.Text =="")
            {
                IsReq = true;
                lblMsg.Text = "Password can't be empty";
            }

            if (IsReq==true)
            {
                divMsg.Visible = true;
            }
            else
            {
                divMsg.Visible = false;
            }

            return IsReq;
        }
    }
}