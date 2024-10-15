<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserOnlyAd.master" AutoEventWireup="true" CodeFile="Sent.aspx.cs" Inherits="User_Sent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container coursekatta-layout-1">
         <h3 > Messaging</h3>
   
    <div class="row">
        <ul class="nav nav-tabs">
            <li><a href="Compose.aspx">Compose</a></li>
            <li><a href="Inbox.aspx">Inbox&nbsp;<span class="badge"><asp:Label ID="lblcountmsg" runat="server" Text="0"></asp:Label></span></a></li>
            <li class="active"><a href="Sent.aspx">Sent</a></li> 
        </ul>
    </div>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1"> 
                 
          
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           
                   
                       
         <asp:ListView ID="lstSentMessages" runat="server" OnItemCommand="lstSentMessages_ItemCommand"  > 
            <EmptyDataTemplate>
                <h1>
                                        <center>  <i class="fa fa-hand-spock-o" aria-hidden="true"></i> There are no conversations to show !</center>
                                    </h1>

            </EmptyDataTemplate> 
            <ItemTemplate> 
                 
                     <div class="row myborder" style="margin:5px"  >
                         <br />
   <div class="col-lg-2" >
       <asp:ImageButton ID="imgSimilarPic" runat="server" CssClass="img-rounded" Height="60px" Width="60px"   ImageUrl='<%# "~/user/media/" + Eval("SentPhoto") %>' /> 
      
      </div>
                    <div class="col-lg-8">
               
               <asp:Label ID="varMemberNameLabel" runat="server" Text='<%# Eval("SentMemName") %>' Font-Bold="true"/> &nbsp; : &nbsp;
             
             <asp:Label ID="varMsgToLabel" runat="server" Text='<%# Eval("SentMsg") %>' />  <br />
              
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("SentDate") %>' />, <asp:Label ID="Label3" runat="server" Text='<%# Eval("SentTime") %>' /> 
                        </div>

          <div class="col-lg-1">
     <asp:LinkButton runat="server" ID="lnkDelete"  CommandArgument='<%# Eval("ConId") %>' CommandName="delet" ><i class="fa fa-trash pagebtn pagebtn-blue"></i></asp:LinkButton></div>
  </div>
                    </span>
                
            </ItemTemplate>
             
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <div runat="server" id="itemPlaceholder" />
                </div>
             
            </LayoutTemplate> 
        </asp:ListView>
                   </div>
               </div>
    </div>
</asp:Content>

