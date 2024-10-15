<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" AutoEventWireup="true" CodeFile="NewOrder.aspx.cs" Inherits="college_NewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h3 class="text-center">
                <asp:Localize Visible="false" ID="lblOrderNo" runat="server" Text=""></asp:Localize>
            </h3>

            <%-- <asp:Label ID="lblOrderStatus" runat="server" Text=""></asp:Label>--%>

            <div class="col-lg-4 col-lg-offset-3 text-center">


                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>
                <asp:ListView ID="ListView1" runat="server">


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
                            <h3>Selected Package </h3>
                            <div class="panel panel-primary panel-pricing">
                                <div class="panel-heading">
                                    <i class="fa fa-desktop"></i>
                                    <h2>
                                        <asp:Label ID="varPackageNameLabel" runat="server" Text='<%# Eval("varPackageName") %>' /></h2>
                                </div>

                                <ul class="list-group text-center">
                                    <li class="list-group-item"><strong><i class="fa fa-inr"></i>
                                        <asp:Label ID="varPackagePriceLabel" runat="server" Text='<%# Eval("varPackagePrice") %>' /></strong></li>
                                    <li class="list-group-item"><i class="fa fa-check"></i>
                                        <asp:Label ID="varPackageDurationLabel" runat="server" Text='<%# Eval("varPackageDuration") %>' />
                                        <asp:Label ID="varPackageDurationTimeLabel" runat="server" Text='<%# Eval("varPackageDurationTime") %>' /></li>
                                    <li class="list-group-item"><i class="fa fa-check"></i>
                                        <asp:Label ID="varPackageDescriptionLabel" runat="server" Text='<%# Eval("varPackageDescription") %>' /></li>
                                    <%--<li class="list-group-item"><i class="fa fa-check"></i>  <asp:Label ID="varBenifitsLabel" runat="server" Text='<%# Eval("varBenifits") %>' /></li>--%>
                                </ul>

                            </div>

                        </span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>

                    </LayoutTemplate>
                </asp:ListView>

            </div>
            <div class="col-lg-4">
                <br />
                <br />
                <br />
                <asp:LinkButton ID="lnkProceed" runat="server" CssClass="btn btn-transition-green" OnClick="lnkProceed_Click">Pay with PayU</asp:LinkButton>
                <br />
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-transition-paytm" OnClick="LinkButton1_Click" >Pay with paytm</asp:LinkButton>
                <br />
                <br />
               <%-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                <a href="Default.aspx" class="btn btn-blue ">Cancel</a>
            </div>
        </div>
        </div>
</asp:Content>

