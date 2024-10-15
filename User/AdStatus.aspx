<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="AdStatus.aspx.cs" Inherits="User_AdStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h3 class="text-center">Order No. :
            <asp:Localize ID="lblOrderNo" runat="server" Text=""></asp:Localize>
            <asp:Localize ID="lblOrderStatus" runat="server" Text="Label"></asp:Localize></h3> 
        <div class="col-lg-4 col-lg-offset-2">

            <a href="Advert.aspx" class="pagebtn pagebtn-blue btn fa fa-3x">View Ads</a>

            <a href="Default.aspx" class="pagebtn pagebtn-blue btn fa-3x fa">Go To Home</a>
        </div>
    </div>

</asp:Content>

