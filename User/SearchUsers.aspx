<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="SearchUsers.aspx.cs" Inherits="User_SearchUsers" %>
<%@ Import Namespace="RegExForAspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container coursekatta-layout-1">

        <h3>Network Search</h3>
        <div class="row">
    <asp:ListView ID="lstConnectFriends"   runat="server"  DataKeyNames="intuserId">
                <EmptyDataTemplate>

                    <div class="rlp-table">
                        <div class="rlp-title" style="color: #221E1F; font-size: 20px">
                            No One in network yet
                        </div>
                        <div class="page-login media-body media-heading text-center">
                            <br />
                            <br />
                            <i class="fa fa-2x fa-facebook-square"></i>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-2x fa-twitter"></i>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                              <i class="fa fa-2x fa-linkedin-square"></i>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-2x fa-google-plus"></i>
                        </div>
                    </div>
                    <br />
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="col-lg-4 myborder text-center" style="padding: 10px 0px; margin-bottom: 10px">

                        <asp:Image ID="dd" runat="server" Height="70px" Width="70px" ImageUrl='<%# "../user/media/" + Eval("varPhoto") %>' CssClass="img-responsive img-circle center-block" />

                        Name :
                                <asp:Label Text='<%# Eval("varuserName") %>' runat="server" ID="varuserNameLabel"></asp:Label>
                        <br />
                        From:
                                <asp:Label Text='<%# Eval("varuserCity") %>' runat="server" ID="varuserCityLabel" /><br />

                        Connections :
                                <asp:Label Text='<%# Eval("varuserCity") %>' runat="server" ID="Label1" /><br />

                        <asp:Literal Visible="false" Text='<%# Eval("intuserId") %>' runat="server" ID="intuserIdLabel" />
                        <asp:LinkButton ID="Button2" runat="server" CssClass="pagebtn pagebtn-blue fa fa-eye" PostBackUrl='<%# "~/user/ViewUserProfile.aspx?id=" + regPass.EncryptStringPass((Eval("intuserId").ToString()))%>'></asp:LinkButton>
                     
  <%--<asp:LinkButton ID="Button1" runat="server" CssClass="pagebtn pagebtn-blue fa fa-times"  CommandName="del" CommandArgument='<%# Eval("intId")+";"+Eval("intuserId") %>' Style="margin-top: 10px"></asp:LinkButton>--%>


                    </div>


                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" style="">
                        <div runat="server" id="itemPlaceholder" />
                    </div>

                </LayoutTemplate>

            </asp:ListView>
            </div>

    </div>
</asp:Content>

