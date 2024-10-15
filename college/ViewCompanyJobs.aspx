﻿<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageClgNoAds.master" AutoEventWireup="true" CodeFile="ViewCompanyJobs.aspx.cs" Inherits="college_ViewCompanyJobs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/User/TimelineUserControl.ascx" TagPrefix="uc1" TagName="TimelineUserControl" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/StyleSheet.css" rel="stylesheet" />
    <script src="assets/js/jquery_002.js"></script>
    <link href="assets/js/jquery.css" rel="stylesheet" />
    <link href="assets/css/tabs.css" rel="stylesheet" />


    <script type="text/javascript">
        $(function () {
            $('#gallery a').lightBox({ fixedNavigation: true });
        });
    </script>
    <style type="text/css">
        /* jQuery lightBox plugin - Gallery style */
        #gallery {
            margin-bottom: 15px;
        }

            #gallery ul {
                list-style: none;
                margin: 0px;
                padding: 0px;
            }

                #gallery ul li {
                    display: inline;
                    padding-right: 6px;
                }

                #gallery ul img {
                }

                #gallery ul a:hover img {
                }

                #gallery ul a:hover {
                    color: #fff;
                }
    </style>
    <link href="rating/rating.css" rel="stylesheet" />
    <script src="rating/rating.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.rating').rating();

            $('.ratingEvent').rating({ rateEnd: function (v) { $('#result').text(v); } });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="col-lg-3">
        <div class="rlp-table">
            <asp:ListView ID="ListView1" runat="server"
                DataSourceID="SqlDataSourceHomeCollege">

                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>

                    <asp:Image ID="imgCollege" runat="server" ImageUrl='<%# "~/college/media/" + Eval("varPhoto") %>' Height="150px" Width="150px" class="center-block myborder img-circle img-responsive" />
                    <br />
                    <asp:Label ID="lblCollege" runat="server" Font-Size="20px" Text='<%# Eval("varCollegeName") %>'></asp:Label>
                    <br />

                    <%-- 
                            <br />Web:<asp:HyperLink ID="lblUrl"
                                Target="_blank" NavigateUrl='<%# Eval("varCollegeWeb") %>' runat="server" Text='<%# Eval("varCollegeWeb") %>'></asp:HyperLink>
                            <br />
                            <br />
                            <i class="fa fa-envelope"></i>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("varCollegeEmail") %>'></asp:Label></a>
                            <br />--%>
                    <br />
                    <i class="fa fa-phone"></i>
                    <asp:Label ID="lblContact" runat="server" Text='<%# Eval("varContactOne") %>'></asp:Label>
                    <br />
                    <%--<br />
                            <i class="fa fa-phone-square"></i>
                            <asp:Label ID="lblContactT" runat="server" Text='<%# Eval("varContactTwo") %>'></asp:Label>
                            <br />--%>
                    <br />
                    <%--   <br />--%>
                    <div class="description">
                        <asp:Label ID="lblAddress" CssClass="lblView" runat="server" Text='<%# Eval("varCollegeAddress") %>'></asp:Label>,
                                                           <asp:Label ID="lblCity" CssClass="lblView" runat="server" Text='<%# Eval("varCollegeCity") %>'></asp:Label>,
                                                           <asp:Label ID="lblState" runat="server" CssClass="lblView" Text='<%# Eval("varCollegeState") %>'></asp:Label>
                    </div>
                    <br />
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <div runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceHomeCollege" runat="server"
                ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"></asp:SqlDataSource>


            <i class="fa fa-building"></i>

            <asp:Label ID="lbluni" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
            <br />
            <i class="fa fa-flag "></i>

            <asp:Label ID="lblnaac" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
            <br />
            <br />
            <asp:Label ID="btnlike" runat="server" Visible="false">    
                        <i class="fa fa-thumbs-o-up fa-lg"  ></i>
            </asp:Label>




        </div>

        <br />

        <div class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Media</label>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="col-lg-2 myborder mypad ">

                        <asp:HyperLink Target="_blank" class="fa fa-globe" Style="color: #49575f" ID="lnkWebsite" runat="server" ToolTip="Website Link">
                        </asp:HyperLink>
                        <br />

                    </div>
                    <div class="col-lg-2 myborder mypad ">

                        <asp:LinkButton ID="imgBrochure" OnClick="lnkbtnbroucher_Click" runat="server" ToolTip="Download Brochure">
                              <i class="fa fa-download" style="color: #49575f"></i></asp:LinkButton>
                        <br />

                    </div>
                    <div class="col-lg-2 myborder mypad ">

                        <asp:HyperLink Target="_blank" ID="lnkVideo" runat="server" ToolTip="Video Link">
                              <i class="fa fa-video-camera" style="color: #49575f"></i></asp:HyperLink>
                        <br />

                    </div>
                    <%-- <div class="col-lg-2 myborder mypad ">

                        <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Visit Site">
                            <i class="fa fa-at" style="color: #49575f"></i> <br />  
                        </asp:LinkButton>
                    </div>--%>
                </div>
            </div>
            <br />
        </div>
        <div class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Social Media</label>
            <div class="row">
                <div class="col-lg-12 text-center">

                    <div class="col-lg-2 myborder mypad">

                        <asp:HyperLink class="fa fa-facebook" Style="color: #49575f" Target="_blank" ID="lnkFacebook" runat="server" ToolTip="Visit Facebook Page" /><br />

                    </div>
                    <div class="col-lg-2 myborder mypad">


                        <asp:HyperLink Target="_blank" ID="lnkTwitter" class="fa fa-twitter" Style="color: #49575f" runat="server" ToolTip="Visit Twitter Page" /><br />

                    </div>
                    <div class="col-lg-2 myborder mypad">


                        <asp:HyperLink Target="_blank" ID="lnkGplus" class="fa fa-google-plus" Style="color: #49575f" runat="server" ToolTip="Visit Google Plus Page" /><br />

                    </div>
                    <div class="col-lg-2 myborder mypad">


                        <asp:HyperLink Target="_blank" ID="lnkLinkedIn" class="fa fa-linkedin" Style="color: #49575f" runat="server" ToolTip="Visit LinkedIn" /><br />

                    </div>
                </div>
            </div>
            <br />
        </div>


    </div>
    <div class="col-lg-7">
        <div class="container coursekatta-layout-1">
            <div class="col-md-12">
                <div style="text-align: center">
                    <asp:Label ID="Lbldetail" CssClass="title-news" runat="server" Font-Size="22px" Text="Welcome to " font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
                    <asp:Label ID="lblCollegName" CssClass="title-news" runat="server" Font-Size="22px" Text="Label" font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
                </div>
            </div>
        </div>

        <div id="profileView" runat="server">
              <div class="container coursekatta-layout-1">
                <br />
                <div class="col-lg-12  text-center">
                    <div class="col-md-2 myborder efHover">

                        <h4><a><i class="fa fa-heart "></i>

                            <br />
                            <asp:Label ID="lbllike" runat="server"
                                > Like    
                            </asp:Label>
                        </a>
                        </h4>
                    </div>
                    <div class="col-md-2 myborder efHover">

                        <h4><a>
                            <i class="fa fa-building "></i>
                            <br />
                            <asp:LinkButton ID="OverView" runat="server">
                            Overview </asp:LinkButton>
                        </a></h4>
                    </div>

                    <div id="forCompany" runat="server" visible="false">
                    <div class="col-md-2 myborder efHover">
                        <h4><a><i class="fa fa-cogs "></i>
                            <br />
                            <asp:LinkButton ID="Services" runat="server">
                            Services </asp:LinkButton></a></h4>
                    </div>
                    <div class="col-md-2 myborder efHover">
                        <h4><a><i class="fa fa-users "></i>
                            <br />
                            <asp:LinkButton ID="Team" runat="server">
                            Team </asp:LinkButton></a></h4>
                    </div>
                        </div>
                     <div id="forCollege" runat="server" visible="false">
                     <div class="col-md-2 myborder efHover">
                            <h4><a href="#courses"><i class="fa fa-book "></i>
                                <br />
                                Courses</a></h4>
                        </div>
                        <div class="col-md-2 myborder efHover">
                            <h4><a href="#facility"><i class="fa fa-server "></i>
                                <br />
                                Facility</a></h4>
                        </div>
                         </div>
                    <div class="col-md-2 myborder efHover">
                        <h4><a><i class="fa fa-comments "></i>
                            <br />
                            <asp:LinkButton ID="Reviews" runat="server">
                            Reviews </asp:LinkButton></a> </h4>
                    </div>
                    <div class="col-md-2 myborder efHover">
                        <h4>
                            <asp:HyperLink ID="Jobss" NavigateUrl="~/college/ViewCompanyJobs.aspx" runat="server"><i class="fa fa-briefcase "></i>
                                <br />
                                Jobs</asp:HyperLink>
                        </h4>
                    </div>

                </div>

            </div>

            <div class="container nopadding coursekatta-layout-1">

               <div class="container nopadding coursekatta-layout-1">
                <div class="row">
                    <div class="col-sm-4">
                        <asp:HyperLink ID="createJob" runat="server" CssClass="pagebtn pagebtn-blue" Text="Create Job" />

                    </div>
                    <div class="col-sm-4">
                        <asp:HyperLink ID="ViewMyJobs" runat="server" CssClass="pagebtn pagebtn-blue" Text="View Job Postings" />

                    </div>
                    <div class="col-sm-4">
                        <asp:HyperLink ID="ViewApplications" runat="server" CssClass="pagebtn pagebtn-blue" Text="View Job Applications" />
                    </div>
                </div>

            </div>
            </div>

            <div id="courses" class="container coursekatta-layout-1">
                <asp:Repeater ID="GridView1" runat="server" OnItemCommand="GridView1_ItemCommand" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <a class="panel-title accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-2" href="#<%#Eval("intId")%>" aria-expanded="false">
                                    <div class="accordionHeader facPadding"> 
                                        <i class="fa fa-arrow-circle-down" style="color: #fff"></i> <%#Eval("varDesignation")%>
                                    </div>
                                </a> 
                                <div id="<%#Eval("intId")%>" aria-expanded="false" style="height: 0px;" class="panel-collapse collapse myborder">
                                    <div class="panel-body pull-left">
                                     Opportunity: <%#Eval("varopportunity")%><br />
                                        CTC: <%#Eval("varSalary")%><br />
                                      
                                        Qualification: <%#Eval("varQualification")%><br />
                                        Skills Req.: <%#Eval("varSkills")%><br />
                                          Last Date: <%#Eval("varDate")%><br />
                                   </div>
                                     <div class="pull-right">
                                     <asp:Button ID="deletes" runat="server"
                                    Text="Delete" class="pagebtn pagebtn-blue"
                                    CommandName="deletes"
                                    CommandArgument='<%# Eval("intId") %>'>
                                </asp:Button>
                                    </div>  
                                </div>
                              
                            </ItemTemplate>
                        </asp:Repeater>
                   <br />
                     <%--<asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="intId" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="varDesignation" HeaderText="Designation" SortExpression="varDesignation"></asp:BoundField>
                        <asp:BoundField DataField="varopportunity" HeaderText="Opportunity" SortExpression="varopportunity"></asp:BoundField>
                        <asp:BoundField DataField="varSalary" HeaderText="Salary" SortExpression="varSalary"></asp:BoundField>
                        <asp:BoundField DataField="varDate" HeaderText="Date" SortExpression="varDate"></asp:BoundField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="deletes" runat="server"
                                    Text="Delete" class="button btn-primary"
                                    CommandName="deletes"
                                    CommandArgument='<%# Eval("intId") %>'>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No Jobs Posted Yet
                    </EmptyDataTemplate>
                </asp:GridView>--%>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
            </div>


        </div>

    </div>
    <div class="col-lg-2">
        <div class="coursekatta-layout-1">

            <div style="text-align: center">
                <asp:LinkButton ID="Button2" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button2_Click" Text="Page View"></asp:LinkButton>
                <asp:Button Visible="false" ID="Button3" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button3_Click" Text="Page View"></asp:Button>
                <asp:LinkButton ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button4_Click" Style="margin-top: 5px" Text="Page Settings"></asp:LinkButton>
                <%--                 <asp:LinkButton  ID="Button5" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue"  PostBackUrl="~/college/AdminSetting.aspx"  Text="Page Admin"></asp:LinkButton>--%>
            </div>
        </div>
        <div class="container coursekatta-layout-1 rlp-table">
            <div class="row">


                <h4 class="text-center">Similar Options</h4>
                <hr />
                <asp:ListView ID="ListView3" runat="server" DataKeyNames="intCollegeId"
                    DataSourceID="SqlDataSourceSimilarCollege">
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <div class="col-lg-12 text-center ">
                             <asp:Image ID="imgCollege" runat="server" ImageUrl='<%# "~/college/media/" + Eval("varPhoto") %>' Height="100px" Width="100px" class="center-block myborder img-circle img-responsive" />
                            <asp:Label ID="lblCollege" runat="server" Text='<%# Eval("varCollegeName") %>' font-family="Gotham SSm A" Font-Size="15px" font-weight="normal" color="#414141" CommandArgument='<%# Eval("intCollegeId") %>'></asp:Label>
                            <div class="author item">
                                Rating : <i style="color: #1b4969" class="fa fa-star"></i><i style="color: #1b4969" class="fa fa-star"></i><i style="color: #1b4969" class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                            </div>
                            <hr />

                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <div runat="server" id="itemPlaceholder" />
                        </div>

                    </LayoutTemplate>

                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceSimilarCollege" runat="server"
                    ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                    SelectCommand="SELECT DISTINCT intCollegeId,isTutor, varCollegeName, varPhoto FROM tblcollegedetails where varCollegeCity=(select varCollegeCity from tblcollegedetails where intCollegeId=@intCollegeId) AND intCollegeId!=@intCollegeId order by rand() limit 4">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intCollegeId"
                            QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <br />
            <br />
        </div>
    </div>

</asp:Content>


