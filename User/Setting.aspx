<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="User_Setting" %>

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
        <h3>Profile Setting </h3>

        <ul class="nav nav-tabs  responsive-tabs" id="Tabs">
            <li class="active"><a data-toggle="tab" href="#Basic">Basic</a></li>
            <li><a data-toggle="tab" href="#Educational">Educational</a></li>
            <li><a data-toggle="tab" href="#Professional">Professional</a></li>
            <li><a data-toggle="tab" href="#Password">Change Password</a></li>
        </ul>

        <div class="tab-content responsive">
            <div id="Basic" class="tab-pane  active">
                <h3 class="text-center">Basic Details</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 15px 0px 10px">
                           
                            <div class="form-group">


                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

                                <asp:TextBox ID="txtName" ValidationGroup="basic"
                                    CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="basic"
                                    ControlToValidate="txtName"
                                    Text="Name is required." />
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label9" runat="server" Text="Profile Heading"></asp:Label>

                                <asp:TextBox ID="txtAbout" ValidationGroup="basic" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="basic"
                                    ControlToValidate="txtAbout"
                                    Text="Profile Heading is required." />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="Date of Birth"></asp:Label>

                                <asp:TextBox ID="txtDob" ValidationGroup="basic" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="basic"
                                    ControlToValidate="txtDob"
                                    Text="Date is required." />
                                <cc1:CalendarExtender ID="txtDob_CalendarExtender" runat="server"
                                    Format="dd-MM-yyyy" Enabled="True" TargetControlID="txtDob"></cc1:CalendarExtender>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label13" runat="server" Text="Gender"></asp:Label>

                                <asp:DropDownList ID="ddlGender" ValidationGroup="basic" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select">:: Select Gender :: </asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddlGender" ID="CompareValidator7"
                                    ValidationGroup="basic" ErrorMessage="Please select a Gender"
                                    runat="server" Display="Dynamic"
                                    Operator="NotEqual" ValueToCompare="Select" Type="String" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>

                                <asp:TextBox ID="txtAddress" ValidationGroup="basic" CssClass="form-control" runat="server"
                                    TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="basic"
                                    ControlToValidate="txtAddress"
                                    Text="Address is required." />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label26" runat="server" Text="State"></asp:Label>

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
                                    ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label25" runat="server" Text="City"></asp:Label>

                                <asp:TextBox ID="txtCity" ValidationGroup="basic" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="basic"
                                    ControlToValidate="txtCity"
                                    Text="City is required." />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label10" runat="server" Text="Marital status"></asp:Label>

                                <asp:DropDownList ID="ddlMaritalStatus" ValidationGroup="basic" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select">:: Select Marital Status :: </asp:ListItem>
                                    <asp:ListItem Value="Single">Single</asp:ListItem>
                                    <asp:ListItem Value="Married">Married</asp:ListItem>
                                    <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddlMaritalStatus" ID="CompareValidator1"
                                    ValidationGroup="basic" ErrorMessage="Please select a Marital Status"
                                    runat="server" Display="Dynamic"
                                    Operator="NotEqual" ValueToCompare="Select" Type="String" />
                                <%-- <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator9" Display="Dynamic"
                                ValidationGroup="basic" runat="server" ControlToValidate="ddlMaritalStatus"
                                Text="Marital Status is required."></asp:RequiredFieldValidator>--%>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Select Profile Photo"></asp:Label>

                                <div class="fileupload fileupload-new" data-provides="fileupload">

                                    <input id="fupProPic" type="file" name="file" onchange="previewFile()" runat="server" accept='image/*' /></span>
                                     <asp:Image ID="ImgProduct" CssClass="fileupload-preview thumbnail" Style="width: 200px; height: 150px; float: none" runat="server" ImageUrl="~/User/media/NoProfile.png" />
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
                                <asp:Button ID="btnUpdate" ValidationGroup="basic" CssClass="pagebtn pagebtn-blue" runat="server" Text="Update"
                                    OnClick="btnUpdate_Click" />
                                &nbsp;<asp:Button ID="brnCancel" CssClass="pagebtn pagebtn-blue" runat="server" Text="Cancel"
                                    OnClick="brnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Educational" class="tab-pane ">
                <h3 class="text-center">Educational Details</h3>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="form-horizontal" style="padding: 0px 15px 0px 10px">
                          
                            <div class="form-group">

                                <asp:Label ID="Label18" runat="server" Text="Course"></asp:Label>
                                <asp:TextBox ID="txtCourses" runat="server" CssClass="form-control" placeholder="Courses Eg : MCA"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="txtCourses_AutoCompleteExtender"
                                    runat="server" Enabled="True"
                                    TargetControlID="txtCourses" MinimumPrefixLength="1" EnableCaching="true"
                                    CompletionSetCount="1" CompletionInterval="1" ServiceMethod="GetCourses">
                                </cc1:AutoCompleteExtender>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label19" runat="server" Text="College"></asp:Label>
                                <asp:TextBox ID="txtCollege" runat="server" CssClass="form-control" placeholder="College Name"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label20" runat="server" Text="University"></asp:Label>
                                <asp:TextBox ID="txtUniversity" runat="server" CssClass="form-control" placeholder="University Name"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label21" runat="server" Text="Passing Year"></asp:Label>
                                <asp:TextBox ID="txtPassingYear" runat="server" CssClass="form-control" placeholder="Passing Year"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label22" runat="server" Text="Marks"></asp:Label>
                                <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" placeholder="Marks"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label23" runat="server" Text="Percentage"></asp:Label>
                                <asp:TextBox ID="txtPercent" runat="server" CssClass="form-control" placeholder="Percentage"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label24" runat="server" Text="Grade"></asp:Label>
                                <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" placeholder="Grade"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <asp:Button ID="btnSubmitEdu" runat="server" Text="Submit"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnSubmitEdu_Click" />
                                <asp:Button ID="btnEditEdu" runat="server" Text="Update" Visible="false"
                                    CssClass="pagebtn pagebtn-blue" OnClick="btnEditEdu_Click" />
                                &nbsp;<asp:Button ID="Button2" CssClass="pagebtn pagebtn-blue" runat="server" Text="Cancel"
                                    OnClick="brnCancel_Click" />
                            </div>

                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div id="education" runat="server" class="table-responsive">

                            <asp:GridView ID="grdEdus" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSourceed" OnRowCommand="grdEdus_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="varStudentClass" HeaderText="Course"
                                        SortExpression="varStudentClass" />
                                    <asp:BoundField DataField="varStudentCollege" HeaderText="College"
                                        SortExpression="varStudentCollege" />
                                    <asp:BoundField DataField="varStudentUniversity"
                                        HeaderText="University" SortExpression="varStudentUniversity" />
                                    <asp:BoundField DataField="varStudentPassingYear"
                                        HeaderText="PassingYear" SortExpression="varStudentPassingYear" />
                                    <asp:BoundField DataField="varStudentMarks" HeaderText="Marks"
                                        SortExpression="varStudentMarks" />
                                    <asp:BoundField DataField="varStudentPer" HeaderText="Percentile"
                                        SortExpression="varStudentPer" />
                                    <asp:BoundField DataField="varStudentGrade" HeaderText="Grade"
                                        SortExpression="varStudentGrade" />
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="edit" runat="server"
                                                Text="Edit" class="fa fa-edit pagebtn pagebtn-blue"
                                                CommandName="editedu"
                                                CommandArgument='<%# Eval("intId") %>'>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Qualifications Added</EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceed" runat="server"
                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>


            <div id="Professional" class="tab-pane ">
                <h3 class="text-center">Professional Details</h3>

                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                         <div class="form-horizontal" style="padding: 0px 15px 0px 10px">
                           
                            <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Name of Company"></asp:Label> 
                                
                                    <asp:TextBox ID="txtCompany" ValidationGroup="proff" runat="server" CssClass="form-control" placeholder="Name of Company"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="proff"
                                        ControlToValidate="txtCompany"
                                        Text="Company is required." />

                               </div>

                            <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Designation"></asp:Label> 
                                    <asp:TextBox ID="txtDesignation" ValidationGroup="proff" runat="server" CssClass="form-control" placeholder="Designation"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="proff"
                                        ControlToValidate="txtDesignation"
                                        Text="Designation is required." />

                                 </div>

                            <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Field of Expertise" /> 
                                    <asp:TextBox ID="txtExperience" ValidationGroup="proff" runat="server" CssClass="form-control" placeholder="Field of Expertise"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="proff"
                                        ControlToValidate="txtExperience"
                                        Text="Experience is required." />
                                </div>

                            <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="From"></asp:Label> 
                                    <asp:DropDownList ID="ddlFromMonth" ValidationGroup="proff" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=":: From Month ::">:: From Month :: </asp:ListItem>
                                        <asp:ListItem Value="January">January</asp:ListItem>
                                        <asp:ListItem Value="February">February</asp:ListItem>
                                        <asp:ListItem Value="March">March</asp:ListItem>
                                        <asp:ListItem Value="April">April</asp:ListItem>
                                        <asp:ListItem Value="May">May</asp:ListItem>
                                        <asp:ListItem Value="June">June</asp:ListItem>
                                        <asp:ListItem Value="July">July</asp:ListItem>
                                        <asp:ListItem Value="August">August</asp:ListItem>
                                        <asp:ListItem Value="September">September</asp:ListItem>
                                        <asp:ListItem Value="October">October</asp:ListItem>
                                        <asp:ListItem Value="November">November</asp:ListItem>
                                        <asp:ListItem Value="December">December</asp:ListItem>

                                    </asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlFromMonth" ID="CompareValidator3"
                                        ValidationGroup="proff" ErrorMessage="Please select a From Month"
                                        runat="server" Display="Dynamic"
                                        Operator="NotEqual" ValueToCompare=":: From Month ::" Type="String" />
                                
                                    <asp:DropDownList ID="ddlFromYear" ValidationGroup="proff" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=":: From Year ::">:: From Year :: </asp:ListItem>
                                        <asp:ListItem Value="1960">1960</asp:ListItem>
                                        <asp:ListItem Value="1961">1961</asp:ListItem>
                                        <asp:ListItem Value="1962">1962</asp:ListItem>
                                        <asp:ListItem Value="1963">1963</asp:ListItem>
                                        <asp:ListItem Value="1964">1964</asp:ListItem>
                                        <asp:ListItem Value="1965">1965</asp:ListItem>
                                        <asp:ListItem Value="1966">1966</asp:ListItem>
                                        <asp:ListItem Value="1967">1967</asp:ListItem>
                                        <asp:ListItem Value="1968">1968</asp:ListItem>
                                        <asp:ListItem Value="1969">1969</asp:ListItem>
                                        <asp:ListItem Value="1970">1970</asp:ListItem>
                                        <asp:ListItem Value="1971">1971</asp:ListItem>
                                        <asp:ListItem Value="1972">1972</asp:ListItem>
                                        <asp:ListItem Value="1973">1973</asp:ListItem>
                                        <asp:ListItem Value="1974">1974</asp:ListItem>
                                        <asp:ListItem Value="1975">1975</asp:ListItem>
                                        <asp:ListItem Value="1976">1976</asp:ListItem>
                                        <asp:ListItem Value="1977">1977</asp:ListItem>
                                        <asp:ListItem Value="1978">1978</asp:ListItem>
                                        <asp:ListItem Value="1979">1979</asp:ListItem>
                                        <asp:ListItem Value="1980">1980</asp:ListItem>
                                        <asp:ListItem Value="1981">1981</asp:ListItem>
                                        <asp:ListItem Value="1982">1982</asp:ListItem>
                                        <asp:ListItem Value="1983">1983</asp:ListItem>
                                        <asp:ListItem Value="1984">1984</asp:ListItem>
                                        <asp:ListItem Value="1985">1985</asp:ListItem>
                                        <asp:ListItem Value="1986">1986</asp:ListItem>
                                        <asp:ListItem Value="1987">1987</asp:ListItem>
                                        <asp:ListItem Value="1988">1988</asp:ListItem>
                                        <asp:ListItem Value="1989">1989</asp:ListItem>
                                        <asp:ListItem Value="1990">1990</asp:ListItem>
                                        <asp:ListItem Value="1991">1991</asp:ListItem>
                                        <asp:ListItem Value="1992">1992</asp:ListItem>
                                        <asp:ListItem Value="1993">1993</asp:ListItem>
                                        <asp:ListItem Value="1994">1994</asp:ListItem>
                                        <asp:ListItem Value="1995">1995</asp:ListItem>
                                        <asp:ListItem Value="1996">1996</asp:ListItem>
                                        <asp:ListItem Value="1997">1997</asp:ListItem>
                                        <asp:ListItem Value="1998">1998</asp:ListItem>
                                        <asp:ListItem Value="1999">1999</asp:ListItem>
                                        <asp:ListItem Value="2000">2000</asp:ListItem>
                                        <asp:ListItem Value="2001">2001</asp:ListItem>
                                        <asp:ListItem Value="2002">2002</asp:ListItem>
                                        <asp:ListItem Value="2003">2003</asp:ListItem>
                                        <asp:ListItem Value="2004">2004</asp:ListItem>
                                        <asp:ListItem Value="2005">2005</asp:ListItem>
                                        <asp:ListItem Value="2006">2006</asp:ListItem>
                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                        <asp:ListItem Value="2011">2011</asp:ListItem>
                                        <asp:ListItem Value="2012">2012</asp:ListItem>
                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                        <asp:ListItem Value="2016">2016</asp:ListItem>
                                        <asp:ListItem Value="2017">2017</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlToMonth" ID="CompareValidator5"
                                        ValidationGroup="proff" ErrorMessage="Please select a From year"
                                        runat="server" Display="Dynamic"
                                        Operator="NotEqual" ValueToCompare=":: From Year ::" Type="String" />
                                </div>

                            <div class="form-group">
                                    <asp:Label ID="Label12" runat="server" Text="To"></asp:Label> 
                                    <asp:DropDownList ID="ddlToMonth" AutoPostBack="true" OnSelectedIndexChanged="ddlToMonth_SelectedIndexChanged" ValidationGroup="proff" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=":: To Month ::">:: To Month :: </asp:ListItem>
                                        <asp:ListItem Value="January">January</asp:ListItem>
                                        <asp:ListItem Value="February">February</asp:ListItem>
                                        <asp:ListItem Value="March">March</asp:ListItem>
                                        <asp:ListItem Value="April">April</asp:ListItem>
                                        <asp:ListItem Value="May">May</asp:ListItem>
                                        <asp:ListItem Value="June">June</asp:ListItem>
                                        <asp:ListItem Value="July">July</asp:ListItem>
                                        <asp:ListItem Value="August">August</asp:ListItem>
                                        <asp:ListItem Value="September">September</asp:ListItem>
                                        <asp:ListItem Value="October">October</asp:ListItem>
                                        <asp:ListItem Value="November">November</asp:ListItem>
                                        <asp:ListItem Value="December">December</asp:ListItem>
                                        <asp:ListItem Value="Currently Working">Currently Working</asp:ListItem>

                                    </asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlToMonth" ID="CompareValidator4"
                                        ValidationGroup="proff" ErrorMessage="Please select a From Month"
                                        runat="server" Display="Dynamic"
                                        Operator="NotEqual" ValueToCompare=":: To Month ::" Type="String" />
                                
                                    <asp:DropDownList ID="ddlToYear" ValidationGroup="proff" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=":: To Year ::">:: To Year :: </asp:ListItem>
                                        <asp:ListItem Value="1960">1960</asp:ListItem>
                                        <asp:ListItem Value="1961">1961</asp:ListItem>
                                        <asp:ListItem Value="1962">1962</asp:ListItem>
                                        <asp:ListItem Value="1963">1963</asp:ListItem>
                                        <asp:ListItem Value="1964">1964</asp:ListItem>
                                        <asp:ListItem Value="1965">1965</asp:ListItem>
                                        <asp:ListItem Value="1966">1966</asp:ListItem>
                                        <asp:ListItem Value="1967">1967</asp:ListItem>
                                        <asp:ListItem Value="1968">1968</asp:ListItem>
                                        <asp:ListItem Value="1969">1969</asp:ListItem>
                                        <asp:ListItem Value="1970">1970</asp:ListItem>
                                        <asp:ListItem Value="1971">1971</asp:ListItem>
                                        <asp:ListItem Value="1972">1972</asp:ListItem>
                                        <asp:ListItem Value="1973">1973</asp:ListItem>
                                        <asp:ListItem Value="1974">1974</asp:ListItem>
                                        <asp:ListItem Value="1975">1975</asp:ListItem>
                                        <asp:ListItem Value="1976">1976</asp:ListItem>
                                        <asp:ListItem Value="1977">1977</asp:ListItem>
                                        <asp:ListItem Value="1978">1978</asp:ListItem>
                                        <asp:ListItem Value="1979">1979</asp:ListItem>
                                        <asp:ListItem Value="1980">1980</asp:ListItem>
                                        <asp:ListItem Value="1981">1981</asp:ListItem>
                                        <asp:ListItem Value="1982">1982</asp:ListItem>
                                        <asp:ListItem Value="1983">1983</asp:ListItem>
                                        <asp:ListItem Value="1984">1984</asp:ListItem>
                                        <asp:ListItem Value="1985">1985</asp:ListItem>
                                        <asp:ListItem Value="1986">1986</asp:ListItem>
                                        <asp:ListItem Value="1987">1987</asp:ListItem>
                                        <asp:ListItem Value="1988">1988</asp:ListItem>
                                        <asp:ListItem Value="1989">1989</asp:ListItem>
                                        <asp:ListItem Value="1990">1990</asp:ListItem>
                                        <asp:ListItem Value="1991">1991</asp:ListItem>
                                        <asp:ListItem Value="1992">1992</asp:ListItem>
                                        <asp:ListItem Value="1993">1993</asp:ListItem>
                                        <asp:ListItem Value="1994">1994</asp:ListItem>
                                        <asp:ListItem Value="1995">1995</asp:ListItem>
                                        <asp:ListItem Value="1996">1996</asp:ListItem>
                                        <asp:ListItem Value="1997">1997</asp:ListItem>
                                        <asp:ListItem Value="1998">1998</asp:ListItem>
                                        <asp:ListItem Value="1999">1999</asp:ListItem>
                                        <asp:ListItem Value="2000">2000</asp:ListItem>
                                        <asp:ListItem Value="2001">2001</asp:ListItem>
                                        <asp:ListItem Value="2002">2002</asp:ListItem>
                                        <asp:ListItem Value="2003">2003</asp:ListItem>
                                        <asp:ListItem Value="2004">2004</asp:ListItem>
                                        <asp:ListItem Value="2005">2005</asp:ListItem>
                                        <asp:ListItem Value="2006">2006</asp:ListItem>
                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                        <asp:ListItem Value="2011">2011</asp:ListItem>
                                        <asp:ListItem Value="2012">2012</asp:ListItem>
                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                        <asp:ListItem Value="2016">2016</asp:ListItem>
                                        <asp:ListItem Value="2017">2017</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlToYear" ID="CompareValidator6"
                                        ValidationGroup="proff" ErrorMessage="Please select a To Year"
                                        runat="server" Display="Dynamic"
                                        Operator="NotEqual" ValueToCompare=":: To Year ::" Type="String" />
                                </div>

                            <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Responsibilities"></asp:Label> 
                                    <asp:TextBox TextMode="MultiLine" ValidationGroup="proff" ID="txtResponsibilities" runat="server" CssClass="form-control" placeholder="Responsibilities"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="proff"
                                        ControlToValidate="txtResponsibilities"
                                        Text="Responsibilities is required." />
                                </div>

                            <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="CTC"></asp:Label> 
                                    <asp:TextBox ID="txtCTC" ValidationGroup="proff" runat="server" CssClass="form-control" placeholder="CTC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                                        runat="server"
                                        Display="Dynamic"
                                        ValidationGroup="proff"
                                        ControlToValidate="txtCTC"
                                        Text="CTC is required." />
                                  </div>

                            <div class="form-group">
                                    <asp:Button ID="btnSubmitProf" runat="server" Text="Submit" ValidationGroup="proff"
                                        CssClass="pagebtn pagebtn-blue" OnClick="btnSubmitProf_Click" />
                                    <asp:Button ID="btnEditProf" runat="server" Text="Update" ValidationGroup="proff"
                                        CssClass="pagebtn pagebtn-blue" OnClick="btnEditProf_Click" Visible="false" />
                                    &nbsp;<asp:Button ID="Button4" CssClass="pagebtn pagebtn-blue" runat="server" Text="Cancel"
                                        OnClick="brnCancel_Click" />
                                </div>
                             </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False"
                                OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company"></asp:BoundField>
                                    <asp:BoundField DataField="Desig" HeaderText="Desig" SortExpression="Desig"></asp:BoundField>
                                    <asp:BoundField DataField="Exp" HeaderText="Expertise" SortExpression="Exp"></asp:BoundField>
                                    <asp:BoundField DataField="WorkingFrom" HeaderText="From" SortExpression="WorkingFrom"></asp:BoundField>
                                    <asp:BoundField DataField="WorkingTill" HeaderText="To" SortExpression="WorkingTill"></asp:BoundField>
                                    <asp:BoundField DataField="Responsibilities" HeaderText="Work" SortExpression="Responsibilities"></asp:BoundField>
                                    <asp:BoundField DataField="CTC" HeaderText="CTC" SortExpression="CTC"></asp:BoundField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="edit" runat="server"
                                                CssClass="fa fa-edit pagebtn pagebtn-blue" class="btn-warning"
                                                CommandName="editpro"
                                                CommandArgument='<%# Eval("intId") %>'>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Professional Details Added</EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>

            </div>
            <div id="Password" class="tab-pane ">
                <h3 class="text-center">Change Password</h3>
              <div class="col-lg-8 col-lg-offset-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-3">
                                <asp:Label ID="oldPassword" runat="server" Text="Old Password"></asp:Label>
                            </div>

                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtOldPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="passw"
                                    ControlToValidate="TxtOldPassword"
                                    Text="Old password is required." />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">

                            <div class="col-lg-3">
                                <asp:Label ID="NewPassword" runat="server" Text="New Password"></asp:Label>
                            </div>

                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtNewPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="passw"
                                    ControlToValidate="TxtNewPassword"
                                    Text="New password is required." />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">

                            <div class="col-lg-3">
                                <asp:Label ID="ConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                            </div>

                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtConfirmPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                    runat="server"
                                    Display="Dynamic"
                                    ValidationGroup="passw"
                                    ControlToValidate="TxtConfirmPassword"
                                    Text="Confirm password is required." />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-6">
                                <asp:Button ID="Change" ValidationGroup="passw" runat="server" Text="CHANGE" OnClick="Change_Click" Class="pagebtn pagebtn-blue" />

                            </div>
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

