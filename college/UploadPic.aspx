<%@ Page Title="" Language="C#" MasterPageFile="~/college/MasterPageCollege.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="UploadPic.aspx.cs" Inherits="college_UploadPic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="skills" class="">
	  <div class="container">
	     <div class="skills-grids text-center">  <h3> Upload profile picture </h3>
                  </div>
                  <div class="services_grids">
						  <div id=".canvas">
								<div class="skill-grids text-center">
										<div class="col-md-3">	 
										</div>
										<div class="col-md-6">	
						 					 <table class="table table-bordered"  >                                            
                                 
                                  <tr>
                                  <td >
                                      <asp:Label ID="Label25" runat="server" Text="Select File to Upload"></asp:Label></td>
                                  <td colspan="2" align="left">
                                  <asp:FileUpload ID="fupProPic"  runat="server" CssClass="btn-info"/>  </td>
                                  </tr>
                                  <tr>
                                  <td>
                                  </td>
                                  <td align="left">
                                      <asp:Button ID="btnUploadPro" runat="server" Text="Upload" CssClass="btn btn-info"
                                          onclick="btnUploadPro_Click" /></td>
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

