<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .card {
            position: relative;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        .card-header:first-child {
            border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
        }

        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: #1b4969;
            color: #fff;
            border-bottom: 1px solid rgba(0,0,0,.125);
        }

            .card-header a {
                text-decoration: none;
                color: #fff;
            }

        .card-block {
            -webkit-box-flex: 1;
            -webkit-flex: 1 1 auto;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section progress-bars ">
        <div class="container">
            <div class="progress-bars-content">
                <div class="progress-bar-wrapper">
                    <h2 class="title-2">Frequently asked Questions</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">


        <div class="col-lg-12">
            <div class="col-lg-3">
              

                    <div class="adStructure rlp-table">
                        <span class="ad">AD</span>
                        <h2>Promote yourself with coursekatta
                        </h2>
                        <h1>www.coursekatta.com</h1>
                        <a href="http://coursekatta.com" class="adbtn adbtn-blue" target="_blank">Click Here</a>
                        <p>To Advertize</p>
                    </div>
                    <div class="adStructure rlp-table">
                        <span class="ad">AD</span>
                        <h2>Quality Work with ontime delivery
                        </h2>
                        <h1>www.anuvaasoft.com</h1>
                        <a href="http://anuvaasoft.com" class="adbtn adbtn-blue" target="_blank">Get Quote</a>
                    </div>


               
            </div>

            <div class="col-lg-6">

                <div id="feedback" class="container coursekatta-layout-1 rlp-table">
                    <div id="accordion" role="tablist">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <h5 class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">What is coursekatta.com
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                                <div class="card-block">
                                    Coursekatta.com is educational social media site where you can get connected with educational institutions, mentors, tutors, schools, colleges, distance learning center etc.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">What is the purpose of coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="card-block">
                                    To connect world with education.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Why now?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="card-block">
                                    As maximum population around world wide is facing issue with quality of education, awareness about educational fields & opportunities. Which leads to unskilled labour's & unemployment. At coursekatta we believe in providing best market research & knowledge before choosing field which will help to opt best suitable path.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingFour">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree">Who can use coursekatta.com & it's services?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour">
                                <div class="card-block">
                                    Any one who want to learn something, teach something or want to create awareness about research findings.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingFive">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseThree">Who is behind coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFive" class="collapse" role="tabpanel" aria-labelledby="headingFive">
                                <div class="card-block">
                                    coursekatta.com is founded by Mayur Potdar an biotechnologist by education but passionate about technology & education.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingSix">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseThree">Who has designed coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseSix" class="collapse" role="tabpanel" aria-labelledby="headingSix">
                                <div class="card-block">
                                    Coursekatta.com is designed & development by Anuvaa softech Pvt LTD under guidance of Mr. Bhushan savale who is also co-founder for coursekatta.com
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingSeven">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseThree">Who can advertise with coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseSeven" class="collapse" role="tabpanel" aria-labelledby="headingSeven">
                                <div class="card-block">
                                    Any educational institution, service provider, education organization or anyone who want to promote education, technology & future research
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingEight">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseThree">How to advertise with coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseEight" class="collapse" role="tabpanel" aria-labelledby="headingEight">
                                <div class="card-block">
                                    Please drop a mail with your details to hello@coursekatta.com or call 7768900020 we will get in touch with you.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingNine">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" aria-controls="collapseThree">Whom to contact for support in case of technical issues 
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseNine" class="collapse" role="tabpanel" aria-labelledby="headingNine">
                                <div class="card-block">
                                    You can drop a mail to support@coursekatta.com or call on 9561421489 for all technical issues
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen">Whom to contact for payment related issues
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTen" class="collapse" role="tabpanel" aria-labelledby="headingTen">
                                <div class="card-block">
                                    You can drop a mail to account@coursekatta.com or call 7768900020 for payment related issues. Please read our refund policy<a href="RefundPolicy.aspx" target="_blank">here</a>.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingEleven">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">For web support or app support for new design where to contact 
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseEleven" class="collapse" role="tabpanel" aria-labelledby="headingEleven">
                                <div class="card-block">
                                    You can write a mail to contact@anuvaasoft.com or call 9561421489 for all web design, mobile app or software development related support.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwelve">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">Where to apply for career opportunities at coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwelve" class="collapse" role="tabpanel" aria-labelledby="headingTwelve">
                                <div class="card-block">
                                    You can forward updated CV to hello@coursekatta.com or open career page here.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThirteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">Whom to contact for admission related issues or guidance through coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThirteen" class="collapse" role="tabpanel" aria-labelledby="headingThirteen">
                                <div class="card-block">
                                    You can drop a mail to enquiry@coursekatta.com or call 7768800020 for admission related information, institution tie up, admission procedure or any other information required to opt career path.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingFourteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">Why we are not able to see information without registration
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFourteen" class="collapse" role="tabpanel" aria-labelledby="headingFourteen">
                                <div class="card-block">
                                    As it's important to get genuine people using information we have to maintain security that's the reason we ask for all information same time the information given by you is secured & protected by our privacy policy.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingFifteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">What's the use of coursekattacafe?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFifteen" class="collapse" role="tabpanel" aria-labelledby="headingEleven">
                                <div class="card-block">
                                    It's a place where you can easily find market trends, market updates, market requirements & make your own choices. Our data science technology will help you to compare & analyse your requirement while making choices for which coursekattacafe is one stop solution
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingSixteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">What's coursekatta search?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseSixteen" class="collapse" role="tabpanel" aria-labelledby="headingSixteen">
                                <div class="card-block">
                                    We provide map based search of educational institutions, supportive services & service providers to make sure that students focus on their studies while rest will be taken care by use. Coursekatta search is the tool which will help you to get all required services from your nearby locality with best price.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingSeventeen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">Is coursrkatta.com associated with other companies?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseSeventeen" class="collapse" role="tabpanel" aria-labelledby="headingSeventeen">
                                <div class="card-block">
                                    Yes, we are associated with some companies to deliver timely & quality services at best price. You can see companies associated with us here on our associates.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingEighteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen" aria-expanded="false" aria-controls="collapseEighteen">Are there any charges for using coursekatta.com?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseEighteen" class="collapse" role="tabpanel" aria-labelledby="headingEighteen">
                                <div class="card-block">
                                    Coursekatta.com is social media site which is absolutely free for using to gain knowledge. But if you need advance services or want more marketing or need extra support then it's paid as per requirement.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingNineteen">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen" aria-expanded="false" aria-controls="collapseNineteen">Where can we see payment details to promote on coursekatta.com
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseNineteen" class="collapse" role="tabpanel" aria-labelledby="headingNineteen">
                                <div class="card-block">
                                    It's as per your requirement. Please share your requirement to enquiry@coursekatta.com or call 7768800020 or click here on Purchase. We will get in touch with you.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwenty">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwenty" aria-expanded="false" aria-controls="collapseTwenty">How to contact coursekatta.com? 
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwenty" class="collapse" role="tabpanel" aria-labelledby="headingTwenty">
                                <div class="card-block">
                                    You can contact us on:
                                    <br />
                                    What's app: 776890020
                                    <br />
                                    Hike:7768900020
                                    <br />
                                    Telegram: 7768900020
                                    <br />
                                    <br />

                                    You can follow us on:
                                    <br />

                                    <div class="socialst">
                                        <a href="https://www.facebook.com/coursekatta/" target="_blank" class="facebook"><i class="fa fa-facebook"></i></a><a href="https://plus.google.com/u/1/112047046336198281374" target="_blank" class="google"><i class="fa fa-google-plus"></i></a><a href="https://twitter.com/course_katta" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                                        <a href="https://www.linkedin.com/in/course-katta-434027143/" target="_blank" class="linkedin"><i class="fa fa-linkedin"></i></a><a href="https://www.youtube.com/channel/UCEdYixOrZCzvkdD3wjrInmw" target="_blank" class="youtube"><i class="fa fa-youtube"></i></a>
                                    </div>
                                    <br />
                                    Or you can visit us at our corporate office 
                                    <br />

                                    Anuvaa Softech Pvt Ltd
                                    <br />
                                    Jalgaon
                                </div>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-lg-3"> 

                    <div class="adStructure rlp-table">
                        <span class="ad">AD</span>
                        <h2>Promote yourself with coursekatta
                        </h2>
                        <h1>www.coursekatta.com</h1>
                        <a href="http://coursekatta.com" class="adbtn adbtn-blue" target="_blank">Click Here</a>
                        <p>To Advertize</p>
                    </div>
                    <div class="adStructure rlp-table">
                        <span class="ad">AD</span>
                        <h2>Quality Work with ontime delivery
                        </h2>
                        <h1>www.anuvaasoft.com</h1>
                        <a href="http://anuvaasoft.com" class="adbtn adbtn-blue" target="_blank">Get Quote</a>
                    </div>


         
            </div>
        </div>

    </div>
</asp:Content>

