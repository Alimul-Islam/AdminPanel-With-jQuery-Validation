<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Blank.Master" AutoEventWireup="true" CodeBehind="Rgister.aspx.cs" Inherits="RealProjectB1.auth.Rgister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        .input-group-text,
        .form-control,
        .btn{
            border-radius:0px !important;

        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid bg-gradient-primary " style="">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="site_logo  mt-5 text-center">
                        <img class="img-fluid w-25 " src="../assets/img/logo.png" alt="Alternate Text" />
                    </div>
                    <div id="divMsg" runat="server" class="alert alert-danger text-center">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>

                    <!-- Page Heading -->
                 
                    <div class="card">
                        <div class="card-header bg-gradient-primary text-light">
                            Personal Details
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="form-label">User Name</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">First Name</label>
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>



                                <div class="col-md-3">
                                    <label class="form-label">Middle Name</label>
                                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Last Name</label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Date Of Birth</label>
                                    <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control datepicker" TextMode="Date"></asp:TextBox>

                                    <%--                   <div class="col-md-6">
                    <input type="text" class="form-control datepicker" placeholder="Select Date"/>
                    </div>--%>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Gender</label>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Select ---</asp:ListItem>
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                        <asp:ListItem Value="3">Others</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Contact Number</label>
                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <%--<div class="col-md-3">
                                    <label class="form-label">Alternative Contact Number</label>
                                    <asp:TextBox ID="txtAltContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>--%>
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control "></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label class="form-label">Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Nationality</label>
                                    <asp:TextBox ID="txtNationality" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>


                                   <div class="col-md-4">
                                    <label class="form-label">Religion</label>
                                       <asp:DropDownList ID="txtReligion" runat="server" CssClass="form-control">

                                       </asp:DropDownList>

                                   </div>
                                <div >
                                    <asp:FileUpload ID="UserImage" CssClass="col-md-12 mt-3 form-control " runat="server" />
                                </div>

                                <div class="col-md-12 ">
                                    <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn  btn-primary form-control mt-4 " OnClick="SaveButton_Click1"  />
                                </div>

                            </div>
                        </div>
                     

<%--                                    <asp:TextBox ID="txtReligion" runat="server" CssClass="form-control"></asp:TextBox>--%>

                        

                                </div>










                   <%-- <div class="card mt-3">
                        <div class="card-header bg-gradient-primary text-light">
                            Educational Information
                        </div>

                        <div class="card-body">
                            <div class="row">

                               <%-- <div class="col-md-3">
                                    <label class="form-label">Level/Cirtificate Completed</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass>
                                        <asp:ListItem Value="0">Select ---</asp:ListItem>
                                        <asp:ListItem Value="1">SSC</asp:ListItem>
                                        <asp:ListItem Value="2">HSC</asp:ListItem>
                                        <asp:ListItem Value="3">Graduation</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>



<%--                                <div class="col-md-6">
                                    <label class="form-label">Nationality</label>
                                    <asp:TextBox ID="txtNationality" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>


                                   <div class="col-md-4">
                                    <label class="form-label">Religion</label>

                                       <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                           <asp:ListItem Value="0">Select ---</asp:ListItem>
                                           <asp:ListItem Value="1">Islam</asp:ListItem>
                                           <asp:ListItem Value="2">Hindu</asp:ListItem>
                                           <asp:ListItem Value="3">Christain</asp:ListItem>
                                           <asp:ListItem Value="4">Buddhist</asp:ListItem>

                                       </asp:DropDownList>--%>--%>

<%--                                    <asp:TextBox ID="txtReligion" runat="server" CssClass="form-control"></asp:TextBox>--%>

                                   <%--      <div class="col-md-1">

                                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary form-control mt-4 align-content-center  " />
                                </div>

                                </div>--%>



                               <%-- <div class="col-md-2">
                                    <label class="form-label">Passing Year</label>
                                    <asp:TextBox ID="txtPassingYear" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Result</label>
                                    <asp:TextBox ID="txtResult" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>--%>

<%--                                <div class="col-md-1">

                                    <asp:Button ID="btnAdd" runat="server" Text="Save" CssClass="btn btn-primary form-control mt-4 align-content-center  " />
                                </div>


                                <div> 
                                    <asp:Image ID="Image1" runat="server" />

                                </div>

                            </div>--%>
                     <%--   </div>
                    </div>--%>


                    <%--                    <div class="card mt-1">
                        <div class="card-body ">

                            <div class="input-group flex-nowrap mt-4">
                                <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtUsername"  runat="server" CssClass ="form-control" placeholder="Username"></asp:TextBox>

                            </div>

                            <div class="input-group flex-nowrap mt-4">
                                <span class="input-group-text" id=""><i class="fas fa-lock"></i></span>
                                <asp:TextBox ID="txtPassword"  runat="server" CssClass ="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-check mt-2">
                              
                              <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input"/>

                              <label class="form-check-label" for="flexCheckDefault">
                                Remember
                              </label>
                            </div>
                            <div class="input-group flex-nowrap mt-4 justify-content-end">
                                <span class="input-group-text" id=""><i class="fas fa-paper-plane"></i></span>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success form-control" Text="Login"  />

                            </div>
                            <div class="login_links mt-3">
                                <a href="#" class="">Forgot Password</a>
                                <a href="login.aspx" class="float-right">Login</a>
                            </div>
                        </div>
                    </div>--%>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
