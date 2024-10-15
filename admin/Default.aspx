<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center"> <h3> Institute/Company Registration with User</h3>
                  </div>
                  <div class="services_grids">
						  <div id=".canvas">
								<div class="skill-grids"> 
                                <div class="col-md-3">	</div>
										<div class="col-md-6">	
						 <table class="table mybg">
                             
                                <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label15" runat="server" Text="Institute/Company" ></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                     <asp:DropDownList ID="ddlInstOrTut" required runat="server" CssClass="form-control" >
                                         <asp:ListItem Value="">:: Select Institute/Company ::</asp:ListItem>
                                         <asp:ListItem Value="0">Institute</asp:ListItem>
                                         <asp:ListItem Value="1">Company</asp:ListItem>

                                     </asp:DropDownList>         </td>
                              </tr>                    
                             <tr>
                             <td class="text-right">
                                   <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtName" required="required" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>  </td>
                              </tr>
                               
                              <tr><td class="text-right">
                                       <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label></td>
                                 <td colspan="2" align="left">
                                             <asp:TextBox ID="txtAddress" required="required" runat="server" 
                                         CssClass="form-control" placeholder="Address" Height="80px" 
                                          TextMode="MultiLine"></asp:TextBox>         
                                             </td> 
                             </tr>
                               <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label13" runat="server" Text="State"></asp:Label></td>                                  
                                 <td colspan="2" align="left"> 
                                     <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                                         AutoPostBack="True" onselectedindexchanged="ddlState_SelectedIndexChanged">     
                                     <asp:ListItem>-- Select State--</asp:ListItem>          
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Chattisgardh</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>Orissa</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajastan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Tripura</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem></asp:DropDownList>
                                 </td>
                              </tr>
                              
                                               <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label14" runat="server" Text="City" ></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                     <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" >
                                     </asp:DropDownList>         </td>
                              </tr>                              
                             <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label7" runat="server" Text="Landline"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtCnt1" pattern="\d*" required="required" runat="server" CssClass="form-control"  placeholder="Landline"></asp:TextBox>       </td>
                              </tr>
                              <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label8" runat="server" Text="Mobile 1"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtCnt2" pattern="\d*" required="required" runat="server" CssClass="form-control"  placeholder="Mobile 1"></asp:TextBox>       </td>
                              </tr>
                            <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label9" runat="server" Text="Mobile 2"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtCnt3" pattern="\d*" required="required" runat="server" CssClass="form-control"  placeholder="Mobile 2"></asp:TextBox>       </td>
                              </tr>

                             <tr>                              
                              <td class="text-right">
                                      <asp:Label ID="Label2" runat="server"  Text="E-Mail"></asp:Label></td>
                                 <td colspan="2" align="left">
                                      <asp:TextBox ID="txtEmail" required="required" runat="server" CssClass="form-control"  placeholder="E-Mail" 
                                      pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum|in|ac.in|ac)"></asp:TextBox>       </td>
                       
                             </tr>
                              <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label11" runat="server" Text="Web URL"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtWeb" required="required" runat="server" CssClass="form-control"  placeholder="Web URL"></asp:TextBox>       </td>
                              </tr>
                             <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label3" runat="server" Text="Principal/Founder"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtPrincipal" required="required" runat="server" CssClass="form-control"  placeholder="Principal Name"></asp:TextBox>       </td>
                              </tr>
                              <tr>
                             <td class="text-right">
                                 <asp:Label ID="Label10" runat="server" Text="Incharge"></asp:Label></td>
                                 <td colspan="2" align="left"> 
                                      <asp:TextBox ID="txtIncharge" required="required" runat="server" CssClass="form-control"  placeholder="Admission Incharge Name"></asp:TextBox>       </td>
                              </tr>
                                <tr><td class="text-right">
                                     <asp:Label ID="Label4" runat="server"  Text="Password"></asp:Label></td>
                                 <td colspan="2" align="left">
                                       <asp:TextBox ID="txtPassOne" required="required" runat="server" 
                                           CssClass="form-control"  placeholder="Enter Password" TextMode="Password"></asp:TextBox>            </td>
                          
                             </tr>
                              <tr><td class="text-right">
                                      <asp:Label ID="Label5" runat="server"  Text="Confirm Password"></asp:Label></td>
                                 <td colspan="2" align="left">
                                       <asp:TextBox ID="txtPassTwo" required="required" runat="server" 
                                           CssClass="form-control"  placeholder="Enter Confirm Password" onkeyup="checkPass(); return false;" 
                                           TextMode="Password"></asp:TextBox>      
                                            <span id="confirmMessage" class="confirmMessage"></span>      </td>
                          
                             </tr>
                              <tr><td class="text-right">
                                      <asp:Label ID="Label12" runat="server"  Text="Photo Upload"></asp:Label></td>
                                 <td colspan="2" align="left"> <asp:FileUpload ID="fupPhoto" runat="server" CssClass="form-control"   />
                                            </td>
                          
                             </tr>
                                  
                              <tr><td >
                                     &nbsp;</td>
                                 <td colspan="2" align="left">
                                       <asp:Button ID="btnRegStudent" CssClass="btn btn-info" runat="server" 
                                           Text="Register" onclick="btnRegStudent_Click" />           </td>
                         
                             </tr>
                              </table>						  
										</div>
										
										<div class="col-md-3">	
																  
										</div>
										<div class="clearfix"> </div>
								  </div>
						   </div>
					  </div>
                   
                  </div>
                  </div>
</asp:Content>

