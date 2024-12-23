<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Reset Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    </head>

    <body class="auth-body-bg">
        <div>
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4">
                        <div class="authentication-page-content p-4 d-flex align-items-center min-vh-100">
                            <div class="w-100">
                                <div class="row justify-content-center">
                                    <div class="col-lg-9">
                                        <div>
                                            <div class="text-center  mt-5">
                                                <div>
                                                    <a href="home" class="">
                                                        <img src="assets/images/logo-dark.png" alt="" height="40" class="auth-logo logo-dark mx-auto">
                                                        <img src="assets/images/logo-light.png" alt="" height="40" class="auth-logo logo-light mx-auto">
                                                    </a>
                                                </div>
    
                                                <h4 class="font-size-16 mt-4">Reset Password</h4>
                                               
                                            </div>

                                            <div class="p-2 mt-4">
                                            	<c:if test="${not empty userStatus}" >
						                        	<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						                                   <p style="color:green"><h4 class="mb-sm-0">${userStatus}</h4></p>
													</div>
						              			</c:if>
						              			<c:if test="${not empty userStatusError}" >
						                        	<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						                                   <p style="color:red"><h4 class="mb-sm-0">${userStatusError}</h4></p>
													</div>
						              			</c:if>
                                            	
                                                <form class="" method="post" action="/${siteurl}/resetpassword">
                                                
													<input type="hidden" id="emailId" name="emailId" value="${emailId}">
													<div class="auth-form-group-custom mb-4">
                                                        <i class="ri-user-2-line auti-custom-input-icon"></i>
                                                        <label for="newpassword">New Password *</label>
                                                        <input id="newpassword" class="form-control" type="password" name="newpassword" placeholder="Enter New Password" minlength = "8" maxlength="20" size="50" oninput="checkPasswordStrength()" required>
                                                    </div>
													
													<div class="auth-form-group-custom mb-4">
                                                        <i class="ri-mail-line auti-custom-input-icon"></i>
                                                        <label for="confirmpassword">Confirm Password *</label>
                                                        <input id="confirmpassword" class="form-control" type="password" name="confirmpassword" placeholder="Confirm Password" maxlength="20" size="50" required>
                                                        
                                                    </div>
                                                    
                                                    <div id="password-strength"></div>   <br/>

                                                    <div class="text-center">
                                                        <button class="btn btn-primary w-md waves-effect waves-light" type="submit" onclick="return Validate()">Reset</button>
                                                    </div>

                                                    
                                                </form>
                                            </div>

                                            <div class="mt-5 text-center">
                                               
                                                <p>�Copyright 2022 COMPLAI. All Rights Reserved. <br>
Crafted with <i class="mdi mdi-heart text-danger"></i> by <a href="https://www.sageinformatics.co.in/" target="_blank">Sage Informatics Pvt Ltd.</a></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="authentication-bg1 position-relative">
                           	
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
		<script src="assets/js/changepassword.js"></script>
        <script src="assets/js/app.js"></script>
        
<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>


    </body>
</html>