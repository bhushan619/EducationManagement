<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="college_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="text-center">
            <h3>Welcome
                        <asp:Label ID="lblCollegName" Font-Size="X-Large" runat="server" Text="Label"></asp:Label>
            </h3>
            <div class="text-center">
                <h3>Students Applied</h3>
            </div>

            <div class="text-center">
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked text-left">

                        <li class="active">
                            <a href="Inbox.aspx"><i class="fa fa-arrow-circle-o-down" aria-hidden="true"></i>Applications Recieved</a> </li>


                        <li>
                            <a href="AppsUnderprocess.aspx"><i class="fa fa-spinner" aria-hidden="true"></i>Applications under process</a></li>


                        <li>
                            <a href="AppSchedule.aspx"><i class="fa fa-calendar-plus-o" aria-hidden="true"></i>Appointment scheduled</a>  </li>


                        <li>
                            <a href="AppsConfirm.aspx"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>Appointment confirmed</a>     </li>


                        <li>
                            <a href="VisitDone.aspx"><i class="fa fa-calendar" aria-hidden="true"></i>Visit done</a>  </li>


                        <li>
                            <a href="AdmissionConfirmed.aspx"><i class="fa fa-check-circle-o" aria-hidden="true"></i>Admission confirmed</a> </li>


                        <li>
                            <a href="AdmissionRejected.aspx"><i class="fa fa-times-circle-o" aria-hidden="true"></i>Admission rejected</a>   </li>
                    </ul>
                    <br />
                    <br />
                </div>

                <div class="col-lg-6 table-responsive">

                    <asp:GridView ID="grdAppointment" runat="server" AutoGenerateColumns="false"
                        OnRowDataBound="OnRowDataBound"
                        CssClass="table table-bordered" EmptyDataText="No Appointments">
                    </asp:GridView>
                </div>
                <div class="col-md-3 text-center">
                    <div class="login-wrapper rlp-wrapper">
                        <div class="login-table rlp-table">
                            <div class="login-title rlp-title" style="color: #221E1F;"></div>
                            <div class="login-form bg-w-form rlp-form">
                                <div class="row">
                                    <div class="login-title rlp-title text-center" style="color: #221E1F;">
                                        Map Yourself with #coursekatta
                                         <br />
                                        <br />
                                        Advertize Here  
                                      
                                    </div>
                                    <img src="../assets/images/logo-color-1.png" width="200" height="60" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />

                </div>
            </div>
        </div>

    </div>
</asp:Content>

