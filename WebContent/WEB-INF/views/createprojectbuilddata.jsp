<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en"> 
<head>
<meta charset="utf-8" />
<title>CreateProjectShowBuildingData</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- twitter-bootstrap-wizard css -->
<link rel="stylesheet" href="assets/libs/twitter-bootstrap-wizard/prettify.css">

<!-- Bootstrap Css -->
<link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
</head>

<body data-sidebar="dark">

<!-- <body data-layout="horizontal" data-topbar="dark"> --> 

<!-- Begin page -->
<div id="layout-wrapper">
   
   <!-- header  -->
   <%@include file="header.jsp" %>
  
  			<!-- ========== Left Sidebar Start ========== -->
            <%@include file="sidenav.jsp" %>
            <!-- Left Sidebar End -->
  
  <!-- ============================================================== -->
  <!-- Start right Content here --> 
  <!-- ============================================================== -->
  <div class="main-content">
    <div class="page-content">
      <div class="container-fluid">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <div class="float-end">
                <button type="button" onclick="projectdetails();" class="btn btn-secondary btn-rounded waves-effect waves-light btn-sm">Save and view requirements <i class=" ri-save-line align-middle ms-2"></i></button>
              </div>
              <h3 class="mb-4">Building Data</h3>
              <div id="progrss-wizard" class="twitter-bs-wizard">
                <ul class="twitter-bs-wizard-nav nav-justified">
                  <li class="nav-item"> <a href="#one" class="nav-link" data-toggle="tab"> <span class="step-number">01</span> <span class="step-title">Building Data</span> </a> </li>
                  <li class="nav-item"> <a href="#two" class="nav-link" data-toggle="tab"> <span class="step-number">02</span> <span class="step-title">Heights and Areas</span> </a> </li>
                  <li class="nav-item"> <a href="#three" class="nav-link" data-toggle="tab"> <span class="step-number">03</span> <span class="step-title">Egress</span> </a> </li>
                  <li class="nav-item"> <a href="#four" class="nav-link" data-toggle="tab"> <span class="step-number">04</span> <span class="step-title">Fire Resistance Ratings</span> </a> </li>
                  <li class="nav-item"> <a href="#five" class="nav-link" data-toggle="tab"> <span class="step-number">05</span> <span class="step-title">Plumbing</span> </a> </li>
                  <li class="nav-item"> <a href="#six" class="nav-link" data-toggle="tab"> <span class="step-number">06</span> <span class="step-title">Finish </span> </a> </li>
                </ul>
                <div id="bar" class="progress mt-4">
                  <div class="progress-bar bg-success progress-bar-striped progress-bar-animated"></div>
                </div>
                <div class="tab-content twitter-bs-wizard-tab-content"> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="one">
                    <div class="row">
                      
                          <!-- Basic Life Safety --- Start  -->
                          
                          	<%@include file="basiclifesafety.jsp" %>
                          
                          <!-- Basic Life Safety --- End  -->
                          
                      	  <!-- Building fields ==== Start-->    
                          
                          	<%@include file="buildingfields.jsp" %>
                          
                          <!-- Building fields === End -->
                          
                    </div>
                  </div>
                  <!--tab-content end--> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="two">
                  
	                   <!-- include height and areas -->
	                   <%@include file="heightandareas.jsp" %>
                    
                  </div>
                  <!--tab-content end--> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="three">
                  		<!-- include egress -->
	                   <%@include file="egress.jsp" %>
                  </div>
                  <!--tab-content end--> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="four">
                    <div class="row">
                      <!-- include fire resistance -->
                      <%@include file="fireresistance.jsp" %>
                    </div>
                  </div>
                  <!--tab-content end--> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="five">
                    <div class="row">
                    	<!-- include fire resistance -->
                        <%@include file="plumbing.jsp" %>
                    </div>
                  </div>
                  <!--tab-content end--> 
                  
                  <!--tab-content start-->
                  <div class="tab-pane" id="six">
                    <div class="row justify-content-center">
                      <div class="col-lg-6">
                        <div class="text-center">
                          <div class="mb-4"> <i class="mdi mdi-check-circle-outline text-success display-4"></i> </div>
                          <div>
                            <h5>Confirm Detail</h5>
                            <p class="text-muted">If several languages coalesce, the grammar of the resulting</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--tab-content end--> 
                  
                </div>
                <!--  <ul class="pager wizard twitter-bs-wizard-pager-link">
                  <li class="previous"><a href="#">Previous</a></li>
                  <li class="next"><a href="javascript:heightandareas();">Next</a></li>
                </ul> -->
              </div>
            </div>
          </div>
        </div>
        <!-- end page title -->
        <div class="row"> </div>
      </div>
      <!-- container-fluid --> 
    </div>
    <!-- End Page-content -->
    
    <footer class="footer ">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6"> 
            <script>document.write(new Date().getFullYear())</script> © Codecompilance. </div>
          <div class="col-sm-6">
            <div class="text-sm-end d-none d-sm-block"> Crafted with <i class="mdi mdi-heart text-danger"></i> by Sageinformatics </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
  <!-- end main content--> 
  
</div>
<!-- END layout-wrapper --> 

<!-- JAVASCRIPT --> 
<script src="assets/libs/jquery/jquery.min.js"></script> 
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script> 
<script src="assets/libs/metismenu/metisMenu.min.js"></script> 
<script src="assets/libs/simplebar/simplebar.min.js"></script> 
<script src="assets/libs/node-waves/waves.min.js"></script> 
<!-- twitter-bootstrap-wizard js --> 
<script src="assets/libs/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script> 
<script src="assets/libs/twitter-bootstrap-wizard/prettify.js"></script> 

<!-- form wizard init --> 
<script src="assets/js/pages/form-wizard.init.js"></script> 
<script src="assets/js/app.js"></script>
<script src="assets/js/buildingdata.js"></script>
</body>
</html>
