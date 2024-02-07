<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Login</title>
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
                                            <div class="text-center">
                                                <div>
                                                    <a href="home" class="">
                                                        <img src="assets/images/logo-dark.png" alt="" height="40" class="auth-logo logo-dark mx-auto">
                                                        <img src="assets/images/logo-light.png" alt="" height="40" class="auth-logo logo-light mx-auto">
                                                    </a>
                                                </div>
    
                                                <h4 class="font-size-18 mt-4">Welcome Back !</h4>
                                                <p class="text-muted">Sign in to continue to ComplAI.</p>
                                            </div>
                                            
                                            <div>
                                            <!--<c:out value="${siteurl}"></c:out> -->
                                            	<c:set var="loginStatus" value="${loginStatus}" scope="request"/>
										          <c:if test = "${not empty loginStatus}">
										          	<p style="color:red">Invalid Email or password. Please try again...</p>
										          </c:if>
										          <c:if test="${not empty userStatus}" >
										          	<p style="color:green"><c:out value="${userStatus}"/></p>
						              			  </c:if>
										          <c:if test = "${not empty signupStatus}">
										          	<p style="color:green"><c:out value="${signupStatus}"/></p>
										          </c:if>
										    </div>

                                            <div class="p-2 mt-5">
                                            	  
                                                <form class="" method="post" action="/${siteurl}/user_login">
                    
                                                    <div class="mb-3 auth-form-group-custom mb-4">
                                                        <i class="ri-user-2-line auti-custom-input-icon"></i>
                                                        <label for="username">Email</label>
                                                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter Email" required>
                                                    </div>
                            
                                                    <div class="mb-3 auth-form-group-custom mb-4">
                                                        <i class="ri-lock-password-line auti-custom-input-icon"></i>
                                                        <label for="password">Password</label>
                                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                                                    </div>
                            
                                                    <div class="form-check">
                                                        <input type="checkbox" class="form-check-input" id="customControlInline">
                                                        <label class="form-check-label" for="customControlInline">Remember me</label>
                                                    </div>

                                                    <div class="mt-4 text-center">
                                                        <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Log In</button>
                                                    </div>

                                                    <div class="mt-4 text-center">
                                                        <a href="forgotpassword" class="text-muted"><i class="mdi mdi-lock me-1"></i> Forgot your password?</a>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="mt-5 text-center">
                                               <p>Don't have an account ? <a href="signup" class="fw-medium text-primary"> Register </a> </p>
                                                <p>©Copyright 2022 COMPLAI. All Rights Reserved. <br>
Crafted with <i class="mdi mdi-heart text-danger"></i> by <a href="https://www.sageinformatics.co.in/" target="_blank">Sage Informatics Pvt Ltd.</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="authentication-bg">
                            
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

        <script src="assets/js/app.js"></script>

		<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>


    </body>
</html>
