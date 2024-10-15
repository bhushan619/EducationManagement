<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="SendPromotionalEmail.aspx.cs" Inherits="admin_SendPromotionalEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
         <div class="container ">
  <div class="col-lg-10 col-lg-offset-1  mybg">
									 
									 
                                              <h3 class="text-center"> Send Promotional Email </h3>
        
            <div class="row"> 
                <div class="col-lg-8 col-lg-offset-2 ">
                    <div class="form-group">
                         <span>Emails (Separated by ',') </span>
                        <asp:TextBox ID="txtEmail" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <%--  <div class="form-group">
                         <span>Text Matter </span>
                        <asp:TextBox ID="txtMatter" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>--%>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="form-group">
                        <span></span>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="form-group">
                        <asp:Button ID="btnAddpack" runat="server" Text="Send Email" OnClick="btnAddpack_Click" CssClass="btn btn-success" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>
 
</div>
             </div>
    
</asp:Content>

