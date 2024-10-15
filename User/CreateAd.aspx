<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="CreateAd.aspx.cs" Inherits="User_CreateAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <h3 class="text-center">Create your Advertizement  </h3>
        <div class="col-lg-12">

            <div class="col-lg-6 col-lg-offset-2 ">
                <div class="rlp-table">
                    <h3>Create Your AD Preview here</h3>

                    <div class="form-group">
                        <asp:TextBox ID="txtName" placeholder="Heading (Max 9 Words)" required CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">

                        <asp:DropDownList ID="ddlButtons" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">:: Select Button Type::</asp:ListItem>
                            <asp:ListItem>Visit Us</asp:ListItem>
                            <asp:ListItem>Call Us</asp:ListItem>
                            <asp:ListItem>Message Us</asp:ListItem>
                            <asp:ListItem>Send Enquiry</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">

                        <asp:TextBox ID="txtLink" placeholder="Link" required CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label>Logo (250px*250px)</label>
                        <div class="fileupload fileupload-new" data-provides="fileupload">

                            <input id="fupProPic" type="file" name="file" onchange="previewFile()" runat="server" accept='image/*' />
                            <asp:Image ID="ImgProduct" CssClass="fileupload-preview thumbnail" Style="width: 100px; height: 100px; float: none" runat="server" ImageUrl="~/User/media/NoProfile.png" />
                            <script type="text/javascript">
                                function previewFile() {

                                    var preview = document.querySelector('#<%=ImgProduct.ClientID %>');
                                        var file = document.querySelector('#<%=fupProPic.ClientID %>').files[0];
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
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtBottomLine" placeholder="Bottom Line (Max 4 Words)" required CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="input-group">
                        <asp:Button ID="btnPreview" CssClass="pagebtn pagebtn-blue" runat="server" Text="Preview Advert"
                            OnClick="btnUpdate_Click" />
                        <i class="input-group-addon" style="border: none;"></i>
                              <asp:Button ID="btnCancel" CssClass="pagebtn pagebtn-blue" runat="server" Text="Cancel"
                            PostBackUrl="~/User/Default.aspx" />
                         <i class="input-group-addon" style="border: none;"></i>
                         <asp:Button ID="btnPayment" CssClass="pagebtn pagebtn-blue center-block" OnClick="btnPayment_Click" runat="server" Text="Proceed to Payment" />
                  
                    </div>
                    <div class="form-group"></div>
                </div>
            </div>

            <div class="col-lg-3">
                <div class="adStructure rlp-table text-center">
                    <span class="ad">AD</span>
                    <h2>
                        <asp:Literal ID="adHeader" runat="server" Text="Promote yourself with coursekatta"></asp:Literal>
                    </h2>
                    <asp:Image ID="AdImage" CssClass="fileupload-preview thumbnail center-block" Style="margin-bottom: 5px;" ImageUrl="~/User/media/NoProfile.png" runat="server" Height="100px" Width="100px" />
                    <h3>
                        <asp:Literal ID="adBase" runat="server" Text="Get To Know Us"></asp:Literal></h3>
                    <asp:HyperLink ID="adLink" runat="server" NavigateUrl="http://coursekatta.com" CssClass="adbtn adbtn-blue" Target="_blank">
                        <asp:Literal ID="adBtnText" runat="server" Text="Click Here"></asp:Literal>
                    </asp:HyperLink>
                    <p>To Advertize</p>
                </div>
                <br />
                       
               
            </div>
        </div>
    </div>
</asp:Content>

