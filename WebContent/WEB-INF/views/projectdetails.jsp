<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>ViewProjectDetails</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		<!--  Include jQuery core into head section if not already present -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- Plugins css -->
        <link href="assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="https://www.cssscript.com/demo/sticky.css" rel="stylesheet" type="text/css">
        
 <style>
#img-zoomer-box {
		  max-width: 500px;
		  height: auto;
		  position: relative;
		  margin: 10px auto;
		}

		#img-1 {
		  width: 100%;
		  height: auto;
		}

		#img-zoomer-box:hover, #img-zoomer-box:active {
		  cursor: zoom-in;
		  display: block;
		}

		#img-zoomer-box:hover #img-2, #img-zoomer-box:active #img-2 {
		  opacity: 1;
		}
		#img-2 {
		  width: 440px;
		  height: 440px;
		  //background: 'http://104.131.0.156:8080/processed_files/49_174/labled_pngs/1_1.png' no-repeat #FFF;
		  box-shadow: 0 5px 10px -2px rgba(0,0,0,0.3);
		  pointer-events: none;
		  position: absolute;
		  left: 80px;
		  opacity: 0;
		  border: 4px solid whitesmoke;
		  z-index: 99;
		  border-radius: 100%;
		  display: block;
		  transition: opacity .2s;
		}
		
		
		</style>
		
		<style>
			  .container {
				align-items: center;
				justify-content: center;
			  }
			  
			  .img1 {
				max-width: 5%;
				max-height:5%;
				float: left;
			  }
			  
			  .text {
				font-size: 20px;
				padding-left: 20px;
				padding-top: 10px;
				float: left;
				align-items: center;
				justify-content: center;
			  }
		.imageclass {
            display: none;
        }

  </style>

<style>
#preview{
	margin-top: 1px;
	border:1px solid black;
	width:100%;
	height:500px;
	background-repeat: no-repeat;
	margin-left: 10px;
	margin-right: 5px;
}
#samples{
	text-align: center;
}
#samples img {	
	margin: 10px;
	display: block;
	 border: 2px solid #6A6462;
}
#samples img:hover {
	 //cursor: zoom-in;
	 border: 0;
	 -moz-box-shadow:2px 2px 7px 2px rgba(130,130,130,1),-1px -1px 7px 2px rgba(130,130,130,1);
	-webkit-box-shadow: 2px 2px 7px 2px rgba(130,130,130,.7),-1px -1px 7px 2px rgba(130,130,130,1);
	box-shadow: 2px 2px 7px 2px rgba(130,130,130,.7),-2px -2px 7px 2px rgba(130,130,130,1);
}
@media screen and (max-width: 767px){
	#samples img {
		display: inline-block;
	}
}

</style>
        
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
                        <!-- start page title -->
                        <div class="row">
                        	
							<dd class="col-sm-12 mb-4">
                                <dl class="row mb-0">
                                	<c:if test="${uploadstatus!= null}" >
			  							<h4><c:out value="The image(s) have been uploaded successfully"></c:out></h4>
									</c:if>
                                    <dt class="col-sm-6"><small class="text-muted">Project</small>
                                    	<h3 class="mb-1">
                                    		<c:if test="${projectView != null}" >
                                    			<c:out value="${projectView.projectName}"/>
                                    		</c:if>
                                    		<c:if test="${projectView == null}" >
                                    			<c:out value="${projectName}"/>
                                    		</c:if> 
                                    	</h3>
                                    </dt>
                                    <dt class="col-sm-3"><small class="text-muted">JURISDICTION</small>
	                                    <h3 class="mb-1"> 
											<c:if test="${projectView != null}" > 
									          	<c:out value="${projectView.jurisdiction}"/>
									        </c:if>
									        <c:if test="${projectView == null}" >
									          	<c:out value="${Jurisdiction}"/>
									        </c:if>
	                                    </h3>
                                    </dt>
                                    <dt class="col-sm-3"><small class="text-muted">CODE YEAR </small>
                                    	<h3 class="mb-1">
                                    	<c:if test="${projectView != null}" > 
								          	<c:out value="${projectView.codeYear}"/>
								          </c:if>
								          <c:if test="${projectView == null}" >
								          	<c:out value="${codeYear}"/>
								          </c:if>
          								</h3>
          							</dt>
                                </dl>
                            </dd>
                        </div>
                        <!-- end page title -->
					<div class="row">

                            

                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-body p-0">
        
                                       
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs nav-justified nav-pills font-size-20" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-bs-toggle="tab" href="#ProjectDetails" role="tab">
                                                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                                                    <span class="d-none d-sm-block">Project Details</span> 
                                                </a>
                                            </li>
											<li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#Up_DXF" role="tab">
                                                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                                                    <span class="d-none d-sm-block">Upload DXF </span> 
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#Processed-DXF" role="tab">
                                                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                                                    <span class="d-none d-sm-block" onclick="showProcessedDXF(${userId},${projectId});">
                                                    	Processed DXF's
                                                    </span> 
                                                </a>
                                            </li>
                                          
                                        </ul>
        
                                        <!-- Tab panes -->
                                        <div class="tab-content p-3 text-muted">
                                            <div class="tab-pane active" id="ProjectDetails" role="tabpanel">
												<div class="row">
												 
												
												<div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        
    
                                        <h4 class="card-title mb-4">Custom Codebooks</h4>
    
                                        <div data-simplebar style="max-height: 345px;">
                                            <ul class="list-unstyled activity-wid">
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-edit-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">28 Apr, 2020 <small class="text-muted">12:07 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">2018 California State Building Code</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-user-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">21 Apr, 2020 <small class="text-muted">08:01 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Added an interest Volunteer Activities</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-bar-chart-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">17 Apr, 2020 <small class="text-muted">09:23 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Joined the group Boardsmanship Forum</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">11 Apr, 2020 <small class="text-muted">05:10 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Responded to need In-Kind Opportunity</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-calendar-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">07 Apr, 2020 <small class="text-muted">12:47 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Created need Volunteer Activities</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-edit-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">05 Apr, 2020 <small class="text-muted">03:09 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Attending the event Some New Event</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-user-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">02 Apr, 2020 <small class="text-muted">12:07 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Responded to need In-Kind Opportunity</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
													
												<div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        
    
                                        <h4 class="card-title mb-4">Collaborators</h4>
    
                                        <div data-simplebar style="max-height: 345px;">
                                            <ul class="list-unstyled activity-wid">
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
                                              	<li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
												<li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
												<li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
												<li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
												<li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Email</h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">test@gmail.com</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>	
													
												<div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        
    
<h4 class="card-title mb-4">Project Status</h4>
    
                                        <div data-simplebar style="max-height: 345px;">
                                            <ul class="list-unstyled activity-wid">
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-edit-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Building Data <small class="text-muted">
																<button type="button" class="btn btn-sm">
																	 <i class="ri-arrow-right-line align-middle ms-2"></i> 
																</button>
																</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Completed</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-user-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Heights and Areas<small class="text-muted">
																<button type="button" class="btn btn-sm">
																	 <i class="ri-arrow-right-line align-middle ms-2"></i> 
																</button>
																</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Completed</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-bar-chart-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Egress<small class="text-muted">
																<button type="button" class="btn btn-sm">
																	 <i class="ri-arrow-right-line align-middle ms-2"></i> 
																</button>
																</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">In progress</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Fire Resistance Ratings <small class="text-muted">
																<button type="button" class="btn btn-sm">
																	 <i class="ri-arrow-right-line align-middle ms-2"></i> 
																</button>
																</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">In progress</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-calendar-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">Plumbing <small class="text-muted">
																<button type="button" class="btn btn-sm">
																	 <i class="ri-arrow-right-line align-middle ms-2"></i> 
																</button>
																</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Completed</p>
                                                        </div>
                                                    </div>
                                                </li>
                                          
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>												
						</div>												
                   </div>
						<div class="tab-pane" id="Up_DXF" role="tabpanel">
							<div class="row">
							<div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
        								<form method="post" action="/${siteurl}/uploadDrawing" enctype="multipart/form-data" class="dropzone">                                            
                                        <h4 class="card-title">Upload DXF Drawings</h4>
                                        <p class="card-title-desc">Select or drop files to upload.
                                        </p>        
                                        <div>
                                            <div class="fallback">
                                                <input id="fileId" name="files[0]" name="file" type="file" multiple="multiple">
                                            </div>
                                            <div class="dz-message needsclick">
                                                <div class="mb-3">
                                                    <i class="display-4 text-muted ri-upload-cloud-2-line" onclick="return uploadDXF();"></i>
                                                </div>
                                                <h4>Drop files here or click to upload.</h4>
                                            </div>
                                            <!-- <div class="text-center mt-4">
                                            	<button type="button" class="btn btn-dark w-lg waves-effect waves-light" onclick="return uploadDXF();">Upload</button>
                                        	</div> -->
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div> 
												
							<div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        
    
                                        <h4 class="card-title mb-4">Status</h4>
    
                                        <div data-simplebar style="max-height: 345px;">
                                            <ul class="list-unstyled activity-wid">
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-edit-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">28 Apr, 2020 <small class="text-muted">12:07 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">2018 California State Building Code</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-user-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">21 Apr, 2020 <small class="text-muted">08:01 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Added an interest Volunteer Activities</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-bar-chart-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">17 Apr, 2020 <small class="text-muted">09:23 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Joined the group Boardsmanship Forum</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-mail-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">11 Apr, 2020 <small class="text-muted">05:10 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Responded to need In-Kind Opportunity</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-calendar-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">07 Apr, 2020 <small class="text-muted">12:47 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Created need Volunteer Activities</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-edit-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">05 Apr, 2020 <small class="text-muted">03:09 pm</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Attending the event "Some New Event"</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="activity-list">
                                                    <div class="activity-icon avatar-xs">
                                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                            <i class="ri-user-2-fill"></i>
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <h5 class="font-size-13">02 Apr, 2020 <small class="text-muted">12:07 am</small></h5>
                                                        </div>
                                                        
                                                        <div>
                                                            <p class="text-muted mb-0">Responded to need "In-Kind Opportunity"</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
												
       					 </div>											
											
                                            <div class="tab-pane" id="Processed-DXF" role="tabpanel">
                                               <div class="row">
												   
                                            <div class="col-xl-12">							
                                                 <div class="product-detail">
                                                    <div class="row">
                                                        <div class="col-2">
                                                            <div class="nav flex-column nav-pills" id="samples" role="tablist" aria-orientation="vertical">
																<div style="overflow-y: scroll; height:850px;">                                                                
																<h5 class="font-size-14">Inputs</h5>

																<c:set var="count" value="1" scope="page" />
                                                                <c:forEach items="${dxfimagesList}" var="imgsrc">
																	<img id="zoom${count}" src="/${imgsrc}" width="80px" height="100px" onclick="onImageClick('/${imgsrc}')">
																	<c:set var="count" value="${count + 1}" scope="page"/>
																</c:forEach>
																
																<h5 class="font-size-14">Outputs</h5>
																<c:forEach items="${pngimagesList}" var="imgsrc">
																<c:set var="count" value="${count + 1}" scope="page"/>
																	<img id="zoom${count}" src="/${imgsrc}" width="80px" height="100px" onclick="onImageClick('/${imgsrc}')">
																	
														        </c:forEach>
																</div>
                                                     
                                                            </div>
                                                        </div>
                                                       
                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
															Zoom: <select id="zoomimage" >
															<option value="25"> 25%</option>
															<option value="50"> 50% </option>
															<option value="75"> 75% </option>	
															<option value="100"> 100% </option>
															</select>
																<!--<div id="preview"></div> -->
																<div id="img-zoomer-box"> 
																<img id="img-1" style="width:500px; height:500px">
																<div id="img-2"></div>
																</div>
														</div>
                                                    </div>
                                                </div>
                                            </div>
                                           
											
											
                                        </div>
        
                                    </div>
                                </div>
                            </div>

                        </div>
        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->
                 <!-- right offcanvas -->
				<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					<div class="offcanvas-header">
					  <h5 id="offcanvasRightLabel">Offcanvas Right</h5>
					  <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
					  ...
					</div>
				</div>
                 <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © Codecompilance.
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end d-none d-sm-block">
                                    Crafted with <i class="mdi mdi-heart text-danger"></i> by Sageinformatics
                                </div>
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
		 <!-- Plugins js -->
        <script src="assets/libs/dropzone/min/dropzone.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script>

function uploadDXF(){
	var type=document.getElementById("fileId").value;
	var fileType = type.split('.')[1];
    if(fileType != "dxf"){
    	alert("Please upload only dxf files");
        return false;
    }
    return true;
}

function showProcessedDXF(userId, projectId){
	URL = "/"+$('#siteurl').val()+"/showProcessedDXF?userId="+userId+"&projectId="+projectId;
	
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		data: userId,
		success : function(response){
			if(response != null && response !=""){
				console.log("Success...");
				console.log(response.outputPage);
				//$(".container .row .col-xl-12").replaceWith(response.outputPage);
				//$(".container .row .col-xl-12").html(response.outputPage);
				window.location.href = response.outputPage;
			}
	},
	 error: function(jqXHR, textStatus, errorThrown) {
		 //console.log("error ==== "+jqXHR.status + ' ' + jqXHR.responseText);
		 console.log("error ==== "+jqXHR.status + ' ' + errorThrown);
        }
    
});
	
}

// function openCity(evt, cityName) {
	
  // var i, tabcontent, tablinks;
  // tabcontent = document.getElementsByClassName("tabcontent");
  // for (i = 0; i < tabcontent.length; i++) {
    // tabcontent[i].style.display = "none";
  // }
  // tablinks = document.getElementsByClassName("tablinks");
  // for (i = 0; i < tablinks.length; i++) {
    // tablinks[i].className = tablinks[i].className.replace(" active", "");
  // }
  // document.getElementById(cityName).style.display = "block";
  // evt.currentTarget.className += " active";
// }

// // Get the element with id="defaultOpen" and click on it
// document.getElementById("defaultOpen").click();
</script>


<script>

jQuery(function ($) {

$(".sidebar-dropdown > a").click(function() {
$(".sidebar-submenu").slideUp(200);
if (
$(this)
  .parent()
  .hasClass("active")
) {
$(".sidebar-dropdown").removeClass("active");
$(this)
  .parent()
  .removeClass("active");
} else {
$(".sidebar-dropdown").removeClass("active");
$(this)
  .next(".sidebar-submenu")
  .slideDown(200);
$(this)
  .parent()
  .addClass("active");
}
});

$("#close-sidebar").click(function() {
$(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
$(".page-wrapper").addClass("toggled");
});

});

</script>


<script>
let slideIndex = 0;
showSlides();

function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
 // slides[slideIndex-1].style.display = "block";
 // dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var xySize = "250% 250%";
var ySize = "250%";

$(function() {
    $("#zoomimage").change(function() {
		console.log('Got here for dropdown value');
		
		var pre = document.getElementById("preview");
		if($('option:selected', this).text()== '25%')
		{
			pre.style.backgroundSize="250% 250%";	
			xySize = "250% 250%";
		}
        else if($('option:selected', this).text()== '50%')
		{
			pre.style.backgroundSize="500% 500%";	
			xySize = "500% 500%";
		}
		else if($('option:selected', this).text()== '75%')
		{
			pre.style.backgroundSize="750% 750%";	
			xySize = "750% 750%";
		}
		else if($('option:selected', this).text()== '100%')
		{
			pre.style.backgroundSize="1000% 1000%";	
			xySize = "1000% 1000%";
		}
		
    });
});

function onImageClick(imageName)
{
	console.log(imageName)
	var img01 = document.getElementById("img-1");
	img01.src = imageName;
	//img01.style.backgroundSize="100% 100%";	
	var img02 = document.getElementById("img-2");
	//img02.src = imageName;
	img01.style.visibility = "visible";
	img02.style.backgroundImage = "url('" + imageName + "')" ;
	img02.style.backgroundRepeat ="no-repeat"
}



function zoomIn(event) {
	var pre = document.getElementById("preview");
	var img01 = document.getElementById("img-1");

	//var pre = document.getElementById("img-zoomer-box");
	var zimage = document.getElementById("zoomimage");
	var value = zimage.options[zimage.selectedIndex].text;
	
	var posX = event.offsetX;
	var posY = event.offsetY;

	var zoom001 = event.target;
	console.log(zoom001.id);
	
	var img = document.getElementById(zoom001.id);
	pre.style.backgroundImage = "url('" + img.getAttribute("src")+ "')";
	img01.style.src = "url('" + img.getAttribute("src")+ "')";
	if(value == '25%')
		{
			pre.style.backgroundSize="100% 100%";	
			console.log("100% 100%");
			// pre.style.backgroundPosition=(-posX*20)+"px "+(-posY*20)+"px";
		}
        else if(value == '50%')
		{
			pre.style.backgroundSize="150% 150%";	
			// pre.style.backgroundPosition=(-posX*50)+"px "+(-posY*50)+"px";
		}
		else if(value == '75%')
		{
			pre.style.backgroundSize="750% 750%";	
			// pre.style.backgroundPosition=(-posX*80)+"px "+(-posY*80)+"px";
		}
		else if(value == '100%')
		{
			pre.style.backgroundSize="1000% 1000%";	
			// pre.style.backgroundPosition=(-posX*110)+"px "+(-posY*110)+"px";
		}
		
	pre.style.visibility = "visible";
	
	//pre.style.backgroundSize = xySize;
}

function zoomOut() {
  var pre = document.getElementById("preview");
  pre.style.visibility = "visible";
}

</script>

<script>

let zoomer = function (){
  document.querySelector('#img-zoomer-box')
    .addEventListener('mousemove', function(e) {

    let original = document.querySelector('#img-1'),
        magnified = document.querySelector('#img-2'),
        style = magnified.style,
        x = e.pageX - this.offsetLeft,
        y = e.pageY - this.offsetTop,
        imgWidth = original.offsetWidth,
        imgHeight = original.offsetHeight,
        xperc = ((x/imgWidth) * 100),
        yperc = ((y/imgHeight) * 100);

    //lets user scroll past right edge of image
    if(x > (.01 * imgWidth)) {
      xperc += (.15 * xperc);
    };

    //lets user scroll past bottom edge of image
    if(y >= (.01 * imgHeight)) {
      yperc += (.15 * yperc);
    };

    style.backgroundPositionX = (xperc - 130) + '%';
	//console.log('x% is :' + xperc);
	//console.log('x-value% is :' + (xperc - 130));
	
    style.backgroundPositionY = (yperc - 55) + '%';
	
	//console.log('y% is :' + yperc);
	//console.log('y-value% is :' + (yperc - 55));

    style.left = (x - 480) + 'px';
    style.top = (y - 480) + 'px';

	console.log('x is :' + x);
	console.log('x - value is : ' + (x - 680));
	
	console.log('y is :' + y);
	console.log('y - value is : ' + (y - 580));

  }, false);
}();
</script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>

    </body>
</html>
