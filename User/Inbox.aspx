<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserOnlyAd.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="User_Inbox" %>
<%@ Import Namespace="RegExForAspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container coursekatta-layout-1">
          <h3> Messaging</h3>
   
    <div class="row">
        <ul class="nav nav-tabs">
            <li><a href="Compose.aspx">Compose</a></li>
            <li class="active"><a href="Inbox.aspx">Inbox&nbsp;<span class="badge"><asp:Literal ID="lblcountmsg" runat="server" Text="0"></asp:Literal></span></a></li>
 
        </ul>
    </div>
    <div class="row">
        <div class="col-lg-12">

            <div class="col-lg-4" style="padding: 10px 0px 0px 0px;">
                <asp:ListView ID="lstInbox" runat="server" OnItemCommand="lstInbox_ItemCommand" OnItemDataBound="lstInbox_ItemDataBound">

                    <EmptyDataTemplate>
                        <span>No Conversation Found</span>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                         <div class="row ">
                                <asp:Panel runat="server" ID="userBox" CssClass="col-lg-10 col-lg-offset-1 myborder" Style="padding-bottom: 10px; margin-bottom: 10px">

                                    <div class="col-sm-3" style="padding: 10px 0px 0px 10px;">
                                        <asp:Image ID="imgSimilarPic" runat="server" CssClass="img-circle" Height="40px" Width="40px" ImageUrl='<%# "~/user/media/" + Eval("InboxMemPhoto") %>' />

                                    </div>
                                    <div class="col-sm-8" style="padding: 10px 10px 0px 10px;">
                                        <asp:LinkButton ID="varMsgFromNameLabel" runat="server" Text='<%# Eval("InboxMemName") %>' CommandArgument='<%# Eval("MsgId") +";"+ Eval("InboxMsgMember") %>' CommandName="Views" />
                                        <br />
                                        <asp:Label ID="ddf" Text='<%# "Joined As: " + Eval("UserAs") %>' runat="server"></asp:Label>
                                        <asp:Literal ID="dd" Text='<%# Eval("InboxMsgMember") %>' Visible="false" runat="server"></asp:Literal>
                                    </div>
                                </asp:Panel>
                            </div>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <span runat="server" id="itemPlaceholder"  />
                        </div>
                        
                    </LayoutTemplate>

                </asp:ListView>
                <br /><br />
            </div>
            <div class="col-lg-8" style="border-left:2px solid #808080;">
               
               <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtMessage" CssClass="form-control" runat="server" required="required" placeholder="Your Message" TextMode="MultiLine"></asp:TextBox>
                    </div>
<div class="form-group">
                    <asp:Button ID="btnSend" runat="server" CssClass="pagebtn pagebtn-blue" Text="Reply Message" OnClick="btnSend_Click" />
                    <asp:Button   ID="sad" runat="server" CssClass="pagebtn pagebtn-blue" Text="Cancel"></asp:Button>
                </div>
                <div class="col-lg-12">
                    <asp:ListView ID="lstConv" runat="server" DataSourceID="SqlDataSourceConversation">
                        <ItemTemplate>
                            <span>
                                <div class="row myborder " style="margin-bottom: 5px">
                                    
                                   <div style="padding: 5px"  class='<%# Eval("varMsgFrom").ToString().Equals(regPass.DecryptStringPass(Request.Cookies["userid"].Value.ToString()))?" pull-right text-right":" pull-left text-left" %>'>
                                        <asp:Label ID="varMemberNameLabel" runat="server" Text='<%# Eval("varMemberName") %>' Font-Bold="true" />
                                        <br />

                                        <asp:Label ID="varMsgToLabel" runat="server" Text='<%# Eval("varMsgText") %>' />
                                        <br />
                                         </div>
                                      <%--  <div class='<%# Eval("varMsgFrom").ToString().Equals(regPass.DecryptStringPass(Request.Cookies["userid"].Value.ToString()))?" pull-left":" pull-right" %>'>
                                        <div style="float: right">
                                            <asp:Label ID="varDateLabel" runat="server" Text='<%# Eval("varDate") %>' />,
                                            <asp:Label ID="varTimeLabel" runat="server" Text='<%# Eval("varTime") %>' /></div>
                                    </div>--%>

                                </div>

                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div style="" id="itemPlaceholderContainer" runat="server"><span runat="server" id="itemPlaceholder" /></div>

                            <div style=""></div>
                        </LayoutTemplate>
                        <%--<AlternatingItemTemplate>
           <span>
           <div class="row justborder" style="background-color:#f0f0f0" >

                    <div class="col-lg-10">
           <asp:Label ID="varMemberNameLabel" runat="server" Text='<%# Eval("varMemberName") %>'  Font-Bold="true"/> <br />
                
               <asp:Label ID="varMsgToLabel" runat="server" Text='<%# Eval("varMsgText") %>' /> <br />
               
              <asp:Label ID="varDateLabel" runat="server" Text='<%# Eval("varDate") %>' />, <asp:Label ID="varTimeLabel" runat="server" Text='<%# Eval("varTime") %>' />
           </div>
               </div> 

                    </span>
       </AlternatingItemTemplate>--%>
                    </asp:ListView>

                    <asp:SqlDataSource ID="SqlDataSourceConversation" runat="server"
                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>
                </div>
            </div>


        </div>
    </div>
         </div>
</asp:Content>

