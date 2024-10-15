<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-login">
        <div class="container">
            <div class="col-lg-5 col-md-offset-4">
                <div class="login-wrapper rlp-wrapper" style="color: #464043">
                    <div class="login-table rlp-table">

                        <div class="login-title rlp-title text-center">Login here!</div>
                        <div class="login-form bg-w-form rlp-form">

                            <div class="row">
                                <div class="col-lg-10 col-md-offset-1">

                                    <asp:Label ID="lblError" runat="server" Text="Label" Visible="False"
                                        ForeColor="Red"></asp:Label>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtName" required="required" runat="server" CssClass="form-control" placeholder="E-Mail"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPass" required="required" runat="server"
                                            CssClass="form-control" placeholder="Enter Password"
                                            TextMode="Password"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button Width="100%" ID="btnLogin" CssClass="btn btn-login btn-green" runat="server"
                                            Text="Submit" OnClick="btnLogin_Click" />
                                    </div>
                                    <div class="form-group">
                                       <div class="col-md-6">
                                            <asp:HyperLink ID="HyperLink3" runat="server" Text="Forget Password?" NavigateUrl="~/RetrievePassword.aspx"></asp:HyperLink>
                                        </div> 
                                        <div class="col-md-6 text-right">
                                            <asp:HyperLink ID="HyperLink1" runat="server" Text="Register now." NavigateUrl="~/Register.aspx"></asp:HyperLink>
                                        </div>
                                        
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div> 
</asp:Content>

