<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-login">
        <div class="container">
           <div class="col-lg-5 col-md-offset-4">
                <div class="rlp-table"> 
                <div id="stu" runat="server">
                    <div class="row">
                        <div class="col-lg-12"> 
                               <div style="margin-bottom: 10px;margin-top: 10px;" class="login-title rlp-title text-center">
                                    Register for free
                                </div>
                                <div class=" text-center">
                                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <div id="reg" runat="server">
                                    <div class="input-group" style="padding-bottom: 5px">

                                        <asp:TextBox ID="txtName" required="required" runat="server" CssClass="custom-form-control" placeholder="First Name"></asp:TextBox>

                                        <span class="input-group-addon" style="border: 0px;background-color:#fff"></span>
                                        <asp:TextBox ID="txtLastName" required="required" runat="server" CssClass="custom-form-control" placeholder="Last Name"></asp:TextBox>


                                    </div>
                                    <br />
                                    <div class="custom-form-group">
                                        <asp:TextBox ID="txtEmail" required="required" runat="server" CssClass="custom-form-control" placeholder="E-Mail"
                                            pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum|in|co.in)"></asp:TextBox>
                                    </div>
                                   <br />
                                    <div class="custom-form-group">
                                        <asp:TextBox ID="txtPhone" pattern="[7-9]{1}[0-9]{9}" required="required" runat="server" CssClass="custom-form-control" placeholder="Mobile"></asp:TextBox>
                                    </div>
                                 <br />
                                    <div class="custom-form-group">

                                        <asp:TextBox ID="txtPassOne" required="required" runat="server"
                                            CssClass="custom-form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="custom-form-group">

                                        <asp:TextBox ID="txtPassTwo" required="required" runat="server"
                                            CssClass="custom-form-control" placeholder="Enter Confirm Password" onkeyup="checkPassStu(); return false;"
                                            TextMode="Password"></asp:TextBox>
                                        <asp:Literal ID="pas" runat="server"></asp:Literal>
                                    </div>
                                  <br />
                                    <div class="custom-form-group btn-xs">
                                        By clicking Register Now, you agree to the coursekatta <a href="TACPP.aspx" class=" btn-xs" target="_blank">User Agreements, Terms and Conditions, Privacy Policy and Cookie Policy.</a>
                                    </div>
                                  <br />
                                    <div class="custom-form-group">
                                        <asp:Button ID="btnReg" runat="server" Width="100%"
                                            Text="Register Now" OnClick="btnRegStudent_Click" class="pagebtn pagebtn-blue" />
                                    </div>
                                    <br />
                                </div>
                                <div id="otp" runat="server" visible="false" style="padding-top: 100px; padding-bottom: 100px;">
                                    <div class="custom-form-group">
                                        <asp:TextBox ID="TxtOTP" runat="server" CssClass="custom-form-control" placeholder="Enter OTP"></asp:TextBox>
                                        <span class="glyphicon glyphicon-lock custom-form-control-feedback"></span>
                                    </div>

                                    <div class="custom-form-group">
                                        <asp:Button ID="BtnComplete" runat="server" Text="Verify OTP" Width="100%"
                                            class="pagebtn pagebtn-blue" OnClick="BtnComplete_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
               
                    <%--<div id="stu" runat="server">
                        <div class="row">
                            <div class="col-lg-12 col-md-offset-2">
                                <div class="col-md-8">
                                    <h3 class="text-center">Create Your Own Educational Story<br />
                                        Get started...It’s Free
                                    </h3>
                                    <div class=" text-center">
                                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-3">
                                            <label for="regemail" class="control-label form-label" style="margin-top: 8px;">Register as <span class="highlight">*</span></label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rdbStudent" runat="server" CssClass="radio" required
                                                Text="Student" GroupName="as" />
                                        </div>

                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rdbCollege" runat="server" CssClass="radio" required
                                                Text="Institute" GroupName="as" />
                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rdbTutor" runat="server" CssClass="radio" required
                                                Text="Tutor" GroupName="as" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RadioButton ID="rdbAdvertiser" runat="server" CssClass="radio" required
                                                Text="Advertiser" GroupName="as" />
                                        </div>

                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtName" required="required" runat="server" CssClass="form-control form-input" placeholder="Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtEmail" required="required" runat="server" CssClass="form-control form-input" placeholder="E-Mail"
                                            pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPhone" pattern="[7-9]{1}[0-9]{9}" required="required" runat="server" CssClass="form-control form-input" placeholder="Mobile"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPassOne" required="required" runat="server"
                                            CssClass="form-control form-input" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPassTwo" required="required" runat="server"
                                            CssClass="form-control form-input" placeholder="Enter Confirm Password" onkeyup="checkPassStu(); return false;"
                                            TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        By clicking Register Now, you agree to the coursekatta User Agreements, Terms and Conditions, Privacy Policy and Cookie Policy.
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnReg" runat="server"
                                            Text="Register Now" OnClick="btnRegStudent_Click" CssClass="btn form-control  form-input" Style="color: #1b4969; font-size: x-large; font-weight: 800;" />
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>--%>
                    <div class="clearfix"></div>
                </div>
            
        </div>
    </div>

</asp:Content>

