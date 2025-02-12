<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8" />
<title>Update Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Bootstrap Css -->
<link href="assets/css/bootstrap.min.css" id="bootstrap-style"
	rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="assets/css/app.min.css" id="app-style" rel="stylesheet"
	type="text/css" />
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.7-beta/jquery.inputmask.min.js"></script>


</head>

<body data-sidebar="dark">

	<!-- <body data-layout="horizontal" data-topbar="dark"> -->

	<!-- Begin page -->
	<div id="layout-wrapper">


		<!-- header -->
		<%@include file="header.jsp"%>

		<!-- ========== Left Sidebar Start ========== -->
		<%@include file="sidenav.jsp"%>
		<!-- Left Sidebar End -->



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">

			<div class="page-content">
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div
							class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0">Update Profile</h4>
						</div>
					</div>
					<c:if test="${userStatus != null}">
						<div
							class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0">${userStatus}</h4>
						</div>
					</c:if>
					<!-- end page title -->
					<div class="row">
						<div class="col-xl-6">
							<div class="card">
								<div class="card-body">
									<form class="custom-validation" action="/${siteurl}/profile"
										method="post">
										<div class="mb-3">
											<label>Name *</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="username" name="username"
													value="${userView.firstName}" maxlength="20" size="50"
													required>
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="username" name="username"
													placeholder="Enter your name" maxlength="20" size="50"
													required>
											</c:if>
										</div>

										<div class="mb-3">
											<label>Company *</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="company" name="company"
													value="${userView.company}" maxlength="50" required>
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="company" name="company"
													placeholder="Enter Company Name" maxlength="50" required>
											</c:if>
										</div>

										<div class="mb-3">
											<label>Emaild ID</label>
											<c:if test="${userView != null}">
												<c:out value="${userView.email}"></c:out>
											</c:if>
										</div>

										<div class="mb-3">
											<label>Plan</label>
											<c:if test="${userView != null}">
												<c:out value="${userView.plan}"></c:out>
											</c:if>
										</div>

										<div class="mb-3">
											<label>Address</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="address" name="address"
													value="${userView.address}" maxlength="30">
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" name="address" placeholder="Enter Address"
													maxlength="30">
											</c:if>
										</div>

										<div class="mb-3">
											<label>Street/Area</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="street" name="street"
													value="${userView.street}" maxlength="30">
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" name="street" placeholder="Enter Street/Area"
													maxlength="30">
											</c:if>
										</div>

										<div class="mb-3">
											<label>City</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="city" name="city" value="${userView.city}"
													maxlength="20">
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" name="city" placeholder="Enter City"
													maxlength="20">
											</c:if>
										</div>

										<div class="mb-3">
											<label>State</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" id="state" name="state"
													value="${userView.statename}" maxlength="20">
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" name="state" placeholder="Enter State"
													maxlength="20">
											</c:if>
										</div>

										<div class="mb-3">
											<label for="mobile">Phone/Mobile</label>
											<c:if test="${userView != null}">
												    <input value="${userView.phone}" data-parsley-type="alphanum" class="form-control" type="text" id="mobile" 
												    name="mobile" placeholder="(000) 000-0000" oninput="formatPhoneNumber(this)" maxlength="14" />
												    <p id="error" style="color: red; display: none;">Please enter a valid US phone number.</p>
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="text" placeholder="(000) 000-0000" maxlength="14" id="mobile" name="mobile"
													placeholder="Enter mobile" oninput="formatPhoneNumber(this)">
													<p id="error" style="color: red; display: none;">Please enter a valid US phone number.</p>
											</c:if>
										</div>

										<div class="mb-3">
											<label>Zipcode</label>
											<c:if test="${userView != null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="number" id="zipcode" maxlength="5"
													oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
													name="zipcode" value="${userView.zipcode}">
											</c:if>
											<c:if test="${userView == null}">
												<input data-parsley-type="alphanum" class="form-control"
													type="number" name="zipcode" maxlength="5"
													oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
													placeholder="Enter zipcode">
											</c:if>
										</div>

										<!-- <div class="mb-3">
                                                <label>Profile Pic</label>
                                                <div>
													 <input type="file" id="myFile" name="filename" class="form-control" >
                                                    
                                                </div>
                                            </div> -->

										<div class="mb-0">
											<div>
												<button type="submit"
													class="btn btn-primary waves-effect waves-light me-1">
													Update</button>
												<button type="reset" class="btn btn-secondary waves-effect">
													Cancel</button>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
						<!-- end col -->

						<!-- end col -->
					</div>

				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->

			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<script>document.write(new Date().getFullYear())</script>
							© Codecompilance.
						</div>
						<div class="col-sm-6">
							<div class="text-sm-end d-none d-sm-block">
								Crafted with <i class="mdi mdi-heart text-danger"></i> by
								Sageinformatics
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
	<script src="assets/js/phonevalidation.js"></script>
	<script src="assets/js/app.js"></script>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
	    const updateButton = document.getElementById("updateButton");
	    const updateForm = document.getElementById("updateForm");

	    // Ensure the button is enabled on page load
	    updateButton.disabled = false;

	    function disableUpdateButton() {
	        updateButton.disabled = true;
	        updateButton.classList.add("btn-secondary");
	        updateButton.classList.remove("btn-primary");
	    }

	    function enableUpdateButton() {
	        updateButton.disabled = false;
	        updateButton.classList.remove("btn-secondary");
	        updateButton.classList.add("btn-primary");
	    }

	    // Handle form submission
	    updateForm.addEventListener("submit", function(event) {
	        event.preventDefault(); 
	        disableUpdateButton();

	        // Simulating an API request or form processing delay
	        setTimeout(() => {
	            enableUpdateButton(); 
	            alert("Update successful!");
	        }, 2000);
	    });
	});
    </script>
	<!-- chatbot  -->
	<%@include file="chatbot.jsp"%>
	
	</body>
	</html>
