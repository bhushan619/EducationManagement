<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>
<%@ Import Namespace="RegExForAspx" %>
<%@ Register Src="~/User/TimelineUserControl.ascx" TagPrefix="uc1" TagName="TimelineUserControl" %> 
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
     <script type="text/javascript">  
         function validate() {
             var doc = document.getElementById('Richtextbox');
             if (doc.value.length == 0) {
                 alert('Please Enter data in Richtextbox');
                 return false;
             }
         }
        </script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="fb-root"></div>

    <div >

        <!-- /.box-header -->

        <div   style="margin-bottom: 10px">
            <div class="form-group">
                <asp:TextBox ID="TxtDescription" runat="server"
                    TextMode="MultiLine" Height="100px" CssClass="form-control" placeholder="Share your ideas, thoughts & plans..."></asp:TextBox>
            </div>
            <div class="box-footer rlp-table" style="margin-top: -15px">
                <div class="file-upload pull-left">
                    <label for="FileUpload1" class="fa fa-camera file-upload__label" style="color: #1b4969">Image</label>
                    <asp:FileUpload ID="FileUpload1" onchange="previewFile()" runat="server" CssClass="file-upload__input" ToolTip="Select Photo" />
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
        <%--  <ul class="todo-list">--%>

   

        <div>
           
       
                <uc1:TimelineUserControl runat="server" ID="TimelineUserControl" />
           
        </div>


    </div>

</asp:Content>

