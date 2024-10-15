<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUser.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="User_ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-12">
        <div class="col-lg-8">
            <div class="panel panel-danger center">
                <div class="panel-heading">
                    <h3 class="panel-title">Your Orders</h3>
                </div>
                <div class=" panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <asp:GridView ID="grdPaidMember" runat="server" AllowPaging="True" OnPageIndexChanging="grdPaidMember_PageIndexChanging"
                                    CssClass="table table-bordered" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="varMemberName" HeaderText="College Name" SortExpression="varMemberName" />
                                        <asp:BoundField DataField="varPaymentAmount" HeaderText="Paid" SortExpression="varPaymentAmount" />
                                        <asp:BoundField DataField="PackageName" HeaderText="Package" SortExpression="PackageName" />
                                        <asp:BoundField DataField="varPaymentStatus" HeaderText="Status " SortExpression="varPaymentStatus" />
                                        <asp:BoundField DataField="varOrderStatus" HeaderText="Order Status " SortExpression="varOrderStatus" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="well-sm"><span>You Have Not Purchased Any Package, Please Upgrade Now...</span> </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-danger center">
                <div class="panel-heading">
                    <h3 class="panel-title">Your Subscription</h3>
                </div>

                <div class=" panel-body">
                    <div class="row">

                        <div class="col-lg-12">

                            <div class="table-responsive">
                                <asp:GridView ID="grdContacts" runat="server" AllowPaging="True" CssClass="table table-bordered text-center"
                                    AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="varOrderId" HeaderText="OrderId" SortExpression="varOrderId" />

                                        <asp:BoundField DataField="varFromDate" HeaderText="From Date" SortExpression="varFromDate" />
                                        <asp:BoundField DataField="varToDate" HeaderText="To Date" SortExpression="varToDate" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Data Found.  

                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>

