<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="PackageRegister.aspx.cs" Inherits="admin_PackageRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container ">
        <div class="col-lg-10 col-lg-offset-1  mybg">


            <h3 class="text-center">Add New Package </h3>
            <div id="packtext" runat="server" visible="false">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Package Name  </span>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:TextBox ID="txtpackage" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span></span>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:Button ID="btnAddpack" runat="server" Text="Save" OnClick="btnAddpack_Click" CssClass="btn btn-success" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </div>

            </div>

            <%--             new div--%>
            <div id="other" runat="server">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Package Name  </span>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <asp:DropDownList ID="ddlPackageName" runat="server" required="required" AppendDataBoundItems="True" CssClass="form-control">
                                <asp:ListItem Value="">--Select Package--</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <asp:LinkButton ID="btnadd" runat="server" Text="New Package" CssClass="btn btn-primary" OnClick="btnadd_Click" CausesValidation="False" />
                        </div>
                    </div>

                </div>


                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Package Duration </span>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <asp:DropDownList ID="txtDuration" runat="server" required="required" CssClass="form-control">
                                <asp:ListItem Value="">Select</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                               

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <asp:DropDownList ID="ddlDuration" runat="server" required="required" CssClass="form-control">
                                <asp:ListItem Value="">Select</asp:ListItem>
                                <asp:ListItem>Month</asp:ListItem>
                                <%--                            <asp:ListItem>Year</asp:ListItem>--%>
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
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Package Price </span>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:TextBox ID="txtPrice" runat="server" required="required" onkeyup="checkDec(this);" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Package Description </span>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:TextBox ID="txtDescription" runat="server" required="required" CssClass="form-control"
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <span>Benefits of Package </span>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:TextBox ID="txtBenefit" runat="server" TextMode="MultiLine" required="required" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>


            </div>




            <div class="col-lg-12">
                <h3 class="text-center">Packages List </h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>"
                    SelectCommand="SELECT DISTINCT tblampackages.varPackageId, tblampackages.varPackageName, tblampackagesdetails.varPackageDescription, tblampackagesdetails.varPackageDuration, tblampackagesdetails.varPackagePrice, tblampackagesdetails.varBenifits, tblampackagesdetails.varPackageDurationTime FROM tblampackages INNER JOIN tblampackagesdetails ON tblampackages.varPackageId = tblampackagesdetails.varPackageId"></asp:SqlDataSource>
                <br />
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"
                    OnItemCommand="ListView1_ItemCommand">


                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>
                                    <%--  No Packages Found.--%></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <span style="">
                            <div class="col-md-4 text-center">
                                <div class="panel panel-danger panel-pricing">
                                    <div class="panel-heading">
                                        <i class="fa fa-desktop"></i>
                                        <h3>
                                            <asp:Label ID="varPackageNameLabel" runat="server" Text='<%# Eval("varPackageName") %>' /></h3>
                                    </div>
                                    <div class="panel-body text-center">
                                        <p><strong><i class="fa fa-inr"></i>
                                            <asp:Label ID="varPackagePriceLabel" runat="server" Text='<%# Eval("varPackagePrice") %>' /></strong></p>
                                    </div>
                                    <ul class="list-group text-center">
                                        <li class="list-group-item"><i class="fa fa-check"></i>
                                            <asp:Label ID="varPackageDescriptionLabel" runat="server" Text='<%# Eval("varPackageDescription") %>' /></li>
                                        <li class="list-group-item"><i class="fa fa-check"></i>
                                            <asp:Label ID="varPackageDurationLabel" runat="server" Text='<%# Eval("varPackageDuration") %>' />
                                            <asp:Label ID="varPackageDurationTimeLabel" runat="server" Text='<%# Eval("varPackageDurationTime") %>' /></li>
                                        <li class="list-group-item"><i class="fa fa-check"></i>
                                            <asp:Label ID="varBenifitsLabel" runat="server" Text='<%# Eval("varBenifits") %>' /></li>
                                    </ul>
                                    <div class="panel-footer">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass=" fa fa-edit loginbtn" CommandArgument='<%# Eval("varPackageId")+";"+ Eval("varPackageName") +";"+ Eval("varPackageDuration") +";"+ Eval("varPackageDurationTime") %>' CommandName="buy">&nbsp;Edit</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>


            </div>
        </div>
    </div>
</asp:Content>

