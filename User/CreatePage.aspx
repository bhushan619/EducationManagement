<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="CreatePage.aspx.cs" Inherits="User_CreatePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <br />
        <div class="col-md-2 ">

            <div class="rlp-table text-center">
                <div class="rlp-table ">
                    <asp:Image ID="imgProfile" Height="100px" Width="100px" Style="border: 3px solid #ddd; border-radius: 50px;" runat="server" />
                    <br />
                    <asp:Literal ID="proName" runat="server"></asp:Literal>
                    <br />
                    <span id="aboutUser" runat="server" class="text-left"></span>

                </div>
                <br />
                <ul class="list-group" style="padding-left: 15px;">

                    <li class="list-group-item">
                        <asp:LinkButton ID="btnDocs" runat="server" Width="100%" PostBackUrl="~/User/CreatePage.aspx"
                            class="fa fa-flag pagebtn pagebtn-blue" Style="text-align: left" CausesValidation="false">
                                                 Page 
                        </asp:LinkButton></li>
                    <li class="list-group-item">
                        <asp:HyperLink ID="LinkButton3" runat="server" Style="text-align: left" Width="100%" NavigateUrl="~/User/Advert.aspx"
                            CausesValidation="false" class="fa fa-address-card-o pagebtn pagebtn-blue">
                                                 Adverts 
                        </asp:HyperLink></li>
                </ul>

            </div>


        </div>
        <div class="col-md-6">
            <div class="container coursekatta-layout-1 ">
                <h2>Create Your Page</h2>

                <div class="form-group">
                    <label>Who are you?</label>
                    <asp:RadioButtonList ID="rdbWhoAreYou" runat="server">
                        <asp:ListItem Value="1">Company/Organization </asp:ListItem>
                        <asp:ListItem Value="0">Educational institution/Tutors/Online service provider/Other</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <label>Page Name</label>
                    <asp:TextBox ID="txtName" required="required" runat="server" CssClass="form-control" placeholder="Page Name"></asp:TextBox>
                </div>
                <div class="form-group">

                    <asp:Button ID="ssf" runat="server" Text="Proceed" OnClick="ssf_Click" CssClass="pagebtn pagebtn-blue" />
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="container coursekatta-layout-1 ">
                <br />
                <h4>Your Company/Organization Pages</h4>
                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" DataSourceID="SqlDataSource1">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No Pages Created yet</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:LinkButton Text='<%# Eval("varCollegeName") %>' runat="server" ID="varCollegeNameLabel" CommandArgument='<%# Eval("intCollegeId")+";"+Eval("isTutor") %>' CommandName="viewPage" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>

                        <table runat="server" id="itemPlaceholderContainer" class="table" style="" border="0">

                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>

                    </LayoutTemplate>

                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
            </div>
            <div class="container coursekatta-layout-1 ">
                <br />
                <h4>Your Educational institution/Other Pages</h4>
                <asp:ListView ID="ListView2" runat="server" OnItemCommand="ListView1_ItemCommand" DataSourceID="SqlDataSource2">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No Pages Created yet</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:LinkButton Text='<%# Eval("varCollegeName") %>' runat="server" ID="varCollegeNameLabel" CommandArgument='<%# Eval("intCollegeId")+";"+Eval("isTutor") %>' CommandName="viewPage" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>

                        <table runat="server" id="itemPlaceholderContainer" class="table" style="" border="0">

                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>

                    </LayoutTemplate>

                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

