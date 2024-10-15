<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageClg.master" AutoEventWireup="true" CodeFile="AdminSetting.aspx.cs" Inherits="college_AdminSetting" %>

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
        
                <h3 >Admin Setting </h3> 
                <span class="pull-right" style="margin-top: -40px;">
                    <asp:LinkButton ID="Button4" Width="100%" runat="server" CssClass="pagebtn pagebtn-blue" PostBackUrl="~/college/ComProfile.aspx" Text="Back to Page"></asp:LinkButton></span>
                <ul class="nav nav-tabs  responsive-tabs" id="Tabs"> 
                        <li class="active"><a data-toggle="tab" href="#Recieved" style="padding: 10px 8px">Appli'ns Recieved</a></li>
                        <li><a data-toggle="tab" href="#process" style="padding: 10px 8px">Appli'ns under process</a></li>
                        <li><a data-toggle="tab" href="#scheduled" style="padding: 10px 8px">App'int scheduled</a></li>
                        <li><a data-toggle="tab" href="#confirmed" style="padding: 10px 8px">App'int confirmed</a></li>
                        <li><a data-toggle="tab" href="#done" style="padding: 10px 8px">Visit done</a></li>
                        <li><a data-toggle="tab" href="#aconfirmed" style="padding: 10px 8px">Admission confirmed</a></li>
                        <li><a data-toggle="tab" href="#rejected" style="padding: 10px 8px">Admission rejected</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="Recieved" class="tab-pane active" >
                            <h3 class="text-center">Applications Recieved</h3>
                             <asp:GridView ID="GridViewRecieved" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewRecieved_OnRowDataBound" 
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="process" class="tab-pane " >
                            <h3 class="text-center">Applications under process</h3>
                             <asp:GridView ID="GridViewprocess" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewprocess_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="scheduled" class="tab-pane " >
                            <h3 class="text-center">Appointment scheduled</h3>
                             <asp:GridView ID="GridViewscheduled" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewscheduled_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="confirmed" class="tab-pane " >
                            <h3 class="text-center">Appointment confirmed</h3>
                             <asp:GridView ID="GridViewAppconfirmed" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewAppconfirmed_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="done" class="tab-pane " >
                            <h3 class="text-center">Visit done</h3>
                             <asp:GridView ID="GridViewVisitdone" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewVisitdone_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="aconfirmed" class="tab-pane " >
                            <h3 class="text-center">Admission confirmed</h3>
                            <asp:GridView ID="grdAdmissionConfirmed" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="grdAdmissionConfirmed_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>
                        <div id="rejected" class="tab-pane " >
                            <h3 class="text-center">Admission rejected</h3>
                             <asp:GridView ID="GridViewAdmissionrejected" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="GridViewAdmissionrejected_OnRowDataBound"
                                CssClass="table table-bordered" EmptyDataText="No Admission confirmed">
                            </asp:GridView>
                        </div>

                    </div>
                </div>
           

        <script>
        $('.responsive-tabs').responsiveTabs({
            accordionOn: ['xs', 'sm']
        });
    </script>
</asp:Content>

