<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="User_Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container coursekatta-layout-1">
        <h3 class="text-center">Notifications</h3>
        <div class="row">


            <div class="col-lg-12  text-right">
                <%--<asp:LinkButton ID="btnReadAll" runat="server" CssClass="pagebtn pagebtn-blue" Text="Mark all as read" OnClick="btnReadAll_Click" />&nbsp;&nbsp;--%>
                <asp:LinkButton ID="lnkDeleteAll" CssClass="pagebtn pagebtn-blue" runat="server" Text="Delete all" OnClick="lnkDeleteAll_Click" />
            </div>
            <br />
            <br />
        </div>
        <asp:ListView ID="lstNotification" runat="server"
            OnItemCommand="lstNotification_ItemCommand"
            
            OnPagePropertiesChanging="lstNotification_PagePropertiesChanging">


            <EmptyDataTemplate>
              <asp:Panel ID="notificationpanel" runat="server"  CssClass="myborder notifBg text-center">
                  No New Notifications
                  </asp:Panel>
            </EmptyDataTemplate>

            <ItemTemplate>
                <span style="">
                    <asp:Panel ID="notificationpanel" CssClass="myborder" runat="server" Style="padding: 2px 0px 25px;">
                        <div class="col-lg-11">


                            <asp:LinkButton ID="varNotTextLabel" runat="server" CommandName="Views" CssClass=" "
                                CommandArgument='<%#Eval("intId")+","+Eval("varLink")+","+Eval("intNotFromId")+","+Eval("varSession")+","+Eval("varRemark")+","+Eval("varNotType")+","+Eval("varNotText")%>'
                                Text='<%# Eval("varNotText") %>' />

                        </div>



                        <div class="col-lg-1">
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Deletes" CssClass="iconcolor text-left fa fa-times"
                                CommandArgument='<%#Eval("intId")+","+Eval("varLink")+","+Eval("intNotFromId")+","+Eval("varSession")+","+Eval("varRemark")+","+Eval("varNotType")+","+Eval("varNotText")%>' />
                            <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("varStatus") %>'></asp:Label>
                        </div>
                    </asp:Panel>

                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                
            </LayoutTemplate>



        </asp:ListView>
        <br />
      <%--  <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstNotification">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ButtonCssClass="pagebtn pagebtn-blue"
                    ShowLastPageButton="True" />
            </Fields>
        </asp:DataPager>--%>

    </div>
</asp:Content>

