<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Parents.aspx.cs" Inherits="Parents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="section progress-bars section-padding">
        <div class="container">
            <div class="progress-bars-content">
                <div class="progress-bar-wrapper">
                    <h2 class="captions">For Parents</h2>
                </div>
            </div>
        </div>
    </div>


    <div class="section section-padding">
        <div class="container">
            <div class="col-lg-8 col-md-offset-2">
                <h4 class="text-center">Responsibility is our.. To create future of Nation..</h4>
                <div class="description text-justify">It's very tough journey when we start searching for career options or educational institutions for our Children. It's all about their future & we know how big pressure you have. To release that coursekatta is as team of passionate, dedicated & enthusiastic team of youngsters who work hard to make it simple for you. We are most advanced map based educational search engine who work hard to map anything & everything related to education near you. Just have a look on what we do.</div>
                <br />
                <div class="description text-justify">At coursekatta.com we are committed to help you for resolving these issues. Our services are completely choice based & cost effective where students are our primary focus.</div>
               <br />
                 <ul class="fa-ul">
                    <li><i class="fa-li fa fa-check-square"></i>Knowledge transfer: for guiding you what's good </li>
                    <li><i class="fa-li fa fa-check-square"></i>Technology support: for easy access</li>
                    <li><i class="fa-li fa fa-check-square"></i>Counseling: to make correct decision </li>
                </ul>

            </div>

            <div class="col-lg-8 col-md-offset-2">
                <h4>Why choose us?</h4>
                <div class="description">
                    You will find many online portals & offline service providers with all such information but they will never deal with market requirements.
                      <br />
                    <br />
                    We not only map education near you but we deal with 
                </div>
                <br />
                <ul class="fa-ul">
                    <li>1. Verified listings & genuine information</li>
                    <li>2. Direct contact details </li>
                    <li>3. Transparency during communion</li>
                    <li>4. Easy to use & friendly advisors </li>
                    <li>5. Dedicated Consultant as per your need</li>
                    <li>6. Direct visits </li>
                    <li>7. Students & alumni talks </li>
                    <li>8. Discuss with management's any many more..</li>
                </ul>

            </div>

        
        <div class="col-lg-8 col-md-offset-2">
            <h2 class="text-center">Register Here</h2>
            <form method="POST" action="regstu.aspx">
                <table class="table">
                    <tr>
                        <td>
                            <input type="text" required class="form-control form-input" name="nm" placeholder="Name" />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <input type="email" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum|in|ac.in)" name="eml" required class="form-control form-input" placeholder="E-Mail" />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <input type="text" name="mob" required class="form-control form-input" placeholder="Mobile" /></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" id="Password1" required class="form-control form-input" name="pas" placeholder="Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" required id="Password2" class="form-control form-input" onkeyup="checkPassCol(); return false;" name="pass" placeholder="Confirm Password" />
                            <span id="confirmStu" class="confirmMessageStu"></span></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Submit" class="btn btn-green" /></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
    
    </div>
</asp:Content>

