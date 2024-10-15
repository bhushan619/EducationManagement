<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="CollegePay.aspx.cs" Inherits="college_CollegePay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <div id="plans" runat="server" visible="false">
                         <table class="table table-bordered mybg">
                            <tr>
                                <th>
                                    Plan Features</th>
                                <th>
                                    Basic</th>
                                <th>
                                   Premium</th>
                                <th>
                                    Gold</th>
                                <th>
                                    Platinum</th>
                            </tr>
                            <tr>
                                <td>
                                   Add Validity</td>
                                <td>
                                   30 Days</td>
                                <td>
                                   90 Days</td>
                                <td>
                                    180 Days</td>
                                <td>
                                   365 Days</td>
                            </tr>
                            <tr>
                                <td>
                                   AMS Validity</td>
                                <td>
                                   30 Days</td>
                                <td>
                                   90 Days</td>
                                <td>
                                    180 Days</td>
                                <td>
                                   365 Days</td>
                            </tr>
                            <tr>
                                <td>
                                   SMS</td>
                                <td>
                                   100</td>
                                <td>
                                   500</td>
                                <td>
                                    1000</td>
                                <td>
                                    Unlimited</td>
                            </tr>
                            <tr>
                                <td>
                                   Mails</td>
                                <td>
                                   100 </td>
                                <td>
                                   500 </td>
                                <td>
                                    1000</td>
                                <td>
                                  Unlimited  </td>
                            </tr>
                            <tr>
                                <td>
                                    Call Assistance</td>
                                <td>
                                   No </td>
                                <td>
                                   Yes </td>
                                <td>
                                   Yes </td>
                                <td>
                                  Yes  </td>
                            </tr>
                            <tr>
                                <td>
                                  Chat Facility</td>
                                <td>
                                   No </td>
                                <td>
                                    Yes</td>
                                <td>
                                    Yes</td>
                                <td>
                                   Yes </td>
                            </tr>
                            <tr>
                                <td>
                                    Post Editing</td>
                                <td>
                                    No</td>
                                <td>
                                   Yes </td>
                                <td>
                                    Yes</td>
                                <td>
                                    Yes</td>
                            </tr>
                            <tr>
                                <td>
                                    Cost</td>
                                <td>
                                    5000/-</td>
                                <td>
                                    15,000/-</td>
                                <td>
                                   30,000/- </td>
                                <td>
                                   60,000/- </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1"  class="btn btn-info" runat="server" Text="Buy Plan 1" 
                                        CausesValidation="False" /></td>
                                <td>
                                       <asp:Button ID="Button2"  class="btn btn-info" runat="server" Text="Buy Plan 2" 
                                           CausesValidation="False" /></td>
                                <td>
                                       <asp:Button ID="Button3"  class="btn btn-info" runat="server" Text="Buy Plan 3" 
                                           CausesValidation="False" /></td>
                                <td>
                                        <asp:Button ID="Button4"  class="btn btn-info" runat="server" Text="Buy Plan 4" 
                                            CausesValidation="False" /></td>
                            </tr>
                             <tr>
                                <td colspan="5">
                                  <asp:Button ID="Button5"  class="btn btn-info" runat="server" 
                                        Text="Continue as free" CausesValidation="False" /></td>
                                 
                            </tr>
                            <tr>
                                <td colspan="5">
                                  (Above cost is exclusive of service tax, 12.36% service tax will be charged extra)  </td>
                                 
                            </tr>
                        </table></div>
    </div>
</asp:Content>

