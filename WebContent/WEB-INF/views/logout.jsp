<html lang="en"><head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>COMPLAI</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="" rel="icon">
  <link href="" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,500;0,900;1,100;1,300;1,400;1,700;1,900&amp;display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/asidestyle.css" rel="stylesheet">

<style>
  #header {
    transition: all 0.5s;
    z-index: 997;
    padding: 25px 0;
    background: #ffffff;
    height: 85px;
}
.mobile-nav-toggle {
    position: fixed;
    top: 30px;
    right: 15px;
    z-index: 9998;
    border: 0;
    background: none;
    font-size: 24px;
    transition: all 0.4s;
    outline: none !important;
    line-height: 1;
    cursor: pointer;
    text-align: right;
}
</style>

</head>

<body data-aos-easing="ease" data-aos-duration="1000" data-aos-delay="0"><button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container-fluid d-flex align-items-center">
      <div class="logo mr-auto">
        <!-- <h1 class="text-light"><a href="#"><span>complai</span></a></h1> -->
        <!-- Uncomment below if you prefer to use an image logo -->
        <a href="home"><img src="assets/images/complai-color-logo.svg" alt="logo" class="img-fluid logo-height-55"></a>
      </div>

            <div class="search-newsletter d-none d-lg-block">
              <div class="container">
                <div class="row justify-content-center">
                    <form method="get" action="search">
                      <div class="main-search-icon-wrap">
                        <svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M15.8045 15.7908L11.2545 10.9565C12.1359 9.79983 12.6665 8.33004 12.6665 6.72923C12.6665 3.01902 9.82522 0.00012207 6.33325 0.00012207C2.84128 0.00012207 0 3.01899 0 6.7292C0 10.4394 2.84132 13.4583 6.33328 13.4583C7.83992 13.4583 9.22325 12.8945 10.3119 11.9581L14.8619 16.7924C14.9919 16.9305 15.1625 17 15.3332 17C15.5039 17 15.6745 16.9305 15.8045 16.7924C16.0652 16.5155 16.0652 16.0678 15.8045 15.7908ZM6.33328 12.0416C3.57597 12.0416 1.33333 9.65885 1.33333 6.7292C1.33333 3.79955 3.57597 1.41675 6.33328 1.41675C9.0906 1.41675 11.3332 3.79955 11.3332 6.7292C11.3332 9.65885 9.09057 12.0416 6.33328 12.0416Z" fill="black"></path>
                        </svg>
                      </div>
                      <input type="text" name="search" placeholder="Search...">
                    </form>
                </div>
              </div>
            </div>
      <nav class="nav-menu d-none d-lg-block float-right">
        <ul>
          <li class="active"><a href="home">Home</a></li>
                    <li><a href="login">Login</a></li>
          <li><a href="signup" class="get-started-btn scrollto">Sign Up</a></li>
                  </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="hero-container">
      <!-- <h1>COMPLAI LOGO</h1> -->
      <img src="assets/images/complai-color-logo.svg" class="img-fluid logo-height-75">
      <!-- <h2>We are team of talanted designers making websites with Bootstrap</h2> -->
      <!--Search Engine-->

    </div>

    <div class="container">
	<div class="row">
	<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form method="post" action="user_login">
                    <input type="hidden" name="_token" value="">
										<div class="form-group">
											<label>Username</label>
											<input class="form-control form-control-lg" type="text" name="username" placeholder="Enter your Username">
										</div>
										<div class="form-group">
											<label>Password</label>
											<input class="form-control form-control-lg" type="password" name="password" placeholder="Enter your Password">
										</div>
										<div class="text-center mt-3">
											<!-- <a href="dashboard-default.html" class="btn btn-lg get-started-btn">Login</a> -->
											<button type="submit" class="btn btn-lg get-started-btn">Login</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>


  </div>

  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container aos-init" data-aos="fade-up">
        <div class="row content">
          <div class="col-lg-6">
            <div class="card card-custom">
              <div class="card-body card-body-custom">
                <h4 class="card-title text-center card-title-c-custom"><span class="font-weight-500">Key</span> Features</h4>
                <p class="card-text">Some example text some example text. John Doe is an architect and engineer.
                  John Doe is an architect and engineer
                </p>
              <ul>
                <li>Lorem ipsum dolor sit, amet consectetur adipisicing elit. </li>
                <li>Lorem ipsum dolor sit, amet consectetur adipisicing elit. </li>
                <li>Lorem ipsum dolor sit, amet consectetur adipisicing elit. </li>
              </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <div class="card card-custom">
              <div class="card-body card-body-custom">
                <h4 class="card-title text-center card-title-c-custom"><span class="font-weight-500">Why</span> CODE COMPLAI?</h4>
                <p class="card-text">Some example text some example text. John Doe is an architect and engineer.
                  John Doe is an architect and engineer
                </p>

                <div class="row">
                  <div class="col-xl-4 text-center">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"> <g clip-path="url(#clip0)"> <path d="M29.5 27H28V17.5C28 17.224 27.7755 17 27.4995 17.0005C27.3365 17.0005 27.1839 17.08 27.0905 17.2135L20.0905 27.2135C19.9324 27.4401 19.9875 27.7515 20.214 27.91C20.2975 27.9685 20.3975 28 20.5 28H27V29.5C27 29.776 27.224 30 27.4999 30C27.7759 30 27.9999 29.776 27.9999 29.5V28H29.4999C29.7759 28 29.9999 27.776 29.9999 27.5001C30 27.224 29.776 27 29.5 27ZM27 19.086V27H21.46L27 19.086Z" fill="black"></path> <path d="M20.4998 29H14.5803L20.0838 22.5195C20.0963 22.5045 20.1078 22.4889 20.1188 22.4729C21.1543 20.9404 20.8093 18.866 19.3338 17.7509C17.5398 16.4619 15.0403 16.8714 13.7513 18.6654C13.2628 19.3454 12.9998 20.1624 12.9998 20.9999C12.9998 21.2759 13.2238 21.4999 13.4997 21.4999C13.7757 21.4999 13.9997 21.2759 13.9997 20.9999C13.9997 19.3429 15.3427 17.9999 16.9992 17.9994C17.6272 17.9994 18.2392 18.1963 18.7497 18.5629C19.7832 19.3549 20.0242 20.8134 19.2997 21.8954L13.1188 29.1765C12.9403 29.3871 12.9658 29.7025 13.1763 29.881C13.2668 29.958 13.3813 30 13.4998 30H20.4998C20.7758 30 20.9998 29.776 20.9998 29.5C20.9998 29.224 20.7758 29 20.4998 29Z" fill="black"></path> <path d="M13.511 26.5095C13.5215 26.2335 13.306 26.0015 13.03 25.991C6.50701 25.749 1.27148 20.5225 1.01748 14H3C3.27598 14 3.49998 13.776 3.49998 13.5C3.49998 13.224 3.27598 13 3 13H1.01748C1.2675 6.48902 6.48896 1.26803 13 1.01801V2.50002C13 2.776 13.224 3 13.4999 3C13.7759 3 13.9999 2.776 13.9999 2.50002V1.01801C20.4219 1.2665 25.6054 6.35203 25.9759 12.768L24.0259 10.818C23.8274 10.626 23.5109 10.6315 23.3189 10.8305C23.1319 11.0245 23.1319 11.3314 23.3189 11.525L26.1099 14.316C26.1624 14.3795 26.2304 14.429 26.3069 14.4595C26.3264 14.4654 26.3464 14.47 26.3664 14.4739C26.4009 14.4864 26.4364 14.4949 26.4724 14.4994C26.4773 14.4994 26.4819 14.4994 26.4868 14.4994C26.4918 14.4994 26.4963 14.4994 26.5008 14.4994C26.5389 14.4964 26.5764 14.4889 26.6128 14.4775C26.6333 14.4749 26.6538 14.471 26.6738 14.466C26.7413 14.442 26.8033 14.4035 26.8543 14.3529L29.6834 11.5249C29.8754 11.3264 29.8699 11.0099 29.6709 10.8179C29.4769 10.631 29.1699 10.631 28.9764 10.8179L26.9779 12.8149C26.621 5.64803 20.7115 0.0175195 13.5355 0.00697266C13.523 0.00650391 13.5125 0 13.5 0C13.4875 0 13.477 0.00650391 13.4645 0.00697266C6.0365 0.0169922 0.0169922 6.0365 0.00697266 13.4645C0.00697266 13.477 0 13.4875 0 13.5C0 13.5125 0.00650391 13.523 0.00697266 13.5355C0.0194531 20.7805 5.75297 26.721 12.993 26.9905H13.0115C13.28 26.9905 13.501 26.778 13.511 26.5095Z" fill="black"></path> <path d="M20.2174 6.78252C20.0224 6.58752 19.7054 6.58752 19.5104 6.78252L14.1375 12.155C13.7315 11.974 13.268 11.974 12.8619 12.155L10.3179 9.61101C10.1194 9.419 9.80293 9.42451 9.61092 9.62349C9.42394 9.8175 9.42394 10.1245 9.61092 10.318L12.1499 12.857C11.7934 13.6035 12.1094 14.497 12.8559 14.8535C13.4289 15.127 14.1119 15.01 14.5604 14.561C15.0114 14.1135 15.1279 13.4285 14.8494 12.8575L20.2174 7.48951C20.4124 7.29451 20.4124 6.97752 20.2174 6.78252ZM13.8535 13.8535C13.6559 14.0425 13.344 14.0425 13.1465 13.8535C12.9509 13.6585 12.9509 13.3415 13.1465 13.1465C13.342 12.9515 13.6585 12.951 13.8535 13.1465C14.049 13.3415 14.049 13.658 13.8535 13.8535Z" fill="black"></path> </g> <defs> <clipPath id="clip0"> <rect width="30" height="30" fill="white"></rect> </clipPath> </defs> </svg>
                    <div class="box-area">
                      <p>Integrity is our most important</p>
                    </div>
                  </div>
                  <div class="col-xl-4 text-center">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M15 30C14.2731 30 13.6816 29.4086 13.6816 28.6816C13.6816 28.6583 13.6823 28.6351 13.6835 28.612L6.30516 25.5558C6.06369 25.824 5.714 25.9928 5.32559 25.9928C4.59867 25.9928 4.00723 25.4013 4.00723 24.6744C4.00723 23.9475 4.59867 23.3561 5.32559 23.3561C6.0525 23.3561 6.64395 23.9475 6.64395 24.6744C6.64395 24.6978 6.6433 24.721 6.64213 24.7441L14.0204 27.8002C14.2619 27.5321 14.6116 27.3633 15 27.3633C15.3884 27.3633 15.7381 27.5321 15.9796 27.8002L23.3579 24.7441C23.3566 24.7209 23.3561 24.6978 23.3561 24.6744C23.3561 23.9475 23.9475 23.3561 24.6744 23.3561C25.4013 23.3561 25.9928 23.9475 25.9928 24.6744C25.9928 25.4013 25.4013 25.9928 24.6744 25.9928C24.286 25.9928 23.9363 25.824 23.6948 25.5558L16.3165 28.612C16.3178 28.6351 16.3184 28.6583 16.3184 28.6816C16.3184 29.4086 15.7269 30 15 30ZM15 28.2422C14.7577 28.2422 14.5605 28.4393 14.5605 28.6816C14.5605 28.924 14.7577 29.1211 15 29.1211C15.2423 29.1211 15.4395 28.924 15.4395 28.6816C15.4395 28.4393 15.2423 28.2422 15 28.2422ZM24.6744 24.2349C24.432 24.2349 24.2349 24.432 24.2349 24.6744C24.2349 24.9167 24.432 25.1138 24.6744 25.1138C24.9167 25.1138 25.1138 24.9167 25.1138 24.6744C25.1138 24.432 24.9167 24.2349 24.6744 24.2349ZM5.32564 24.2349C5.0833 24.2349 4.88619 24.432 4.88619 24.6744C4.88619 24.9167 5.0833 25.1138 5.32564 25.1138C5.56799 25.1138 5.7651 24.9167 5.7651 24.6744C5.7651 24.432 5.56793 24.2349 5.32564 24.2349ZM15 24.7266C9.63674 24.7266 5.27344 20.3633 5.27344 15C5.27344 9.63674 9.63674 5.27344 15 5.27344C16.9013 5.27344 18.7431 5.82211 20.3264 6.86021C20.5294 6.99328 20.586 7.26574 20.453 7.46871C20.3199 7.67174 20.0473 7.72828 19.8445 7.59527C19.3479 7.26973 18.8235 6.99715 18.2784 6.77965C18.6727 7.18014 19.04 7.65662 19.3735 8.20447C19.5812 8.54549 19.7714 8.90748 19.9434 9.28711H21.7581C21.5401 9.0307 21.3062 8.78479 21.0566 8.55029C20.8796 8.38412 20.871 8.10604 21.0372 7.92914C21.2034 7.75213 21.4815 7.74352 21.6584 7.90975C23.6082 9.74144 24.7266 12.3257 24.7266 15C24.7266 20.3633 20.3633 24.7266 15 24.7266ZM15.4395 20.7129V23.8161C16.6281 23.6446 17.7452 22.78 18.6229 21.3384C18.7451 21.1376 18.8608 20.929 18.9697 20.7129H15.4395ZM11.0303 20.7129C11.1392 20.929 11.2549 21.1376 11.3771 21.3384C12.2548 22.7801 13.3719 23.6446 14.5605 23.8161V20.7129H11.0303ZM19.9435 20.7129C19.7715 21.0925 19.5812 21.4545 19.3736 21.7955C19.041 22.3416 18.6749 22.8169 18.2821 23.2166C19.6344 22.6744 20.8233 21.8073 21.7509 20.7129L19.9435 20.7129ZM8.249 20.7129C9.1766 21.8073 10.3656 22.6744 11.7178 23.2165C11.325 22.8169 10.9589 22.3416 10.6264 21.7955C10.4187 21.4545 10.2285 21.0925 10.0564 20.7128L8.249 20.7129ZM20.298 19.834H22.4074C23.2425 18.5585 23.7574 17.0551 23.8369 15.4395H21.0878C21.0448 17.004 20.7727 18.5037 20.298 19.834ZM15.4395 19.834H19.3606C19.8699 18.528 20.1628 17.0225 20.2086 15.4395H15.4395V19.834ZM10.6394 19.834H14.5605V15.4395H9.79143C9.83725 17.0225 10.1301 18.528 10.6394 19.834ZM7.59264 19.834H9.70201C9.22723 18.5037 8.95518 17.004 8.91223 15.4395H6.16313C6.24258 17.0551 6.7575 18.5585 7.59264 19.834ZM21.0878 14.5605H23.8371C23.7607 12.9714 23.2705 11.468 22.4164 10.166H20.298C20.7727 11.4963 21.0448 12.996 21.0878 14.5605ZM15.4395 14.5605H20.2086C20.1628 12.9775 19.87 11.472 19.3606 10.166H15.4395V11.1914C15.4395 11.4342 15.2428 11.6309 15 11.6309C14.7572 11.6309 14.5605 11.4342 14.5605 11.1914V10.166H10.6394C10.1301 11.472 9.83725 12.9775 9.79143 14.5605H14.5605V12.9492C14.5605 12.7065 14.7572 12.5098 15 12.5098C15.2428 12.5098 15.4395 12.7065 15.4395 12.9492V14.5605ZM6.16313 14.5605H8.91223C8.95518 12.996 9.22728 11.4963 9.70201 10.166H7.59264C6.7575 11.4415 6.24258 12.9449 6.16313 14.5605ZM15.4395 9.28711H18.9697C18.8608 9.07102 18.7451 8.86236 18.6229 8.66156C17.7452 7.21992 16.6281 6.35537 15.4395 6.18393V9.28711ZM11.0303 9.28711H14.5605V6.18393C13.3719 6.35537 12.2548 7.21998 11.3771 8.66156C11.2549 8.86236 11.1392 9.07102 11.0303 9.28711ZM8.249 9.28711H10.0565C10.2285 8.90748 10.4188 8.54555 10.6264 8.20447C10.959 7.65838 11.3251 7.18307 11.7179 6.7834C10.3656 7.32557 9.1766 8.1927 8.249 9.28711ZM25.6217 22.8265C25.5656 22.8265 25.5087 22.8157 25.4537 22.7929C25.2295 22.7 25.1229 22.443 25.2159 22.2188L27.8002 15.9796C27.5321 15.7381 27.3633 15.3884 27.3633 15C27.3633 14.6116 27.5321 14.2619 27.8002 14.0204L24.7441 6.64213C24.7209 6.64336 24.6978 6.64395 24.6744 6.64395C23.9475 6.64395 23.3561 6.0525 23.3561 5.32559C23.3561 4.59867 23.9475 4.00723 24.6744 4.00723C25.4013 4.00723 25.9928 4.59867 25.9928 5.32559C25.9928 5.714 25.824 6.06369 25.5558 6.30516L28.612 13.6835C28.6351 13.6822 28.6583 13.6816 28.6816 13.6816C29.4086 13.6816 30 14.2731 30 15C30 15.7269 29.4086 16.3184 28.6816 16.3184C28.6583 16.3184 28.6351 16.3177 28.612 16.3165L26.0279 22.5551C25.9578 22.7243 25.7941 22.8265 25.6217 22.8265ZM28.6816 14.5605C28.4393 14.5605 28.2422 14.7577 28.2422 15C28.2422 15.2423 28.4393 15.4395 28.6816 15.4395C28.924 15.4395 29.1211 15.2423 29.1211 15C29.1211 14.7577 28.924 14.5605 28.6816 14.5605ZM24.6744 4.88619C24.432 4.88619 24.2349 5.0833 24.2349 5.32564C24.2349 5.56799 24.432 5.7651 24.6744 5.7651C24.9167 5.7651 25.1138 5.56799 25.1138 5.32564C25.1138 5.0833 24.9167 4.88619 24.6744 4.88619ZM4.3783 22.8265C4.20586 22.8265 4.04227 22.7244 3.97213 22.5551L1.38803 16.3165C1.36488 16.3178 1.34174 16.3184 1.31836 16.3184C0.591445 16.3184 0 15.7269 0 15C0 14.2731 0.591445 13.6816 1.31836 13.6816C1.34174 13.6816 1.36494 13.6823 1.38803 13.6835L4.44416 6.30516C4.17603 6.06369 4.00723 5.714 4.00723 5.32559C4.00723 4.59867 4.59867 4.00723 5.32559 4.00723C5.714 4.00723 6.06369 4.17603 6.30516 4.44416L13.6835 1.38803C13.6822 1.36488 13.6816 1.34174 13.6816 1.31836C13.6816 0.591445 14.2731 0 15 0C15.7269 0 16.3184 0.591445 16.3184 1.31836C16.3184 1.34174 16.3177 1.36494 16.3165 1.38803L22.5638 3.9757C22.788 4.06857 22.8945 4.32562 22.8016 4.54986C22.7087 4.7741 22.4516 4.88074 22.2274 4.7877L15.9796 2.19979C15.7381 2.46785 15.3884 2.63672 15 2.63672C14.6116 2.63672 14.2619 2.46791 14.0204 2.19979L6.64213 5.25592C6.64336 5.27906 6.64395 5.30221 6.64395 5.32559C6.64395 6.0525 6.0525 6.64395 5.32559 6.64395C5.30221 6.64395 5.279 6.6433 5.25592 6.64213L2.19979 14.0204C2.46791 14.2619 2.63672 14.6116 2.63672 15C2.63672 15.3884 2.46791 15.7381 2.19979 15.9796L4.78406 22.2188C4.87699 22.443 4.77053 22.7 4.54623 22.7929C4.49127 22.8157 4.43432 22.8265 4.3783 22.8265ZM1.31836 14.5605C1.07602 14.5605 0.878906 14.7577 0.878906 15C0.878906 15.2423 1.07602 15.4395 1.31836 15.4395C1.5607 15.4395 1.75781 15.2423 1.75781 15C1.75781 14.7577 1.5607 14.5605 1.31836 14.5605ZM5.32564 4.88619C5.0833 4.88619 4.88619 5.0833 4.88619 5.32564C4.88619 5.56799 5.0833 5.7651 5.32564 5.7651C5.56799 5.7651 5.7651 5.56799 5.7651 5.32564C5.7651 5.0833 5.56793 4.88619 5.32564 4.88619ZM15 0.878906C14.7577 0.878906 14.5605 1.07602 14.5605 1.31836C14.5605 1.5607 14.7577 1.75781 15 1.75781C15.2423 1.75781 15.4395 1.5607 15.4395 1.31836C15.4395 1.07602 15.2423 0.878906 15 0.878906Z" fill="black"></path> </svg>                    <div class="box-area">
                      <p>Integrity is our most important</p>
                    </div>
                  </div>
                  <div class="col-xl-4 text-center">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M29.5 5.50088H27.5V3.00088C27.501 2.72475 27.2779 2.50007 27.0018 2.49913C26.9871 2.49907 26.9726 2.49969 26.958 2.50088L25.6535 2.61088C22.4901 2.8725 19.3873 3.62907 16.4585 4.85288L15 5.45938L13.543 4.85488C10.6139 3.63088 7.51075 2.87419 4.347 2.61238L3.042 2.50088C2.76681 2.47769 2.52494 2.68194 2.50175 2.95713C2.5005 2.97169 2.49994 2.98632 2.5 3.00088V5.50088H0.5C0.223875 5.50088 0 5.72475 0 6.00088V27.0009C0 27.277 0.223875 27.5009 0.5 27.5009H29.5C29.7761 27.5009 30 27.277 30 27.0009V6.00088C30 5.72475 29.7761 5.50088 29.5 5.50088ZM1 26.5019V6.50088H2.5V24.0009C2.49906 24.2613 2.69806 24.4788 2.9575 24.5009L4.303 24.6159C4.66969 24.6466 5.03631 24.6844 5.403 24.7294C5.5255 24.7439 5.647 24.7634 5.7695 24.7794C6.012 24.8119 6.2545 24.8444 6.496 24.8829C6.64 24.9059 6.7835 24.9329 6.927 24.9584C7.146 24.9969 7.365 25.0354 7.583 25.0784C7.733 25.1084 7.883 25.1414 8.033 25.1739C8.2435 25.2189 8.454 25.2649 8.6635 25.3149C8.8135 25.3509 8.966 25.3894 9.117 25.4279C9.3235 25.4809 9.5295 25.5349 9.735 25.5919C9.885 25.6339 10.035 25.6779 10.185 25.7219C10.389 25.7822 10.5925 25.8449 10.7955 25.9099C10.9442 25.9572 11.0925 26.0059 11.2405 26.0559C11.445 26.1244 11.648 26.1964 11.851 26.2699C11.995 26.3199 12.1395 26.3744 12.2825 26.4289C12.3445 26.4524 12.406 26.4789 12.4675 26.5019H1ZM14.5 26.2509L13.578 25.8659C10.6511 24.6396 7.54987 23.8804 4.3875 23.6159L3.5 23.5419V3.54488L4.263 3.60888C7.32337 3.86175 10.3251 4.5935 13.1585 5.77738L14.5 6.33438V26.2509ZM15.5 26.2509V6.33438L16.843 5.77688C19.6759 4.59325 22.6771 3.86169 25.737 3.60888L26.5 3.54488V23.5404L25.6785 23.6074C22.5142 23.8701 19.4102 24.6248 16.4785 25.8444L15.5 26.2509ZM29 26.5009H17.54C17.6085 26.4744 17.6765 26.4464 17.745 26.4204C17.895 26.3629 18.045 26.3084 18.1985 26.2539C18.3945 26.1829 18.5913 26.1141 18.789 26.0474C18.943 25.9974 19.098 25.9474 19.2525 25.8974C19.45 25.8344 19.6485 25.7744 19.847 25.7154C20.003 25.6694 20.1595 25.6239 20.316 25.5809C20.516 25.5249 20.716 25.4724 20.921 25.4209C21.076 25.3814 21.2315 25.3419 21.3875 25.3049C21.5955 25.2549 21.805 25.2099 22.0145 25.1654C22.1645 25.1329 22.3145 25.0994 22.4675 25.0694C22.6875 25.0259 22.9085 24.9874 23.129 24.9489C23.272 24.9239 23.4145 24.8989 23.558 24.8739C23.8045 24.8349 24.0515 24.8014 24.299 24.7684C24.4175 24.7529 24.536 24.7339 24.655 24.7184C25.0217 24.6741 25.3902 24.6362 25.7605 24.6049L27.041 24.5009C27.301 24.4795 27.5009 24.2618 27.5 24.0009V6.50088H29V26.5009Z" fill="black"></path> </svg>                    <div class="box-area">
                      <p>Integrity is our most important</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

 <!-- ======= Testimonials Section ======= -->
 <section id="testimonials" class="testimonials">
  <div class="container aos-init" data-aos="fade-up">

    <div class="section-title">
      <h2>Partners</h2>
      <p>meet our awesome network.</p>
    </div>

    <div class="owl-carousel testimonials-carousel owl-loaded owl-drag">

      

      

      

      

      
    <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1665px, 0px, 0px); transition: all 0.25s ease 0s; width: 3608px;"><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-2.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-3.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-4.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-1.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item" style="width: 277.5px;"><div class="testimonial-item">
      <div class="testmonilal-box">
        <img class="img-fluid" src="assets/images/clients-logo-1.png" alt="Lorem ipsum">
        <p>Lorem ipsum</p>
      </div>

      </div></div><div class="owl-item" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-2.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item active" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-3.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item active" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-4.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item active" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-1.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned active" style="width: 277.5px;"><div class="testimonial-item">
      <div class="testmonilal-box">
        <img class="img-fluid" src="assets/images/clients-logo-1.png" alt="Lorem ipsum">
        <p>Lorem ipsum</p>
      </div>

      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-2.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-3.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div><div class="owl-item cloned" style="width: 277.5px;"><div class="testimonial-item">
        <div class="testmonilal-box">
          <img class="img-fluid" src="assets/images/clients-logo-4.png" alt="Lorem ipsum">
          <p>Lorem ipsum</p>
        </div>
      </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots"><button role="button" class="owl-dot active"><span></span></button><button role="button" class="owl-dot"><span></span></button></div></div>

  </div>
</section><!-- End Testimonials Section -->



  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6 footer-contact">
            <img src="assets/images/complai-white-logo.svg" class="img-fluid logo-height-50">
            <p>
              Some example text some example text. John Doe is an architect and engineer. John Doe is an architect and engineer
            </p>
            <h4 class="pt-3 font-20">Download Mobile App</h4>
            <img src="assets/images/android_complai.png" class="app-img" alt="android-complai">
            <img src="assets/images/ios_complai.png" class="app-img" alt="ios-complai">

          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>CODE COMPLAI</h4>
            <ul>
              <li><a href="#">Home</a></li>
              <li> <a href="#">Link one</a></li>
              <li> <a href="#">Link two</a></li>
              <li> <a href="#">Privacy</a></li>
              <li> <a href="#">Contact us</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>QUICK LINKS</h4>
            <ul>
              <li><a href="#">Home</a></li>
              <li> <a href="#">Link one</a></li>
              <li> <a href="#">Link two</a></li>
              <li> <a href="#">Privacy</a></li>
              <li> <a href="#">Contact us</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>CONTACT US</h4>
            <p>
              CODE COMPLAI <br>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
            <h4 class="mb-0 pb-0">FOLLOW US</h4>
            <div class="social-links">
              <a href="#" class="twitter"><svg style="width:22px;position: relative;top: 2px;" id="regular" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 506.68 415.97"><defs><style>.cls-1{fill:#fff;}</style></defs><title>twitter</title><path class="cls-1" d="M10.09,418a297.11,297.11,0,0,0,159.53,46c83.41,0,159.85-32,215.25-90.22,53-55.68,82.18-130.49,80.73-206.42,20.1-17.19,43.73-50,43.73-82a16,16,0,0,0-24.1-13.8c-18.88,11.09-36.1,14-53.81,9-36.16-35.24-90-42.66-135.33-18.21-39.64,21.33-61.68,60.37-59.7,103a265.1,265.1,0,0,1-172-93.93,16,16,0,0,0-26.16,2.13C17.49,109.16,17.71,150.4,35.78,183.7a16.66,16.66,0,0,0-13.91,16.58A112.85,112.85,0,0,0,61.18,285.5a16,16,0,0,0-4.09,16.58,114.82,114.82,0,0,0,65,69.63C89.26,387.39,53,392.62,20.63,388.65,3.9,386.39-4.35,408.87,10.09,418ZM174,377.19c12-9.19,5.62-28.35-9.4-28.67a83.44,83.44,0,0,1-65.54-34.09,113,113,0,0,0,21.85-3.5c16.23-4.39,15.46-27.82-1-31.12a82.13,82.13,0,0,1-62.23-55.9,110.22,110.22,0,0,0,24.41,3.25c16.19.08,22.31-20.67,9.11-29.36C61.4,178.2,48.7,143.57,57.11,111a297.49,297.49,0,0,0,197.06,88c10.68.66,18.7-9.39,16.36-19.57-10.14-43.92,14.4-74.71,40.74-88.89,26.07-14.08,67.93-18.48,100,15.19,9.53,10,41.7,10.43,58.06,6.61-7.33,13.82-18.62,26.94-29.18,34.33a16,16,0,0,0-6.8,13.88c3.43,70.08-22.68,139.76-71.64,191.15C312.41,403.46,244.2,432,169.64,432a268.75,268.75,0,0,1-86.21-14.12A216,216,0,0,0,174,377.19Z" transform="translate(-2.65 -48.03)"></path></svg></a>
              <a href="#" class="linkedin"><svg style="width:22px" id="regular" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 511.83 512"><defs><style>.cls-1{fill:#fff;}</style></defs><title>linkedin</title><path class="cls-1" d="M396.59,512,496,512a16,16,0,0,0,16-16c-7.47-167.62,39.3-344.49-135.21-344.49-33.56,0-60.29,11.45-79.55,26.6,0-31.17-33.69-13.93-111.45-18.56a16,16,0,0,0-16,16c6.44,302.21-14.38,336.45,16,336.45h99.42c28.86,0,10.49-40.71,16-174.68,0-55.34,16-66.17,43.64-66.17,30.6,0,35.74,21.24,35.74,68.86C386.07,471.55,367.83,512,396.59,512ZM344.85,239.13c-95.8,0-75.64,105.34-75.64,240.85H201.79V191.53h63.45v27.69c0,15.36,23.4,22.91,31.55,7.47,10.5-19.93,37.76-43.2,80-43.2,75.24,0,103.21,37,103.21,136.45V480H412.59c0-152.41,16.12-240.87-67.74-240.87Z" transform="translate(-0.65)"></path><path class="cls-1" d="M23.94,159.55c-30.3,0-9.56,33.82-16,336.45a16,16,0,0,0,16,16h99.52c30.29,0,9.55-33.81,16-336.45C139.46,147.93,99.33,164.22,23.94,159.55ZM107.46,480H39.94V191.55h67.52Z" transform="translate(-0.65)"></path><path class="cls-1" d="M73.64,0c-97.62,0-97,147.82,0,147.82S171.37,0,73.64,0Zm0,115.82c-54.78,0-55.29-83.82,0-83.82S128.34,115.82,73.64,115.82Z" transform="translate(-0.65)"></path></svg></a>
            </div>
          </div>

        </div>
<div class="row">
  <div class="col-xl-12 text-center">
    <p class="footer-copy">© Copyright 2020 <span class="footer-blod"> COMPLAI</span>. All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp; Power by Sage Informatics Pvt Ltd.</p>
  </div>
</div>

      </div>
    </div>
  </footer><!-- End Footer -->
  <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>


  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script><nav class="mobile-nav d-lg-none">
        <ul>
          <li class="active"><a href="http://demo.codecomplai.com">Home</a></li>
                    <li><a href="http://demo.codecomplai.com/login">Login</a></li>
          <li><a href="http://demo.codecomplai.com/signup" class="get-started-btn scrollto">Sign Up</a></li>
                  </ul>
      </nav><div class="mobile-nav-overly"></div>




</body></html>