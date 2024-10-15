<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="student_Search" %>

<%@ Register Src="~/user/GoogleMapForASPNet.ascx" TagName="GoogleMapForASPNet" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center ">
            <h3>Your Search Results</h3>
            <br />
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-8  rlp-table">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <uc1:GoogleMapForASPNet ID="GoogleMapForASPNet1" runat="server" />
            </div>
            <div class="col-lg-4  " style="overflow-y: scroll; height: 420px;">

                <div class="col-md-12 rlp-table">

                    <asp:ListView ID="ListView1" runat="server"
                        DataSourceID="SqlDataSourceHomeCollege">

                        <EmptyDataTemplate>
                            No data was returned.
                        </EmptyDataTemplate>
                        <ItemSeparatorTemplate>
                            <br />
                        </ItemSeparatorTemplate>
                        <ItemTemplate>
                            <div class="col-sm-12 rlp-table">

                                <div class="row">
                                    <div class="col-lg-3">
                                                                      <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/college/media/" + Eval("varPhoto") %>' CssClass="img-responsive myborder img-circle center-block searchImage"  />
                                    </div>
                                    <div class="col-lg-9 nopadding">

                                        <div class="coursekatta-content">
                                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="title" Text='<%# Eval("varCollegeName") %>' NavigateUrl='<%# Convert.ToInt16(Eval("isTutor"))==0? "~/user/ViewCollege.aspx?id=" + Eval("intCollegeId"): "~/user/ViewCompany.aspx?id=" + Eval("intCollegeId")%>'> </asp:HyperLink>

                                            <div class="info">
                                                <div class="author item">
                                                    Rating : <i style="color: #1b4969" class="fa fa-star"></i><i style="color: #1b4969" class="fa fa-star"></i><i style="color: #1b4969" class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                </div>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Style="margin-right: .5em;"
                                                    CssClass="pull-right pagebtn pagebtn-blue fa fa-eye" NavigateUrl='<%# Convert.ToInt16(Eval("isTutor"))==0? "~/user/ViewCollege.aspx?id=" + Eval("intCollegeId"): "~/user/ViewCompany.aspx?id=" + Eval("intCollegeId")%>'> </asp:HyperLink>

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

                <asp:SqlDataSource ID="SqlDataSourceHomeCollege" runat="server"
                    ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>


            </div>
        </div>

    </div> 
</asp:Content>
