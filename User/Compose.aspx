<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserOnlyAd.master" AutoEventWireup="true" CodeFile="Compose.aspx.cs" Inherits="User_Compose" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container coursekatta-layout-1">
        <h3> Messaging</h3>
         <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a href="Compose.aspx">Compose</a></li>
            <li><a href="Inbox.aspx">Inbox&nbsp; <span class="badge"><asp:Label ID="lblcountmsg" runat="server" Text="0"></asp:Label></span></a></li>
           
        </ul>
    </div>
        <div class="row">
        
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="col-lg-12">
                    <br />
                    <div class="form-group">
                        <asp:DropDownList ID="ddlMemberDetails" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value="">:: Select Connection to Message ::</asp:ListItem>
                        </asp:DropDownList>
                       <%-- <asp:TextBox ID="txtMember" runat="server" required="required" CssClass="form-control"
                            placeholder="Enter Member Name"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                            MinimumPrefixLength="1" CompletionInterval="1"
                            EnableCaching="true"
                            DelimiterCharacters=""
                            Enabled="True"
                            ServiceMethod="GetCompletionList"
                            CompletionSetCount="1"
                            TargetControlID="txtMember" UseContextKey="True">
                        </cc1:AutoCompleteExtender>--%>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtMessage" CssClass="form-control" runat="server" required="required" placeholder="Your Message" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSend" runat="server" CssClass="pagebtn pagebtn-blue" Text="Send Message" OnClick="btnSend_Click" />
                        <asp:Button ID="sad" runat="server" CssClass="pagebtn pagebtn-blue" Text="Cancel"></asp:Button>
                    </div>
                </div>

            
        </div>
    </div>
</asp:Content>

