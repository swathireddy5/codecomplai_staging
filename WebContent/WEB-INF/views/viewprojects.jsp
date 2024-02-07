<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>ViewProjects</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
   		<!-- Sweet Alert-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body data-sidebar="dark">
    
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

            
            <!-- header -->
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
                            <div class="col-12">
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <c:if test="${empty projectList}">
                                    	<h4 class="mb-sm-0">No Projects</h4>
                                    </c:if>
                                    <c:if test="${!empty projectList}">
                                    	<h4 class="mb-sm-0">All Projects</h4>
                                    </c:if>
                                    
                                   <div class="page-title-right">
									   <button type="button" class="btn btn-sm btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#New_Project">
                                                Create New Project <i class="ri-add-line align-middle ms-2"></i> 
                                            </button>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
							
						<c:if test="${!empty projectList}">
						<div class="row">
                            
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div>
                                                        <ul class="list-inline my-3 ecommerce-sortby-list">
			                                                <li class="list-inline-item"><span class="fw-medium font-family-secondary">Sort by:</span></li>
			                                                <li class="list-inline-item active"><a href="viewProjects">All</a></li>
			                                                <li class="list-inline-item"><a href="viewProjects?sort=desc">Newest</a></li>
			                                                <li class="list-inline-item"><a href="viewProjects?sort=asc">Oldest</a></li>
			                                            </ul>
                                                    </div>
                                                </div>
                                                
                                                <!-- pagination  -->
												
												<c:set var="totalCount" scope="session" value="${fn:length(projectList)}"/>
                                                <c:set var="projects" scope="session" value="${projectList}"/>
												<c:set var="perPage" scope="session"  value="12"/>
												<c:set var="totalPages" scope="session" value="${Math.floor(fn:length(projectList)/perPage)}"/>
												<c:set var="pageCount" scope="session"  value="${fn:substringBefore(totalPages, '.')}"/>
												<c:set var="pageStart" value="${param.start}"/>
												<c:set var="pageno" scope="session" value="0"/>
												<c:if test="${empty pageStart or pageStart < 12}">
													   <c:set var="pageStart" value="0"/>
												</c:if>
												<c:if test="${totalCount < pageStart}">
													   <c:set var="pageStart" value="${pageStart - 12}"/>
												</c:if>
												<c:if test="${pageStart > 1}">
													   <c:set var="pageno" value="${fn:substring(pageStart, 0, 1)}"/>
												</c:if>
												<!-- pagination  -->                               
                                                
            
                                                <div class="col-md-6">
                                                    <div class="form-inline float-md-end">
                                                        <div class="search-box ms-2">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control rounded" placeholder="Search the project names">
                                                                <i class="mdi mdi-magnify search-icon" oninput="getProjectsList(this);"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            

                                            <div class="row g-3 pro">
                                            <c:forEach var="project" items="${projectList}" varStatus="letterCounter" begin="${pageStart}" end="${pageStart + perPage - 1}">
												<div class="col-xl-3 col-sm-6">
                                                    <div class="product-box">
                                                        <div class="dropdown float-end">
				                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
				                                                <i class="mdi mdi-dots-horizontal"></i>
				                                            </a>
															<div class="dropdown-menu dropdown-menu-end">
																<a class="dropdown-item" data-project-id="${project.projectId}" data-bs-toggle="modal" data-bs-target="#Rename_Project" href="#Rename_Project" onClick="pop_up(${userId},${project.projectId});">Rename</a> 
																<!-- item--> 
																<a class="dropdown-item" href="duplicateProject?userId=${userId}&projectId=${project.projectId}&projectName=${project.projectName}" onclick="return confirm('Are you sure you want to create a copy of this project?');Javascript:location.replace(this.href);Event.returnvalue=false;">Duplicate</a> 
																<!-- item--> 
																<a class="dropdown-item" href="deleteProject?userId=${userId}&projectId=${project.projectId}" onclick="return confirm('Are you sure you want to delete this project?');">Remove</a> 
																<!-- item--> 
																<a href="javascript:void(0);" class="dropdown-item">Manage Collaborators</a> 
																<!-- item--> 
																<a href="javascript:void(0);" class="dropdown-item">Export Bookmarks(PDF)</a> 
															</div>
                                        				</div>
                                                        
                                                        <div class="text-center py-1">
                                                            <p class="font-size-12 mb-1">Created On</p>
                                                            <p class="font-size-14 mb-1">${project.createdAt}</p>
                                                            <h5 class="font-size-20">
                                                            <a href="viewProjectDetails?userId=${userId}&projectId=${project.projectId}">${project.projectName}<br/>
															<button type="button" class="btn btn-sm btn-primary waves-effect waves-light mt-3">
                                                			view Project <i class="ri-arrow-right-line align-middle ms-2"></i> </button></a>
                                                			</h5>
                                                        </div>
                                                    </div>
                                                </div>
											</c:forEach>
										</div>
											 
                                            <div class="row mt-4">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <p class="mb-sm-0 mt-2">Pages <span class="fw-bold">${pageno+1}</span> Of <span class="fw-bold">${pageCount+1}</span></p>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="float-sm-end">
                                                    <ul class="pagination pagination-rounded mb-sm-0">
                                                            <!-- <li class="page-item disabled">
                                                                <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                                                            </li> 
                                                            <c:if test="${empty pageStart or pageStart < 10}">
	                                                            <li class="page-item disabled">
	                                                                <a href="#" class="page-link">Prev</a>
	                                                            </li>
                                                            </c:if>
                                                            <c:if test="${pageStart > 9}">-->
	                                                            <li class="page-item">
	                                                                <a href="viewProjects?start=${pageStart - 12}" class="page-link">Prev</a>
	                                                            </li>
                                                            <!-- </c:if> -->
                                                            <li class="page-item active">
                                                                <a href="#" class="page-link">${pageStart + 1} - ${pageStart + 12}</a>
                                                            </li>
                                                            <!-- <li class="page-item">
                                                                <a href="viewProjects?start=${pageStart + 12}" class="page-link">Next</a>
                                                            </li> -->
                                                            <c:choose>
															    <c:when test = "${pageno+1 eq pageCount+1}">
															        <li class="page-item disabled">                                                             	
	                                                            	</li>
															    </c:when>
															    <c:otherwise>
															        <li class="page-item">
	                                                                	<a href="viewProjects?start=${pageStart + 12}" class="page-link">Next</a>
	                                                            	</li>
															    </c:otherwise>
															</c:choose>
                                                            
                                                            <!--<c:if test="${pageno+1 eq pageCount+1}">
	                                                            <li class="page-item">
	                                                                <a href="viewProjects?start=${pageStart + 12}" class="page-link">Next</a>
	                                                            </li>
                                                            </c:if>
                                                            <c:if test="${totalCount < pageStart}">
	                                                            <li class="page-item disabled">
	                                                                <a href="#" class="page-link">Next</a>
	                                                            </li>
                                                            </c:if> 
                                                           
                                                             <li class="page-item">
                                                                <a href="#" class="page-link"><i class="mdi mdi-chevron-end"></i></a>
                                                            </li> -->
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </div> <!-- container-fluid -->
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

										
                                              
                                                <!-- Rename Project -->
                                                <div class="modal fade" id="Rename_Project" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="Rename_ProjectLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
	                                                    <form action="/${siteurl}/renameProject" onsubmit="event.preventDefault()">
	                                                        <div class="modal-content">
	                                                        	<input type="hidden" id='inputuserId' name="inputuserId"/>
																<input type="hidden" id='inputprojectId' name="inputprojectId"/>
	                                                            <div class="modal-header">
	                                                                <h5 class="modal-title" id="Rename_ProjectLabel">Rename Project</h5>
	                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                                                            </div>
	                                                            <div class="modal-body">
	                                                                <div class="form-group">
																	<label>Enter new Project name*</label>
																	<input class="form-control" type="text" name="projectname" placeholder="Project Name" maxlength="30" required autofocus="autofocus">
																	</div>
	                                                            </div>
	                                                            <div class="modal-footer">
	                                                                <button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">Close</button>
	                                                                <button type="submit" class="btn btn-primary waves-effect waves-light" type="submit">Rename Project</button>
	                                                            </div>
	                                                        </div>
	                                                    </form>
                                                    </div>
                                                </div>
		
										<!-- Create New Project -->
                                                <div class="modal fade" id="New_Project" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="New_ProjectLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="New_ProjectLabel">Create New Project</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
																<p>Projects allow you to save customized inputs about your building. These inputs help surface the applicable codes and requirements.</p>
                                                                
													<!------------------------------>
													
													<form action="/${siteurl}/createProjectShowBuildingData">
														<div class="form-group mb-4">
															<label>Project Name*</label>
															<input class="form-control" type="text" name="projectname" placeholder="Project Name" maxlength="30" required autofocus="autofocus">
														</div>
														<div class="form-group mb-4">
															<label>Jurisdiction*</label><c:out value="${regionYear.regionId}"/>
															<input type="hidden" name="selectedJurisdictionLabel" id="selectedJurisdictionLabelId" autofocus="autofocus">
															<select id="JurisdictionId" name="Jurisdiction" class="form-control" onchange="getval(this);" required autofocus="autofocus">
																<option value="0"> --Select One-- </option>
																<c:forEach var="regionYear" items="${regionCodeYear}">
																<option value=<c:out value="${regionYear.regionId}"/>>${regionYear.regionName}</option>
																</c:forEach>
				         									</select>
														</div>
														<div class="form-group">
															<label>Code Year*</label>
															<select name="codeYear" id="codeYearId" class="form-control" required autofocus="autofocus">
																<option value="0" disabled> --Select One-- </option>
																<!--<option value="1"> 2019 </option>
																	<option value="2">2016</option>
																 -->
															</select>
														</div>
														<br/>
														<div class="form-group">
                                                                <button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">Close</button>
																<input type="submit" class="btn btn-primary waves-effect waves-light" value="Create New Project">
                                                               
                                                        </div>
														<!--<div class="text-center mt-3">
															<input type="submit" class="btn btn-lg btn-warning" value="Create New Project"></input>
														</div>-->
													</form>													
                                                    </div>
                                                    </div>
                                                </div>
                                                </div>
        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <script src="assets/js/app.js"></script>
  		<!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>

        <!-- Sweet alert init js-->
        <script src="assets/js/pages/sweet-alerts.init.js"></script>
        
        <script>
  
  function pop_up(userId,projectId){
	  
	  $("#inputuserId").val(userId);
	  $("#inputprojectId").val(projectId);
	  //$("#inputprojectName").html(projectName);
  }
  

  function getval(sel)
  {
	  console.log("selected Regionname="+sel.value);
      URL = "/codecompilance/getCodeYearsList";
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
        var allFields = document.querySelectorAll(".register_form");

        for (var i = 0; i < allFields.length; i++) {

            allFields[i].addEventListener("keyup", function(event) {

                if (event.keyCode === 13) {
                    console.log('Enter clicked')
                    event.preventDefault();
                    if (this.parentElement.nextElementSibling.querySelector('input')) {
                        this.parentElement.nextElementSibling.querySelector('input').focus();
                    }
                }
            });

        }
    </script>

		<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>
    </body>
</html>
