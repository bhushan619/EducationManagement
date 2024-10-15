<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddFacilities.aspx.cs" Inherits="admin_AddFacilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add Facility Details of Institute : <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
                  <div class="services_grids">
						  <div id=".canvas">
								<div class="skill-grids text-center"> 
											<div class="row col-lg-12">
                                    	<div class="col-md-3">	
						 <table class="table mybg" > 
                                 <tr align="left">
                            <td>
                                 <asp:LinkButton ID="lnkProfile" runat="server" Text="Profile" 
                                     CausesValidation="false" onclick="lnkProfile_Click"
                                   />  </td>
                           
                        </tr>
                        <tr> <td align="left"> 
                            <asp:LinkButton ID="lnkAddDetails" runat="server" Text="Add Details" 
                                     CausesValidation="false" onclick="lnkAddDetails_Click"  
                                   /> 
                      </td>
                            
                        </tr>
                        <tr>
                            <td align="left">
                              <asp:LinkButton ID="btnImages" runat="server" Text="Images"   
                                    CausesValidation="false" onclick="btnImages_Click"
                                 /></td>
                            
                        </tr>
                         <tr>
                            <td align="left">
                           <asp:LinkButton ID="btnMedia" runat="server" Text="Video"   CausesValidation="false"
                                  onclick="btnMedia_Click" /> </td>
                            
                        </tr>
                         <tr>
                            <td align="left">
                          <asp:LinkButton ID="btnFacilityDetail" runat="server" Text="Facilities" 
                                    CausesValidation="false" onclick="btnFacilityDetail_Click"
                                    />     </td>
                            
                        </tr>
                         <tr>
                            <td align="left">
                            <asp:LinkButton ID="btnLastsDetails" runat="server" Text="Courses Details" 
                                    CausesValidation="false" onclick="btnLastsDetails_Click"
                                   />	  </td></tr>
                                    
                                      <tr> <td align="left">
                            <asp:LinkButton ID="btnCompany" runat="server" Text="Company Details" 
                                    CausesValidation="false" onclick="btnCompany_Click" 
                                   />	  </td>
                                      <tr>
                                              <td align="left">
                            <asp:LinkButton ID="btnCoordinates" runat="server" Text="Institute  Coordinates" 
                                    CausesValidation="false" onclick="btnCoordinates_Click" 
                                   />	  </td>
                                          </tr>
                            
                        </tr>
                                                      
                              </table>					  
										</div>
										<div class="col-md-6">
<table class="table mybg">
                                           <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label1" runat="server" Text="Facility Name"></asp:Label></td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox></td>
                                           </tr>

                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label></td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtFDescrip" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                                           </tr>

                                            <tr>
                                               <td align="right"></td>
                                               <td align="left">
                                                   <asp:Button ID="btnAddFacility" CssClass="btn btn-info" runat="server" onclick="btnAddFacility_Click" 
                                                       Text="Add Details" />
                                                       &nbsp;<asp:Button ID="UpdateCom" CssClass="btn btn-info" runat="server"  
                                                       Text="Update" onclick="UpdateCom_Click" Visible="False" />
                                                </td>
                                           </tr>
                                            <tr>
                                               <td></td>
                                               <td></td>
                                           </tr>
                                            </table>
                                        </div>
                                        <div class="col-md-2 text-center">
                   
		 <asp:Image ID="imgProfile" Height="170px" Width="170px" runat="server"  />
                      <br />  <br /> 
                      <asp:Button ID="btnUpload" runat="server" Text="Upload Photo"   
                           CssClass="btn btn-info" onclick="btnUpload_Click"  />
                     
                       </div>
                       </div>
                         <div class="row col-lg-12"> 
                       
                         <div class="col-md-9">
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                          onrowcommand="grdCollegeData_RowCommand"
                          DataSourceID="SqlDataSource1" CssClass="table table-bordered mybg table-responsive text-justify" 
                                                       GridLines="None">
                                                       <AlternatingRowStyle BackColor="White" />
                                                       <Columns>
                                                           
                                                           <asp:BoundField DataField="varFacility" HeaderText="Facility" 
                                                               SortExpression="varFacility" />
                                                           <asp:BoundField DataField="varFacilityDescription" 
                                                               HeaderText="Facility Description" 
                                                               SortExpression="varFacilityDescription" />
                                                               <asp:TemplateField HeaderText="">
                                 <ItemTemplate> 
                                  <asp:LinkButton ID="view" runat="server" 
                                      Text="Edit" class="button btn-primary"
                                    CommandName="view" 
                                    CommandArgument='<%# Eval("intId") %>'>
                                </asp:LinkButton> 
                                 </ItemTemplate>
                             </asp:TemplateField> 
                              <asp:TemplateField HeaderText="">
                                 <ItemTemplate> 
                                  <asp:LinkButton ID="deletes" runat="server" 
                                      Text="Delete" class="button btn-primary"
                                    CommandName="deletes" 
                                    CommandArgument='<%# Eval("intId") %>'>
                                </asp:LinkButton> 
                                 </ItemTemplate>
                             </asp:TemplateField> 
                                                       </Columns>
                                                     
                                                   </asp:GridView>
                                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                       ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString%>"
                                                       ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' 
                                                       SelectCommand="SELECT intId, intCollegeId, varFacility, varFacilityDescription FROM tblfacilities WHERE intCollegeId = @intCollegeId">
                                                       <SelectParameters>
                                                            <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"  
                                                               Type="Int64" />
                                                       </SelectParameters>
                                                   </asp:SqlDataSource>
                         </div></div>
								  
						   </div>
					  </div>
                   
                  </div>
                  </div>
                  </div>
                  
            <br /><br />
		</div>
</asp:Content>

