<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="admin_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">

									 
										<div class="col-lg-12 text-center table-responsive">	
                                              <h3> View Users </h3>
                                <asp:GridView ID="grdCollege" runat="server" CssClass="table mybg" 
                                  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                  DataSourceID="SqlDataSourceCollege"  >
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name"
                                            SortExpression="Name" />
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                                        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact"></asp:BoundField>
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>


                                        <asp:BoundField DataField="Gender" HeaderText="Gender"
                                            SortExpression="Gender" />
                                         
                                    </Columns>

                                </asp:GridView>           
                                
                                            <asp:SqlDataSource ID="SqlDataSourceCollege" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' 
                                                SelectCommand="SELECT DISTINCT varuserName AS Name, varuserCity AS City, varContactOne AS Contact, varuserEmail AS Email, varGender AS Gender FROM tbluserdetails">
                              </asp:SqlDataSource>						  
										</div>
										
										
								  </div>
					<br /><br />
</asp:Content>

