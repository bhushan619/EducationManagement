<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="CollegeOther.aspx.cs" Inherits="admin_CollegeOther" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add/Edit Details of Institute <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
                  <div class="services_grids">
						  <div id=".canvas">
								<div class="skill-grids text-center"> 
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
                            <asp:LinkButton ID="btnCoordinates" runat="server" Text="Institute Coordinates" 
                                    CausesValidation="false" onclick="btnCoordinates_Click" 
                                   />	  </td>
                                          </tr>
                            
                        </tr>
                                                      
                              </table>					  
										</div>
										
										<div class="col-md-6 mybg">	
												
                                                <asp:DetailsView ID="DetailsView1" runat="server"    GridLines="None" RowStyle-CssClass="text-left"
                             AutoGenerateRows="False" DataSourceID="SqlDataSourceCollegeDetails" 
                             DataKeyNames="intCollegeId" BorderStyle="None" CssClass="table mybg">
                        <Fields>
                           <asp:BoundField DataField="varCollegeName" HeaderText="Institute Name"
                                SortExpression="varCollegeName" />
                            <asp:BoundField DataField="varCollegeAddress" HeaderText="Institute Address" 
                                SortExpression="varCollegeAddress" />
                            <asp:BoundField DataField="varCollegeCity" HeaderText="Institute City" 
                                SortExpression="varCollegeCity" />
                            <asp:BoundField DataField="varCollegeState" HeaderText="Institute State" 
                                SortExpression="varCollegeState" />
                            <asp:BoundField DataField="varContactOne" HeaderText="Contact One" 
                                SortExpression="varContactOne" />
                            <asp:BoundField DataField="varContactTwo" HeaderText="Contact Two" 
                                SortExpression="varContactTwo" />
                            <asp:BoundField DataField="varContactThree" HeaderText="Contact Three" 
                                SortExpression="varContactThree" />
                            <asp:BoundField DataField="varCollegeEmail" HeaderText="Institute E mail" 
                                SortExpression="varCollegeEmail" />
                            <asp:BoundField DataField="varCollegeWeb" HeaderText="Web URL" 
                                SortExpression="varCollegeWeb" /> 
                            <asp:BoundField DataField="varCollegePrincipal" HeaderText="Principal Name" 
                                SortExpression="varCollegePrincipal" />
                            <asp:BoundField DataField="varCollegeAdmissionIncharge" 
                                HeaderText="Admission Incharge" SortExpression="varCollegeAdmissionIncharge" />
                            
                        </Fields>
                    </asp:DetailsView>				  
										
                                          <div id="edit" runat="server" class="text-left" visible="false"> 
                        <table class="table mybg" >
                            <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text="Institute Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" runat="server" Text="Principal Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrincName" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label19" runat="server" Text="Admission Incharge"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAdminInch" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label20" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label21" runat="server" Text="City"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label22" runat="server" Text="State"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                                        DataSourceID="SqlDataSourceState" DataTextField="varState" 
                                        DataValueField="varState">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceState" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings: coursekattaConnectionString%>"
                                        ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' 
                                        SelectCommand="SELECT DISTINCT varState FROM tbledmitrastate ORDER BY varState">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label23" runat="server" Text="Landline"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCnt1" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label24" runat="server" Text="Mobile 1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCnt2" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label25" runat="server" Text="Mobile 2"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCnt3" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label26" runat="server" Text="Web URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtWeb" runat="server" CssClass="form-control" ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    
                    </div>
                     <div id="editbtns" runat="server" >
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" 
                                  CssClass="btn btn-info" onclick="btnEdit_Click"  />       
                         <asp:Button ID="btnSubmit" runat="server" Visible="false" Text="Submit" 
                                  CssClass="btn btn-info" onclick="btnSubmit_Click"  />  
                         <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                  CssClass="btn btn-info" onclick="btnCancel_Click"  /><br /></div>
                       
                         <asp:SqlDataSource ID="SqlDataSourceCollegeDetails" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"  
                             ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'
                             SelectCommand="SELECT intCollegeId, varCollegeName, varCollegeAddress, varCollegeCity, varCollegeState, varContactOne, varContactTwo, varContactThree, varCollegeEmail, varCollegeWeb, varPassword, varCollegePrincipal, varCollegeAdmissionIncharge FROM tblcollegedetails WHERE intCollegeId = @intCollegeId" >
                             <SelectParameters>
                                  <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"  
                                     Type="Int64" />
                             </SelectParameters>
                              
                         </asp:SqlDataSource>
                          
                                      </div>
										
                                        <div class="col-md-2 text-center ">
                   
		 <asp:Image ID="imgProfile" Height="170px" Width="170px" runat="server"  />
                      <br />  <br /> 
                      <asp:Button ID="btnUpload" runat="server" Text="Upload Photo"   
                           CssClass="btn btn-info" onclick="btnUpload_Click"  />
                     
                       </div>
								  
						   </div>
					  </div>
                   
                  </div>
                  </div>
                  </div>
                  
 </div>
</asp:Content>

