<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageClgNoAds.master" AutoEventWireup="true" CodeFile="InstitituteSettings.aspx.cs" Inherits="college_InstitituteSettings" %>

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
       
                <h3>Page Setting </h3>
                <span class="pull-right" style="margin-top: -40px;">
                    <asp:LinkButton ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" PostBackUrl="~/college/ComProfile.aspx" Text="Back to Page"></asp:LinkButton></span>
                <ul class="nav nav-tabs  responsive-tabs" id="Tabs">
                    <li class="active"><a data-toggle="tab" href="#Basic">Profile</a></li>
                    <li><a data-toggle="tab" href="#OtherDetails">Other Details</a></li>
                    <li><a data-toggle="tab" href="#AddImages">Add Images</a></li>
                    <li><a data-toggle="tab" href="#AddVideo">Add Video</a></li>
                    <li><a data-toggle="tab" href="#AddFacilities">Add Facilities</a></li>
                    <li><a data-toggle="tab" href="#AddCourses">Add Courses</a></li>
                    <li><a data-toggle="tab" href="#AddCompany">Add Company</a></li>
                    <li><a data-toggle="tab" href="#AddCoordinates">Add Coordinates</a></li>
                </ul>

                <div class="tab-content">
                    <div id="Basic" class="tab-pane active" >
                        <h3 class="text-center">Profile</h3>
                          <div class="row">
                        <div class="col-lg-4 col-lg-offset-4"> 
                            <div id="edit" runat="server" class="text-left" visible="false">
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                    <div class="form-group">
                                        <asp:Label ID="Label9" runat="server" Text="Institutes Name"></asp:Label>

                                        <asp:TextBox ID="txtName" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="basic"
                                            ControlToValidate="txtName"
                                            Text="Name is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label18" runat="server" Text="Principal Name"></asp:Label>

                                        <asp:TextBox ID="txtPrincName" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="basic"
                                            ControlToValidate="txtPrincName"
                                            Text="Principal is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label19" runat="server" Text="Admission Incharge"></asp:Label>

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
                                        <asp:Label ID="Label35" runat="server" Text="Select Profile Pic"></asp:Label>
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
                    <div id="OtherDetails" class="tab-pane " >
                        <h3 class="text-center">Other Details</h3>
                      <div class="row">
                             <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                    <div class="form-group">
                                        <asp:Label ID="Label28" runat="server" Text="Short About Us:"></asp:Label> 
                                        <asp:TextBox ID="txtVision" runat="server" required="required" ValidationGroup="otherdetails"
                                            CssClass="form-control" placeholher="Short About Us" Height="100px"
                                            TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="otherdetails"
                                            ControlToValidate="txtVision"
                                            Text="Vision is required." />
                                     </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label29" runat="server" Text="Long About Us:"></asp:Label> 
                                        <asp:TextBox ID="txtObjective" runat="server" required="required" ValidationGroup="otherdetails"
                                            CssClass="form-control" placeholher="Long About Us:" Height="100px"
                                            TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="otherdetails"
                                            ControlToValidate="txtObjective"
                                            Text="Objective is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label30" runat="server" Text="Affiliated to"></asp:Label> 
                                        <asp:TextBox ID="txtUgc" runat="server" ValidationGroup="otherdetails" required="required" CssClass="form-control" placeholher="Brief"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="otherdetails"
                                            ControlToValidate="txtUgc"
                                            Text="Ugc is required." />
                                        <label style="font-size: small; color: #C0C0C0">Name of university Eg. Bengaluru University/AICTE/MSBTE     </label>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label31" runat="server" Text="NAAC accreditation"></asp:Label> 
                                        <asp:TextBox ID="txtNaac" runat="server" ValidationGroup="otherdetails" required="required" CssClass="form-control" placeholher="Brief"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="otherdetails"
                                            ControlToValidate="txtNaac"
                                            Text="Naac is required." />
                                        <label style="font-size: small; color: #C0C0C0">Grade B+/A</label>
                                     </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label32" runat="server" Text="Placements record"></asp:Label> 
                                        <asp:TextBox ID="txtPlaceRecord" ValidationGroup="otherdetails" runat="server" required="required" CssClass="form-control" placeholher="Brief"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="otherdetails"
                                            ControlToValidate="txtPlaceRecord"
                                            Text="Placement Record is required." />
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
                                     </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label34" runat="server" Text="Please Attach E-Broucher"></asp:Label>
                                    </div>

                                    <div class="form-group">
                                        <asp:FileUpload ID="fupFeeStruc" runat="server" /></td>
                                </div>

                                    <div class="form-group">

                                        <asp:LinkButton Style="padding: 5px 10px;" ID="btnPanelOther" ValidationGroup="otherdetails" runat="server" Text="Add Details"
                                            CssClass="pagebtn pagebtn-blue" OnClick="btnPanelOther_Click" />

                                     </div> 
                        </div>
                           
                    </div>
                          </div>
                </div>
                    <div id="AddImages" class="tab-pane " >
                        <h3 class="text-center">Add Images</h3>
                         <div class="row">
                              <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                   <div class="form-group">
                                        <asp:Label ID="Label17" runat="server" Text="Image Caption"></asp:Label>
                                  </div>

                                    <div class="form-group">
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

                                        <asp:LinkButton ID="btnImagePanel" runat="server" Text="Add Image" ValidationGroup="imggs"
                                            CssClass="pagebtn pagebtn-blue" OnClick="btnImagePanel_Click" />
                                        &nbsp;<asp:Button ID="UpdateCom" CssClass="pagebtn pagebtn-blue" runat="server" ValidationGroup="imggs"
                                            Text="Update" OnClick="UpdateCom_Click" Visible="False" />

                                   </div> 
                                    <asp:SqlDataSource ID="SqlDataSourceImg" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                        ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'></asp:SqlDataSource>
                                 

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
                    <div id="AddVideo" class="tab-pane " >
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
                    <div id="AddFacilities" class="tab-pane " >
                        <h3 class="text-center">Add Facilities</h3>
                       <div class="row">
                             <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                   <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Facility Name"></asp:Label></div>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox> 
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
                    <div id="AddCourses" class="tab-pane " >
                        <h3 class="text-center">Add Courses</h3>
                  <div class="row">
                             <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                   <div class="form-group">
                                        <asp:Label ID="Label7" runat="server" Text="Course Type"></asp:Label> </div>

                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCourseType" ValidationGroup="course" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="--Select Course Type--">--Select Course Type--</asp:ListItem>
                                            <asp:ListItem>Courses After 10th</asp:ListItem>
                                            <asp:ListItem>Courses After 12th</asp:ListItem>
                                            <asp:ListItem>Bachelors Degree Courses</asp:ListItem>
                                            <asp:ListItem>Masters Degree Courses</asp:ListItem>
                                            <asp:ListItem>Doctoral/Fellowship Courses</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:CompareValidator ControlToValidate="ddlCourseType" ID="CompareValidator1"
                                            ValidationGroup="course" ErrorMessage="Please select a Course Type"
                                            runat="server" Display="Dynamic"
                                            Operator="NotEqual" ValueToCompare="--Select Course Type--" Type="String" />
                                   </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Course Name"></asp:Label> 
                                        <asp:TextBox ID="txtCName" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtCName"
                                            Text="Course name is required." /> 
                                 </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label10" runat="server" Text="Course Description"></asp:Label> 
                                        <asp:TextBox ID="txtDescription" ValidationGroup="course" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtDescription"
                                            Text="Description is required." /> </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label11" runat="server" Text="Duration"></asp:Label>
                                     
                                        <asp:TextBox ID="txtDuration" ValidationGroup="course" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtDuration"
                                            Text="Duration is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label12" runat="server" Text="Fees"></asp:Label>
                                     
                                        <asp:TextBox ID="txtFes" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtFes"
                                            Text="Fees is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label13" runat="server" Text="Affliation To"></asp:Label>
                                    
                                        <asp:TextBox ID="txtaffli" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtaffli"
                                            Text="Affliation is required." />
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label14" runat="server" Text="Accredited By"></asp:Label>
                                   
                                        <asp:TextBox ID="txtAccre" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtAccre"
                                            Text="Accredited is required." />
                                     </div>

                                    <div class="form-group">
                                        <asp:Label ID="Label15" runat="server" Text="Admission/Eligibility  Criteria"></asp:Label>
                                   
                                        <asp:TextBox ID="txtAddmision" ValidationGroup="course" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16"
                                            runat="server"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ControlToValidate="txtAddmision"
                                            Text="Admission is required." />
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
                                    <asp:BoundField DataField="varCourseType" HeaderText="Course Type"
                                        SortExpression="varCourseType" />
                                    <asp:BoundField DataField="varCourseName" HeaderText="Course Name"
                                        SortExpression="varCourseName" />
                                    <asp:BoundField DataField="varDuration" HeaderText="Duration"
                                        SortExpression="varDuration" />
                                    <asp:BoundField DataField="varFees" HeaderText="Fees"
                                        SortExpression="varFees" />
                                    <asp:BoundField DataField="varAffliation" HeaderText="Affliation"
                                        SortExpression="varAffliation" />
                                    <asp:BoundField DataField="varAccredited" HeaderText="Accredited"
                                        SortExpression="varAccredited" />
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
                    
                    <div id="AddCompany" class="tab-pane " >
                        <h3 class="text-center">Add Company</h3>
                     <div class="row">
                             <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                   <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Company Name"></asp:Label> </div>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtCompany" ValidationGroup="company" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="company"
                                        ControlToValidate="txtCompany"
                                        Text="Company Name is required." />
                                </div>

                                    <div class="form-group">

                                        <asp:LinkButton Style="padding: 5px 10px;" ID="AddComp" ValidationGroup="company" CssClass="pagebtn pagebtn-blue" runat="server" OnClick="AddComp_Click" Text="Add" />

                                    </div>
                                   
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSource2" CssClass="table text-justify table-bordered"
                                GridLines="None" AllowPaging="True"
                                DataKeyNames="intid">
                                <AlternatingRowStyle BackColor="White" />

                                <Columns>

                                    <asp:BoundField DataField="intid" HeaderText="intid" ReadOnly="True"
                                        SortExpression="intid" Visible="False" />
                                    <asp:BoundField DataField="intCollegeId" HeaderText="intCollegeId"
                                        SortExpression="intCollegeId" Visible="False" />
                                    <asp:BoundField DataField="varCompanyName" HeaderText="Company Name"
                                        SortExpression="varCompanyName" />
                                    <asp:CommandField ButtonType="Link" ShowDeleteButton="True"
                                        ControlStyle-CssClass="btn btn-green"></asp:CommandField>
                                </Columns>

                            </asp:GridView>
                            <%-- UpdateCommand="UPDATE tblcollegecomp SET varCompanyName = @varCompanyName WHERE intid = @intid"--%>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'
                                DeleteCommand="DELETE FROM tblcollegecomp WHERE intid = @intid">
                                <DeleteParameters>
                                    <asp:Parameter Name="intid" Type="Int64"></asp:Parameter>
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="intid" Type="Int64"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                           </div>
                         </div>
                    </div>
                    <div id="AddCoordinates" class="tab-pane " >
                        <h3 class="text-center">Add Coordinates</h3>
                          <div class="row">
                                <div class="col-lg-4 col-lg-offset-4"> 
                              <div class="form-horizontal" style="padding: 0px 5px 0px 2px">
                                   <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Latitude"></asp:Label>
                                   </div>

                                    <div class="form-group">
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


