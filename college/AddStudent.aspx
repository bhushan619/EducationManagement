<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="college_AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center"> <h3>Welcome
                        <asp:Label ID="lblCollegName" Font-Size="X-Large" runat="server" Text="Label"></asp:Label><br />
                             Add New Student</h3>
                  </div>
                  <div class="services_grids">
						  <div id=".canvas">
								<div class="skill-grids text-center">
										<div class="col-md-2"></div>
										<div class="col-md-8">	
						 <table class="table table-responsive mybg">                        
                               
                                                           
                                   <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label9" runat="server" Text="Student Name"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="TextBox1" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label20" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtAddress" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label21" runat="server" Text="City"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtCity" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label22" runat="server" Text="State"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                                        DataSourceID="SqlDataSourceState" DataTextField="varState" 
                                        DataValueField="varState">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceState" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:coursekattaConnectionString.ProviderName  %>"
                                        SelectCommand="SELECT DISTINCT varState FROM tbledmitrastate ORDER BY varState">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label24" runat="server" Text="Mobile"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtMobile" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label26" runat="server" Text="E-Mail"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtEmail" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                              <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Course Interested In"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtCourseInterested" required runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                              <tr>
                                <td class="text-right">
                                    <asp:Label ID="Label3" runat="server" Text="Referred By"></asp:Label>
                                </td>
                                <td colspan="2" align="left">
                                    <asp:TextBox ID="txtReferedBy" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                              <tr>
                              <td></td>
                              <td colspan="2" align="left">
                              <asp:Button ID="btnSubmit" runat="server"  Text="Submit" 
                                  CssClass="btn btn-info" onclick="btnSubmit_Click"  />  
                     
                         &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                  CssClass="btn btn-info" onclick="btnCancel_Click"  /></td>
                             </tr>
                 </table>						  
										</div>
										
									
								  </div>
						   </div>
					  </div>
                   
                  </div>
                  </div>
</asp:Content>

