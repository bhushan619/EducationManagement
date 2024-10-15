<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPageUserProfileViews.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="user_View" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="assets/js/jquery-1.10.2.js"></script>
    <link href="assets/js/jquery-ui.css" rel="stylesheet" />
    <script src="assets/js/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            SearchText();
        });
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/user/View.aspx/GetCourses") %>',
                        data: "{'prefixText':'" + $('#ContentPlaceHolder1_txtCourse').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            SearchTextCity();
        });
        function SearchTextCity() {
            $(".autosuggesttxtCity").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/user/View.aspx/GetCity") %>',
                        data: "{'prefixText':'" + $('#ContentPlaceHolder1_txtCity').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            SearchTextInstitute();
        });
        function SearchTextInstitute() {
            $(".autosuggesttxtInstitute").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/user/View.aspx/GetInstitute") %>',

                        data: "{'prefixText':'" + $('#ContentPlaceHolder1_txtInstitute').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            SearchTextUniversity();
        });
        function SearchTextUniversity() {
            $(".autosuggesttxtUniversity").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/user/View.aspx/GetUniversity") %>',
                        data: "{'prefixText':'" + $('#ContentPlaceHolder1_txtUniversity').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <div class="container">
        <div class="row rlp-table">
            <div class="container text-center">
                <div class="col-lg-12 ">
                    <h1 class="text-center"> Search for Institutes, Tutors, Colleges</h1>
                    <div class="col-lg-5 nopadding" style="padding-bottom:5px">
                        <asp:HiddenField ID="hdnId" runat="server" />
                        <div class="input-group" style="width:100%">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <asp:TextBox type="text" ID="txtCourse" runat="server" class="form-control autosuggest" placeholder="Search for Institutes, Tutors, Colleges etc." />
                        </div>
                        <%--<asp:TextBox ID="txtCourses" runat="server" CssClass="autosuggest   form-control form-input" placeholder="Courses Eg : MCA"></asp:TextBox>--%>
                        <%-- <cc1:AutoCompleteExtender ID="txtCourses_AutoCompleteExtender"
                                                runat="server" Enabled="True"
                                                TargetControlID="txtCourses" MinimumPrefixLength="1" EnableCaching="true"
                                                CompletionSetCount="1" CompletionInterval="1" ServiceMethod="GetCourses">
                                            </cc1:AutoCompleteExtender>--%>
                    </div>
                    <div class="col-lg-5 nopadding" style="padding-bottom:5px">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                            <asp:TextBox type="text" ID="txtCity" runat="server" class="form-control autosuggesttxtCity" placeholder="City Eg : Bengaluru" />
                        </div>
                        <%--<asp:TextBox ID="txtCity" runat="server" CssClass="autosuggesttxtCity form-control form-input" placeholder="City Eg : Bengaluru"></asp:TextBox>
                        --%> <%--  <cc1:AutoCompleteExtender ID="AutoCompleteExtender1"
                                                runat="server" Enabled="True"
                                                TargetControlID="txtCity" MinimumPrefixLength="1" EnableCaching="true"
                                                CompletionSetCount="1" CompletionInterval="1" ServiceMethod="GetCity">
                                            </cc1:AutoCompleteExtender>--%>
                    </div>
                    <div class="col-lg-2 nopadding" style="padding-bottom:5px">
                        <asp:Button ID="btnSearchTabOne" CssClass="pagebtn pagebtn-blue" runat="server" Text="Search"
                            OnClick="btnSearchTabOne_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container rlp-table">

        <h3>Sponsored Adverts</h3>
        <div class="col-lg-12 nopadding">
            <div class="col-lg-3 nopadding">
                <div class="adStructure rlp-table">
                    <span class="ad">AD</span>
                    <h2>Make your career by choice and stay updated with current job openings with 
                    </h2>
                    <h1>www.careerskatta.com</h1>
                    <a href="http://careerskatta.com" class="adbtn adbtn-blue" target="_blank">Join Now</a>
                </div>
            </div>
            <div class="col-lg-3 nopadding">
                <div class="adStructure rlp-table">
                    <span class="ad">AD</span>
                    <h2>Worried About Society Management?? We can HELP you 
                    </h2>

                    <h1>www.societykatta.com</h1>
                    <a href="http://societykatta.com" class="adbtn adbtn-blue" target="_blank">Join Now</a>

                </div>
            </div>
            <div class="col-lg-3 nopadding">
                <div class="adStructure rlp-table">
                    <span class="ad">AD</span>
                    <h2>Quality Work with ontime delivery
                    </h2>
                    <h1>www.anuvaasoft.com</h1>
                    <a href="http://anuvaasoft.com" class="adbtn adbtn-blue" target="_blank">Get Quote</a>
                </div>
            </div>
            <div class="col-lg-3 nopadding">
                <div class="adStructure rlp-table">
                    <span class="ad">AD</span>
                    <h2>Make your career by choice and stay updated with current job openings with 
                    </h2>
                    <h1>www.careerskatta.com</h1>
                    <a href="http://careerskatta.com" class="adbtn adbtn-blue" target="_blank">Join Now</a>
                </div>
            </div>
        </div>

    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



</asp:Content>
