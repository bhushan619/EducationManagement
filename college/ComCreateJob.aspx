<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageClgNoAds.master" AutoEventWireup="true" CodeFile="ComCreateJob.aspx.cs" Inherits="college_ComCreateJob" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/User/TimelineUserControl.ascx" TagPrefix="uc1" TagName="TimelineUserControl" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="Server">
     
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

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                            <asp:LinkButton ID="lbllike" runat="server"> Like    
                            </asp:LinkButton>
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

            <div id="courses" class="container coursekatta-layout-1">
                <br />
                <label class="title-news" style="font-size: 22px">Create New Job</label>
                <div class="form-group"></div>
                <div class="form-group">
                    <label>Designation</label>
                    <asp:TextBox ID="txtDesignation" ValidationGroup="jobss" placeholder="Designation" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtDesignation"
                        Text="Designation is required." />
                </div>
                <div class="form-group">
                    <label>About the job opportunity</label>
                    <asp:TextBox ID="txtopportunity" ValidationGroup="jobss" placeholder="About the job opportunity" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtopportunity"
                        Text="Opportunity is required." />
                </div>
                <div class="form-group">
                    <label>Job Responsibilities</label>
                    <asp:TextBox ID="txtResponsibilities" ValidationGroup="jobss" placeholder="Job Responsibilities" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtResponsibilities"
                        Text="Responsibilities is required." />
                </div>
                <div class="form-group">
                    <label>Qualification Required</label>
                    <asp:TextBox ID="txtQualification" ValidationGroup="jobss" placeholder="Qualification Required" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtQualification"
                        Text="Qualification is required." />
                </div>
                <div class="form-group">
                    <label>Skills required</label>
                    <asp:TextBox ID="txtSkills" ValidationGroup="jobss" placeholder="Skills required" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtSkills"
                        Text="Skills is required." />
                </div>
                <div class="form-group">
                    <label>Yearly Salary</label>
                    <asp:TextBox ID="txtSalary" ValidationGroup="jobss" placeholder="Salary" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtSalary"
                        Text="Salary is required." />
                </div>
                <div class="form-group">
                    <label>Last Date of application</label>
                    <asp:TextBox ID="txtDate" ValidationGroup="jobss" placeholder="Last Date of application" CssClass="form-control" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtDob_CalendarExtender" runat="server"
                        Format="dd-MM-yyyy" Enabled="True" TargetControlID="txtDate"></cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="jobss"
                        ControlToValidate="txtDate"
                        Text="Principal is required." />
                </div>
                <div class="form-group">
                    <label>Listing For 1 Month</label>
                    <asp:TextBox ID="txtListing" ValidationGroup="jobss" Enabled="false" Text="500" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    By clicking Promote, you agree to the coursekatta User Agreements, Terms and Conditions, Privacy Policy and Cookie Policy.
                </div>
                <div class="form-group">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="pagebtn  pagebtn-blue pull-left" Text="Cancel" />
                    <asp:Button ValidationGroup="jobss" OnClick="HyperLink2_Click" ID="HyperLink2" runat="server" CssClass="pagebtn pagebtn-blue pull-right" Text="Promote" />
                </div>
                <br />
                <br />
            </div>


        </div>

    </div>
    <div class="col-lg-2">
        <div class="coursekatta-layout-1">

            <div style="text-align: center">
                <asp:LinkButton ID="Button2" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button2_Click" Text="Page View"></asp:LinkButton>
                <asp:Button Visible="false" ID="Button3" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button3_Click" Text="Page View"></asp:Button>
                <asp:LinkButton ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" PostBackUrl="~/college/ComSettings.aspx" Style="margin-top: 5px" Text="Page Settings"></asp:LinkButton>
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

