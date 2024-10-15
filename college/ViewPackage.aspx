<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" AutoEventWireup="true" CodeFile="ViewPackage.aspx.cs" Inherits="college_ViewPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">	
        <div class="row"> 
                <h2 class="text-center"> View Packages</h2>
            <div class="col-lg-10 col-lg-offset-1">
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>" 
      >
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server"  
       onitemcommand="ListView1_ItemCommand">
        
        
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>
                      <%--  No Packages Found.--%></td>
                </tr>
            </table>
        </EmptyDataTemplate> 
        <ItemTemplate>
            <span style=""> 
                    <div class="col-md-4 text-center">
                    <div class="panel panel-primary panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3><asp:Label ID="varPackageNameLabel" runat="server" Text='<%# Eval("varPackageName") %>' /></h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong> <i class="fa fa-inr"></i>   <asp:Label ID="varPackagePriceLabel" runat="server" Text='<%# Eval("varPackagePrice") %>' /></strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i>  <asp:Label ID="varPackageDurationLabel" runat="server" Text='<%# Eval("varPackageDuration") %>' /> <asp:Label ID="varPackageDurationTimeLabel" runat="server" Text='<%# Eval("varPackageDurationTime") %>' /></li>
                           <li class="list-group-item"><i class="fa fa-check"></i> <asp:Label ID="varPackageDescriptionLabel" runat="server" Text='<%# Eval("varPackageDescription") %>' /></li>
                             <%--<li class="list-group-item"><i class="fa fa-check"></i>  <asp:Label ID="varBenifitsLabel" runat="server" Text='<%# Eval("varBenifits") %>' /></li>--%>
                        </ul>
                        <div class="panel-footer">
          <asp:LinkButton runat="server" CssClass="btn btn-green" CommandArgument='<%# Eval("varPackageId")+";"+ Eval("varPackageName") +";"+ Eval("varPackageDuration") +";"+ Eval("varPackageDurationTime") %>' CommandName="buy">Buy</asp:LinkButton>
          </div>
                        </div>
                        </div>
                </span>
        </ItemTemplate>
        <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
    </asp:ListView>

                 
            </div>
               </div>
           
          </div>
</asp:Content>

