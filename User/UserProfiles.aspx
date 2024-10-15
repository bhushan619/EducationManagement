<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="UserProfiles.aspx.cs" Inherits="User_UserProfiles" %>

<%@ Import Namespace="RegExForAspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container coursekatta-layout-1">

        <h3>My Contacts (<asp:Literal ID="myNetwork" runat="server"></asp:Literal>)</h3> 
        <div class="row">
    <asp:ListView ID="lstConnectFriends"  OnItemCommand="lstConnectFriends_ItemCommand"  runat="server"  DataKeyNames="intuserId">
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
                         <asp:LinkButton ID="Button1" runat="server" CssClass="pagebtn pagebtn-blue fa fa-times"  CommandName="del" CommandArgument='<%# Eval("intId")+";"+Eval("intuserId") %>' Style="margin-top: 10px"></asp:LinkButton>


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
    <div class="container coursekatta-layout-1">

        <h3>Contact Requests (<asp:Literal ID="cntReq" runat="server"></asp:Literal>)</h3>

        <div class="row">


            <asp:ListView ID="lstConnectRequest" OnItemCommand="lstConnectRequest_ItemCommand" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="intuserId">
                <EmptyDataTemplate>

                    <div class="rlp-table">
                        <div class="rlp-title" style="color: #221E1F; font-size: 20px">
                      No New Requests.. Invite your friends & create network
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
                        <asp:LinkButton ID="sf" runat="server" CssClass="pagebtn pagebtn-blue fa fa-check" CommandName="ok" CommandArgument='<%# Eval("intId")+";"+Eval("intConnectionMe") %>' Style="margin-top: 8px"></asp:LinkButton>
                        <asp:LinkButton ID="Button1" runat="server" CssClass="pagebtn pagebtn-blue fa fa-times"  CommandName="del" CommandArgument='<%# Eval("intId")+";"+Eval("intConnectionMe")  %>' Style="margin-top: 10px"></asp:LinkButton>


                    </div>


                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" style="">
                        <div runat="server" id="itemPlaceholder" />
                    </div>

                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>

        </div>
    </div>
    <div class="container coursekatta-layout-1">


        <h3>People you may wish to add as contact</h3>

        <div class="row">
            <asp:ListView ID="lstPoepleYoumayKnow" OnItemCommand="lstPoepleYoumayKnow_ItemCommand" runat="server" DataKeyNames="intuserId">
                <EmptyDataTemplate>

                    <div class="rlp-table">
                        <div class="rlp-title" style="color: #221E1F; font-size: 20px">
                              No new networks.. Invite your friends & create network
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
                        <asp:Image ID="dd" runat="server" Height="70px" Width="70px" ImageUrl='<%# "../user/media/" + Eval("varPhoto") %>' CssClass="img-responsive img-circle center-block" /><br>
                        Name :
                                  <asp:Label Text='<%# Eval("varuserName") %>' runat="server" ID="varuserNameLabel"></asp:Label>
                        <br />
                        From :
                                <asp:Label Text='<%# Eval("varuserCity") %>' runat="server" ID="varuserCityLabel" /><br />

                        Connections :
                                <asp:Label Text='<%# Eval("varuserCity") %>' runat="server" ID="Label1" /><br />

                        <asp:Literal Visible="false" Text='<%# Eval("intuserId") %>' runat="server" ID="intuserIdLabel" />
                        <asp:LinkButton ID="Button2" runat="server" CssClass="pagebtn pagebtn-blue fa fa-eye" PostBackUrl='<%# "~/user/ViewUserProfile.aspx?id=" + regPass.EncryptStringPass((Eval("intuserId").ToString()))%>'></asp:LinkButton>
                        <asp:LinkButton ID="sf" runat="server" CssClass="pagebtn pagebtn-blue fa fa-handshake-o" CommandArgument='<%# Eval("intuserId") %>'></asp:LinkButton>

                    </div>

                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" style="">
                        <div runat="server" id="itemPlaceholder" />
                    </div>

                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>

        </div>
    </div>



</asp:Content>

