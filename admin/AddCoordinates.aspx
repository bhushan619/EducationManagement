<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="AddCoordinates.aspx.cs" Inherits="admin_AddCoordinates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">
	     <div class="text-center">   <h3> Add Coordinates of Institute <asp:Label ID="lblCollegName" Font-Size="X-Large" runat="server" Text="Label"></asp:Label></h3>
			  
                
								<div class="text-center"> 
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
										
										<div class="col-lg-6 table-responsive">	  
                                 <table class="table mybg" > 
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label1" runat="server" Text="Latitude"></asp:Label>
                                        </td>
                                        <td align="left" >
                                            <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                           <asp:Label ID="Label16" runat="server" Text="Longitude"></asp:Label></td>
                                        <td>
                                           <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control"  ></asp:TextBox>
                                           </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            </td>
                                        <td align="left">
                                              <asp:Button ID="btnMediaPanel" runat="server" Text="Add/Update Coordinates" 
                                  CssClass="btn btn-info" onclick="btnMediaPanel_Click" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="grdMediaPanel" runat="server" Cssclass="table table-bordered" 
                                                AllowPaging="True" AutoGenerateColumns="False" 
                                                DataSourceID="SqlDataSourceMedia">
                                                <Columns>
                                                    <asp:BoundField DataField="varLatitude" HeaderText="Latitude" 
                                                        SortExpression="varMediaName" />
                                                    <asp:BoundField DataField="varLongitude" HeaderText="Longitude" 
                                                        SortExpression="varLongitude" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceMedia" runat="server" 
                                             ProviderName='<%$ ConnectionStrings:coursekattaConnectionString.ProviderName %>'   ConnectionString="<%$ ConnectionStrings:coursekattaConnectionString %>"  
                                               >
                                                
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
</asp:Content>

