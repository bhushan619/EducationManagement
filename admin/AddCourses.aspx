<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddCourses.aspx.cs" Inherits="admin_AddCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add Courses of Institute : <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
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
                            <asp:LinkButton ID="btnCoordinates" runat="server" Text="Institute Coordinates" 
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
                                                   <asp:Label ID="Label1" runat="server" Text="Course Type" ></asp:Label></td>
                                               <td align="left">
                                                   <asp:DropDownList ID="ddlCourseType" runat="server" CssClass="form-control">
                                                   <asp:ListItem>--Select Course Type--</asp:ListItem>
                                                   <asp:ListItem>Courses After 10th</asp:ListItem>
                                                    <asp:ListItem>Courses After 12th</asp:ListItem>
                                                     <asp:ListItem>Bachelors Degree Courses</asp:ListItem>
                                                      <asp:ListItem>Masters Degree Courses</asp:ListItem>
                                                       <asp:ListItem>Doctoral/Fellowship Courses</asp:ListItem>
                                                   </asp:DropDownList>
                                               </td>
                                           </tr>

                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label2" runat="server" Text="Course Name"></asp:Label></td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtCName" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           </tr>

                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label3" runat="server"  Text="Course Description"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox></td>
                                           </tr>
                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label4" runat="server"  Text="Duration"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtDuration" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>
                                           </tr>
                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label5" runat="server" Text="Fees"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtFes" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                           </tr>
                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label6" runat="server" Text="Affliation To"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtaffli" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                           </tr>
                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label7" runat="server" Text="Accredited By"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtAccre" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                           </tr>
                                            <tr>
                                               <td align="right">
                                                   <asp:Label ID="Label8" runat="server" Text="Admission/Eligibility  Criteria"></asp:Label>
                                                </td>
                                               <td align="left">
                                                   <asp:TextBox ID="txtAddmision" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                           </tr>
                                            <tr>
                                               <td align="right">&nbsp;</td>
                                               <td align="left">
                                                   <asp:Button ID="btnAddCourses" CssClass="btn btn-info" runat="server" Text="Add" 
                                                       onclick="btnAddCourses_Click" />
                                                       &nbsp;<asp:Button ID="UpdateCom" CssClass="btn btn-info" runat="server"  
                                                       Text="Update" onclick="UpdateCom_Click" Visible="False" />
                                                </td>
                                           </tr>
                                            <tr>
                                               <td colspan="2">
                                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                       ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString%>" 
                                                        ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'
                                                       SelectCommand="SELECT intId,varCourseType, varCourseName, varCourseDescription, varDuration, varFees, varAffliation, varAccredited, varAdmissionCriteria FROM tblcollegecourses WHERE intCollegeId = @intCollegeId">
                                                       <SelectParameters>
                                                            <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"  
                                                               Type="Int64" />
                                                       </SelectParameters>
                                                   </asp:SqlDataSource>
                                                </td>
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
                <asp:GridView ID="GridView1" runat="server" CssClass="table text-justify mybg" 
                AllowPaging="True"    DataSourceID="SqlDataSource1"  GridLines="None" onrowcommand="grdCollegeData_RowCommand"
                    AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="varCourseType" HeaderText="Course Type" 
                            SortExpression="varCourseType" />
                        <asp:BoundField DataField="varCourseName" HeaderText="Course Name" 
                            SortExpression="varCourseName" />
                       
                        <asp:BoundField DataField="varDuration" HeaderText="Duration" 
                            SortExpression="varDuration" />
                        <asp:BoundField DataField="varFees" HeaderText="Fees" 
                            SortExpression="varFees" />
                        <asp:BoundField DataField="varAffliation" HeaderText="Affliation" 
                            SortExpression="varAffliation" />
                        <asp:BoundField DataField="varAccredited" HeaderText="Accredited" 
                            SortExpression="varAccredited" />
                        
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
                                  </div>
						   </div>
					  </div>
                   
                  </div>
                  </div>
                  </div>
                  
 </div>
</asp:Content>

