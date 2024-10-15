<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="Care.aspx.cs" Inherits="User_Care" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="rlp-table" style="margin-bottom: 10px">
        <h2>Share you Care</h2>
          <div class="form-group">
              <asp:DropDownList ID="ddlShareCare" runat="server" CssClass="form-control">
                  <asp:ListItem Value="">:: Select About ::</asp:ListItem>
                  <asp:ListItem Value="Environment">Environment</asp:ListItem>
                  <asp:ListItem Value="Education">Education </asp:ListItem>
                  <asp:ListItem Value="Child labour">Child labour</asp:ListItem>
                  <asp:ListItem Value="Girl Child Education">Girl Child Education</asp:ListItem>
              </asp:DropDownList>  
          </div>
            <div class="form-group">
                <asp:TextBox ID="TxtDescription" runat="server"
                    TextMode="MultiLine" Height="100px" CssClass="form-control" onkeypress="return this.value.length<=500" placeholder="Share your ideas, thoughts & plans... Limit is 500 Characters..!!"></asp:TextBox>
            </div>
            <div class="box-footer rlp-table" style="margin-top: -15px">
                <div class="file-upload pull-left">
                      <asp:FileUpload ID="FileUpload1" onchange="previewFile()" runat="server" ToolTip="Select Photo" />
                    <asp:Image ID="ImgProduct" CssClass="fileupload-preview thumbnail" Visible="false" Style="width: 200px; height: 200px; float: none" runat="server" ImageUrl="~/User/media/NoProfile.png" />
                    <script type="text/javascript">
                        function previewFile() {

                            var preview = document.querySelector('#<%=ImgProduct.ClientID %>');
                                    var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
                                    var reader = new FileReader();

                                    reader.onloadend = function () {
                                        preview.src = reader.result;

                                    }

                                    if (file) {
                                        reader.readAsDataURL(file);
                                    } else {
                                        preview.src = "";
                                    }

                                }
                    </script>
                </div>
                <asp:LinkButton ID="Button1" runat="server" Text=" Post" class="pagebtn fa fa-paper-plane pagebtn-blue pull-right" OnClick="btnPost_Click"></asp:LinkButton>
            </div>

        </div>
     <div class="rlp-table" style="margin-bottom: 10px">
        <h2>My Share you Care Posts</h2>
             <script type="text/javascript">
    window.addEventListener('keydown', function (e) { if (e.keyIdentifier == 'U+000A' || e.keyIdentifier == 'Enter' || e.keyCode == 13) { if (e.target.nodeName == 'INPUT' && e.target.type == 'text') { e.preventDefault(); return false; } } }, true);
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:ListView ID="ListView1" runat="server"
    OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_DataBound">
    <ItemTemplate>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="box-footer rlp-table" style="margin: 5px 0px">

                    <div class='box-header with-border'>
                        <div class='user-block pull-left'>
                            <asp:Image ID="asaasa" runat="server" class='img-circle' ImageUrl='<%# Eval("VOTE").ToString().Equals("0")? "~/User/media/"+ Eval("varPhoto"): "~/college/media/"+ Eval("varPhoto")%>' alt='user image' />
                            <span class='username'><%#Eval("Name")%></span>
                            <span class='description'>Sponsored from - <%# String.IsNullOrEmpty(Eval("varFrom").ToString())?"Expired":Eval("varFrom").ToString() %>&nbsp;to&nbsp;<asp:Label ID="LblDate" runat="server" Text='<%#String.IsNullOrEmpty(Eval("varFrom").ToString())?"Expired":Eval("varFrom").ToString()%>'></asp:Label></span>
                        </div>
                        <!-- /.user-block -->
                        <div class='pull-right deletepost' >
                            <asp:LinkButton ID="lnkDelete" Visible="false"
                                runat="server" CssClass="fa fa-times" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CommandArgument='<%# Eval("Post_Id") %>' CommandName="deletePost"></asp:LinkButton>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class='box-body rlp-table' style="margin-bottom: 5px">
                        <p style="font-size: 18px; color: #000;" class="comment more">
                            <%#Eval("Post_Description")%>
                        </p>
                        <div>
                            <asp:Image runat="server" ID="ss" CssClass="img-responsive" Visible='<%# "~/"+ Eval("PostImage").ToString() ==  "~/PostImages/NoImage.png"?false:true %>' ImageUrl='<%# "~/"+ Eval("PostImage")%>' AlternateText="Photo" Style="min-width: 100%;" />
                        </div>
                    </div><asp:HiddenField ID="postId" runat="server" Value='<%# Eval("Post_Id") %>' />
                            <asp:HiddenField ID="userId" runat="server" Value='<%# Eval("intStudentId") %>' />
                            <asp:HiddenField ID="IsUser" runat="server" Value='<%# Eval("Vote") %>' />
                    <div class="rlp-table" style="padding: 5px 5px 20px 5px;margin-bottom: 5px;">
                        <span class='pull-left'> 
                            <asp:LinkButton ID="likeBtn" runat="server" CssClass="" CommandName="LikePost" CommandArgument='<%#Eval("Post_Id")%>'><i class='fa fa-heart'></i> Like</asp:LinkButton>
                        
                            <asp:LinkButton ID="commentBtn" runat="server" CssClass="" CommandName="CommentPost" CommandArgument='<%#Eval("Post_Id")%>'><i class='fa fa-comment'></i> Comments</asp:LinkButton>
                        </span>
                        <span class='pull-right text-muted'>
                            <asp:Label ID="lblLikes" runat="server" Text="0"></asp:Label>
                            Likes  -
                            <asp:Label ID="LblComment" runat="server" Text="0"></asp:Label>
                            Comments</span>
                        <br />
                    </div>



                    <div class="box-footer rlp-table" style="margin-bottom: 5px">
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
                                <asp:LinkButton ID="BtnSubmitComment" runat="server" class="pagebtn nopadding fa fa-paper-plane pagebtn-blue" Style="padding: 0px 10px;" CommandName="SubmitComment" CommandArgument='<%#Eval("Post_Id")%>' Text=" Post"></asp:LinkButton>
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

         </div>
</asp:Content>
