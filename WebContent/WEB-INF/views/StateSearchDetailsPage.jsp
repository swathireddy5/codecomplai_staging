<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Search Results</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		

    </head>
    <body data-sidebar="dark" onload="<c:if test="${!empty searchResults}">show_chapter_content(1);</c:if>">
    
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

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

                <div class="page-content">
                    <div class="container-fluid">
					
                    <!-- start page title -->
                    	
                        <div class="row">
                        <div class="col-xl-6">
                        
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
								<a class="dropdown-icon-item" href="codes?statename=${selectedState}">
                                 <img src="assets/images/brands/Building-codes.png" alt="Building codes">
                                 <span>Building codes</span>
                             </a>
								<c:if test="${empty searchResults}">
									<c:if test="${!empty selectedState}">
	                                    <h4 class="mb-sm-0">No search results found for the keyword "<c:out value="${searchString}"/>" in "<c:out value="${selectedState}"/>".</h4>
	                                </c:if>
	                                <c:if test="${empty selectedState}">
	                                    <h4 class="mb-sm-0">No search results found since State is not Selected.</h4>
	                                </c:if>
	                            </c:if>
                                <c:if test="${!empty searchResults}">
                                   	<h4 class="mb-sm-0">Search Results for the keyword "<c:out value="${searchString}"/>" in "<c:out value="${selectedState}"/>" :</h4>
                                                               	
                                   	
                                </c:if>
							</div>
							 
							</div>
							<div class="col-xl-6"></div>
							<c:if test="${!empty searchResults}">
							<h6>Book : <c:out value="${searchBookTitle}"/> Year : <c:out value="${searchBookYear}"/></h6>
							</c:if>
							<c:if test="${!empty searchResults}">                      
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body p-0" id="contentForSelectedSec"><br/>
							            <ul class="todo-list">
							             <c:forEach items="${searchResults}" var="result" varStatus="myIndex">
							       	 		<li>
							                <div>							           
							                   <%-- <c:out value="<span> ${result.highlightVal} </span>" escapeXml="false"/><br> --%>
							                  <label class="label" onclick="javascript:show_chapter_content('${myIndex.count}');" style="cursor: pointer;"> <c:out value=" ${result.highlightVal}" escapeXml="false"/><br></label>
							                </div>
							              </li>
							             </c:forEach>
							            </ul>
            						</div>
            					</div>
            				</div>
            				<div class="col-xl-6">
								<div class="page-title-box d-sm-flex align-items-center justify-content-between">
	                                 <h4 class="mb-sm-0">Content</h4>
								</div>                            
                                <div class="card"><ul>
                                    <div class="card-body p-0" id="contentForSelectedSec"><br/>
						               	<div style="width:400px;height:auto;" id="searchResultsDetailsId"></div>
            						</div><br/>
            					</div></ul>
            				</div>
            				</c:if>
            			</div>
        					
          <!-- /.card-body -->
          
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
	
                                     
        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <script src="assets/js/app.js"></script>
        
	<script>
		function show_chapter_content(responseVal){
		//	console.log('--============responseVal===========--'+responseVal)
			console.log("responseVal==="+responseVal);
			//$("#searchResultsDetailsId").text(responseVal);
		$(this).closest("label").css({ 'background': '#D7D5D5'});
		URL = "/"+$('#siteurl').val()+"/readKeywordSearchRes";
		$.ajax({
			type: "GET",
			 async: false,  
			url : URL,
			data: { indexID: responseVal},
			success : function(response){
				if(response != null && response !=""){
					$(this).closest("label").css({ 'background': '#D7D5D5'});
					$("#searchResultsDetailsId").html(response);
					 
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.status + ' ' + jqXHR.responseText);
		    }
		
		});
		
		}
	</script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>


    </body>
</html>