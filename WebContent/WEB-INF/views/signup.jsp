<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Register</title>
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
    
                                                <h4 class="font-size-18 mt-3">Register account</h4>
                                               
                                            </div>

                                            <div class="p-2 mt-4">
                                            	<c:if test = "${not empty signupStatus}">
										          <p style="color:red"><br/><br/><c:out value="${signupStatus}"/></p>
										         </c:if>
                                                <form class="" method="post" action="/${siteurl}/user_creation" autocomplete="off">

                                                    <input type="hidden" name="_token" value="a8OS8A1IMADyZfMyrKuxiy0AUUQsKPQuUDFRtXga">
                    								<div class="auth-form-group-custom mb-4">
                                                        <i class="ri-star-s-line auti-custom-input-icon"></i>
                                                        <label for="plan">Choose a plan</label>
                                                       
														<select class="form-select form-control" id="plan" name="inputUserType">
									                        <option value="free" <c:if test="${plan == 'free'}">selected</c:if>>Free</option>
									                        <option value="standard" <c:if test="${plan == 'standard'}">selected</c:if>>Standard</option>
									                        <option value="business" <c:if test="${plan == 'business'}">selected</c:if>>Business</option>
									                        <option value="enterprise" <c:if test="${plan == 'enterprise'}">selected</c:if>>Enterprise</option>
								                        </select>
                                                    </div>
													
													<div class="auth-form-group-custom mb-4">
                                                        <i class="ri-user-2-line auti-custom-input-icon"></i>
                                                        <label for="name">Name*</label>
                                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" maxlength = "20" required autofocus="autofocus">
                                                    </div>
													
													<div class="auth-form-group-custom mb-4">
                                                        <i class=" ri-building-2-line user-2-line auti-custom-input-icon"></i>
                                                        <label for="Company">Company</label>
                                                        <input type="text" class="form-control" id="Company" name="company" maxlength = "50" placeholder="Enter Company">
                                                    </div>
													
													<div class="auth-form-group-custom mb-4">
                                                        <i class="ri-mail-line auti-custom-input-icon"></i>
                                                        <label for="useremail">Email*</label>
                                                        <input type="email" class="form-control" id="useremail" autocomplete="false" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" name="email" placeholder="Enter email" maxlength = "60" required>
                                                        <p><i>*This will be your username for login</i></p>
                                                    </div>
                    
                                                    <div class="auth-form-group-custom mb-4">
                                                        <i class="ri-lock-password-line auti-custom-input-icon"></i>
                                                        <label for="txtPassword">Password*</label>
                                                        <input type="password" class="form-control" id="txtPassword" name="password" placeholder="Enter password" minlength = "4" maxlength = "10" required autocomplete="false">
                                                    </div>
                            
                                                    <div class="auth-form-group-custom mb-4">
                                                        <i class="ri-lock-password-line auti-custom-input-icon"></i>
                                                        <label for="txtConfirmPassword">Confirm Password*</label>
                                                        <input type="password" class="form-control" id="txtConfirmPassword" name="password" minlength = "4" maxlength = "10" placeholder="Renter password" required>
                                                    </div>
                            

                                                    <div class="text-center">
                                                        <button class="btn btn-primary w-md waves-effect waves-light" type="submit" onclick="return Validate()">Register</button>
                                                    </div>

                                                    <div class="mt-4 text-center">
														 <p  class="mb-0">Already have an account ? <a href="login" class="fw-medium text-primary"> <strong>Login</strong></a> </p>
                                                        
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="mt-5 text-center">
                                               
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

        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
	    	function Validate() {
	        var password = document.getElementById("txtPassword").value;
	        var confirmPassword = document.getElementById("txtConfirmPassword").value;
	        if (password != confirmPassword) {
	            alert("Passwords do not match.");
	            return false;
	        }
	        return true;
	    	}
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
