<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RetrievePassword.aspx.cs" Inherits="RetrievePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container coursekatta-layout-1">

        <h3 class="text-center">Please fill details to retrieve password</h3>



        <div class="col-md-6 col-md-offset-2">
            <table class="table" style="background-color: #FFFFFF">


                <tr>
                    <td class="text-right">&nbsp;</td>
                    <td colspan="2" align="left">&nbsp;</td>
                </tr>

                <tr>
                    <td class="text-right">
                        <asp:Label ID="Label1" runat="server" Text="Enter E-mail to retrieve password"></asp:Label></td>
                    <td colspan="2" align="left">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="text-left">
                        <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Password"
                            OnClick="btnRetrieve_Click" CssClass="btn btn-blue" /></td>

                    <td class="text-left">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <br />
</asp:Content>

