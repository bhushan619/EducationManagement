<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserViews.master" AutoEventWireup="true" CodeFile="ViewUserProfile.aspx.cs" Inherits="User_ViewUserProfile" %>

<%@ Register Src="~/User/TimelineUserControl.ascx" TagPrefix="uc1" TagName="TimelineUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     
            
                    <div class="box box-primary">

 
                         
                                <uc1:TimelineUserControl runat="server" ID="TimelineUserControl" />
                           


                    </div>
              
            
  


</asp:Content>

