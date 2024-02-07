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
      <%@include file="sidenav.jsp" %>
      <!-- end side nav -->
    
      <main class="page-content">
        <div class="container-fluid">
          
        <!-- main list codes -->
        	<%@include file="mainlist.jsp" %>
      	<!-- end main list -->

<div class="row">
  <div class="col-xl-12">
     <div class="demo10">
            <div class="container">
		<div class="clearfix"></div>
		<div class="">
            
	  <div class="row">
  <div class="col-xl-12">
    <div class="row pt-4 pb-3">
	<div class="col-xl-6 pull-left">
          <div class="section-head">
          
          <h4 class="pull-left" style="margin-top:20px;"><span>Building</span> Data</h4>
          	
        </div> 
      </div>
	  
      <div class="col-xl-4 ">
         <a href="javascript:saveprojectbuildingdata()" class="btn btn-sm btn-secondary pull-right ">SAVE AND VIEW REQUIREMENTS </a>
      </div>
      <div class="col-xl-2 p-0">
         <a href="javascript:heightandareas()" class="btn btn-sm btn-warning  ">NEXT MODULE
</a>
      </div>
    </div>

    <div class="row">
      <div class="col-xl-12">

        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
             General Building Information

            </h3>
            
          </div>
          <!-- /.card-header -->
          <div class="card-body">
		  <div >
            <ul class="">
              <li>
                <div class="custom-control custom-checkbox my-1 mr-sm-2">
				<div class="col-xl-6 pull-left">
                 <p>Basic Life Safety<br><b>What type of building sprinkler system is present?</b></p>
				 </div>
				 <div class="col-xl-6 pull-right">
				 <div class="form-group">
				 <c:if test="${sprinklertype != null}" >
					<select id="sprinklertype" name="drawingtype" class="form-control" style="width:100px;" >
				        
				        <option value="nfpa13" <c:if test="${sprinklertype == 'nfpa13'}">selected</c:if>>NFPA 13</option>
				        
				        <option value="nfpa13R" <c:if test="${sprinklertype == 'nfpa13R'}">selected</c:if>>NFPA 13R</option>
				        
				        <option value="nfpa13D" <c:if test="${sprinklertype == 'nfpa13D'}">selected</c:if>>NFPA 13D</option>
				        
				        <option value="not_sprinklered" <c:if test="${sprinklertype == 'Not sprinklered'}">selected</c:if>>Not sprinklered</option>
												
					</select>
					</c:if>
					<c:if test="${sprinklertype == null}" >
					<select id="sprinklertype" name="drawingtype" class="form-control" style="width:100px;" >
				        
				        <option value="nfpa13" selected>NFPA 13</option>
				        
				        <option value="nfpa13R">NFPA 13R</option>
				        
				        <option value="nfpa13D">NFPA 13D</option>
				        
				        <option value="not_sprinklered">Not sprinklered</option>
												
					</select>
					</c:if>
				</div>
				 </div>
				 <div class="col-xl-4 pull-right">
            <button class="btn btn-sm btn-warning pull-right"  data-toggle="modal" data-target="#Feedback" style="margin-top:20px;">Give a Feedback</button>
            </div>
                </div>
              </li>
       
            </ul>
					 
	</div>
          </div>
          
        </div>
      </div>
      
      
      <!--  Include building fields  -->
      
      <%@include file="buildingfields.jsp" %>
      
      <!-- End Include  -->
      
    </div>
    
    
	
</div>

</div>
	<div class="col-md-12" style="margin-bottom:20px; float:right;">
          <div class="col-xl-2 p-0 pull-right">
              <a href="javascript:heightandareas()" class="btn btn-sm btn-warning  ">NEXT MODULE </a>
          </div>
          <div class="col-xl-4  pull-right">
            <a href="javascript:projectdetails()" class="btn btn-sm btn-secondary pull-right ">SAVE AND VIEW REQUIREMENTS </a>
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
 
      
    </div>
  </div>


</body>

</html>