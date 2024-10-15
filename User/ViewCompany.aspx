<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="ViewCompany.aspx.cs" Inherits="User_ViewCompany" %>

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
                    <asp:HyperLink ID="CompanyView" runat="server" NavigateUrl='<%# "~/User/ViewCompany.aspx?id=" + Eval("intCollegeId") %>'>
                        <asp:Label ID="lblCollege" runat="server" Font-Size="20px" Text='<%# Eval("varCollegeName") %>'></asp:Label>
                    </asp:HyperLink>
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
                ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                SelectCommand="SELECT DISTINCT intCollegeId,varCollegeName,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo,varCollegeEmail, varCollegeWeb, varPhoto FROM tblcollegedetails WHERE (intCollegeId = @varCollegeCity)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="varCollegeCity"
                        QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <i class="fa fa-building"></i>

            <asp:Label ID="lbluni" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
            <br />
            <i class="fa fa-flag "></i>

            <asp:Label ID="lblnaac" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
            <br />
            <br />
        </div>

        <%--<div class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Invite to like page</label>
            <div class="row">
                <div class="col-lg-2">
                    <i class="fa fa-heart" style="color: #49575f"></i>
                </div>
                <div class="col-lg-10">
                    Invite friends to Like
                </div>
                <div class="col-lg-2">
                    <i class="fa fa-rss" style="color: #49575f"></i>
                </div>
                <div class="col-lg-10">
                    Invite friends to Follow
                </div>
                <div class="col-lg-2">
                    <i class="fa fa-user-plus" style="color: #49575f"></i>
                </div>
                <div class="col-lg-10">
                    People who Follow
                </div>

            </div>

            <br />
        </div>--%>
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

                        <asp:HyperLink Target="_blank"  ID="lnkVideo" runat="server" ToolTip="Video Link">
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
                    <asp:Label ID="Lbldetail" CssClass="title-news" runat="server" Font-Size="20px" Text="Welcome to " font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
                    <asp:Label ID="lblCollegName" CssClass="title-news" runat="server" Font-Size="20px" Text="Label" font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
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
                            <asp:LinkButton ID="lbllike" runat="server"
                                OnClick="btnlike_Click"> Like    
                            </asp:LinkButton>
                        </a>
                        </h4>
                    </div>
                    <div class="col-md-2 myborder efHover">

                        <h4><a href="#about"><i class="fa fa-building "></i>

                            <br />
                            Overview </a>
                        </h4>
                    </div>


                    <div class="col-md-2 myborder efHover">
                        <h4><a href="#courses"><i class="fa fa-cogs "></i>
                            <br />
                            Services</a></h4>
                    </div>
                    <div class="col-md-2 myborder efHover">
                        <h4><a href="#facility"><i class="fa fa-users "></i>
                            <br />
                            Team</a></h4>
                    </div>
                    <div class="col-md-2 myborder efHover">
                        <h4><a href="#media"><i class="fa fa-comments "></i>
                            <br />
                            Reviews</a> </h4>
                    </div>
                    <div class="col-md-2 myborder efHover">
                        <h4>
                            <asp:HyperLink ID="Jobss" runat="server"><i class="fa fa-briefcase "></i>
                                <br />
                                Jobs</asp:HyperLink>
                        </h4>
                    </div>

                </div>

            </div>
            <div class="container coursekatta-layout-1 ">

                <div class="col-md-12  text-center">
                    <br />

                    <div id="gallery">
                        <ul>

                            <asp:ListView ID="lstImages" runat="server"
                                DataSourceID="SqlDataSourceCollegeMedia" GroupItemCount="6">


                                <EmptyDataTemplate>
                                    <table id="Table2" runat="server" style="">
                                        <tr>
                                            <td>No Images</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td id="Td4" runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>

                                <ItemTemplate>
                                    <li>
                                        <a href='<%# "../college/media/" + Eval("varMediaPath") %>'>
                                            <img title='<%# Eval("varMediaName") %>' src='<%# "../college/media/" + Eval("varMediaPath") %>' height="100" width="100" />
                                        </a>
                                    </li>
                                </ItemTemplate>
                                <LayoutTemplate>

                                    <div id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <div id="groupPlaceholder" runat="server" />
                                    </div>
                                </LayoutTemplate>

                            </asp:ListView>
                        </ul>
                        <asp:SqlDataSource ID="SqlDataSourceCollegeMedia" runat="server"
                            ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                            SelectCommand="SELECT intCollegeId, varMediaPath, varMediaName FROM tblcollegemedia WHERE ((intCollegeId = @intCollegeId) AND (varMediaType = @varMediaType)) LIMIT 5">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"
                                    Type="Int64" />
                                <asp:Parameter DefaultValue="Image" Name="varMediaType" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>


            <div class="container coursekatta-layout-1" id="about">
                <br />
                <label class="title-news" style="font-size: 22px">About Company</label>
                <br />
                <asp:Label ID="lblVision" runat="server" Text="Label"></asp:Label><br />
                <br />
                <div>
                    <asp:Label ID="lblObjective" runat="server" Text="Label"></asp:Label>
                </div>
                <br />
            </div>

            <div id="courses" class="container coursekatta-layout-1">
                <br />
                <label class="title-news" style="font-size: 22px">Services</label>
                <asp:SqlDataSource ID="sdsParent" runat="server" ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                    SelectCommand="SELECT distinct intCollegeId,varCourseType FROM tblcollegecourses where (intCollegeId = @intCollegeId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"
                            Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <cc1:Accordion ID="accParent" runat="server" SelectedIndex="0" HeaderCssClass="accordionHeader"
                    HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                    FadeTransitions="True" FramesPerSecond="40" TransitionDuration="250" AutoSize="None"
                    RequireOpenedPane="false" SuppressHeaderPostbacks="true" DataSourceID="sdsParent">
                    <HeaderTemplate>
                        <p class="accpaddingheader">
                            <i class="fa fa-arrow-circle-right" style="color: white"></i><%#Eval("varCourseType")%>
                        </p>
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:Label ID="lblvalue" runat="server" Text='<%#Eval("varCourseType")%>' Visible="false"></asp:Label>
                        <asp:Label ID="lblccid" runat="server" Text='<%#Eval("intCollegeId")%>' Visible="false"></asp:Label>
                        <asp:SqlDataSource ID="sdsChild" runat="server" ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                            SelectCommand="SELECT varCourseName,varCourseDescription,varDuration,varFees,varAffliation,varAccredited,varAdmissionCriteria FROM tblcollegecourses where varCourseType=@Field1 and intCollegeId=@ccid">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblvalue" Name="Field1" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="lblccid" Name="ccid" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <cc1:Accordion ID="accChild" runat="server" SelectedIndex="0" HeaderCssClass="accordionSubHeader"
                            HeaderSelectedCssClass="accordionSubHeaderSelected" ContentCssClass="accordionContent"
                            FadeTransitions="True" FramesPerSecond="40" TransitionDuration="250" AutoSize="None"
                            RequireOpenedPane="false" SuppressHeaderPostbacks="true" DataSourceID="sdsChild">
                            <HeaderTemplate>
                                <p class="accpadding">
                                    <i class="fa fa-arrow-circle-down"></i><%#Eval("varCourseName")%>
                                </p>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <p class="accpaddingcon">Description: <%#Eval("varCourseDescription")%></p>

                            </ContentTemplate>
                        </cc1:Accordion>
                    </ContentTemplate>
                </cc1:Accordion>

                <br />
            </div>



            <div id="facility" class="container coursekatta-layout-1">
                <br />
                <label class="title-news" style="font-size: 22px">Team</label>


                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource22">


                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <div class="col-lg-12 myborder mypad margin-bottom">
                            <div class="col-lg-4 text-center myborder mypad">

                                <asp:Image ID="asaasa" runat="server" class='img-circle' Height="100px" Width="100px" ImageUrl='<%# "~/college/media/"+ Eval("ex1")%>' alt='user image' />

                                <div class="row">
                                    <div class="col-lg-12 col-lg-offset-2 text-center">

                                        <div class="col-lg-2  mypad">


                                            <asp:HyperLink Target="_blank" class="fa fa-facebook" Style="color: #49575f" ID="LinkButton6" runat="server" NavigateUrl='<%# Eval("fb") %>' ToolTip="Visit Facebook Page" /><br />

                                        </div>
                                        <div class="col-lg-2  mypad">


                                            <asp:HyperLink Target="_blank" class="fa fa-twitter" Style="color: #49575f" ID="LinkButton7" runat="server" NavigateUrl='<%# Eval("tw") %>' ToolTip="Visit Twitter Page" /><br />

                                        </div>
                                        <div class="col-lg-2  mypad">


                                            <asp:HyperLink Target="_blank" class="fa fa-google-plus" Style="color: #49575f" ID="LinkButdton8" runat="server" NavigateUrl='<%# Eval("gp") %>' ToolTip="Visit Google Plus Page" /><br />

                                        </div>
                                        <div class="col-lg-2  mypad">


                                            <asp:HyperLink Target="_blank" CssClass="fa fa-linkedin" Style="color: #49575f" ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("lnkd") %>' ToolTip="Visit Google Plus Page" /><br />

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-8">
                                <h2>
                                    <asp:Localize Text='<%# Eval("varFacultyName") %>' runat="server" ID="intCollegeIdLabel" /></h2>
                                <h3>
                                    <asp:Localize Text='<%# Eval("varDegree") %>' runat="server" ID="varDegreeLabel" /></h3>
                                <p>
                                    <asp:Localize Text='<%# Eval("varIntro") %>' runat="server" ID="varIntroLabel" />
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>

                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource22"
                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>

                <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>




            </div>

            <div id="media" class="container coursekatta-layout-1">
                <br />
                <label class="title-news" style="font-size: 22px">Reviews and Recommendations</label>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 rlp-table">
                        <div class="form-group" style="padding-bottom: 15px;">
                            <label>Rating</label>
                            <asp:TextBox ID="txtRating" runat="server" class="rating rating5" value="1"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <asp:TextBox ID="txtFeedback" TextMode="MultiLine" placeholder="Write a review" runat="server" CssClass="form-control"></asp:TextBox>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#txtFeedback').keyboard({
                                        preventPaste: true,
                                        autoAccept: true
                                    })
                                    .addTyping();
                                });
                            </script>
                        </div>
                        <div class="form-group text-right">
                            <asp:Button ID="Btnsave" runat="server" Text="Submit" OnClick="Btnsave_Click"
                                CssClass="pagebtn pagebtn-blue" />
                        </div>
                    </div>
                </div>
                <div class="row ">


                    <asp:ListView ID="lstRating" runat="server" DataSourceID="SqlDataSourceFeedback">


                        <EmptyDataTemplate>
                            <div class="col-lg-8 col-lg-offset-2 rlp-table">
                                <div class="col-lg-4 ">
                                    <span class="text-center">No ratings yet</span>
                                </div>
                            </div>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <div class="col-lg-8 col-lg-offset-2 rlp-table">
                                <div class="col-lg-4 ">
                                    <img src='<%# "media/"+ Eval("varPhoto") %>' height="100" width="100" class="img-circle center-block img-responsive" />
                                </div>
                                <div class="col-lg-8 ">
                                    <asp:Label Text='<%# Eval("varuserName") %>' runat="server" ID="varuserNameLabel" /><br />
                                    <asp:Label Text='<%# Eval("ex1") %>' runat="server" ID="ex1Label" /><br />
                                </div>
                                <div class="col-lg-4 ">
                                    Rated:
                                    <asp:Label Text='<%# Eval("intRating") %>' runat="server" ID="intRatingLabel" /><br />
                                    Commented:
                                    <asp:Label Text='<%# Eval("varComment") %>' runat="server" ID="varCommentLabel" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>

                        </LayoutTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceFeedback"
                        ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                        ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>




                </div>
            </div>
        </div>
        <div id="timelineView" runat="server" visible="false">
            <div id="fb-root"></div>

            <div class="box box-primary">
                <div class="box box-primary">
                    <div class="rlp-table">
                        <uc1:TimelineUserControl runat="server" ID="TimelineUserControl" />
                    </div>
                </div>


            </div>


        </div>
    </div>
    <div class="col-lg-2">
        <div class="coursekatta-layout-1">

            <div style="text-align: center">
                <asp:Button ID="Button2" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button2_Click" Text="Page Timeline"></asp:Button>
                <asp:Button Visible="false" ID="Button3" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" OnClick="Button3_Click" Text="Page View"></asp:Button>


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
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="title" Text='<%# Eval("varCollegeName") %>' NavigateUrl='<%# Convert.ToInt16(Eval("isTutor"))==0? "~/user/ViewCollege.aspx?id=" + Eval("intCollegeId"): "~/user/ViewCompany.aspx?id=" + Eval("intCollegeId")%>'> </asp:HyperLink>

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
