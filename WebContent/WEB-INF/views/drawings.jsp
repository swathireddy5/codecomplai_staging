<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>COMPLAI</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="" rel="icon">
  <link href="" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,500;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/asidestyle.css" rel="stylesheet">
  
  <style>
  
   .switch-toggle .this{
        float: left;
        background:  gray;
     }
     .switch-toggle input {
       position: absolute;
       opacity: 0;
     }
     .switch-toggle input + label {
       padding: 7px;
       float:left;
       color: #fff;
       cursor: pointer;
     }

     .switch-toggle  input:checked  +  .red {
        background:  red;
     }

     .switch-toggle  input:checked  +  .green {
        background:  green;
     }
  
  </style>

</head>

<body>

	<!--  Include header jsp  -->
      
		<%@include file="header.jsp" %>
      
	<!-- End header  -->
	
  <main id="main">
  
    <div class="page-wrapper chiller-theme toggled">
      <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fa fa-bars"></i>
      </a>
      
      <!-- side nav jsp -->
      
      <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
          <div class="sidebar-brand">
            <a href="#">MAIN</a>
            <div id="close-sidebar">
              <!-- <i class="fa fa-times"></i> -->
        <svg style="width: 25px;position: relative;left: 10px;" id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 33.02 23"><rect x="5.02" width="28" height="3"/><rect x="5.02" y="10" width="28" height="3"/><rect x="5.02" y="20" width="28" height="3"/><polygon points="4.11 13.92 3.92 8.92 0 11.08 4.11 13.92"/></svg>
            </div>
          </div>
        
          <!-- sidebar-search  -->
          <div class="sidebar-menu">
            <ul>
              <li>
                <a href="codes?statename=${selectedState}">
                  <span>Codes</span>
                </a>
                </li>
              <li>
                <a href="#">
                  <span>Search</span>
                </a>
               </li>
               <li class="sidebar-dropdown active">
                <a href="drawings">
                  <span>New Drawings</span>
                </a>
               </li>
            
              <li>
                <a href="viewProjects">
                 
                  <span>Projects</span>
                </a>
                <div class="sidebar-submenu" style="display: block;">
                   <ul>
                   <!--   
                    <li>
                       <a href="project_details">Project 2</a>
                    </li>
                    -->
                    <c:forEach var="project" items="${projectList}">
                    <li class="active">
                      <a href="viewProjectDetails?userId=${userId}&projectId=${project.projectId}">${project.projectName}</a>
                    </li>
                    </c:forEach>
                  </ul>
                </div>
              </li>
                        
              <li>
                <a href="#">
                  <span>Diagrams</span>
                </a>
              </li>
              <li  class="sidebar-dropdown">
                <a href="#">
                  <span>Bookmarks</span>
                </a>
              </li>
             </ul>
          </div>
          <!-- sidebar-menu  -->
        </div>
      </nav>
      <!-- sidebar-wrapper  -->
      
      <!-- end side nav -->
    
      <main class="page-content">
        <div class="container-fluid">
        
          <!-- main list codes -->
        	<%@include file="mainlist.jsp" %>
      	<!-- end main list -->

<div class="row">
  <div class="col-xl-12"> 
  
  
  <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100" style="padding-top:74px">
					<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form method="post" action="/${siteurl}/uploadDrawing" enctype="multipart/form-data">
										<div class="form-group">
											<label>Select a Project</label>
											
                 
                   
											<select id="projectid" name="projectid" class="form-control" required>
												<option value="0"> --Select One-- </option>
												 <c:forEach var="project" items="${projectList}">
													<option value=<c:out value="${project.projectId}"/>>${project.projectName}</option>
												</c:forEach>
        
         									</select>
										</div>
										<div class="form-group">
											<label>Drawing Details</label>
											<input id="drawingdetail" name="drawingdetail" class="form-control form-control-lg" type="text" name="company" placeholder="Details of the drawing">
										</div>
										
										<div class="form-group">
											<label>Upload Drawings</label>
											 Select<input type="file" name="file2" multiple /><br>
										</div>
										<div class="text-center mt-3">
											<button type="submit" class="btn btn-lg btn-primary">Upload</button>
											<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
										</div>
									</form>
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
</main>

      <!-- page-content" -->
    </div>

  </main><!-- End #main -->

	<!--  Include footer jsp  -->
      
		<%@include file="footer.jsp" %>
      
	<!-- End footer  -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/buildingdata.js"></script>

</body>

</html>