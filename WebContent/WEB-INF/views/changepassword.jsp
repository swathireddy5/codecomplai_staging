<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Change Password</title>
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
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0">Change Password</h4>
							</div>						
                           
                        </div>
                        
                        <c:if test="${userStatus != null}" >
                        	<div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0">${userStatus}</h4>
							</div>
              			</c:if>
                        <!-- end page title -->
					<div class="row">
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body">
                                        <form class="custom-validation" action="/${siteurl}/changepassword" method="post">       
                                            <div class="mb-3">
                                                <label>New Password *</label>
                                                <input id="newpassword" class="form-control" type="password" name="newpassword" placeholder="Enter New Password" minlength = "4" maxlength="20" size="50" required>
                                            </div>
        
                                            <div class="mb-3">
                                                <label>Confirm Password *</label>
                                                <div>
                                                	<input id="confirmpassword" class="form-control" type="password" name="confirmpassword" placeholder="Confirm Password" maxlength="20" size="50" required>
                                                </div>
                                                
                                            </div>      
                                           <div class="mb-0">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light me-1" onclick="return Validate()">
                                                        Update
                                                    </button>
                                                    <button type="reset" class="btn btn-secondary waves-effect">
                                                        Cancel
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
        
                             <!-- end col -->
                        </div>
        
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
        <script type="text/javascript">
		    function Validate() {
		    	var password = document.getElementById("newpassword").value;
		        var confirmPassword = document.getElementById("confirmpassword").value;
		        if (password != confirmPassword) {
		            alert("Passwords do not match.");
		            return false;
		        }
		        return true;
		    }
		</script>
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <script src="assets/js/app.js"></script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>

    </body>
</html>
