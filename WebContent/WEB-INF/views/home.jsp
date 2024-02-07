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
<title>COMPLAi</title>

<!-- FAVICON AND TOUCH ICONS -->
<link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" sizes="152x152" href="assets/images/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="120x120" href="assets/images/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="assets/images/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
<link rel="icon" href="assets/images/apple-touch-icon.png" type="image/x-icon">

<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700;800;900&display=swap" rel="stylesheet">

<!-- BOOTSTRAP CSS -->
<link href="assets/css_nav/bootstrap.min.css" rel="stylesheet">

<!-- FONT ICONS -->
<link href="assets/css_nav/flaticon.css" rel="stylesheet">

<!-- PLUGINS STYLESHEET -->
<link href="assets/css_nav/menu.css" rel="stylesheet">
<link id="effect" href="assets/css_nav/dropdown-effects/fade-down.css" media="all" rel="stylesheet">
<link href="assets/css_nav/magnific-popup.css" rel="stylesheet">
<link href="assets/css_nav/owl.carousel.min.css" rel="stylesheet">
<link href="assets/css_nav/flexslider.css" rel="stylesheet">
<link href="assets/css_nav/slick.css" rel="stylesheet">
<link href="assets/css_nav/slick-theme.css" rel="stylesheet">
<link href="assets/css_nav/owl.theme.default.min.css" rel="stylesheet">
<link href="assets/css_nav/rose-theme.css" rel="stylesheet">

<!-- ON SCROLL ANIMATION -->
<link href="assets/css_nav/animate.css" rel="stylesheet">

<!-- RESPONSIVE CSS -->
<link href="assets/css_nav/responsive.css" rel="stylesheet">
<style>
.btna {
    cursor: pointer;
}
.active, .btna:hover {
    color: #ffbe0b !important;
}
</style>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGnkh1VFWBVNnyQVSw0_WtZGdo-wwKL6Y&amp;callback=initMap&amp;libraries=&amp;v=weekly"></script>
<script type="text/javascript"> 
let map, infoWindow;

function initMap() {
  if (navigator.geolocation) {

                var vm = this;
                navigator.geolocation.getCurrentPosition(function(position)
                {
                    var geolocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    var circle = new google.maps.Circle({
                        center: geolocation,
                        radius: position.coords.accuracy
                    });
                    console.log(fgeolocation);
                    vm.autocomplete.setBounds(circle.getBounds());
                });
            }


  //});
}

function geocodeLatLng(lat, lng) {
    geocoder = new google.maps.Geocoder();
    latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({
        'latLng': latlng
    }, function(results, status) {
        if (status === 'OK') {
            if (results[1]) {
                console.log(results);
                for (var i = 0; i < results[0].address_components.length; i++) {
                    for (var b = 0; b < results[0].address_components[i].types.length; b++) {
                        switch (results[0].address_components[i].types[b]) {
                            case 'locality':
                                city = results[0].address_components[i].long_name;
                                break;
                            case 'administrative_area_level_1':
                                state = results[0].address_components[i].long_name;
                                break;
                            case 'country':
                                country = results[0].address_components[i].long_name;
                                break;
                        }
                    }
                }
                alert(city + ' ' + state + ' ' + country)
            } else {
                alert("No results found");
            }
        } else {
            alert("Geocoder failed due to: " + status);
        }
    });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

</script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/11a/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/11a/util.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps/api/js/AuthenticationService.Authenticate?1shttp%3A%2F%2Fdemo.codecomplai.com%2F&amp;4sAIzaSyBGnkh1VFWBVNnyQVSw0_WtZGdo-wwKL6Y&amp;callback=_xdc_._otf641&amp;key=AIzaSyBGnkh1VFWBVNnyQVSw0_WtZGdo-wwKL6Y&amp;token=82303"></script></head> 
 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
// Base
var ipkey;
let apiKey = 'd9e53816d07345139c58d0ea733e3870';
$.getJSON('https://api.bigdatacloud.net/data/ip-geolocation?key=' + apiKey, function(data) {
  console.log(JSON.stringify(data, null, 2));
  ipkey = data.ip;
  $("#ipkey").val(ipkey);
  document.getElementById('ipkey').value=data.ip;
  //alert($("#ipkey").val());
});
</script>
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
      <input type="hidden" id='ipkey' name="ipkey"/>
      <input type="hidden" id='selectedState' name="selectedState" value="${selectedState}"/>
      <input type="hidden" id='siteurl' name="siteurl" value="${siteurl}"/>
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
	      	  <!--<li class="nl-simple" aria-haspopup="true"><a href="http://newdemo.codecomplai.com/#Product" class="btna">Product</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="http://newdemo.codecomplai.com/#why" class="btna">Why ComplAi?</a></li>
               <li class="nl-simple" aria-haspopup="true"><a href="#Features" class="btna">Features</a></li>  
              <li class="nl-simple" aria-haspopup="true"><a href="http://newdemo.codecomplai.com/getStates" class="btna">Code Books</a></li>-->
              <li class="nl-simple" aria-haspopup="true"><a href="home#Product" class="btna">Product</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#why" class="btna">Why ComplAi?</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="#" onclick="javascript:buildingcodes();" class="btna">Code Books</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#About-Us" class="btna">About Us</a></li>
              <li class="nl-simple" aria-haspopup="true"><a href="home#Contact-Us" class="btna">Contact Us</a></li>
              <c:if test="${username == null}" >
              	<li class="nl-simple" aria-haspopup="true"><a href="login" class="btna">Login</a></li>
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
  
  <!-- HERO-5
			============================================= -->
  <section id="home" class="bg-fixed hero-section division">
    <div class="container">
      <div class="row"> 
        
        <!-- HERO TEXT -->
        <div class="col-lg-8 offset-lg-2">
          <div class="hero-5-txt pl-20 text-center white-color"> 
            
            <!-- Title  -->
            <h2 class="h2-sm">Many Spaces, Many Compliances One Solution </h2>
            <h2 class="h2-title-lg"> <!-- <strong style="color: #ffbe0b;">CODE</strong>  -->COMPL<strong style="color: #ffbe0b;">Ai</strong></h2>
            
            <!-- Text -->
            <p class="p-xl">An enim nullam tempor sapien at gravida donec and ipsum undo pretium porta and justo integer 
              velna integer auctor </p>
            
            <!-- Button --> 
            <a href="pricing" class="btn btn-md btn-theme btn-tra-white white-hover mb-3">Start Free Trial</a>
			  <a href="#" onclick="buildingcodes();" class="btn btn-md btn-tra-white white-hover mb-3">Search the codes</a> </div>
        </div>
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </section>
  <!-- END HERO-5 --> 
  
  <!-- CONTENT-10
			============================================= -->
  <section id="Product" class="rel content-section division wide-100 ">
    <div class="container">
      <div class="row d-flex align-items-center m-row"> 
        
        <!-- IMAGE BLOCK -->
        <div class="col-md-5 col-lg-6 m-bottom">
          <div class="img-block left-column wow fadeInRight" data-wow-delay="0.6s"> <img class="img-fluid" src="assets/images/img-03.png" alt="content-image"> </div>
        </div>
        
        <!-- TEXT BLOCK -->
        <div class="col-md-7 col-lg-6 m-top">
          <div class="txt-block right-column pc-30 wow fadeInLeft" data-wow-delay="0.4s"> 
            
            <!-- Section ID -->
            <div class="section-id grey-color">Product </div>
            
            <!-- Title -->
            <h3 class="h3-sm">An intelligent app that helps you meet every
              compliance related to building new spaces.</h3>
            
            <!-- Text --> 
            
            <!-- Small Title -->
            <h5 class="h5-xs sm-title">Features</h5>
            
            <!-- List -->
            <ul class="simple-list mb-30">
              <li class="list-item">
                <p class="p-md">Fringilla risus luctus mauris  orci auctor purus euismod at pretium purus pretium 
                  ligula rutrum tempor sapien </p>
              </li>
              <li class="list-item">
                <p class="p-md">Nemo ipsam egestas volute turpis dolores ut aliquam quaerat sodales sapien undo pretium 
                  purus </p>
              </li>
            </ul>
            <!-- End List --> 
            
          </div>
        </div>
        <!-- END TEXT BLOCK --> 
        
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </section>
  <!-- END CONTENT-10 --> 
  
  <!-- CONTENT-6
			============================================= -->
  <section id="why" class="content-section division  wide-100 ">
    <div class="container">
      <div class="row d-flex align-items-center m-row"> 
        
        <!-- TEXT BLOCK -->
        <div class="col-md-7 col-lg-6 m-bottom">
          <div class="txt-block left-column pc-30 mb-40 wow fadeInLeft" data-wow-delay="0.4s"> 
            
            <!-- Section ID -->
            <div class="grey-color">
              <h1>WHY</h1>
            </div>
            
            <!-- Title -->
            <h3 class="h3-sm"><!-- <strong style="color: #ffbe0b;">CODE</strong> -->COMPL<span  style="color: #ffbe0b;">Ai</span></h3>
            <h3 class="h4-sm">A new gen app that simplifies
              your compliance needs for
              building office spaces,
              homes, commercial,
              educational and more.</h3>
            
            <!-- List --> 
            
            <!-- Button --> 
            <a href="viewProjects" class="btn btn-md btn-tra-grey theme-hover">Our Latest Projects</a> </div>
        </div>
        <!-- END TEXT BLOCK --> 
        
        <!-- IMAGE BLOCK -->
        <div class="col-md-5 col-lg-6 m-top">
          <div class="content-6-img right-column wow fadeInRight" data-wow-delay="0.4s"> <img class="img-fluid" src="assets/images/tablet-1.png" alt="content-image"> </div>
        </div>
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </section>
  <!-- END CONTENT-6 -->
  
  <!-- Commenting out features sections as part of feedback -->
   <%-- 
  <section id="Features" class="bg-lightgrey wide-60 reviews-section division wide-100 ">
    <div class="container">
      <div class="row"> 
        
        <!-- TEXT -->
        <div class="col-md-6"> 
          
          <!-- TESTIMONIALS-1 TITLE -->
          <div class="reviews-1-title"> 
            
            <!-- Section ID -->
            <h3 class="h3-sm"><strong style="color: #ffbe0b;">CODE</strong> COMPL<span style="color: #ffbe0b;">Ai</span></h3>
            
            <!-- Title -->
            <h2 class="h2-xs">Features Helping You Build the Best</h2>
            
            <!-- Text -->
            <p class="p-lg">Aliquam a augue suscipit, luctus neque purus ipsum and neque at dolor primis libero
              tempus, blandit cursus </p>
          </div>
          
          <!-- TESTIMONIAL #1 -->
          <div id="rv-1-1" class="review-1 radius-04"> 
            
            <!-- BRAND LOGO -->
            <div class="review-1-brand"> <img class="img-fluid" src="assets/images/brand-1.png" alt="brand-logo"> </div>
            
            <!-- Testimonial Text -->
            <div class="review-1-txt"> 
              
              <!-- Text -->
              <p class="p-md grey-color">We can help you design a home as per the rules of the land. </p>
              
              <!-- Testimonial Author -->
              <h6 class="h6-md">DESIGNING HOMES</h6>
              <h5 class="h5-md txt-upcase grey-color">01</h5>
            </div>
          </div>
          <!-- END TESTIMONIAL #1 --> 
          
        </div>
        
        <!-- TEXT -->
        <div class="col-md-6"> 
          
          <!-- TESTIMONIAL #2 -->
          <div id="rv-1-2" class="review-1 radius-04"> 
            
            <!-- BRAND LOGO -->
            <div class="review-1-brand"> <img class="img-fluid" src="assets/images/brand-4.png" alt="brand-logo"> </div>
            
            <!-- Testimonial Text -->
            <div class="review-1-txt"> 
              
              <!-- Text -->
              <p class="p-md grey-color">Whatever you are designing we can help you. </p>
              
              <!-- Testimonial Author -->
              <h6 class="h6-md">RESTAURANTS,PUB,BARS</h6>
              <h5 class="h5-md txt-upcase grey-color">02</h5>
            </div>
          </div>
          <!-- END TESTIMONIAL #2 --> 
          
          <!-- TESTIMONIAL #3 -->
          <div id="rv-1-3" class="review-1 radius-04"> 
            
            <!-- BRAND LOGO -->
            <div class="review-1-brand"> <img class="img-fluid" src="assets/images/brand-7.png" alt="brand-logo"> </div>
            
            <!-- Testimonial Text -->
            <div class="review-1-txt"> 
              
              <!-- Text -->
              <p class="p-md grey-color">Commercial Property regulations , all in one place. Explore </p>
              
              <!-- Testimonial Author -->
              <h6 class="h6-md">COMMERCIAL SPACES</h6>
              <h5 class="h5-md txt-upcase grey-color">03</h5>
            </div>
          </div>
          <!-- END TESTIMONIAL #3 --> 
          
        </div>
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </section>
  --%>  
  
    
  <section id="Code-Books" class="hero-section division wide-60 pb-0">
    <div class="container"> 
      
      <!-- HERO TEXT -->
      <div class="row align-items-end"> 
        
        <!-- TITLE -->
        <div class="col-lg-7">
          <div class="hero-4-title">
            <h3 class="h3-sm"><!-- <strong style="color: #ffbe0b;">CODE</strong>  --> COMPL<span style="color: #ffbe0b;">Ai</span></h3>
            <!-- Section ID -->
            
            <h2 class="h2-xs">with all States</h2>
            <!-- Title --> 
            
          </div>
        </div>
        
        <!-- TEXT -->
        <div class="col-lg-5">
          <div class="hero-4-txt pc-25">
            <p class="p-lg grey-color">Aliqum mullam blandit tempor sapien gravida donec ipsum a porta justo. Velna 
              vitae auctor and congue a magna impedit undo ligula risus. Mauris a donec ociis and magnis sapien </p>
          </div>
        </div>
      </div>
      <!-- END HERO TEXT --> 
    </div>
    <!-- End container --> 
  </section>
  <br/> <br/>
  <div  class="brands-section division wide-100 pt-0">
    <div class="container">
      <div class="row">
        <div class="col text-center" style="z-index:-1">
          <div class="owl-carousel brands-carousel"> 
            <!-- BRAND LOGO IMAGE -->
            <c:forEach var="state" items="${statesList}">
            	<div class="brand-logo ">
            		<a href="codes?statename=${state}"><img class="img-fluid" src="assets/images/states/${state}.png" alt="brand-logo" />
            		</a>
            	</div>
            </c:forEach>
            <!-- <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state2.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state3.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state4.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state5.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state6.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state7.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state8.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state9.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state10.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state11.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state12.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state13.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state14.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state15.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state16.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state17.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state18.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state19.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state20.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state21.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state22.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state23.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state24.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state25.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state26.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state27.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state28.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state29.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state30.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state31.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state32.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state33.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state34.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state35.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state36.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state37.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state38.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state39.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state40.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state41.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state42.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state43.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state44.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state45.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state46.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state47.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state48.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state49.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state50.png" alt="brand-logo" /></div>
            <div class="brand-logo "><img class="img-fluid" src="assets/images/st/state51.png" alt="brand-logo" /></div> -->
          </div>
        </div>
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </div> 
  
  
  <section id="About-Us" class="rel content-section division wide-60 ">
    <div class="container">
      <div class="row d-flex align-items-center m-row"> 
        
        <!-- IMAGE BLOCK -->
        <div class="col-md-5 col-lg-6 m-bottom">
          <div class="img-block left-column wow fadeInRight" data-wow-delay="0.6s"> <img class="img-fluid" src="assets/images/img-01.png" alt="content-image"> </div>
        </div>
        
        <!-- TEXT BLOCK -->
        <div class="col-md-7 col-lg-6 m-top">
          <div class="txt-block right-column pc-30 wow fadeInLeft" data-wow-delay="0.4s"> 
            
            <!-- Section ID -->
            <div class="section-id grey-color">ABOUT US</div>
            
            <!-- Title -->
            <h3 class="h3-sm">Our objective is to <strong style="color: #ffbe0b;">simplify your work,</strong> make your designs <strong style="color: #ffbe0b;">compliant as per the law of the land</strong>, and assist you with <strong style="color: #ffbe0b;">design improvements.</strong></h3>
          </div>
        </div>
        <!-- END TEXT BLOCK --> 
        
      </div>
      <!-- End row --> 
    </div>
    <!-- End container --> 
  </section>
  
  <!-- BRANDS-2
			============================================= -->
  <div id="brands-2" class="wide-70 brands-section division">
    <div class="container"> 
      
      <!-- BRANDS-2 WRAPPER -->
      <div class="brands-2-wrapper">
        <div class="row">
          <div class="col-md-12"> 
            
            <!-- BRAND LOGO IMAGE --> 
            
            <!-- BRAND LOGO IMAGE -->
            <div class="brand-logo"> <a href="#"> <img class="img-fluid" src="assets/images/brand-2.png" alt="brand-logo" /> </a> </div>
            
            <!-- BRAND LOGO IMAGE -->
            <div class="brand-logo"> <a href="#"> <img class="img-fluid" src="assets/images/brand-3.png" alt="brand-logo" /> </a> </div>
            
            <!-- BRAND LOGO IMAGE -->
            <div class="brand-logo"> <a href="#"> <img class="img-fluid" src="assets/images/brand-5.png" alt="brand-logo" /> </a> </div>
            
            <!-- BRAND LOGO IMAGE -->
            <div class="brand-logo"> <a href="#"> <img class="img-fluid" src="assets/images/brand-6.png" alt="brand-logo" /> </a> </div>
            
            <!-- BRAND LOGO IMAGE --> 
            
            <!-- BRAND LOGO IMAGE -->
            <div class="brand-logo"> <a href="#"> <img class="img-fluid" src="assets/images/brand-10.png" alt="brand-logo" /> </a> </div>
          </div>
        </div>
      </div>
      <!-- END BRANDS-2 WRAPPER --> 
      
    </div>
    <!-- End container --> 
  </div>
  <!-- END BRANDS-2 --> 
  
  <!-- FOOTER-1
			============================================= -->
  <footer id="Contact-Us" class="footer division">
    <div class="container"> 
      
      <!-- FOOTER CONTENT -->
      <div class="row"> 
        
        <!-- FOOTER INFO -->
        <div class="col-md-6 col-lg-6">
          <div class="footer-info mb-40"> 
            
            <!-- Footer Logo -->
            <div class="footer-logo"><img src="assets/images/logo-01.png" alt="footer-logo"/></div>
            
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
<script src="assets/js/jquery-3.5.1.min.js"></script> 
<script src="assets/js/bootstrap.min.js"></script> 
<script src="assets/js/modernizr.custom.js"></script> 
<script src="assets/js/jquery.easing.js"></script> 
<script src="assets/js/jquery.appear.js"></script> 
<script src="assets/js/jquery.scrollto.js"></script> 
<script src="assets/js/menu.js"></script> 
<script src="assets/js/materialize.js"></script> 
<script src="assets/js/slick.min.js"></script> 
<script src="assets/js/imagesloaded.pkgd.min.js"></script> 
<script src="assets/js/isotope.pkgd.min.js"></script> 
<script src="assets/js/jquery.flexslider.js"></script> 
<script src="assets/js/owl.carousel.min.js"></script> 
<script src="assets/js/jquery.magnific-popup.min.js"></script> 
<script src="assets/js/jquery.validate.min.js"></script> 
<script src="assets/js/jquery.ajaxchimp.min.js"></script> 
<script src="assets/js/wow.js"></script> 

<!-- Custom Script --> 
<script src="assets/js/custom.js"></script> 
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
	
	function buildingcodes(){
		var ipaddress = document.getElementById('ipkey').value;
		var selectedState = document.getElementById('selectedState').value;
		URL = "/"+$('#siteurl').val()+"/codes?statename="+selectedState+"&ipkey="+ipaddress;
		window.location.href = URL;
		//codes?statename=${selectedState}&ipkey=${ipkey}
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
