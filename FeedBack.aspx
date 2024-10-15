<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
       <link href="rating/rating.css" rel="stylesheet" />
    <script src="rating/rating.js"></script>
     <script type="text/javascript">
        $(function () {
            $('.rating').rating();

            $('.ratingEvent').rating({ rateEnd: function (v) { $('#result').text(v); } });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="section progress-bars"   >
        <div class="container">
            <div class="progress-bars-content">
                <div class="progress-bar-wrapper">
                    <h2 class="title-2">If you want to go fast, go alone. If you want to go far, go together. - African Proverb</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
     
        
        <div class="col-lg-12">
             <div class="col-lg-3">
                    <div class="adStructure rlp-table">
                  <span class="ad">AD</span>
                  <h2>
                      Make your career by choice and stay updated with current job openings with 
                  </h2>
                  <h1>www.careerskatta.com</h1>
                  <a href="http://careerskatta.com" class="adbtn adbtn-blue" target="_blank">Join Now</a>
                  </div>
             </div>
                 
              <div class="col-lg-6">
 <div id="feedback" class="container coursekatta-layout-1">
                        <br />
                        <h2 class="text-center">                               Every journey needs support & words for improvement<br />
Rate our services:
</h2>
      <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Rating"></asp:Label>
                            <asp:TextBox ID="txtRating"  runat="server" class="rating rating5 text-center   " value="1"></asp:TextBox>   
                     <br />  <br />     </div>
   
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Feedback"></asp:Label>
                            <asp:TextBox ID="txtFeedback" TextMode="MultiLine"  runat="server" CssClass="form-control"></asp:TextBox>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#txtFeedback').keyboard({
                                        preventPaste: true,
                                        autoAccept: true
                                    })
                                    .addTyping();
                                });
                            </script>
                        </div>
                       

                        <div class="form-group text-right">
                            <asp:Button ID="Btnsave" runat="server" Text="Submit Feedback" CssClass="btn btn-blue" OnClick="Btnsave_Click" />
                            
                        </div>
                    </div>
                  <br />
        </div>  <div class="col-lg-3">
                     <div class="adStructure rlp-table">
                  <span class="ad">AD</span>
                  <h2>
                      Worried About Society Management?? We can HELP you 
                  </h2>
                  <h1>www.societykatta.com</h1>
                  <a href="http://societykatta.com" class="adbtn adbtn-blue" target="_blank">Join Now</a>
                  </div>

                </div>
                      </div>
        </div> 
</asp:Content>

