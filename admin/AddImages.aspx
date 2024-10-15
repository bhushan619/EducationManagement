<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddImages.aspx.cs" Inherits="admin_AddImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
<div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add Images of Institute : <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
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
										
										 <div class="col-md-6">	  
                                <table class="table mybg"> 
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label17" runat="server" Text="Image Caption"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                           <asp:Label ID="Label27" runat="server" Text="Image Upload"></asp:Label></td>
                                        <td>
                                            <asp:FileUpload ID="fupImage" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            </td>
                                        <td align="left">
                                              <asp:Button ID="btnImagePanel" runat="server" Text="Add Image" 
                                  CssClass="btn btn-info" onclick="btnImagePanel_Click"  /> &nbsp;<asp:Button ID="UpdateCom" CssClass="btn btn-info" runat="server"  
                                                       Text="Update" onclick="UpdateCom_Click" Visible="False" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            
                                            
                                            <asp:SqlDataSource ID="SqlDataSourceImg" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString%>" 
                                             ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'
                                     SelectCommand="SELECT intId, intCollegeId, varMediaType, varMediaName, varMediaPath FROM tblcollegemedia WHERE varMediaType = @varMediaType AND intCollegeId = @intCollegeId"    >
                                             <SelectParameters>
                                                     <asp:Parameter DefaultValue="Image" Name="varMediaType" Type="String" />
                                                     <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id"  
                                                        Type="Int64" />
                                                   
                                                </SelectParameters></asp:SqlDataSource>
                                       <%--             SelectCommand="SELECT intId, intCollegeId, varMediaType, varMediaName, varMediaPath FROM tblcollegemedia WHERE varMediaType = @varMediaType AND intCollegeId = @intCollegeId" 
                                                DeleteCommand="DELETE FROM tblcollegemedia WHERE intId= @intId" 
                                                InsertCommand="INSERT INTO tblcollegemedia intId, intCollegeId, varMediaType, varMediaName, varMediaPath VALUES @intId, @intCollegeId, @varMediaType, @varMediaName, @varMediaPath" 
                                                UpdateCommand="UPDATE tblcollegemedia SET intCollegeId = @intCollegeId, varMediaType = @varMediaType, varMediaName = @varMediaName, varMediaPath = @varMediaPath WHERE intId = @intId" >
                                                <DeleteParameters>
                                                    <asp:Parameter Name="intId" Type="Int64" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="intId" Type="Int64" />
                                                    <asp:Parameter Name="intCollegeId" Type="Int64" />
                                                    <asp:Parameter Name="varMediaType" Type="String" />
                                                    <asp:Parameter Name="varMediaName" Type="String" />
                                                    <asp:Parameter Name="varMediaPath" Type="String" />
                                                </InsertParameters>
                                               
                                                <UpdateParameters>
                                                    <asp:Parameter Name="intCollegeId" Type="Int64" />
                                                    <asp:Parameter Name="varMediaType" Type="String" />
                                                    <asp:Parameter Name="varMediaName" Type="String" />
                                                    <asp:Parameter Name="varMediaPath" Type="String" />
                                                    <asp:Parameter Name="intId" Type="Int64" />
                                                </UpdateParameters>--%>
                                        </td>
                                    </tr>
                              </table> 
                               
                             <asp:GridView ID="GridView1" runat="server" CssClass="table mybg " 
                                                AllowPaging="True" AutoGenerateColumns="False" 
                                                onrowcommand="grdCollegeData_RowCommand"   DataSourceID="SqlDataSourceImg" DataKeyNames="intId">
                                                <Columns>
                                                
                                                 
                                                    <asp:BoundField DataField="varMediaName" HeaderText="Image Caption" 
                                                        SortExpression="varMediaName" />
                                                  <asp:TemplateField> 
                                  <ItemTemplate>
                                  <asp:Image ImageUrl='<%# "~/college/media/" + Eval("varMediaPath") %>' ID="download" runat="server" 
                                    Height="100px" Width="100px"      DataField="varMediaPath"  SortExpression="varMediaPath" /> 
                                  </ItemTemplate>                                  
                                  </asp:TemplateField> 
                                                       

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

										
                                        <div class="col-md-2 text-center">
                   
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

