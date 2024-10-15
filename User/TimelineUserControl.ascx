<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimelineUserControl.ascx.cs" Inherits="User_TimelineUserControl" %>

<script type="text/javascript">
    window.addEventListener('keydown', function (e) { if (e.keyIdentifier == 'U+000A' || e.keyIdentifier == 'Enter' || e.keyCode == 13) { if (e.target.nodeName == 'INPUT' && e.target.type == 'text') { e.preventDefault(); return false; } } }, true);
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:ListView ID="ListView1" runat="server"
    OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_DataBound">
    <ItemTemplate>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="rlp-table" id='<%# Eval("Post_Id") %>' style="margin: 15px 0px;">

                    <div class='box-header with-border'>
                        <div class='user-block pull-left'>
                            <asp:Image ID="asaasa" runat="server" class='img-circle' ImageUrl='<%# Eval("VOTE").ToString().Equals("0")? "~/User/media/"+ Eval("varPhoto"): "~/college/media/"+ Eval("varPhoto")%>' alt='user image' />
                            <span class='username'><%#Eval("Name")%></span>
                            <span class='description'>Shared publicly - <%#Eval("Times")%>&nbsp<asp:Label ID="LblDate" runat="server" Text='<%#Eval("Dates")%>'></asp:Label></span>
                        </div>
                        <!-- /.user-block -->
                        <div class='pull-right deletepost' >
                            <asp:LinkButton ID="lnkDelete" Visible="false"
                                runat="server" CssClass="fa fa-times" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CommandArgument='<%# Eval("Post_Id") %>' CommandName="deletePost"></asp:LinkButton>
                        </div>
                        
                    </div>
                    <!-- /.box-header -->
                    <div class='box-body ' style="margin-bottom: 5px; border-bottom: 1px solid #f4f4f4;">
                        <p style="font-size: 18px; color: #000;" class="comment more">
                            <%#Eval("Post_Description")%>
                        </p>
                        <div>
                            <asp:Image runat="server" ID="ss" CssClass="img-responsive" Visible='<%# "~/"+ Eval("PostImage").ToString() ==  "~/PostImages/NoImage.png"?false:true %>' ImageUrl='<%# "~/"+ Eval("PostImage")%>' AlternateText="Photo" Style="min-width: 100%;" />
                        </div>
                    </div><asp:HiddenField ID="postId" runat="server" Value='<%# Eval("Post_Id") %>' />
                            <asp:HiddenField ID="userId" runat="server" Value='<%# Eval("intStudentId") %>' />
                            <asp:HiddenField ID="IsUser" runat="server" Value='<%# Eval("Vote") %>' />
                    <div class="" style="padding: 5px;margin-bottom: 15px;">
                        <span class='pull-left'> 
                            <asp:LinkButton ID="likeBtn" runat="server" CssClass=""  ForeColor="#4d4d4d" CommandName="LikePost" CommandArgument='<%#Eval("Post_Id")%>'><i class='fa fa-heart'></i> Like</asp:LinkButton>
                        
                            <asp:LinkButton ID="commentBtn" runat="server" CssClass=""  ForeColor="#4d4d4d"  CommandName="CommentPost" CommandArgument='<%#Eval("Post_Id")%>'><i class='fa fa-comment'></i> Comments</asp:LinkButton>
                        </span>
                        <span class='pull-right text-muted'>
                            <asp:Label ID="lblLikes" runat="server" Text="0"></asp:Label>
                            Likes  -
                            <asp:Label ID="LblComment" runat="server" Text="0"></asp:Label>
                            Comments</span>
                        <br />
                    </div>



                    <div class="box-footer" style="margin-bottom: 5px">
                        <div class="row">

                            <div class="col-lg-10">
                                <div class="input-group" style="width: 100%">
                                    <span class="input-group-addon" style="padding: 1px; width: 32px">
                                        <asp:Image ID="Image2" runat="server" class="img-responsive img-circle img-sm"></asp:Image>
                                    </span>
                                    <asp:TextBox ID="TxtComment" Width="100%" runat="server" class="form-control" placeholder="Give your comment"></asp:TextBox>
                                </div>


                            </div>

                            <%--<asp:Button ID="BtnSubmitComment" runat="server" Text="Submit" class="btn btn-default btn-xs" CommandName="SubmitComment" CommandArgument='<%#Eval("Post_Id")%>' />--%>
                            <div class="col-lg-2   pull-right mobilecomment" >
                                <asp:LinkButton ID="BtnSubmitComment" runat="server" class="pagebtn nopadding fa fa-paper-plane pagebtn-blue" Style="padding: 0px 5px;" CommandName="SubmitComment" CommandArgument='<%#Eval("Post_Id")%>' Text=" Post"></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div class='box-footer box-comments'>

                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <div class='box-comment'>
                                    <!-- User image -->
                                    <asp:Image ID="assaaaasa" runat="server" class='img-circle' ImageUrl='<%# "~/User/media/"+ Eval("varPhoto")%>' alt='user image' />
                                    <div class='comment-text pull-left'>
                                        <span class="username">
                                            <%#Eval("Name")%>
                                        </span>

                                        <%#Eval("Comment")%>
                                    </div>
                                    <div class='pull-right'>
                                        <asp:HiddenField ID="userID" runat="server" Value='<%# Eval("intuserid") %>' />
                                        <asp:LinkButton Visible="false" ID="lnkDeletes" runat="server" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CssClass="fa fa-times" CommandArgument='<%# Eval("id") %>' CommandName="deleteComment"></asp:LinkButton>
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                            ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                            ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
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
