<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Codes</title>
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

    </head>

    <body data-sidebar="dark">
    
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

            <input type="hidden" id='siteurl' name="siteurl" value="${siteurl}"/>
            <!-- header  -->
            <%@include file="header.jsp" %>

            <!-- ========== Left Sidebar Start ========== -->
            <c:if test="${username != null}">
            	<%@include file="sidenav.jsp" %>
            </c:if>
            
            <!-- Left Sidebar End -->

            

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">
			<c:set var="flag" value="true" scope="session" />
                <div class="page-content">
                    <div class="container-fluid">
                    <!-- start page title -->
                        <div class="row">
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0">Codes</h4>
							</div>
							
                           
                        </div>
                        <!-- end page title -->
                    
					<div class="row">							
									  <c:forEach var="map" items="${stateBooksMap}">
									  	<div class="col-xl-3 col-sm-6">
		                                <div class="card">
		                                    <div class="card-body c-p" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" onclick="changeState('${map.key}')">
												<!--  <div class="text-center">-->
		                                            <img src="assets/images/states/${map.key}.png" alt="Alabama" class="avatar-sm mt-2 mb-4">
		                                            <div class="flex-1">
		                                                <h5 class="text-truncate">${map.key}</h5>
		                                                <p class="text-muted">
		                                                    <i class="mdi mdi-location-enter me-1"></i><c:out value="${fn:length(map.value)}" /> books available
		                                                </p>
		                                            </div>
		                                        
		                                    </div>
		                                </div>
		                            </div>
									</c:forEach>
									
								
        
                    </div></div>  <!-- container-fluid -->
                </div>
                <!-- End Page-content -->
                
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
	
                                        <!-- right offcanvas -->
                                        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                                            <div class="offcanvas-header">
                                              <h5 id="offcanvasRightLabel">State books</h5>
                                              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>                                            
											<form class="app-search d-none d-lg-block px-3">
												<div class="position-relative">
													<input id="bookTitle" name="bookTitle" type="text" class="form-control bg-gradient" placeholder="search the book titles ">
													<span class="ri-search-line" oninput="getBooksList(this);"></span>
												</div>
											</form>
                                            <div class="offcanvas-body">
                                                <input type="hidden" id='bookList' name="bookList"/>
                                                <!--<c:forEach var="book" items="${bookList}">
												<a id="" href="getBookDetails?regionName=<c:out value="${book.regionName}"/>&bookName=<c:out value="${book.bookName}"/>&bookUrl=<c:out value="${book.bookUrl}"/>" class="text-dark">
												<div class="card bg-dark text-light mb-2 bg-h">
													<span class="card-body">
													<h4 class="card-title text-light"><input type=lable>${book.regionName}</h4>
													<p class="card-text"><input type=lable>${book.bookName}
													<i class="ri-arrow-right-line align-middle ms-2"></i>
													</p>
													</span>
												</div>
												</a>
												</c:forEach>-->
													<span class="card-body" id="regionBasedBooksList">
													
													</span>
                                            </div>
                                        </div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <script src="assets/js/app.js"></script>
        
<script>

$("#bookTitle").keyup(function() {
    // Do whatever you need to do on actual change of the value of the input field
	var bookTitle = this.value;
    //alert(bookTitle);
	URL = "/"+$('#siteurl').val()+"/bookTitleSearch?bookTitle="+bookTitle;
	console.log("selected URL="+URL);
	$.ajax({
		type: "POST",
		async: false,
		url : URL,
		success : function(response){
			if(response.length == 0){
				$('#regionBasedBooksList').empty();
				$('#regionBasedBooksList').append('No Match Found');
			}else if(response != null && response.length > 0){
				console.log("Success...");
				console.log(response);
				$('#regionBasedBooksList').empty().append();
				for(i = 0; i< response.length; i++){
					$("#regionBasedBooksList").append('<a onclick="return false;" href="getBookDetails?regionName='+response[i].regionName+'&bookId='+response[i].bookId+'&stateId='+response[i].stateId+'" class="text-dark"><div class="card bg-dark text-light mb-2 bg-h"><span class="card-body"><h4 class="card-title text-light">'+response[i].regionName+'</h4><p class="card-text">'+response[i].bookName+'<i class="ri-arrow-right-line align-middle ms-2"></i></p></span></div></a>');
				}
			}
			
	},
	 error: function(jqXHR, textStatus, errorThrown) {
		 console.log("error ==== "+jqXHR.status + ' ' + jqXHR.responseText);
        }
    
	});
});

function changeState(selectedState){
	URL = "/"+$('#siteurl').val()+"/getBooksForSelectedState?statename="+selectedState;
	console.log("selected URL="+URL);
	$.ajax({
		type: "POST",
		async: false,
		url : URL,
		success : function(response){
			if(response != null && response !=""){
				console.log("Success...");
				console.log(response);
				$('#regionBasedBooksList').empty().append();
				for(i =0; i< response.length; i++){
					$("#regionBasedBooksList").append('<a href="getBookDetails?regionName='+response[i].regionName+'&bookId='+response[i].bookId+'&stateId='+response[i].stateId+'" class="text-dark"><div class="card bg-dark text-light mb-2 bg-h"><span class="card-body"><h4 class="card-title text-light">'+response[i].regionName+'</h4><p class="card-text">'+response[i].bookName+'<i class="ri-arrow-right-line align-middle ms-2"></i></p></span></div></a>');
				}
			}
	},
	 error: function(jqXHR, textStatus, errorThrown) {
		 console.log("error ==== "+jqXHR.status + ' ' + jqXHR.responseText);
        }
    
	});
}

function getval(selectedState)
{
	console.log("selected Regionname="+selectedState);
    URL = "/"+$('#siteurl').val()+"/getCodeYearsList";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
	data: { "regionId" : sel.value},
		success : function(response){
			if(response != null && response !=""){
				$('#codeYearId').children('option[value!="0"]').remove(); 
				data = response.years;
				console.log("==========data======"+data);
				$("#selectedJurisdictionLabelId").val(sel.text);
				// Adding text as Current for the latest year and keeping the value as it is 
				$("#codeYearId").append($('<option>', { 
				        value: data[0][0],
				        text : "Current"
				    }));
				for( i=1;i<data[0].length;i++){
					console.log("==========data======"+data[0][i]);
					$("#codeYearId").append($('<option>', { 
				        value: data[0][i],
				        text : data[0][i]
				    }));
				}
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
}

$(document).ready(function(){
var x = document.getElementById("currlocation");
console.log("got the value of the x : ");
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }

function showPosition(position) {
 console.log(position);
  x.innerHTML = "Latitude: " + position.coords.latitude +
  "<br>Longitude: " + position.coords.longitude;

  $('#currlocation').val(position.coords.latitude +
  ", " + position.coords.longitude)
}
});
</script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>
</body>
</html>
