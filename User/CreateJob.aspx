<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="CreateJob.aspx.cs" Inherits="User_CreateJob" %>

 <%@ Import Namespace="RegExForAspx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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

                    <asp:Image ID="imgCollege" runat="server" ImageUrl='<%# "~/Tutor/media/" + Eval("varPhoto") %>' Height="150px" Width="150px" class="center-block myborder img-circle img-responsive" />
                    <br />
                    <asp:HyperLink ID="CompanyView" runat="server" NavigateUrl='<%# "~/User/ViewCompany.aspx?id=" + Eval("intCollegeId") %>' >
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
 
        </div>

        <div class="container coursekatta-layout-1">
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
        </div>
        <div class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Media</label>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="col-lg-2 myborder mypad ">

                        <asp:LinkButton ID="LinkButton2" runat="server"   ToolTip="Download Brochure">
                              <i class="fa fa-globe" style="color: #49575f"></i></asp:LinkButton>
                        <br />

                    </div>
                    <div class="col-lg-2 myborder mypad ">

                        <asp:LinkButton ID="imgBrochure" runat="server"  ToolTip="Download Brochure">
                              <i class="fa fa-download" style="color: #49575f"></i></asp:LinkButton>
                        <br />

                    </div>
                    <div class="col-lg-2 myborder mypad ">

                        <asp:LinkButton ID="LinkButton1" runat="server"   ToolTip="Visit Site">
                            <i class="fa fa-at" style="color: #49575f"></i> <br />  
                        </asp:LinkButton>
                    </div>

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

                        <i class="fa fa-facebook" style="color: #49575f"></i>
                        <asp:LinkButton ID="LinkButton6" runat="server"   ToolTip="Visit Facebook Page" /><br />

                    </div>
                    <div class="col-lg-2 myborder mypad">

                        <i class="fa fa-twitter" style="color: #49575f"></i>
                        <asp:LinkButton ID="LinkButton7" runat="server"   ToolTip="Visit Twitter Page" /><br />

                    </div>
                    <div class="col-lg-2 myborder mypad">

                        <i class="fa fa-google-plus" style="color: #49575f"></i>
                        <asp:LinkButton ID="LinkButton8" runat="server"  ToolTip="Visit Google Plus Page" /><br />

                    </div>
                </div>
            </div>
            <br />
        </div>

        <div id="feedback" class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Rating and Feedback</label>

            <div class="form-group" style="margin-left: 50px; padding-bottom: 15px;">

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
                <asp:Button ID="Btnsave" Width="100%" runat="server" Text="Submit"
                     CssClass="pagebtn pagebtn-blue"  />
            </div>
        </div>
      
        <div id="reviews" class="container coursekatta-layout-1">
            <br />
            <label style="font-size: 16px">Reviews and Recommendations</label>
            <div class="row ">
                <div class="col-lg-12 rlp-table">
                    <div class="col-lg-4 ">
                        <img src="media/NoProfile.png" height="100" width="100" class="img-circle center-block img-responsive" />
                    </div>
                    <div class="col-lg-8 ">
                        Bhushan Savale<br />
                        02-02-2017<br />
                    </div>
                    <div class="col-lg-4 ">
                        Rated:4
                    </div>
                    <div class="col-lg-12 form-group">
                        <asp:TextBox placeholder="Review or comment.." TextMode="MultiLine" ID="ss" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-12 form-group">
                        <asp:Button ID="ssf" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" Text="Reply" />
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-12 rlp-table">
                    <div class="col-lg-4 ">
                        <img src="media/NoProfile.png" height="100" width="100" class="img-circle center-block img-responsive" />
                    </div>
                    <div class="col-lg-8 ">
                        Mayur Potdar<br />
                        02-02-2017<br />
                    </div>
                    <div class="col-lg-4 ">
                        Rated:5
                    </div>
                    <div class="col-lg-12 form-group">
                        <asp:TextBox placeholder="Review or comment.." TextMode="MultiLine" ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-12 form-group">
                        <asp:Button ID="Button1" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" Text="Reply" />
                    </div>
                </div>
            </div>
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
                <div class="col-lg-12 text-center">
                    <div class="col-md-2 myborder efHover">
                        <h4><i class="fa fa-heart "></i>
                        </h4>
                        <asp:Label ID="lbllike" runat="server" Text="Like" CssClass="lllbl"></asp:Label>
                    </div>
                    <div class="col-md-2 myborder efHover">

                        <h4><i class="fa fa-rss "></i>

                        </h4>
                        <asp:Label ID="Label1" runat="server" Text="Follow" CssClass="lllbl"></asp:Label>


                    </div>

                    <div class="col-md-2 myborder efHover">

                        <h4><i class="fa fa-comment fa-lg "></i>

                        </h4>
                        <asp:Label ID="lblviews" runat="server" Text="Message" CssClass="lllbl"></asp:Label>


                    </div>

                    <div class="col-md-2 myborder efHover">
                        <h4><i class="fa fa-star "></i>
                            <br />
                        </h4>
                        <asp:Label ID="Label6" runat="server" Text="Rating" CssClass="lllbl"></asp:Label>

                    </div>

                    <div class="col-md-2 myborder efHover">
                        <h4><a href="#facility"><i class="fa fa-users "></i>
                        </a></h4>
                        <asp:Label ID="Label5" runat="server" Text="Members" CssClass="lllbl"></asp:Label>

                    </div>
                    <div class="col-md-2 myborder efHover">
                      <asp:HyperLink ID="JobsView" runat="server" >
                           <h4> <i class="fa fa-briefcase "></i>
                        </h4>
                        <asp:Label ID="Label4" runat="server" Text="Jobs" CssClass="lllbl"></asp:Label>
                          </asp:HyperLink>
                    </div>
                </div>

            </div>
      
             <div class="container nopadding coursekatta-layout-1">
         
              <asp:HyperLink ID="createJob" runat="server" CssClass="pagebtn pagebtn-blue pull-left" Text="Create Job"  />
                     <asp:HyperLink ID="ViewMyJobs" runat="server" CssClass="pagebtn pagebtn-blue pull-right" Text="View Job Postings" />
         
                 </div>
            
                  <div id="courses" class="container coursekatta-layout-1">
                <br />
                <label class="title-news" style="font-size: 22px">Create New Job</label>
             <div class="form-group"></div>
                      <div class="form-group">
                        <label>Designation</label>
                            <asp:TextBox ID="txtName" placeholder="Designation" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        <label>About the job opportunity</label>
                            <asp:TextBox ID="TextBox2" placeholder="About the job opportunity" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                      <div class="form-group">
                        <label>Job Responsibilities</label>
                            <asp:TextBox ID="TextBox3" placeholder="Job Responsibilities" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        <label>Qualification Required</label>
                            <asp:TextBox ID="TextBox5" placeholder="Qualification Required" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div> 
                       <div class="form-group">
                        <label>Skills required</label>
                            <asp:TextBox ID="TextBox4" placeholder="Skills required" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        <label>Salary</label>
                            <asp:TextBox ID="TextBox6" placeholder="Salary" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        <label>Last Date of application</label>
                            <asp:TextBox ID="TextBox7" placeholder="Last Date of application" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                      <div class="form-group">
                        <label>Listing For 1 Month</label>
                            <asp:TextBox ID="TextBox8"   Enabled="false" Text="500" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                      <div class="form-group">
                          By clicking Promote, you agree to the coursekatta User Agreements, Terms and Conditions, Privacy Policy and Cookie Policy.
                      </div>
                       <div class="form-group">
                       <asp:HyperLink ID="HyperLink1" runat="server" CssClass="pagebtn  pagebtn-blue pull-left" Text="Cancel"  />
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="pagebtn pagebtn-blue pull-right" Text="Promote"  /> 
                       </div>
                <br />  <br />
            </div>


        </div>
        <div id="timelineView" runat="server" visible="false">
            <div id="fb-root"></div>

            <div class="box box-primary">
                <div class="box box-primary">
                    <div class="rlp-table">
                        <asp:ListView ID="ListView2" runat="server"
                            OnItemCommand="ListView2_ItemCommand">
                            <ItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <div class="box-footer rlp-table" style="margin: 5px 0px">

                                            <div class='box-header with-border'>
                                                <div class='user-block'>
                                                    <img class='img-circle' src='<%# "media/"+ Eval("varPhoto")%>' alt='user image'>
                                                    <span class='username'><%#Eval("Name")%></span>
                                                    <span class='description'>Shared publicly - <%#Eval("Times")%>&nbsp<asp:Label ID="LblDate" runat="server" Text='<%#Eval("Dates")%>'></asp:Label></span>
                                                </div>
                                                <!-- /.user-block -->

                                            </div>
                                            <!-- /.box-header -->
                                            <div class='box-body rlp-table' style="margin-bottom: 5px">
                                                <p style="font-size: 18px; color: #000;">
                                                    <%#Eval("Post_Description")%>
                                                </p>
                                                <div id="gallery">
                                                    <ul>
                                                        <li>
                                                            <a href='<%# "../" + Eval("PostImage") %>'>
                                                                <asp:Image runat="server" ID="ssss" CssClass="img-responsive" Visible='<%# "~/"+ Eval("PostImage").ToString() ==  "~/PostImages/NoImage.png"?false:true %>' ImageUrl='<%# "~/"+ Eval("PostImage")%>' AlternateText="Photo" Style="min-width: 100%;" />
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="rlp-table" style="margin-bottom: 5px">
                                                <span class='pull-left'>
                                                    <asp:LinkButton ID="LinkButton1s" runat="server" CssClass="" CommandName="LikePost" CommandArgument='<%#Eval("Post_Id")%>'><i class='fa fa-thumbs-o-up'></i> Like</asp:LinkButton>
                                                </span>
                                                <span class='pull-left' style="padding-left: 20px;">
                                                    <div class="fb-share-button" data-href="https://www.coursekatta.com/<%#Eval("PostImage")%>" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.coursekatta.com%2F&amp;src=sdkpreparse">Share</a></div>
                                                    <asp:HiddenField ID="postId" runat="server" Value='<%#Eval("Post_Id")%>' />
                                                    <asp:HiddenField ID="VoteHidden" runat="server" Value='<%#Eval("Vote")%>' />
                                                    <asp:HiddenField ID="HdnApprove" runat="server" Value='<%#Eval("Approve")%>' />

                                                </span>
                                                <span class='pull-right text-muted'>
                                                    <asp:Label ID="lblLikes" runat="server" Text="0"></asp:Label>
                                                    Likes 
                                                        - 
                                                        <asp:Label ID="LblComment" runat="server" Text="0"></asp:Label>
                                                    Comments</span>
                                                <br />
                                            </div>



                                            <div class="box-footer rlp-table" style="margin-bottom: 5px">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class="pull-left">
                                                            <asp:Image ID="Image2" runat="server" class="img-responsive img-circle img-sm"></asp:Image>

                                                            <div class="pull-right" style="width: 470px;">
                                                                <asp:TextBox ID="TxtComment" Width="100%" runat="server" class="form-control" placeholder="Give your comment"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <asp:Button ID="BtnSubmitComment" runat="server" class="pagebtn pagebtn-blue pull-right" Style="margin-right: 15px;" CommandName="SubmitComment" CommandArgument='<%#Eval("Post_Id")%>' Text="Post"></asp:Button>


                                                </div>
                                            </div>
                                            <div class='box-footer box-comments'>

                                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                    <ItemTemplate>
                                                        <div class='box-comment'>
                                                            <!-- User image -->
                                                            <img class='img-circle img-sm' src='<%#  "media/"+ Eval("varPhoto")%>' alt='user image'>
                                                            <div class='comment-text'>
                                                                <span class="username">
                                                                    <%#Eval("Name")%>
                                                                </span>

                                                                <%#Eval("Comment")%>
                                                            </div>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                                                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                                                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'
                                                    SelectCommand="SELECT tbl_likecomment.Comment, tbluserdetails.varuserName AS Name, tbluserdetails.varPhoto FROM tbl_likecomment INNER JOIN tbluserdetails ON tbl_likecomment.intuserId = tbluserdetails.intuserId where tbl_likecomment.Post_Id=@postid and tbl_likecomment.Comment IS NOT NULL order by tbl_likecomment.Id desc LIMIT 3">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="postId" Name="postid" PropertyName="Value" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <!-- /.box-footer -->

                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="ItemCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="ItemDataBound" />
                                        <asp:AsyncPostBackTrigger ControlID="Repeater1" EventName="ItemDataBound" />
                                        <asp:AsyncPostBackTrigger ControlID="Repeater1" EventName="ItemCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h1>
                                    <center>  <i class="fa fa-hand-spock-o" aria-hidden="true"></i> There are no post to show !</center>
                                </h1>

                            </EmptyDataTemplate>
                        </asp:ListView>

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
                            <asp:HyperLink ID="CompanyView" runat="server" NavigateUrl='<%#  Eval("isTutor").ToString().Equals("1")? "~/User/ViewCompany.aspx?id=" + Eval("intCollegeId"):"~/User/ViewCollege.aspx?id=" + Eval("intCollegeId") %>'><asp:Label ID="lblCollege" runat="server" Font-Size="20px" Text='<%# Eval("varCollegeName") %>'></asp:Label></asp:HyperLink>
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

