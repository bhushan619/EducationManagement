<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserViews.master" AutoEventWireup="true" CodeFile="ViewUserEducation.aspx.cs" Inherits="User_ViewUserEducation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/tabs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
             
            <h2 class="text-center">Educational Details</h2>
            <div id="feedback" class="container coursekatta-layout-1 rlp-table">
                <div id="accordion-2" class="panel-group accordion">
                    <div class="panel">
                        <asp:Repeater ID="userEdu" runat="server" DataSourceID="SqlDataSourceEdu">
                            <ItemTemplate>
                                <a class="panel-title accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-2" href="#<%#Eval("id")%>" aria-expanded="false">
                                    <div class="accordionHeader facPadding"> 
                                        <i class="fa fa-arrow-circle-down" style="color: #fff"></i> <%#Eval("varStudentCollege")%>
                                    </div>
                                </a> 
                                <div id="<%#Eval("id")%>" aria-expanded="false" style="height: 0px;" class="panel-collapse collapse myborder">
                                    <div class="panel-body">
                                     University: <%#Eval("varStudentUniversity")%><br />
                                        Passing Year: <%#Eval("varStudentPassingYear")%><br />
                                        Marks: <%#Eval("varStudentMarks")%><br />
                                        Percentage: <%#Eval("varStudentPer")%><br />
                                        Grade: <%#Eval("varStudentGrade")%><br />
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSourceEdu" runat="server"
                            ConnectionString="<%$ ConnectionStrings:courseKattaConnectionString %>" ProviderName="<%$ ConnectionStrings:courseKattaConnectionString.ProviderName %>"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        
</asp:Content>


