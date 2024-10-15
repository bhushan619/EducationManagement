<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ViewCollege.aspx.cs" Inherits="admin_ViewCollege" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	  <div class="container">

									 
										<div class="col-lg-12 text-center table-responsive">	
                                              <h3> View Institutes/Comapanies </h3>
                                <asp:GridView ID="grdCollege" runat="server" CssClass="table mybg" 
                                  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                  DataSourceID="SqlDataSourceCollege" onrowcommand="grdCollegeData_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="varCollegeName" HeaderText="Name" 
                                            SortExpression="varCollegeName" />
                                        <asp:BoundField DataField="varCollegeCity" HeaderText="College City" 
                                            SortExpression="varCollegeCity" />
                                        <asp:BoundField DataField="varContactOne" HeaderText="Contact One" 
                                            SortExpression="varContactOne" />
                                        <asp:BoundField DataField="varContactTwo" HeaderText="Contact Two" 
                                            SortExpression="varContactTwo" />
                                        <asp:BoundField DataField="varCollegePrincipal" HeaderText="Cnt Person" 
                                            SortExpression="varCollegePrincipal" />
                                        <asp:TemplateField HeaderText="">
                                 <ItemTemplate> 
                               <%--   <asp:LinkButton ID="view" runat="server" 
                                      Text="" class="btn btn-primary fa fa-edit"
                                    CommandName="view" 
                                    CommandArgument='<%# Eval("intCollegeId") %>'>
                                </asp:LinkButton> 
                                      <asp:LinkButton ID="LinkButton1" runat="server" 
                                      Text="" class="btn btn-success fa fa-inr"
                                    CommandName="upg" 
                                    CommandArgument='<%# Eval("intCollegeId") %>'>
                                </asp:LinkButton> --%>
                                      <asp:LinkButton ID="LinkButton2" runat="server" 
                                      Text="" class="btn btn-danger fa fa-times"
                                    CommandName="upg" 
                                    CommandArgument='<%# Eval("intCollegeId") %>'>
                                </asp:LinkButton> 
                                 </ItemTemplate>
                             </asp:TemplateField> 
                                    </Columns>

                                </asp:GridView>           
                                
                                            <asp:SqlDataSource ID="SqlDataSourceCollege" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                                ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' SelectCommand="SELECT DISTINCT intCollegeId, varCollegeName, varCollegeCity, varContactOne, varContactTwo, varCollegePrincipal FROM tblcollegedetails">
                              </asp:SqlDataSource>						  
										</div>
										
										
								  </div>
					<br /><br />
  

</asp:Content>

