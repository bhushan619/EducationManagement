<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageClgNoAds.master" AutoEventWireup="true" CodeFile="ComSettings.aspx.cs" Inherits="college_ComSettings" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="dist/css/bootstrap-responsive-tabs.css" rel="stylesheet" />
    <script src="dist/js/jquery.bootstrap-responsive-tabs.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="TabName" runat="server" />
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "Basic";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
        });
    </script>
    <div class="container coursekatta-layout-1">

        <h3 >Page Setting </h3>
        <span class="pull-right" style="margin-top: -40px;">
            <asp:LinkButton ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" PostBackUrl="~/college/ComProfile.aspx" Text="Back to Page"></asp:LinkButton></span>
        <ul class="nav nav-tabs  responsive-tabs" id="Tabs">
            <li class="active"><a data-toggle="tab" href="#Basic">Profile</a></li>
            <li><a data-toggle="tab" href="#OtherDetails">Other Details</a></li>
            <li><a data-toggle="tab" href="#AddImages">Add Images</a></li>
            <li><a data-toggle="tab" href="#AddVideo">Add Video</a></li>
            <li><a data-toggle="tab" href="#AddFaculties">Add Members</a></li>
            <li><a data-toggle="tab" href="#AddFacilities">Add Facilities</a></li>
            <li><a data-toggle="tab" href="#AddCourses">Add Services</a></li>
            <li><a data-toggle="tab" href="#AddCoordinates">Add Coordinates</a></li>
        </ul>

        <div class="tab-content">
            <div id="Basic" class="tab-pane active" role="tabpanel">
                <h3 class="text-center">Profile</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div id="edit" runat="server" class="text-left" visible="false">
                            <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Company Name"></asp:Label>

                                    <asp:TextBox ID="txtName" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtName"
                                        Text="Name is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label18" runat="server" Text="Founder Name"></asp:Label>

                                    <asp:TextBox ID="txtPrincName" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtPrincName"
                                        Text="Principal is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label19" runat="server" Text="HR Representative  "></asp:Label>

                                    <asp:TextBox ID="txtAdminInch" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtAdminInch"
                                        Text="Incharge is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label20" runat="server" Text="Address"></asp:Label>

                                    <asp:TextBox ID="txtAddress" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtAddress"
                                        Text="Address is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label21" runat="server" Text="City"></asp:Label>

                                    <asp:TextBox ID="txtCity" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtCity"
                                        Text="City is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label22" runat="server" Text="State"></asp:Label>

                                    <asp:DropDownList ID="ddlState" ValidationGroup="basic" runat="server" CssClass="form-control"
                                        DataSourceID="SqlDataSourceState" DataTextField="varState"
                                        DataValueField="varState">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlState" ID="CompareValidator2"
                                        ValidationGroup="basic" ErrorMessage="Please select a State"
                                        runat="server" Display="Dynamic"
                                        Operator="NotEqual" ValueToCompare="-- Select State --" Type="String" />
                                    <asp:SqlDataSource ID="SqlDataSourceState" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                        ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"
                                        SelectCommand="SELECT DISTINCT varState FROM tbledmitrastate ORDER BY varState"></asp:SqlDataSource>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label23" runat="server" Text="Landline"></asp:Label>

                                    <asp:TextBox ID="txtCnt1" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label24" runat="server" Text="Mobile 1"></asp:Label>

                                    <asp:TextBox ID="txtCnt2" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtCnt2"
                                        Text="Contact is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label25" runat="server" Text="Mobile 2"></asp:Label>

                                    <asp:TextBox ID="txtCnt3" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label26" runat="server" Text="Web URL"></asp:Label>

                                    <asp:TextBox ID="txtWeb" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="basic"
                                        ControlToValidate="txtWeb"
                                        Text="Website is required." />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label35" runat="server" Text="Select Company Logo Pic"></asp:Label>
                                    <div class="fileupload fileupload-new" data-provides="fileupload">

                                        <input id="fupProPic" type="file" name="file" onchange="previewFile()" runat="server" accept='image/*' />
                                        <asp:Image ID="imgProfile" CssClass="fileupload-preview thumbnail" Style="width: 200px; height: 150px; float: none" runat="server" ImageUrl="~/college/media/NoProfile.png" />
                                        <script type="text/javascript">
                                            function previewFile() {

                                                var preview = document.querySelector('#<%=imgProfile.ClientID %>');
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

                            </div>


                            <div id="editbtns" class="text-center" runat="server">
                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnEdit" runat="server" Text="Edit" ValidationGroup="basic"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnEdit_Click" />
                                <asp:LinkButton Style="padding: 5px 10px;"
                                    ID="btnSubmit" runat="server" Visible="false" Text="Submit" ValidationGroup="basic"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnSubmit_Click" />
                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnCancel" runat="server" Text="Cancel" ValidationGroup="basic"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnCancel_Click" />
                                <br />
                                <br />
                            </div>

                            <asp:SqlDataSource ID="SqlDataSourceCollegeDetails" runat="server"
                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
            <div id="OtherDetails" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Other Details</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label28" runat="server" Text="Vision Us:"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtVision" runat="server" required="required" ValidationGroup="otherdetails"
                                    CssClass="form-control" placeholher="Vision" Height="100px"
                                    TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="otherdetails"
                                    ControlToValidate="txtVision"
                                    Text="Vision is required." />
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label29" runat="server" Text="About Us:"></asp:Label>
                                <asp:TextBox ID="txtObjective" runat="server" required="required" ValidationGroup="otherdetails"
                                    CssClass="form-control" placeholher="About Us:" Height="100px"
                                    TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="otherdetails"
                                    ControlToValidate="txtObjective"
                                    Text="Objective is required." />
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label30" runat="server" Text="Registered under (ROC Name)"></asp:Label>
                                <asp:TextBox ID="txtUgc" runat="server" ValidationGroup="otherdetails" required="required" CssClass="form-control" placeholher="Brief"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="otherdetails"
                                    ControlToValidate="txtUgc"
                                    Text="Ugc is required." />
                                <label style="font-size: small; color: #C0C0C0">Name of ROC (ROC Mumbai) </label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label31" runat="server" Text="Certification (if any)"></asp:Label>
                                <asp:TextBox ID="txtNaac" runat="server" ValidationGroup="otherdetails" required="required" CssClass="form-control" placeholher="Brief"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="otherdetails"
                                    ControlToValidate="txtNaac"
                                    Text="Naac is required." />

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label33" runat="server" Text="Special Achievements:"></asp:Label>
                                <asp:TextBox ID="txtSpecialAchievements" ValidationGroup="otherdetails" runat="server" required="required"
                                    CssClass="form-control" placeholher="Special Achivements:" Height="100px"
                                    TextMode="MultiLine"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label37" runat="server" Text="FB Link"></asp:Label>

                                <asp:TextBox ID="fbo" ValidationGroup="otherdetails" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.facebook.com/ </label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label38" runat="server" Text="G+ Link"></asp:Label>

                                <asp:TextBox ID="gpo" ValidationGroup="otherdetails" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.google.com/ </label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label39" runat="server" Text="LinkedIn Link"></asp:Label>

                                <asp:TextBox ID="lnko" ValidationGroup="otherdetails" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.linkedin.com/ </label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label40" runat="server" Text="Twitter Link"></asp:Label>

                                <asp:TextBox ID="two" ValidationGroup="otherdetails" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.twitter.com/ </label>

                                <asp:Label ID="Label34" runat="server" Text="Please Attach E-Broucher"></asp:Label>

                                <asp:FileUpload ID="fupFeeStruc" runat="server" />

                            </div>

                            <div class="form-group">


                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnPanelOther" ValidationGroup="otherdetails" runat="server" Text="Add Details"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnPanelOther_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="AddImages" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Images</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="Image Caption"></asp:Label>
                                 
                                <asp:TextBox ID="txtImage" ValidationGroup="imggs" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="imggs"
                                    ControlToValidate="txtImage"
                                    Text="Name is required." />
                            </div>

                                <div class="form-group">
                                <asp:Label ID="Label27" runat="server" Text="Image Upload"></asp:Label> 

                                <asp:FileUpload ValidationGroup="imggs" ID="fupImage" runat="server" /></td>
                       </div>

                                <div class="form-group">
                                        <asp:LinkButton ID="btnImagePanel" Style="padding: 5px 10px;" runat="server" Text="Add Image" ValidationGroup="imggs"
                                            CssClass="pagebtn pagebtn-blue" OnClick="btnImagePanel_Click" />
                                        &nbsp;<asp:Button ID="UpdateCom" CssClass="pagebtn pagebtn-blue" runat="server" ValidationGroup="imggs"
                                            Text="Update" OnClick="UpdateCom_Click" Visible="False" />

                                   
                                    <asp:SqlDataSource ID="SqlDataSourceImg" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                        ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
                               </div>

                                

                    <asp:GridView ID="GridView2" runat="server" CssClass="table mybg "
                        AllowPaging="True" AutoGenerateColumns="False"
                        OnRowCommand="grdCollegeData_RowCommand" DataSourceID="SqlDataSourceImg" DataKeyNames="intId">
                        <Columns>
                            <asp:BoundField DataField="varMediaName" HeaderText="Image Caption"
                                SortExpression="varMediaName" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# "~/college/media/" + Eval("varMediaPath") %>' ID="download" runat="server"
                                        Height="100px" Width="100px" DataField="varMediaPath" SortExpression="varMediaPath" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="view" runat="server"
                                        Text="Edit" class="button btn-primary"
                                        CommandName="view"
                                        CommandArgument='<%# Eval("intId") %>'>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                    </asp:GridView>
                            </div>
                        
                        </div>
                    </div>
                </div>
            <div id="AddVideo" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Video</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Media Caption"></asp:Label>
                            
                                <asp:TextBox ID="txtMediaName" ValidationGroup="viddo" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="viddo"
                                    ControlToValidate="txtMediaName"
                                    Text="Name is required." />
                            </div>

                                <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="YouTube Video Link"></asp:Label> 
                                <asp:TextBox ID="txtVideoLink" ValidationGroup="viddo" runat="server" CssClass="form-control" type="url" pattern="https?://.+"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="viddo"
                                    ControlToValidate="txtVideoLink"
                                    Text="Link is required." />
                            </div>

                                <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.youtube.com/watch?v=dilnw_dP3xk</label></td>

                     </div>

                                <div class="form-group">

                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnVideo" runat="server" Text="Add Video"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnVideo_Click" ValidationGroup="viddo" />

                          </div>

                                
                                <asp:GridView ID="GridViewVideo" runat="server" CssClass="table table-bordered"
                                    AllowPaging="True" AutoGenerateColumns="False"
                                    DataSourceID="SqlDataSourceVideo">
                                    <Columns>
                                        <asp:BoundField DataField="varMediaName" HeaderText="Media Caption"
                                            SortExpression="varMediaName" />
                                        <asp:BoundField DataField="varMediaPath" HeaderText="Media Code"
                                            SortExpression="varMediaPath" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceVideo" runat="server"
                                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"></asp:SqlDataSource>
                           </div>
                        </div>
                    
                </div>
            </div>
            
            <div id="AddFaculties" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Members</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Member Name"></asp:Label>
                            
                                <asp:TextBox ID="txtMemberName" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="members"
                                    ControlToValidate="txtMemberName"
                                    Text="Name is required." />
                             </div>

                                <div class="form-group">
                                <asp:Label ID="Label11" runat="server" Text="Member Degree"></asp:Label>
                             
                                <asp:TextBox ID="txtDegree" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="members"
                                    ControlToValidate="txtDegree"
                                    Text="Degree is required." />
                             </div>

                                <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="Member Intro"></asp:Label>
                            
                                <asp:TextBox ID="txtIntro" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="members"
                                    ControlToValidate="txtIntro"
                                    Text="Intro is required." />
                            </div>

                                <div class="form-group">
                                <asp:Label ID="Label13" runat="server" Text="FB Link"></asp:Label>
                           
                                <asp:TextBox ID="txtfb" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>

                             </div>

                                <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.facebook.com/ </label>
                             </div>

                                <div class="form-group">
                                <asp:Label ID="Label14" runat="server" Text="G+ Link"></asp:Label>
                            
                                <asp:TextBox ID="txtGPlus" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>

                           </div>

                                <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.google.com/ </label>
                           </div>

                                <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="LinkedIn Link"></asp:Label>
                           
                                <asp:TextBox ID="txtLinked" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>

                         </div>

                                <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.linkedin.com/ </label>
                          </div>

                                <div class="form-group">
                                <asp:Label ID="Label32" runat="server" Text="Twitter Link"></asp:Label>
                           
                                <asp:TextBox ID="txttw" ValidationGroup="members" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                                <div class="form-group">
                                <label style="font-size: small; color: #C0C0C0">Eg: https://www.twitter.com/ </label>
                             </div>

                                <div class="form-group">
                                <asp:Label ID="Label36" runat="server" Text="Select Company Logo Pic"></asp:Label> 
                          
                                <div class="fileupload fileupload-new" data-provides="fileupload">

                                    <input id="FileUploadMember" type="file" name="file" onchange="previewFileMember()" runat="server" accept='image/*' />
                                    <asp:Image ID="imgMember" CssClass="fileupload-preview thumbnail" Style="width: 200px; height: 150px; float: none" runat="server" ImageUrl="~/college/media/NoProfile.png" />
                                    <script type="text/javascript">
                                        function previewFileMember() {

                                            var preview = document.querySelector('#<%=imgMember.ClientID %>');
                                            var file = document.querySelector('#<%=FileUploadMember.ClientID %>').files[0];
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

                                <asp:LinkButton Style="padding: 5px 10px;" ID="lbkMember" runat="server" Text="Add Member"
                                    CssClass="pagebtn pagebtn-blue" OnClick="LinkButton1_Click" ValidationGroup="members" />

                           
                           
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                                    AllowPaging="True" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                    DataSourceID="SqlDataSource2" DataKeyNames="intId">
                                    <Columns>
                                        <asp:BoundField DataField="varFacultyName" HeaderText="Name" SortExpression="varFacultyName"></asp:BoundField>
                                        <asp:BoundField DataField="varDegree" HeaderText="Degree" SortExpression="varDegree"></asp:BoundField>
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
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConflictDetection="CompareAllValues"
                                    ConnectionString='<%$ ConnectionStrings:coursekattaConnectionString %>'
                                    DeleteCommand="DELETE FROM tblfacultymembers WHERE intId = @original_intId" OldValuesParameterFormatString="original_{0}"
                                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'>
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_intId" Type="Int64"></asp:Parameter>

                                    </DeleteParameters>

                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"></asp:SqlDataSource>
                            </div>
                            </div>
                </div> 
                </div>
            </div>
            <div id="AddFacilities" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Facilities</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Facility Name"></asp:Label> 
                                <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15"
                                runat="server"
                                Display="Dynamic"
                                ValidationGroup="facil"
                                ControlToValidate="txtFName"
                                Text="Name is required." />
                       </div>

                                <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Description"></asp:Label> 
                           
                                <asp:TextBox ID="txtFDescrip" CssClass="form-control" runat="server"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14"
                                runat="server"
                                Display="Dynamic"
                                ValidationGroup="facil"
                                ControlToValidate="txtFDescrip"
                                Text="Description is required." />
                        </div>

                                <div class="form-group">
                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnAddFacility" ValidationGroup="facil" CssClass="pagebtn pagebtn-blue" runat="server" OnClick="btnAddFacility_Click"
                                    Text="Add Details" />
                                &nbsp; 
                                            <asp:LinkButton Style="padding: 5px 10px;" ID="btnUpdateFacility" ValidationGroup="facil" CssClass="pagebtn pagebtn-blue" runat="server"
                                                Text="Update" OnClick="btnUpdateFacility_Click" Visible="False" />
                            </div>

                               
                    <div class="table-responsive">
                        <asp:GridView ID="GridViewFacil" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceFacil" CssClass="table table-bordered mybg table-responsive text-justify"
                            OnRowCommand="GridViewFacil_RowCommand" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="varFacility" HeaderText="Facility"
                                    SortExpression="varFacility" />
                                <asp:BoundField DataField="varFacilityDescription"
                                    HeaderText="Facility Description"
                                    SortExpression="varFacilityDescription" />
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="view" runat="server"
                                            Text="Edit" class="button btn-primary"
                                            CommandName="view"
                                            CommandArgument='<%# Eval("intId") %>'>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceFacil" runat="server"
                            ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString%>"
                            ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
                    </div>
                </div>
            </div>
                    </div>
                </div>
            <div id="AddCourses" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Services</h3>
               
                   <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Service Type"></asp:Label> 
                                <asp:DropDownList ID="ddlCourseType" ValidationGroup="course" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="--Select Course Type--">--Select Service Type--</asp:ListItem>
                                    <asp:ListItem>Online</asp:ListItem>
                                    <asp:ListItem>Offline</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddlCourseType" ID="CompareValidator1"
                                    ValidationGroup="course" ErrorMessage="Please select a Course Type"
                                    runat="server" Display="Dynamic"
                                    Operator="NotEqual" ValueToCompare="--Select Course Type--" Type="String" />
                            </div>

                                <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="Service Name"></asp:Label> 
                                <asp:TextBox ID="txtCName" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="course"
                                    ControlToValidate="txtCName"
                                    Text="Course name is required." /> 
                      </div>

                                <div class="form-group">
                                <asp:Label ID="Label10" runat="server" Text="Service Description"></asp:Label>
                            
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" ValidationGroup="course" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="course"
                                    ControlToValidate="txtDescription"
                                    Text="Description is required." /> 
                         </div>

                                <div class="form-group">
                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnAddCourses" ValidationGroup="course" CssClass="pagebtn pagebtn-blue" runat="server" Text="Add Details"
                                    OnClick="btnAddCourses_Click" />
                                &nbsp;
                                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnUpdateCourses" ValidationGroup="course" CssClass="pagebtn pagebtn-blue" runat="server"
                                                    Text="Update" OnClick="btnUpdateCourses_Click" Visible="False" />


                            
                            <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server"
                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
                     </div>

                              </div>
 </div>
                    <div class="row col-lg-12 table-responsive">
                        <asp:GridView ID="GridViewCourse" runat="server" CssClass="table text-justify table-bordered"
                            OnRowCommand="GridViewCourse_RowCommand" DataSourceID="SqlDataSourceCourse" GridLines="None"
                            AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="varCourseType" HeaderText="Service Type"
                                    SortExpression="varCourseType" />
                                <asp:BoundField DataField="varCourseName" HeaderText="Service Name"
                                    SortExpression="varCourseName" />

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="view" runat="server"
                                            Text="Edit" class="button btn-primary"
                                            CommandName="view"
                                            CommandArgument='<%# Eval("intId") %>'>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

                        </asp:GridView>
                    </div>
               
            </div>
                 
                </div>

            <div id="AddCoordinates" class="tab-pane " role="tabpanel">
                <h3 class="text-center">Add Coordinates</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Latitude"></asp:Label>
                           
                                <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="Coordinates"
                                    ControlToValidate="txtLatitude"
                                    Text="Latitude is required." />
                             </div>

                                <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="Longitude"></asp:Label> 
                                <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="Coordinates"
                                    ControlToValidate="txtLongitude"
                                    Text="Longitude is required." />
                              </div>

                                <div class="form-group">

                                <asp:LinkButton Style="padding: 5px 10px;" ID="btnMediaPanel" ValidationGroup="Coordinates" runat="server" Text="Add/Update Coordinates"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnMediaPanel_Click" />
 </div>
                           
                                <asp:GridView ID="grdMediaPanel" runat="server" CssClass="table table-bordered"
                                    AllowPaging="True" AutoGenerateColumns="False"
                                    DataSourceID="SqlDataSourceMedia">
                                    <Columns>
                                        <asp:BoundField DataField="varLatitude" HeaderText="Latitude"
                                            SortExpression="varMediaName" />
                                        <asp:BoundField DataField="varLongitude" HeaderText="Longitude"
                                            SortExpression="varLongitude" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceMedia" runat="server"
                                    ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"></asp:SqlDataSource>
                           
                            </div>
                        </div>

                </div>
            </div>
        </div>
     
        </div> 

     <script>
        $('.responsive-tabs').responsiveTabs({
            accordionOn: ['xs', 'sm']
        });
    </script>
</asp:Content>




