<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="EditPackage.aspx.cs" Inherits="admin_EditPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="panel panel-danger center">
                <div class="panel-heading">
                    <h3 class="panel-title">Edit Package Details  </h3>
                </div>

                <div class=" panel-body">
                    <div class="col-lg-10">

                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span>Package Name </span>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <asp:Label ID="ddlPackageN" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span>Package Duration</span>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <asp:DropDownList ID="txtDuration" runat="server" required="required" CssClass="form-control">
                                        <asp:ListItem Value="">Select</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlDuration" runat="server" required="required" CssClass="form-control">
                                        <asp:ListItem Value="">Select</asp:ListItem>
                                        <asp:ListItem>Month</asp:ListItem>
                                        <asp:ListItem>Year</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <span>Contact numbers </span>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="form-group">
                                    <asp:TextBox ID="txtContact" runat="server" required="required" onkeyup="checkDec(this);" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span>Package Price </span>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <asp:TextBox ID="txtPrice" runat="server" onkeyup="checkDec(this);" required="required" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span>Package Description </span>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <asp:TextBox ID="txtDescription" runat="server" required="required" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span>Benefits of Package </span>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <asp:TextBox ID="txtBenefit" runat="server" required="required" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-5">
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">

                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Update" CssClass="btn btn-warning" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

