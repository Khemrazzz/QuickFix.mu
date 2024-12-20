<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="QuickFix.mu.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="slider">
        <div class="slider-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" data-background="images/banner1.jpg" data-stellar-background-ratio="1.15">
                    <div class="container">
                        <h1><span>Udført</span> Luxury Residences</h1>
                        <h2>Living Spaces in Pecherska - Kiev</h2>
                        <a href="#">GET A CONSULTATION <i class="fas fa-caret-right"></i></a>
                        <figure>
                            <img src="images/services-icon01.png" alt="Image"></figure>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
                <div class="swiper-slide" data-background="images/banner2.jpg" data-stellar-background-ratio="1.15">
                    <div class="container">
                        <h1><span>Oxøme</span> Premium Flats</h1>
                        <h2>Provide a decent level of comfort </h2>
                        <a href="#">GET A CONSULTATION <i class="fas fa-caret-right"></i></a>
                        <figure>
                            <img src="images/services-icon08.png" alt="Image"></figure>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
                <div class="swiper-slide" data-background="images/banner3.jpg" data-stellar-background-ratio="1.15">
                    <div class="container">
                        <h1><span>Hømepark</span> Elite Residences</h1>
                        <h2>We build your dream house</h2>
                        <a href="#">GET A CONSULTATION <i class="fas fa-caret-right"></i></a>
                        <figure>
                            <img src="images/services-icon07.png" alt="Image"></figure>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
            </div>
            <!-- Add Pagination -->
            <div class="inner-elements">
                <div class="container">
                    <div class="pagination"></div>
                    <!-- end pagination -->
                    <div class="button-prev">PREV</div>
                    <!-- end button-prev -->
                    <div class="button-next">NEXT</div>
                    <!-- end button-next -->
                    <div class="social-media">
                        <h6>SOCIAL MEDIA</h6>
                        <ul>
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-google"></i></a></li>
                            <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                        </ul>
                    </div>
                    <!-- end social-media -->
                </div>
                <!-- end container -->
            </div>
            <!-- end inner-elements -->
        </div>
        <!-- end slider-container -->
    </header>
    <!-- end slider -->
    <section class="intro">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <figure>
                        <div class="pattern-bg" data-stellar-ratio="1.07"></div>
                        <!-- end pattern-bg -->
                        <div class="holder" data-stellar-ratio="1.10">
                            <img src="images/17.jpg" alt="Image"></div>
                        <!-- end holder -->
                    </figure>
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6 wow fadeInUp">
                    <div class="content-box">
                        <b>01</b>
                        <h4><span>Pozniaky</span> Construction LLC</h4>
                        <h3>Living spaces for creative peoples</h3>
                        <p>
                            The smaller male cones release pollen, 
            which fertilizes the female
                        </p>
                        <a href="#">
                            <img src="images/icon-m2.png" alt="Image">See our projects</a>
                    </div>
                    <!-- end content-box -->
                </div>
                <!-- edn col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end intro -->
    <section class="logos">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0s">
                    <figure>
                        <img src="images/logo01.jpg" alt="Image">
                        <h6>TABLE</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.05s">
                    <figure>
                        <img src="images/logo02.jpg" alt="Image">
                        <h6>PLANE</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.10s">
                    <figure>
                        <img src="images/logo03.jpg" alt="Image">
                        <h6>CONNECT</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.15s">
                    <figure>
                        <img src="images/logo04.jpg" alt="Image">
                        <h6>GLASSES</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.20s">
                    <figure>
                        <img src="images/logo05.jpg" alt="Image">
                        <h6>PIXEL</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.25s">
                    <figure>
                        <img src="images/logo06.jpg" alt="Image">
                        <h6>ATTACH</h6>
                    </figure>
                </div>
                <!-- end col-2 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end logos -->
    <section class="benefits">
        <div class="container">
            <div class="row">
                <div class="col-12 wow fadeInUp">
                    <b>02</b>
                    <h4><span>Homepark</span> Property</h4>
                    <h3>Decorated Flats in Pozniaky - Kiev</h3>
                </div>
                <!-- end col-12 -->
                <div class="col wow fadeInUp" data-wow-delay="0s">
                    <figure>
                        <img src="images/icon-benefits01.png" alt="Image">
                        <b></b></figure>
                    <h6>Near to Subway</h6>
                    <span class="odometer" data-count="28" data-status="yes">0</span> <span class="extra">min</span>
                </div>
                <!-- end col -->
                <div class="col wow fadeInUp" data-wow-delay="0.05s">
                    <figure>
                        <img src="images/icon-benefits02.png" alt="Image">
                        <b></b></figure>
                    <h6>Spaces in Pozniaky</h6>
                    <span class="odometer" data-count="32" data-status="yes">0</span> <span class="extra">+</span>
                </div>
                <!-- end col -->
                <div class="col wow fadeInUp" data-wow-delay="0.10s">
                    <figure>
                        <img src="images/icon-benefits03.png" alt="Image">
                        <b></b></figure>
                    <h6>Spaces in Pozniaky</h6>
                    <span class="odometer" data-count="15" data-status="yes">0</span> <span class="extra">%</span>
                </div>
                <!-- end col -->
                <div class="col wow fadeInUp" data-wow-delay="0.15s">
                    <figure>
                        <img src="images/icon-benefits04.png" alt="Image">
                        <b></b></figure>
                    <h6>Spaces in Pozniaky</h6>
                    <span class="odometer" data-count="3" data-status="yes">0</span> <span class="extra">years</span>
                </div>
                <!-- end col -->
                <div class="col wow fadeInUp" data-wow-delay="0.20s">
                    <figure>
                        <img src="images/icon-benefits05.png" alt="Image">
                        <b></b></figure>
                    <h6>Spaces in Pozniaky</h6>
                    <span class="odometer" data-count="79" data-status="yes">0</span> <span class="extra">m²</span>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end benefits -->
    <section class="recent-gallery">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5 wow fadeInUp">
                    <b>03</b>
                    <h4><span>Property</span> Inner Gallery</h4>
                    <h3>Lux Living Spaces in Pozniaky - Kiev</h3>
                    <a href="#" class="link">SEE ALL GALLERY <i class="fas fa-caret-right"></i></a>
                </div>
                <!-- end col-5 -->
                <div class="col-lg-7">
                    <div class="row inner">
                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0s">
                            <figure data-stellar-ratio="1.07"><a href="images/gallery-thumb01.jpg" data-fancybox>
                                <img src="images/2.jpg" alt="Image"></a> </figure>
                        </div>
                        <!-- end col-4 -->
                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.05s">
                            <figure data-stellar-ratio="1.15"><a href="images/gallery-thumb02.jpg" data-fancybox>
                                <img src="images/3.jpg" alt="Image"></a> </figure>
                        </div>
                        <!-- end col-4 -->
                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.10s">
                            <figure data-stellar-ratio="1.04"><a href="images/gallery-thumb03.jpg" data-fancybox>
                                <img src="images/5.jpg" alt="Image"></a> </figure>
                        </div>
                        <!-- end col-4 -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end col-7 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end recent-gallery -->
    <section class="property-calculator">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <figure>
                        <div class="pattern-bg" data-stellar-ratio="1.03"></div>
                        <!-- end pattern-bg -->
                        <div class="holder" data-stellar-ratio="1.07">
                            <img src="images/6.jpg" alt="Image"></div>
                        <!-- end holder -->
                    </figure>
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6 wow fadeInUp">
                    <div class="content-box">
                        <b>04</b>
                        <h4><span>Homepark</span> Living Spaces</h4>
                        <h3>Decorated Flats in Pozniaky - Kiev</h3>
                        <p>
                            The smaller male cones release pollen, 
            which fertilizes the female
                        </p>
                        <ul>
                            <li>
                                <img src="images/bank-logos01.jpg" alt="Image"></li>
                            <li>
                                <img src="images/bank-logos02.jpg" alt="Image"></li>
                        </ul>
                        <a href="#">
                            <img src="images/icon-calculator.png" alt="Image">
                            Living Space Calculator</a>
                    </div>
                    <!-- end content-box -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end property-calculator -->
    <section class="property-plans">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 wow fadeInUp">
                    <b>05</b>
                    <h4><span>Homepark</span> Living Spaces</h4>
                    <h3>Decorated Flats in Pozniaky - Kiev</h3>
                    <p>We are waiting for you in our sales office for having all these opportunities with affordable prices and appropriate payment opportunities..</p>
                    <table>
                        <tbody>
                            <tr>
                                <td>Total area:</td>
                                <td>680 metre square</td>
                            </tr>
                            <tr>
                                <td>Total Floor:</td>
                                <td>24 Floor</td>
                            </tr>
                            <tr>
                                <td>Parking Lot:</td>
                                <td>5 Large</td>
                            </tr>
                            <tr>
                                <td>Social Area:</td>
                                <td>860 m²</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.05s">
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" data-toggle="pill" href="#tab-one">1 Room 47m²</a> </li>
                        <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#tab-two" role="tab">2 Rooms 65m²</a> </li>
                        <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#tab-three" role="tab">3 Rooms 90m²</a> </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-one">
                            <figure>
                                <img src="images/7.jpg" alt="Image"></figure>
                        </div>
                        <!-- end tab-pane -->
                        <div class="tab-pane fade" id="tab-two">
                            <figure>
                                <img src="images/7.jpg" alt="Image"></figure>
                        </div>
                        <!-- end tab-pane -->
                        <div class="tab-pane fade" id="tab-three">
                            <figure>
                                <img src="images/7.jpg" alt="Image"></figure>
                        </div>
                        <!-- end tab-pane -->
                    </div>
                    <!-- end tab-contnet -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- property-plans -->
    <section class="get-consultation" data-background="images/8.jpg" data-stellar-background-ratio="0.9">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-8 fadeInUp wow">
                    <div class="content-box">
                        <b>06</b>
                        <h4><span>Homepark</span> Living Spaces</h4>
                        <h3>Are you interested to Homepark</h3>
                        <p>The sun collectors, shall provide the electricity of the social areas of the site and shall do its part for protecting the environment.</p>
                        <a href="#">SCHEDULE A VISIT <i class="fas fa-caret-right"></i></a>
                    </div>
                    <!-- end content-box -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end get-consultation -->
    <section class="recent-posts">
        <div class="container">
            <div class="row">
                <div class="col-12 wow fadeInUp">
                    <b>07</b>
                    <h4><span>Homepark</span> Living Spaces</h4>
                    <small>Smaller male cones </small>
                </div>
                <!-- end col-12 -->
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0s">
                    <div class="post-box">
                        <figure>
                            <img src="images/14.jpg" alt="Image">
                        </figure>
                        <span>24, September 2019</span>
                        <h6><a href="#">50th Anniversary of the Turner School of Construction Management </a></h6>
                        <p>
                            The smaller male cones release pollen, 
            which fertilizes the female
                        </p>
                    </div>
                    <!-- end post-box -->
                </div>
                <!-- end col-4 -->
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.10s">
                    <div class="post-box">
                        <figure>
                            <img src="images/15.jpg" alt="Image">
                        </figure>
                        <span>06, November 2019</span>
                        <h6><a href="#">The Center for Construction Research and Training to Receive 2019 Award</a></h6>
                        <p>
                            The smaller male cones release pollen, 
            which fertilizes the female
                        </p>
                    </div>
                    <!-- end post-box -->
                </div>
                <!-- end col-4 -->
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.20s">
                    <div class="post-box">
                        <figure>
                            <img src="images/16.jpg" alt="Image">
                        </figure>
                        <span>31, April 2019</span>
                        <h6><a href="#">Henry C. Turner Prize for Innovation in Construction Company</a></h6>
                        <p>
                            The smaller male cones release pollen, 
            which fertilizes the female
                        </p>
                    </div>
                    <!-- end post-box -->
                </div>
                <!-- end col-4 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end recent-posts -->
    <section class="property-customization">
        <div class="video-bg">
            <video src="videos/video01.mp4" loop autoplay muted></video>
        </div>
        <!-- end video-bg -->
        <div class="container">
            <div class="row">
                <div class="col-12 wow fadeInUp">
                    <b>08</b>
                    <h4><span>Homepark</span> Living Spaces</h4>
                    <h3>Are you interested to Homepark</h3>
                </div>
                <!-- end col-12 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon01.png" alt="Image">
                        <figcaption>Water Taps</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.05s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon02.png" alt="Image">
                        <figcaption>Furniture</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.10s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon03.png" alt="Image">
                        <figcaption>Electricity</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.15s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon04.png" alt="Image">
                        <figcaption>Wood Edition</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.20s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon05.png" alt="Image">
                        <figcaption>Ceramics</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.25s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon06.png" alt="Image">
                        <figcaption>Pipelines</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon07.png" alt="Image">
                        <figcaption>Cimento</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.05s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon08.png" alt="Image">
                        <figcaption>Hummer</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.10s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon09.png" alt="Image">
                        <figcaption>Digging</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.15s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon10.png" alt="Image">
                        <figcaption>Raiser</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.20s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon11.png" alt="Image">
                        <figcaption>Screwsrive</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
                <div class="col-lg-2 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.25s">
                    <figure data-toggle="tooltip" data-placement="top" title="The smaller male cones release pollen, which fertilizes">
                        <img src="images/services-icon12.png" alt="Image">
                        <figcaption>Blueprint</figcaption>
                    </figure>
                </div>
                <!-- end col-2 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end property-customization -->
    <section class="certificates">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-12 wow fadeInUp">
                    <b>09</b>
                    <h4><span>Property</span> Certificates</h4>
                    <small>Smaller male cones </small>
                </div>
                <!-- end col-5 -->
                <div class="col-lg-2 col-md-3 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.05s">
                    <figure><a href="images/certificate01.jpg" data-fancybox>
                        <img src="images/9.jpg" alt="Image"></a> </figure>
                </div>
                <!-- end col-3 -->
                <div class="col-lg-2 col-md-3 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.10s">
                    <figure><a href="images/certificate02.jpg" data-fancybox>
                        <img src="images/10.jpg" alt="Image"></a> </figure>
                </div>
                <!-- end col-3 -->
                <div class="col-lg-2 col-md-3 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.15s">
                    <figure><a href="images/certificate03.jpg" data-fancybox>
                        <img src="images/11.jpg" alt="Image"></a> </figure>
                </div>
                <!-- end col-3 -->
                <div class="col-lg-2 col-md-3 col-sm-6 col-6 wow fadeInUp" data-wow-delay="0.20s">
                    <figure><a href="images/certificate04.jpg" data-fancybox>
                        <img src="images/13.jpg" alt="Image"></a> </figure>
                </div>
                <!-- end col-3 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end certificates -->
</asp:Content>
