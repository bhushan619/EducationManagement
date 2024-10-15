<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="Appointments.aspx.cs" Inherits="User_Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="rating/rating.css" rel="stylesheet" />
    <script src="rating/rating.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.rating').rating();

            $('.ratingEvent').rating({ rateEnd: function (v) { $('#result').text(v); } });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"
                       SelectCommand = "SELECT DISTINCT intCollegeId,varCollegeName,varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo,varCollegeEmail, varCollegeWeb, varPhoto FROM tblcollegedetails WHERE (intCollegeId = @id)">
                       <SelectParameters>
                           <asp:QueryStringParameter Name="id" QueryStringField="id" />
                       </SelectParameters>
                    </asp:SqlDataSource>


                    <i class="fa fa-graduation-cap"></i>

                    <asp:Label ID="lbluni" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
                    <br />
                    <i class="fa fa-flag "></i>

                    <asp:Label ID="lblnaac" runat="server" Text="Label" CssClass="lllbl"></asp:Label>
                    <br />
                    <br />
                    <asp:LinkButton ID="btnlike" runat="server" Visible="false"
                        OnClick="btnlike_Click">    
                        <i class="fa fa-thumbs-o-up fa-lg"  ></i>
                    </asp:LinkButton>




                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <asp:Button ID="Button1" CommandName="apply" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue"
                            OnClick="btnApply_Click" Text="Apply"></asp:Button>
                    </div>
                    <div class="col-lg-7">
                        <asp:Button ID="btnVisit" CommandName="visit" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue"
                            OnClick="btnVisit_Click" Text="Schedule Visit"></asp:Button>
                    </div>


                </div>
                <br />
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

                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkbtnbroucher_Click" ToolTip="Download Brochure">
                              <i class="fa fa-globe" style="color: #49575f"></i></asp:LinkButton>
                                <br />

                            </div>
                            <div class="col-lg-2 myborder mypad ">

                                <asp:LinkButton ID="imgBrochure" runat="server" OnClick="lnkbtnbroucher_Click" ToolTip="Download Brochure">
                              <i class="fa fa-download" style="color: #49575f"></i></asp:LinkButton>
                                <br />

                            </div>
                            <div class="col-lg-2 myborder mypad ">

                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lblColgWeb_Click" ToolTip="Visit Site">
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
                                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="fbLink_Click" ToolTip="Visit Facebook Page" /><br />

                            </div>
                            <div class="col-lg-2 myborder mypad">

                                <i class="fa fa-twitter" style="color: #49575f"></i>
                                <asp:LinkButton ID="LinkButton7" runat="server" OnClick="twLink_Click" ToolTip="Visit Twitter Page" /><br />

                            </div>
                            <div class="col-lg-2 myborder mypad">

                                <i class="fa fa-google-plus" style="color: #49575f"></i>
                                <asp:LinkButton ID="LinkButton8" runat="server" OnClick="gpLink_Click" ToolTip="Visit Google Plus Page" /><br />

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
                        <asp:Button ID="Btnsave" Width="100%" runat="server" Text="Submit" CssClass="pagebtn pagebtn-blue" OnClick="Btnsave_Click" />

                    </div>
                </div>
                <br />
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
                                <asp:Button ID="Button2" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" Text="Reply" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
     <div class="col-lg-6 table-responsive">	
          <div class="container coursekatta-layout-1">
                <div class="col-md-12">
                <div style="text-align: center">
                    <asp:Label ID="Lbldetail" CssClass="title-news" runat="server" Font-Size="20px" Text="Welcome to " font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
                    <asp:Label ID="lblCollegName" CssClass="title-news" runat="server" Font-Size="20px" Text="Label" font-family="Gotham SSm A" ForeColor="#7B7B7B"></asp:Label>
                </div>
            </div>
                    </div>
           <div class="container coursekatta-layout-1">
               <br />
                <div id="apponts" runat="server">
                <h3>Appointments</h3>
                <asp:GridView ID="grdAppointment" runat="server" AutoGenerateColumns="false"
                    OnRowDataBound="OnRowDataBoundAppointment"
                    CssClass="table" EmptyDataText="No Appointments">
                </asp:GridView>
                <h3>Applications</h3>
                <asp:GridView ID="grdApplied" runat="server" AutoGenerateColumns="false"
                    OnRowDataBound="OnRowDataBoundApplied"
                    CssClass="table" EmptyDataText="No Colleges Applied">
                </asp:GridView>
            </div>
               </div>
         </div>
           <div class="col-lg-3">
                <div class="coursekatta-layout-1">
               
                    <div style=" text-align: center">
                            <asp:Button ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue"   Text="My appointments"></asp:Button>
                 
                </div>
                    </div>
                                <div class="adStructure rlp-table">
                                    <span class="ad">AD</span>
                                    <h2>Promote yourself with coursekatta
                                    </h2>
                                    <h1>www.coursekatta.com</h1>
                                    <a href="http://coursekatta.com" class="adbtn adbtn-blue" target="_blank">Click Here</a>
                                    <p>To Advertize</p>
                                </div>
                                <div class="adStructure rlp-table">
                                    <span class="ad">AD</span>
                                    <h2>Quality Work with ontime delivery
                                    </h2>
                                    <h1>www.anuvaasoft.com</h1>
                                    <a href="http://anuvaasoft.com" class="adbtn adbtn-blue" target="_blank">Get Quote</a>
                                </div>


                            </div>
</asp:Content>

