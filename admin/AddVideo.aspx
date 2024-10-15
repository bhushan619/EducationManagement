<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddVideo.aspx.cs" Inherits="admin_AddVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add Video of Institute : <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
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
                                            <asp:Label ID="Label1" runat="server" Text="File Caption"></asp:Label>
                                        </td>
                                        <td align="left" >
                                            <asp:TextBox ID="txtMediaName" runat="server" CssClass="form-control" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                           <asp:Label ID="Label16" runat="server" Text="YouTube Video Link"></asp:Label></td>
                                        <td>
                                           <asp:TextBox ID="txtVideoLink" runat="server" CssClass="form-control" type="url" pattern="https?://.+"></asp:TextBox>
                                           </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="right"><label style="font-size: small; color: #C0C0C0">Eg: https://www.youtube.com/watch?v=dilnw_dP3xk</label></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            </td>
                                        <td align="left">
                                              <asp:Button ID="btnMediaPanel" runat="server" Text="Add Video" 
                                  CssClass="btn btn-info" onclick="btnMediaPanel_Click" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="grdMediaPanel" runat="server" CssClass="table mybg" 
                                                AllowPaging="True" AutoGenerateColumns="False" 
                                                DataSourceID="SqlDataSourceMedia">
                                                <Columns>
                                                    <asp:BoundField DataField="varMediaName" HeaderText="Media Name" 
                                                        SortExpression="varMediaName" />
                                                    <asp:BoundField DataField="varMediaPath" HeaderText="Media Path" 
                                                        SortExpression="varMediaPath" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceMedia" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"
                                                 ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>' >
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="intCollegeId" QueryStringField="id" 
                                                        Type="Int32" />
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
					  </div>
                   
                  </div>
                  </div>
                  </div>
                  
 </div>          
			
</asp:Content>

