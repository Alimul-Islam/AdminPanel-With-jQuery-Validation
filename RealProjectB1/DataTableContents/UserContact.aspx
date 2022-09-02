<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminLayout.Master" AutoEventWireup="true" CodeBehind="UserContact.aspx.cs" Inherits="RealProjectB1.DataTableContents.UserContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function numberCheck(controlid) {
            var val = document.getElementById(controlid).value;
            var MainC = document.getElementById(controlid);

            var expressDigit = /^\d*$/;


            if (expressDigit.test(val)) {
                MainC.style.backgroundColor = "white";
            }

            else {
                alert("Invalid Number");
                MainC.style.backgroundColor = "#E6A0A0";
                MainC.value = "";
            }
        }


    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid bg-gradient-primary  pb-5 " style="">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div id="divMsg" runat="server" class="alert alert-danger text-center">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>

                    <!-- Page Heading -->

                    <div class="card mt-5 ">
                        <div class="card-header bg-gradient-primary text-light">
                            Contact Details
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="form-label">Name</label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Contact Number</label>
                                    <asp:TextBox ID="UserTxtContact" runat="server" CssClass="form-control"  ></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone Number" CssClass="text-danger" ValidationExpression="(^([+]{1}[8]{2}|0088)?(01){1}[3-9]{1}\d{8})$" ControlToValidate="UserTxtContact"></asp:RegularExpressionValidator>

                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Email</label>
                                    <asp:TextBox ID="UserEmail" runat="server" CssClass="form-control"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" CssClass="text-danger" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="UserEmail" ></asp:RegularExpressionValidator>

                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Social</label>
                                    <asp:TextBox ID="UserSocial" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:HiddenField ID="editCid" runat="server" />
                                <asp:Button ID="AddUser" runat="server" CssClass="mt-4 align-content-center btn btn-primary" Text="Add To Contact" OnClick="AddUser_Click"  />

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="card-header bg-gradient-primary text-light mt-5">
        Contact List   
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12 ">
                <asp:GridView ID="ContactInfo" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" OnRowCommand="ContactInfo_RowCommand">
                    <Columns>         
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Contact"  DataField="Contact"/>
                        <asp:BoundField HeaderText="Email" DataField="Email"/>
                        <asp:BoundField HeaderText="Social" DataField="Social"/>                        
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Action
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HidCid" runat="server" Value='<%#Eval("CID") %>' />
                                <asp:ImageButton ID="ImgEdit" runat="server" CommandName="EditC"  CommandArgument='<%#Container.DataItemIndex %>'  AlternateText="  Edit"   />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>



</asp:Content>
