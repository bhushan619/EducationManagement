<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="UpgradeCollege.aspx.cs" Inherits="admin_UpgradeCollege" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container mybg">
        <div class="text-center">
            <h3>Upgrade Institute :
                <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5">
                <div class="form-group">
                    <asp:Button ID="btnUpgrade" runat="server" Text="Upgrade" OnClick="btnUpgrade_Click" CssClass="btn btn-primary btn-app" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

