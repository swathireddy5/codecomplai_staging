<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>View Bookmarks</title>
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
          <c:if test="${!empty bookmarkList}">
          <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">All Bookmarks</h4>
          </div>
          </c:if>
		  <c:if test="${empty bookmarkList}">
		  <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">No Bookmarks</h4>
          </div>
		  </c:if>
        </div>
        
        <div id ="commentsDiv" class="col-md-12 col-12 mb-4">
            <h5 class="font-size-18 mb-1"><c:out value="${status}"/></h5>
        </div>
        
        <div class="row" id="commentsDiv0">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table table-hover mb-0">
                    <thead>
                      <tr bgcolor="#febd13" class="font-size-16">
                        <th>State</th>
                        <th>Book</th>
                        <th>Chapter</th>
                        <th>Section</th>
                        <th>Sub Section</th>
                        <th>Sub Sub Section</th>
                        <th>Created On</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="bookmark" items="${bookmarkList}">
                      <tr>
                        <td>
                        <input type="hidden" id="userId" name="userId" value="${bookmark.userId}"/>
					  	${bookmark.stateId}
					  </td>
					  <td>
					  	${bookmark.bookId}
					  </td>
					  <td>
					  	${bookmark.chapter}
					  </td>
					  <td>
					  	${bookmark.section}
					  </td>
					  <td>
					  	${bookmark.subSection}
					  </td>
					  <td>
					  	${bookmark.subsubSection}
					  </td>
					  <td>
					  	${bookmark.createdTime}
					  </td>
 						  <td id="tooltip-container9">
                              <!-- <a href="javascript:void(0);" class="me-3 text-primary" data-bs-container="#tooltip-container9" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" aria-label="Edit"><i class="mdi mdi-pencil font-size-18"></i></a> -->
                              <a href="#" class="text-danger" onclick="deletebookmark(${bookmark.userId},${bookmark.bookMarkId},'${bookmark.actionType}');" data-bs-container="#tooltip-container9" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" aria-label="Delete"><i class="mdi mdi-trash-can font-size-18"></i></a>
                          </td>
                      </tr>
                      </c:forEach>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- container-fluid --> 
    </div>
    <!-- End Page-content -->
    
    <footer class="footer">
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
<script src="assets/js/app.js"></script>
<script type="text/javascript">

function deletebookmark(userId,bookmarkId,actionType){
	 URL = "/"+$('#siteurl').val()+"/deleteBookmarksOrComments?userId="+userId+"&bookmarkId="+bookmarkId+"&actionType="+actionType;
	 
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			success : function(response){
				if(response != null && response !=""){
					console.log("Success...");
					console.log(response.outputPage);
					$("#status").val=response.status;
		 			$("#commentsDiv").text(response.status);
		 			$("#commentsDiv0").load(" #commentsDiv0");				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log("error ==== "+jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
}

</script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>

</body>
</html>
