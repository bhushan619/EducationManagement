<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddDetails.aspx.cs" Inherits="admin_AddDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">   <h3> Add Deails of Institute <asp:Label ID="lblCollegName" runat="server" Text="Label"></asp:Label></h3>
			  
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
												    <table class="table text-left mybg" >
                                                     <tr>
                                            <td align="right">
                                                <asp:Label ID="Label3" runat="server" Text="About Institute :"></asp:Label></td>
                                            <td>
                                              <asp:TextBox ID="txtVision" runat="server" required="required" 
                                                    CssClass="form-control"  placeholher="Facilities" Height="100px" 
                                                    TextMode="MultiLine"></asp:TextBox>  </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label28" runat="server" Text="About Institute :"></asp:Label></td>
                                            <td>
                                              <asp:TextBox ID="txtObjective" runat="server" required="required" 
                                                    CssClass="form-control"  placeholher="Facilities" Height="100px" 
                                                    TextMode="MultiLine"></asp:TextBox>  </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label7" runat="server" Text="Affiliated to"></asp:Label></td>
                                            <td>
                                              <asp:TextBox ID="txtUgc" runat="server" required="required" CssClass="form-control"  placeholher="Brief"></asp:TextBox>
                                              <label style="font-size: small; color: #C0C0C0">Name of university Eg. Bengaluru University/AICTE/MSBTE     </label></td>   
                                            <td>
                                              </td>
                                        </tr>
                                         <tr>
                                            <td align="right">
                                                <asp:Label ID="Label8" runat="server" Text="NAAC accreditation"></asp:Label></td>
                                            <td>
                                              <asp:TextBox ID="txtNaac" runat="server" required="required" CssClass="form-control"  placeholher="Brief"></asp:TextBox> 
                                               <label style="font-size: small; color: #C0C0C0">Grade B+/A</label> </td>
                                           
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                         <tr>
                                            <td align="right">
                                                <asp:Label ID="Label13" runat="server" Text="Placements record"></asp:Label></td>
                                            <td>
                                              <asp:TextBox ID="txtPlaceRecord" runat="server" required="required" CssClass="form-control"  placeholher="Brief"></asp:TextBox>  </td>
                                            <td>
                                                &nbsp;</td>
                                      
                                      </tr>
                                                         <tr>
                                <td align="right">
                                    <asp:Label ID="Label1" runat="server" Text="Special Achievements:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtSpecialAchievements" runat="server" required="required"
                                        CssClass="form-control" placeholher="Special Achivements:" Height="100px"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                                          <tr>
                                               <td align="right">
                                           <asp:Label ID="Label15" runat="server" Text="Please Attach E-Broucher"></asp:Label> </td>
                                               <td align="left">
                                            <asp:FileUpload ID="fupFeeStruc" runat="server" /></td>
                                           </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                               <asp:Button ID="btnPanelOther" runat="server" Text="Add Details" 
                                  CssClass="btn btn-info" onclick="btnPanelOther_Click"  /></td>
                                            <td>
                                                &nbsp;</td>
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
                  
 </div>          
				
		 

</asp:Content>

