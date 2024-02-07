<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<!-- CODE COMPLAi design by Jthemes (http://www.jthemes.net) -->
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="author" content="Jthemes"/>
<meta name="description" content="CODE COMPLAi"/>
<meta name="keywords" content="#">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<!-- SITE TITLE -->
<title>CODE COMPLAi- pricing</title>

<!-- FAVICON AND TOUCH ICONS -->
<link rel="shortcut icon" href="assets/pricing/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="assets/pricing/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" sizes="152x152" href="assets/pricing/images/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="120x120" href="assets/pricing/images/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="assets/pricing/images/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" href="assets/pricing/images/apple-touch-icon.png">
<link rel="icon" href="assets/pricing/images/apple-touch-icon.png" type="image/x-icon">

<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700;800;900&display=swap" rel="stylesheet">

<!-- BOOTSTRAP CSS -->
<link href="assets/pricing/css/bootstrap.min.css" rel="stylesheet">

<!-- FONT ICONS -->
<link href="assets/pricing/css/flaticon.css" rel="stylesheet">

<!-- PLUGINS STYLESHEET -->
<link href="assets/pricing/css/menu.css" rel="stylesheet">
<link id="effect" href="assets/pricing/css/dropdown-effects/fade-down.css" media="all" rel="stylesheet">
<link href="assets/pricing/css/magnific-popup.css" rel="stylesheet">
<link href="assets/pricing/css/owl.carousel.min.css" rel="stylesheet">
<link href="assets/pricing/css/flexslider.css" rel="stylesheet">
<link href="assets/pricing/css/slick.css" rel="stylesheet">
<link href="assets/pricing/css/slick-theme.css" rel="stylesheet">
<link href="assets/pricing/css/owl.theme.default.min.css" rel="stylesheet">
<link href="assets/pricing/css/rose-theme.css" rel="stylesheet">

<!-- ON SCROLL ANIMATION -->
<link href="assets/pricing/css/animate.css" rel="stylesheet">

<!-- RESPONSIVE CSS -->
<link href="assets/pricing/css/responsive.css" rel="stylesheet">
<style>
.btna {
    cursor: pointer;
}
.active, .btna:hover {
    color: #ffbe0b !important;
}
</style>
</head>

<body>

<!-- PRELOADER SPINNER
		============================================= -->
<div id="loader-wrapper">
  <div id="loader"></div>
</div>

<!-- PAGE CONTENT
		============================================= -->
<div id="page" class="page"> 
  
  <!-- HEADER
			============================================= -->
  <header id="header" class="header tra-menu navbar-dark">
    <div class="header-wrapper"> 
      
      <!-- MOBILE HEADER -->
      <div class="wsmobileheader clearfix"> <span class="smllogo"><img src="assets/images/logo-01.png" alt="mobile-logo"/></span> <a id="wsnavtoggle" class="wsanimated-arrow"><span></span></a> </div>
      
      <!-- NAVIGATION MENU -->
      <div class="wsmainfull menu clearfix">
        <div class="wsmainwp clearfix"  id="myDIV"> 
          
          <!-- HEADER LOGO -->
          <div class="desktoplogo"><a href="home" class="logo-black btna" ><img src="assets/images/logo-01.png" alt="header-logo"></a></div>
          
          
          <!-- MAIN MENU -->
          <nav class="wsmenu clearfix">
            <ul class="wsmenu-list nav-theme-hover">
              <li class="nl-simple" aria-haspopup="true"><a href="home" class="btna">Home</a></li>
	      		<li class="nl-simple" aria-haspopup="true"><a href="home#Product" class="btna">Product</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#why" class="btna">Why ComplAi?</a></li>
              <!-- <li class="nl-simple" aria-haspopup="true"><a href="#Features" class="btna">Features</a></li>  -->
              <li class="nl-simple" aria-haspopup="true"><a href="home#Code-Books" class="btna">Code Books</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#About-Us" class="btna">About Us</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#Contact-Us" class="btna">Contact Us</a></li>
              <c:if test="${username == null}" >
              	<li class="nl-simple" aria-haspopup="true"> <a href="signup" class="btn btn-md btn-theme last-link tra-white-hover ">Sign Up</a> </li>
              </c:if>
              <c:if test="${username != null}" >              
				<li class="nl-simple" aria-haspopup="true"><a href="viewProjects" class="btna">Projects</a></li>
              	<li>
					<span class="wsmenu-click ws-activearrow"><i class="wsmenu-arrow"></i></span>
					<a href="#" class="lang-select">
						<!--  <img src="images/avatar-2.jpg" alt="" class="rounded-circle" style="width: 30px">--> ${username} 
						<!-- <span class="wsarrow"></span> --></a>					
					<ul class="sub-menu last-sub-menu d-block">						
						 <!-- 
                               <li> <a href="#"><img src="images/user.png" alt="" style="width: 14px; margin-right: 6px; margin-top: -4px"> Profile</a></li>
                               <li> <a href="#"><img src="images/settings.png" alt="" style="width: 14px; margin-right: 6px; margin-top: -4px"> Settings</a></li>
                               <li> <a href="#"><img src="images/unlock.png" alt="" style="width: 14px; margin-right: 6px; margin-top: -4px"> Lock screen</a></li>
                               <div class="dropdown-divider"></div>-->
                               <li><a href="logout"><img src="assets/images/switch.png" alt="" style="width: 14px; margin-right: 6px; margin-top: -4px"> Logout</a></li>
					</ul>
				</li>
              </c:if>
          	</ul>
          </nav>
          <!-- END MAIN MENU --> 
          
        </div>
      </div>
      <!-- END NAVIGATION MENU --> 
      
    </div>
    <!-- End header-wrapper --> 
  </header>
  <!-- END HEADER --> 
  <div id="pricing-page" class="page-hero-section division">
				<div class="container">
					<div class="row">	
						<div class="col-lg-10 offset-lg-1">
							<div class="hero-txt text-center white-color">

								<!-- Breadcrumb 
								<div id="breadcrumb">
									<div class="row">						
										<div class="col">
											<div class="breadcrumb-nav">
												<nav aria-label="breadcrumb">
												  	<ol class="breadcrumb">
												    	<li class="breadcrumb-item"><a href="home">Home</a></li>
												    	<li class="breadcrumb-item active" aria-current="page">Pricing Plans</li>
												  	</ol>
												</nav>
											</div>
										</div>
									</div> 
								</div> -->

								<!-- Title -->
								<h2 class="h2-sm">Flexible Plans &amp; Pricing</h2>

							</div>
						</div>	
					</div>	  <!-- End row -->
				</div>	   <!-- End container --> 
			</div>
  <section id="pricing-5" class="wide-60 pricing-section division">
				<div class="container-fluid px-5">


					<!-- SECTION TITLE -->	
					<div class="row">	
						<div class="col-lg-10 offset-lg-1">
							<div class="section-title text-center mb-60">		

								<!-- Text -->	
								<p class="p-xl">Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero
							       tempus, blandit and cursus varius magna tempus a dolor
								</p>
									
							</div>	
						</div>
					</div>


					<div class="row">


						<!-- BASIC PRICING PLAN -->
						<div class="col-md-3">
							<div class="pricing-5-table radius-06 wow fadeInUp" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">

									

								<!-- Plan Title -->
								<h6 class="h6-sm txt-upcase">Free</h6>				
													
								<!-- Pricing Plan Features  -->
								<ul class="features">
									<!--<li>1 GB Disk Space</li>-->
									<li>3 Drawings</li>
									<!--<li>2GB Monthly Bandwidth</li>-->					
									<li>1 User</li>
									<li>1 Project</li>
								</ul>

								<!-- Plan Price  -->
								<div class="pricing-plan">					
									<sup>$</sup>								
									<span class="price">0</span>
									<p>per month</p>
								</div>	

								<!-- Pricing Table Button  -->
								<a href="signup?plan=free" class="btn btn-theme tra-black-hover">Get Started</a>

							</div>
						</div>	<!-- END BASIC PRICING PLAN -->


						<!-- STANDARD PRICING PLAN -->
						<div class="col-md-3">
							<div class="pricing-5-table radius-06 wow fadeInUp" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">	

								
								<!-- Plan Title -->
								<h6 class="h6-sm txt-upcase">Standard</h6>	
																					
								<!-- Pricing Plan Features  -->
								<ul class="features">
									<li>10 Drawings</li>
									<li>1 User</li>
									<li>2 Projects</li>
								</ul>

								<!-- Plan Price  -->
								<div class="pricing-plan">					
									<sup>$</sup>								
									<span class="price">19</span>
									<sup class="pricing-coins">99</sup>
									<p>per month</p>
								</div>	

								<!-- Pricing Table Button  -->
								<a href="signup?plan=standard" class="btn btn-tra-theme tra-black-hover">Get Started</a>
										
							</div>
						</div>	<!-- END STANDARD PRICING PLAN -->


						<!-- PREMIUM PRICING PLAN -->
						<div class="col-md-3">
							<div class="pricing-5-table radius-06 wow fadeInUp" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">

								<!-- Plan Title -->
								<h6 class="h6-sm txt-upcase">Business</h6>	
																					
								<!-- Pricing Plan Features  -->
								<ul class="features">
									<li>20 Drawings</li>
									<li>3 Users</li>
									<li>4 Projects</li>
								</ul>

								<!-- Plan Price  -->
								<div class="pricing-plan">					
									<sup>$</sup>								
									<span class="price">29</span>
									<sup class="pricing-coins">99</sup>
									<p>per month</p>
								</div>	

								<!-- Pricing Table Button  -->
								<a href="signup?plan=business" class="btn btn-tra-theme tra-black-hover">Get Started</a>
										
							</div>
						</div>	<!-- END PREMIUM PRICING PLAN -->


						<!-- PREMIUM PRICING PLAN -->
						<div class="col-md-3">
							<div class="pricing-5-table radius-06 wow fadeInUp" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">

								<!-- Plan Title -->
								<h6 class="h6-sm txt-upcase">Enterprise</h6>	
																					
								<!-- Pricing Plan Features  -->
								<ul class="features">
									<li>50 Drawings</li>
									<li>5 Users</li>
									<li>10 Projects</li>
								</ul>

								<!-- Plan Price  -->
								<div class="pricing-plan">
									<sup>$</sup>
									<span class="price">39</span>
									<sup class="pricing-coins">99</sup>
									<p>per month</p>
								</div>

								<!-- Pricing Table Button  -->
								<a href="signup?plan=enterprise" class="btn btn-tra-theme tra-black-hover">Get Started</a>
										
							</div>
						</div>	<!-- END PREMIUM PRICING PLAN -->


					</div>	  <!-- End row -->


					<!-- PRICING NOTICE TEXT -->
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="pricing-notice text-center mb-40">							
								<p class="p-md"><span>Note!</span> Prices may vary from location to location due to local
								   taxation laws and conversion rates from U.S. Dollars.
								</p>
							</div>	
						</div>
					</div>

					
				</div>	   <!-- End container -->
			</section>
		
  <footer id="Contact-Us" class="footer division">
    <div class="container"> 
      
      <!-- FOOTER CONTENT -->
      <div class="row"> 
        
        <!-- FOOTER INFO -->
        <div class="col-md-6 col-lg-6">
          <div class="footer-info mb-40"> 
            
            <!-- Footer Logo -->
            <div class="footer-logo"><img src="assets/pricing/images/logo-01.png" alt="footer-logo"/></div>
            
            <!-- Text -->
            <p>A new gen app that simplifies your compliance needs for building office spaces, homes, commercial, educational and more. </p>
          </div>
        </div>
        
        <!-- FOOTER CONTACTS -->
        <div class="col-md-6 col-lg-6">
          <div class="footer-contacts mb-40"> 
            
            <!-- Title -->
            <h6 class="h6-xl">Let's Talk</h6>
            
            <!-- Address -->
            <p>123 Anywhere St., Any City, State,
              Country 12345</p>
            
            <!-- Footer Contacts -->
            <div class="mt-15"> 
              
              <!-- Email -->
              <p class="foo-email">E: <a href="mailto:yourdomain@mail.com">hello@yourdomain.com</a></p>
              
              <!-- Phone -->
              <p>Phone: +12 9 8765 4321</p>
            </div>
          </div>
        </div>
        
        <!-- FOOTER LINKS --> 
        
      </div>
      <!-- END FOOTER CONTENT --> 
      
      <!-- BOTTOM FOOTER -->
      <div class="bottom-footer">
        <div class="row d-flex align-items-center"> 
          
          <!-- FOOTER COPYRIGHT -->
          <div class="col-lg-6">
            <div class="footer-copyright">
              <p>&copy; 2022 CODE COMPLAi. All Rights Reserved</p>
            </div>
          </div>
          
          <!-- BOTTOM FOOTER LINKS -->
          <div class="col-lg-6">
            <ul class="bottom-footer-list ico-15 text-right clearfix">
              <li>
                <p class="first-list-link"><a href="#"><span class="flaticon-facebook"></span> Facebook</a></p>
              </li>
              <li>
                <p><a href="#"><span class="flaticon-twitter"></span> Twitter</a></p>
              </li>
              <li>
                <p><a href="#"><span class="flaticon-youtube"></span> YouTube</a></p>
              </li>
            </ul>
          </div>
        </div>
        <!-- End row --> 
      </div>
      <!-- END BOTTOM FOOTER --> 
      
    </div>
    <!-- End container --> 
  </footer>
  <!-- END FOOTER-1 --> 
  
</div>
<!-- END PAGE CONTENT --> 

<!-- EXTERNAL SCRIPTS
		============================================= --> 
<script src="assets/pricing/js/jquery-3.5.1.min.js"></script> 
<script src="assets/pricing/js/bootstrap.min.js"></script> 
<script src="assets/pricing/js/modernizr.custom.js"></script> 
<script src="assets/pricing/js/jquery.easing.js"></script> 
<script src="assets/pricing/js/jquery.appear.js"></script> 
<script src="assets/pricing/js/jquery.scrollto.js"></script> 
<script src="assets/pricing/js/menu.js"></script> 
<script src="assets/pricing/js/materialize.js"></script> 
<script src="assets/pricing/js/slick.min.js"></script> 
<script src="assets/pricing/js/imagesloaded.pkgd.min.js"></script> 
<script src="assets/pricing/js/isotope.pkgd.min.js"></script> 
<script src="assets/pricing/js/jquery.flexslider.js"></script> 
<script src="assets/pricing/js/owl.carousel.min.js"></script> 
<script src="assets/pricing/js/jquery.magnific-popup.min.js"></script> 
<script src="assets/pricing/js/jquery.validate.min.js"></script> 
<script src="assets/pricing/js/jquery.ajaxchimp.min.js"></script> 
<script src="assets/pricing/js/wow.js"></script> 

<!-- Custom Script --> 
<script src="assets/pricing/js/custom.js"></script> 
<script>
		// Add active class to the current button (highlight it)
		var header = document.getElementById("myDIV");
		var btns = header.getElementsByClassName("btna");
		for (var i = 0; i < btns.length; i++) {
		  btns[i].addEventListener("click", function() {
		  var current = document.getElementsByClassName("active");
		  current[0].className = current[0].className.replace(" active", "");
		  this.className += " active";
		  });
		}
	
	function myFunction() {
  var element = document.getElementById("logo-black");
  element.classList.remove("active");
}
		</script> 
<!-- Google Analytics: Change UA-XXXXX-X to be your site's ID. Go to http://www.google.com/analytics/ for more information. --> 
<!--
		<script>
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-XXXXX-X']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		</script>
		-->

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>
		

</body>
</html>
