<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register Src="~/GoogleMapForASPNet.ascx" TagName="GoogleMapForASPNet" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center ">
            <h3>Your Institutions Search Results</h3>
            <br />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-6 nopadding">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <uc1:GoogleMapForASPNet ID="GoogleMapForASPNet1" runat="server" />
                </div>
                <div class="col-lg-2 nopadding" style="overflow-y: scroll; height: 400px;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row news-page-wrapper">
                                <asp:ListView ID="ListView1" runat="server"
                                    DataSourceID="SqlDataSourceHomeCollege">

                                    <EmptyDataTemplate>
                                        No data was returned.
                                    </EmptyDataTemplate>
                                    <ItemSeparatorTemplate>
                                        <br />
                                    </ItemSeparatorTemplate>
                                    <ItemTemplate>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="coursekatta-layout-3 news-gird">
                                                <div class="coursekatta-layout-3-wrapper">
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <div style="margin: 0; padding-top: 20px; width: 100%">
                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/college/media/" + Eval("varPhoto") %>' CssClass="img-responsive myborder" Width="150px" Height="150px" />
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-8">

                                                            <div class="coursekatta-content">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="title" Text='<%# Eval("varCollegeName") %>' NavigateUrl='<%# "~/student/ViewCollege.aspx?id=" + Eval("intCollegeId") %>'> </asp:HyperLink>

                                                                <div class="info">
                                                                    <div class="author item">
                                                                        <i class="fa fa-phone" style="color: #1b4969"></i>
                                                                        <asp:Label ID="Label1" runat="server" CssClass="lblView" Text='<%# Eval("varContactOne") %>'></asp:Label>,
                                                                    </div>
                                                                    <div class="date-time item">
                                                                        <asp:Label ID="Label2" runat="server" CssClass="lblView" Text='<%# Eval("varContactTwo") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="info-more">
                                                                    <div class="view item">
                                                                        <i class="fa fa-envelope" style="color: #1b4969"></i>
                                                                        <p>
                                                                            <asp:Label ID="Label3" runat="server" CssClass="lblView" Text='<%# Eval("varCollegeEmail") %>'></asp:Label>
                                                                        </p>

                                                                    </div>
                                                                    <div class="comment item">
                                                                        <i class="fa fa-at" style="color: #1b4969"></i>
                                                                        <p>
                                                                            <asp:Label ID="Label4" runat="server" CssClass="lblView" Text='<%# Eval("varCollegeWeb") %>'></asp:Label>
                                                                        </p>
                                                                    </div>
                                                                </div>


                                                            </div>

                                                        </div>
                                                        <div class="col-sm-10">
                                                            <br />
                                                            <div class="description">

                                                                <i class="fa fa-map-marker" style="color: #1b4969"></i>
                                                                <asp:Label ID="Label5" CssClass="lblView" runat="server" Text='<%# Eval("varCollegeAddress") %>'></asp:Label>, 
                                        <asp:Label ID="Label6" CssClass="lblView" runat="server" Text='<%# Eval("varCollegeCity") %>'></asp:Label>,
                                     <asp:Label ID="Label7" runat="server" CssClass="lblView" Text='<%# Eval("varCollegeState") %>'></asp:Label><br />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div runat="server" id="itemPlaceholder" />
                                        </div>                      
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSourceHomeCollege" runat="server"
                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>


                </div>
                <div class="col-lg-2 nopadding">
                    asdasd
                    </div>
            </div>
        </div>

    </div>
    <%--  <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h1>SPACE for ADS</h1>
                <h1>SPACE for ADS</h1>
                <h1>SPACE for ADS</h1>
            </div>
        </div>
    </div>--%>
</asp:Content>
