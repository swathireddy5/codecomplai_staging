<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>COMPLAI</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="" rel="icon">
  <link href="" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,500;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/asidestyle.css" rel="stylesheet">

</head>
<meta charset="UTF-8">
<style>

.node circle {
  fill: #fff;
  stroke: steelblue;
  stroke-width: 3px;
}

.node text {
  font: 8px sans-serif;
}

.link {
  fill: none;
  stroke: #FFFF00 !important;
  stroke-width: 2px;
}

</style>
<body>

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
       <!--    <div class="row justify-content-center">
              <form action="" method="post">
                <div class="main-search-icon-wrap">
                  <svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M15.8045 15.7908L11.2545 10.9565C12.1359 9.79983 12.6665 8.33004 12.6665 6.72923C12.6665 3.01902 9.82522 0.00012207 6.33325 0.00012207C2.84128 0.00012207 0 3.01899 0 6.7292C0 10.4394 2.84132 13.4583 6.33328 13.4583C7.83992 13.4583 9.22325 12.8945 10.3119 11.9581L14.8619 16.7924C14.9919 16.9305 15.1625 17 15.3332 17C15.5039 17 15.6745 16.9305 15.8045 16.7924C16.0652 16.5155 16.0652 16.0678 15.8045 15.7908ZM6.33328 12.0416C3.57597 12.0416 1.33333 9.65885 1.33333 6.7292C1.33333 3.79955 3.57597 1.41675 6.33328 1.41675C9.0906 1.41675 11.3332 3.79955 11.3332 6.7292C11.3332 9.65885 9.09057 12.0416 6.33328 12.0416Z" fill="black"></path>
                  </svg>
                </div>
                <input type="text" name="" placeholder="">
              </form>
          </div> -->
        </div>
      </div>

      <nav class="nav-menu d-none d-lg-block float-right">
        <ul>
          <li><a href="home">Home</a></li>
      <!--     <li><a href="#">Link one</a></li>
          <li><a href="#">Link two</a></li> -->
          <li><a href="login">Login</a></li>
        
      
           <li><a href="signup" class="get-started-btn scrollto">Sign Up</a></li>

        </ul>
      </nav><!-- .nav-menu -->

      

    </div>
  </header><!-- End Header -->

  <main id="main">
  
    <div class="page-wrapper chiller-theme toggled">
      <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fa fa-bars"></i>
      </a>
      <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
          <div class="sidebar-brand">
            <a href="#">MAIN</a>
            <div id="close-sidebar">
              <!-- <i class="fa fa-times"></i> -->
        <svg style="width: 25px;position: relative;left: 10px;" id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 33.02 23"><rect x="5.02" width="28" height="3"/><rect x="5.02" y="10" width="28" height="3"/><rect x="5.02" y="20" width="28" height="3"/><polygon points="4.11 13.92 3.92 8.92 0 11.08 4.11 13.92"/></svg>
            </div>
          </div>
        
          <!-- sidebar-search  -->
        
      
              
                <div class="sidebar-menu">
            <ul>
              
               <c:forEach var="book" items="${books}" varStatus="counter">
       
              <li class="sidebar-dropdown" id="${book.value}">
              
              
                                  <a href="javascript:show_bookgraph('${book.key}' , '${book.value}');     ">
                  <span><c:out value="${book.value}"/></span>
                </a>
         
              </li>
              </c:forEach>
              
           
            </ul>
          </div>
          <!-- sidebar-menu  -->
        </div>
      </nav>
      <!-- sidebar-wrapper  -->
    
      <main class="page-content">
        <div class="container-fluid">
          <div class="row white-bg mobile-padding">
          

          </div>


<div class="row">
  <div class="col-xl-9" >
 <!--  <div style="background-color: white" id="d3jsGraph">
  
  </div> -->
  
  <div class="row">
      <div class="col-xl-8">

        <div class="card" style="width: 800px;">
          <div class="card-header">
            <h3 class="card-title">
              Content:
            </h3>
            <div class="card-tools">
              <ul class="icons-list">
               <li>
                 <a href="#"><svg style="width:18px;" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 480 480" xml:space="preserve"> <g> <g> <path d="M472,160h-40v-56c0-4.418-3.582-8-8-8h-24V8c0-4.418-3.582-8-8-8H88c-4.418,0-8,3.582-8,8v88H56c-4.418,0-8,3.582-8,8v56 H8c-4.418,0-8,3.582-8,8v224c0,4.418,3.582,8,8,8h72v72c0,4.418,3.582,8,8,8h304c4.418,0,8-3.582,8-8v-72h72c4.418,0,8-3.582,8-8 V168C480,163.582,476.418,160,472,160z M400,112h16v48h-16V112z M96,16h288v144H96V16z M64,112h16v48H64V112z M80,352h-8v-24h8 V352z M384,464H96V328h288V464z M464,384h-64v-16h16c4.418,0,8-3.582,8-8v-40c0-4.418-3.582-8-8-8H64c-4.418,0-8,3.582-8,8v40 c0,4.418,3.582,8,8,8h16v16H16V176h448V384z M400,352v-24h8v24H400z"></path> </g> </g> <g> <g> <rect x="176" y="352" width="176" height="16"></rect> </g> </g> <g> <g> <rect x="128" y="384" width="224" height="16"></rect> </g> </g> <g> <g> <rect x="128" y="416" width="176" height="16"></rect> </g> </g> <g> <g> <rect x="128" y="352" width="32" height="16"></rect> </g> </g> <g> <g> <path d="M104,192H40c-4.418,0-8,3.582-8,8v32c0,4.418,3.582,8,8,8h64c4.418,0,8-3.582,8-8v-32C112,195.582,108.418,192,104,192z M96,224H48v-16h48V224z"></path> </g> </g> <g> <g> <rect x="128" y="224" width="80" height="16"></rect> </g> </g> <g> <g> <rect x="224" y="224" width="16" height="16"></rect> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg></a>
               </li>
               <li>
                <a href="#"><svg style="width:18px;" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" xml:space="preserve"> <g> <g> <path d="M485.743,85.333H26.257C11.815,85.333,0,97.148,0,111.589V400.41c0,14.44,11.815,26.257,26.257,26.257h459.487 c14.44,0,26.257-11.815,26.257-26.257V111.589C512,97.148,500.185,85.333,485.743,85.333z M475.89,105.024L271.104,258.626 c-3.682,2.802-9.334,4.555-15.105,4.529c-5.77,0.026-11.421-1.727-15.104-4.529L36.109,105.024H475.89z M366.5,268.761 l111.59,137.847c0.112,0.138,0.249,0.243,0.368,0.368H33.542c0.118-0.131,0.256-0.23,0.368-0.368L145.5,268.761 c3.419-4.227,2.771-10.424-1.464-13.851c-4.227-3.419-10.424-2.771-13.844,1.457l-110.5,136.501V117.332l209.394,157.046 c7.871,5.862,17.447,8.442,26.912,8.468c9.452-0.02,19.036-2.6,26.912-8.468l209.394-157.046v275.534L381.807,256.367 c-3.42-4.227-9.623-4.877-13.844-1.457C363.729,258.329,363.079,264.534,366.5,268.761z"></path> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg></a>
              </li>
              <li>
                <a href="#"><svg style="width:18px;" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 479.924 479.924" xml:space="preserve"> <g> <g> <path d="M396.791,147.784C381.287,78.867,312.85,35.568,243.933,51.072c-34.888,7.849-64.896,29.944-82.75,60.928h-1.192 c-50.189,0.125-93.158,36.006-102.232,85.368c-45.636,16.715-69.082,67.26-52.367,112.897 C18.089,344.931,51.073,367.987,87.991,368h96v-16h-96c-39.765-0.004-71.997-32.242-71.993-72.007 c0.003-31.748,20.8-59.746,51.193-68.921c3.003-0.915,5.193-3.503,5.6-6.616c5.841-43.714,43.097-76.38,87.2-76.456 c1.256,0,2.488,0.088,3.72,0.168l1.6,0.104c3.146,0.229,6.123-1.451,7.552-4.264c28.665-54.758,96.293-75.911,151.051-47.246 c30.533,15.983,51.998,45.143,58.189,79.046c0.575,3.189,3.017,5.716,6.184,6.4c51.8,11.305,84.627,62.462,73.322,114.262 C452,320.5,413.057,351.919,367.991,352h-72v16h72c61.856-0.037,111.97-50.211,111.933-112.067 C479.894,205.22,445.791,160.855,396.791,147.784z"></path> </g> </g> <g> <g> <path d="M268.271,384.4l-20.28,20.288V256h-16v148.688L211.703,384.4l-11.312,11.312l33.944,33.944 c3.124,3.123,8.188,3.123,11.312,0l33.936-33.944L268.271,384.4z"></path> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg></a>
              </li>
              <li>
                <a href="#"><svg style="width:18px;" viewBox="-21 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m389.332031 160c-44.09375 0-80-35.882812-80-80s35.90625-80 80-80c44.097657 0 80 35.882812 80 80s-35.902343 80-80 80zm0-128c-26.453125 0-48 21.523438-48 48s21.546875 48 48 48 48-21.523438 48-48-21.546875-48-48-48zm0 0"></path><path d="m389.332031 512c-44.09375 0-80-35.882812-80-80s35.90625-80 80-80c44.097657 0 80 35.882812 80 80s-35.902343 80-80 80zm0-128c-26.453125 0-48 21.523438-48 48s21.546875 48 48 48 48-21.523438 48-48-21.546875-48-48-48zm0 0"></path><path d="m80 336c-44.097656 0-80-35.882812-80-80s35.902344-80 80-80 80 35.882812 80 80-35.902344 80-80 80zm0-128c-26.453125 0-48 21.523438-48 48s21.546875 48 48 48 48-21.523438 48-48-21.546875-48-48-48zm0 0"></path><path d="m135.703125 240.425781c-5.570313 0-10.988281-2.902343-13.910156-8.0625-4.375-7.679687-1.707031-17.453125 5.972656-21.824219l197.953125-112.855468c7.65625-4.414063 17.449219-1.726563 21.800781 5.976562 4.375 7.679688 1.707031 17.449219-5.972656 21.824219l-197.953125 112.851563c-2.496094 1.40625-5.203125 2.089843-7.890625 2.089843zm0 0"></path><path d="m333.632812 416.425781c-2.6875 0-5.398437-.683593-7.894531-2.109375l-197.953125-112.855468c-7.679687-4.371094-10.34375-14.144532-5.972656-21.824219 4.351562-7.699219 14.125-10.367188 21.804688-5.972657l197.949218 112.851563c7.679688 4.375 10.347656 14.144531 5.976563 21.824219-2.945313 5.183594-8.363281 8.085937-13.910157 8.085937zm0 0"></path></svg></a>
              </li>
              </ul>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body" style="height: 820px; widht:800px; overflow: scroll;" >
           <p id="contentForSelectedSec"></p> 
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">
          
          </div>
        </div>
      </div>
      <div class="col-xl-4 p-0">
       
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              Graph
            </h3>
            <div class="card-tools">
              <ul class="icons-list">
               <li>
                 <a href="#">
                  <svg style="width:20px;" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" xml:space="preserve"> <g> <g> <g> <path d="M128,32V0H16C7.163,0,0,7.163,0,16v112h32V54.56L180.64,203.2l22.56-22.56L54.56,32H128z"></path> <path d="M496,0H384v32h73.44L308.8,180.64l22.56,22.56L480,54.56V128h32V16C512,7.163,504.837,0,496,0z"></path> <path d="M480,457.44L331.36,308.8l-22.56,22.56L457.44,480H384v32h112c8.837,0,16-7.163,16-16V384h-32V457.44z"></path> <path d="M180.64,308.64L32,457.44V384H0v112c0,8.837,7.163,16,16,16h112v-32H54.56L203.2,331.36L180.64,308.64z"></path> </g> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>                 </a>
               </li>
              </ul>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
             <div style="background-color: white;width:400px;height: 820px;overflow-x: scroll;overflow-y: scroll;" id="d3jsGraph">  
             
  </div>
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">
          
          </div>
        </div>
      </div>
    </div>
  
  
  
  
  
  </div>
<div class="col-xl-3 p-1">
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">
        Run Code
      </h3>
      <div class="card-tools">
        <ul class="icons-list">
         <li>
           <a href="#">
            <svg style="width: 20px;" id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32.98 23"><title>close-left-arrow</title><rect width="28" height="3"/><rect y="10" width="28" height="3"/><rect y="20" width="28" height="3"/><polygon points="29.08 8.94 28.92 13.94 32.98 12.06 29.08 8.94"/></svg>

           </a>
         </li>
        </ul>
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
      <div class="paragraph-custom-scroll-small">
      <!--   <p>
          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
          standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled  versions of
          Lorem Ipsum.
        </p>
        <img src="assets/images/clients-logo-3.png" class="img-fluid" alt="img"> -->
        <label for="projects">Select a Project:</label>
<select id="projects" name="projectlist">
  <option value="project1">Project 1</option>
  <option value="project2">Project 2</option>
  <option value="project3">Project 3</option>
  <option value="project4">Project 4</option>
</select>
<label for="description">Description:</label>
        <input type="text" name="description" style="width:140px;">
        <input type="checkbox" name="projectCheck" ><label for="projectCheck"> :Run the project against the selected node</label>
        <input type="submit" name="process" value="Process" style="margin-left:80px;">
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer clearfix">
    
    </div>
  </div>
</div>
</div>




          <!--Tabs view code here hidden-->
          <!-- <div class="row">
            <div class="col-xs-12 ">
              <nav>
                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><svg width="20" height="20" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M14.9999 0C8.8891 0 3.91779 4.97132 3.91779 11.0821C3.91779 13.0939 4.82 15.2575 4.85781 15.3488C5.14921 16.0404 5.72417 17.1147 6.13878 17.7445L13.7372 29.2575C14.0482 29.7295 14.5084 30 14.9999 30C15.4915 30 15.9517 29.7295 16.2626 29.2581L23.8617 17.7445C24.277 17.1147 24.8513 16.0404 25.1427 15.3488C25.1805 15.2581 26.0821 13.0945 26.0821 11.0821C26.0821 4.97132 21.1107 0 14.9999 0ZM23.9406 14.8429C23.6805 15.4628 23.1453 16.4622 22.7731 17.0267L15.174 28.5404C15.024 28.7679 14.9765 28.7679 14.8265 28.5404L7.22743 17.0267C6.8552 16.4622 6.32 15.4622 6.0599 14.8422C6.04882 14.8155 5.22157 12.824 5.22157 11.0821C5.22157 5.69035 9.60814 1.30378 14.9999 1.30378C20.3917 1.30378 24.7783 5.69035 24.7783 11.0821C24.7783 12.8266 23.9491 14.8233 23.9406 14.8429Z" fill="black"/> <path d="M14.9999 5.21573C11.7646 5.21573 9.1329 7.84806 9.1329 11.0827C9.1329 14.3174 11.7646 16.9498 14.9999 16.9498C18.2352 16.9498 20.8669 14.3174 20.8669 11.0827C20.8669 7.84806 18.2352 5.21573 14.9999 5.21573ZM14.9999 15.646C12.4843 15.646 10.4367 13.599 10.4367 11.0827C10.4367 8.56645 12.4843 6.51951 14.9999 6.51951C17.5156 6.51951 19.5631 8.56645 19.5631 11.0827C19.5631 13.599 17.5156 15.646 14.9999 15.646Z" fill="black"/> </svg>
                     Find your location</a>
                  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Building codes</a>
                  <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Land use & Plans</a>
                  <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">Projects</a>
                </div>
              </nav>
              <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                  Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                  Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                </div>
                <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                  Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                </div>
              </div>
            
            </div>
          </div> -->
          </div>
        </div>
      </main>

      <!-- page-content" -->
    </div>

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
              <a href="#" class="twitter"><svg style="width:22px;position: relative;top: 2px;" id="regular" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 506.68 415.97"><defs><style>.cls-1{fill:#fff;}</style></defs><title>twitter</title><path class="cls-1" d="M10.09,418a297.11,297.11,0,0,0,159.53,46c83.41,0,159.85-32,215.25-90.22,53-55.68,82.18-130.49,80.73-206.42,20.1-17.19,43.73-50,43.73-82a16,16,0,0,0-24.1-13.8c-18.88,11.09-36.1,14-53.81,9-36.16-35.24-90-42.66-135.33-18.21-39.64,21.33-61.68,60.37-59.7,103a265.1,265.1,0,0,1-172-93.93,16,16,0,0,0-26.16,2.13C17.49,109.16,17.71,150.4,35.78,183.7a16.66,16.66,0,0,0-13.91,16.58A112.85,112.85,0,0,0,61.18,285.5a16,16,0,0,0-4.09,16.58,114.82,114.82,0,0,0,65,69.63C89.26,387.39,53,392.62,20.63,388.65,3.9,386.39-4.35,408.87,10.09,418ZM174,377.19c12-9.19,5.62-28.35-9.4-28.67a83.44,83.44,0,0,1-65.54-34.09,113,113,0,0,0,21.85-3.5c16.23-4.39,15.46-27.82-1-31.12a82.13,82.13,0,0,1-62.23-55.9,110.22,110.22,0,0,0,24.41,3.25c16.19.08,22.31-20.67,9.11-29.36C61.4,178.2,48.7,143.57,57.11,111a297.49,297.49,0,0,0,197.06,88c10.68.66,18.7-9.39,16.36-19.57-10.14-43.92,14.4-74.71,40.74-88.89,26.07-14.08,67.93-18.48,100,15.19,9.53,10,41.7,10.43,58.06,6.61-7.33,13.82-18.62,26.94-29.18,34.33a16,16,0,0,0-6.8,13.88c3.43,70.08-22.68,139.76-71.64,191.15C312.41,403.46,244.2,432,169.64,432a268.75,268.75,0,0,1-86.21-14.12A216,216,0,0,0,174,377.19Z" transform="translate(-2.65 -48.03)"/></svg></a>
              <a href="#" class="linkedin"><svg style="width:22px" id="regular" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 511.83 512"><defs><style>.cls-1{fill:#fff;}</style></defs><title>linkedin</title><path class="cls-1" d="M396.59,512,496,512a16,16,0,0,0,16-16c-7.47-167.62,39.3-344.49-135.21-344.49-33.56,0-60.29,11.45-79.55,26.6,0-31.17-33.69-13.93-111.45-18.56a16,16,0,0,0-16,16c6.44,302.21-14.38,336.45,16,336.45h99.42c28.86,0,10.49-40.71,16-174.68,0-55.34,16-66.17,43.64-66.17,30.6,0,35.74,21.24,35.74,68.86C386.07,471.55,367.83,512,396.59,512ZM344.85,239.13c-95.8,0-75.64,105.34-75.64,240.85H201.79V191.53h63.45v27.69c0,15.36,23.4,22.91,31.55,7.47,10.5-19.93,37.76-43.2,80-43.2,75.24,0,103.21,37,103.21,136.45V480H412.59c0-152.41,16.12-240.87-67.74-240.87Z" transform="translate(-0.65)"/><path class="cls-1" d="M23.94,159.55c-30.3,0-9.56,33.82-16,336.45a16,16,0,0,0,16,16h99.52c30.29,0,9.55-33.81,16-336.45C139.46,147.93,99.33,164.22,23.94,159.55ZM107.46,480H39.94V191.55h67.52Z" transform="translate(-0.65)"/><path class="cls-1" d="M73.64,0c-97.62,0-97,147.82,0,147.82S171.37,0,73.64,0Zm0,115.82c-54.78,0-55.29-83.82,0-83.82S128.34,115.82,73.64,115.82Z" transform="translate(-0.65)"/></svg></a>
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
  <script src="assets/js/main.js"></script>

<script>

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


$(".sidebar-dropdown1 > a").click(function() {
	$(".sidebar-submenu1").slideUp(200);
	if (
	$(this)
	  .parent()
	  .hasClass("active")
	) {
	$(".sidebar-dropdown1").removeClass("active");
	$(this)
	  .parent()
	  .removeClass("active");
	} else {
	$(".sidebar-dropdown1").removeClass("active");
	$(this)
	  .next(".sidebar-submenu1")
	  .slideDown(200);
	$(this)
	  .parent()
	  .addClass("active");
	}
	});
	
$(".sidebar-dropdown2 > a").click(function() {
	$(".sidebar-submenu2").slideUp(200);
	if (
	$(this)
	  .parent()
	  .hasClass("active")
	) {
	$(".sidebar-dropdown2").removeClass("active");
	$(this)
	  .parent()
	  .removeClass("active");
	} else {
	$(".sidebar-dropdown2").removeClass("active");
	$(this)
	  .next(".sidebar-submenu2")
	  .slideDown(200);
	$(this)
	  .parent()
	  .addClass("active");
	}
	});
	
$(".sidebar-dropdown3 > a").click(function() {
	$(".sidebar-submenu3").slideUp(200);
	if (
	$(this)
	  .parent()
	  .hasClass("active")
	) {
	$(".sidebar-dropdown3").removeClass("active");
	$(this)
	  .parent()
	  .removeClass("active");
	} else {
	$(".sidebar-dropdown3").removeClass("active");
	$(this)
	  .next(".sidebar-submenu3")
	  .slideDown(200);
	$(this)
	  .parent()
	  .addClass("active");
	}
	});
	
	
$(".sidebar-dropdown4 > a").click(function() {
	$(".sidebar-submenu4").slideUp(200);
	if (
	$(this)
	  .parent()
	  .hasClass("active")
	) {
	$(".sidebar-dropdown4").removeClass("active");
	$(this)
	  .parent()
	  .removeClass("active");
	} else {
	$(".sidebar-dropdown4").removeClass("active");
	$(this)
	  .next(".sidebar-submenu4")
	  .slideDown(200);
	$(this)
	  .parent()
	  .addClass("active");
	}
	});
	
$(".sidebar-dropdown5 > a").click(function() {
	$(".sidebar-submenu5").slideUp(200);
	if (
	$(this)
	  .parent()
	  .hasClass("active")
	) {
	$(".sidebar-dropdown5").removeClass("active");
	$(this)
	  .parent()
	  .removeClass("active");
	} else {
	$(".sidebar-dropdown5").removeClass("active");
	$(this)
	  .next(".sidebar-submenu5")
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


function show_bookgraph(bookID, bookName){
	 
	URL = "/codecompilance/chaptersList";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
	data: { bookID: bookID, bookName: bookName},
		success : function(response){
			if(response != null && response !=""){
				data = JSON.parse(response);
			chapters = data['chaptersDetails'];
			graphData = data['graphDetails'];
			//content="User notes: About this chapter: Chapter 1 establishes the limits of applicability of the code and describes how the code is to be applied and enforced. Chapter 1 is in two parts: Part 1—Scope and Application  and Part 2—Administration and Enforcement . Section 101 identifies which buildings and structures come under its purview and references other I-Codes as applicable. Standards and codes are scoped to the extent referenced . This code is intended to be adopted as a legally enforceable document and it cannot be effective without adequate provisions for its administration and enforcement. The provisions of Chapter 1 establish the authority and duties of the code official appointed by the authority having jurisdiction and also establish the rights and privileges of the design professional, contractor and property owner. Chapter 1 is largely concerned with maintaining due process of law in enforcing the building performance criteria contained in the body of the code. Code development reminder: Code change proposals to this chapter will be considered by the Administrative Code Development Committee during the 2019  Code Development Cycle";
			//$('#contentForSelectedSec').text(content);
			$("#"+bookName).append("<div class='sidebar-submenu' style='display:block;'><ul></ul></div>");
			for (var item in chapters) {
	            chapterID = chapters[item].chapterID;
	            chapterName = chapters[item].chapterName;  
	            chapterDivID =chapterID.substring(chapterID.lastIndexOf("/")+1,chapterID.length);
hcode = '<li class="sidebar-dropdown1" id='+chapterDivID+'><a href="javascript:show_subchaptergraph(\''+chapterDivID+'\',\''+chapterID+'\',\''+chapterName+'\');">'+chapterName +'</a></li>';
	           $("#"+bookName+" div ul").append(hcode);
	        //    console.log(chapters[item].chapterID);console.log(chapters[item].chapterName);
	        }
		//	treeData = JSON.parse(graphData);
			treeData = graphData
			root = d3.hierarchy(treeData, function(d) { return d.children; });
			root.x0 = height / 2;
			root.y0 = 0;
			// Collapse after the second level
			root.children.forEach(collapse);

			update(root); 
			
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
});
	
	}
	
	function show_subchaptergraph(chapterDivID, chapterID, chapterName){
	//	alert(chapterID+chapterName+chapterDivID);
		
		
		URL = "/codecompilance/subchaptersList";
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
		data: { chapterID: chapterID, chapterName: chapterName},
			success : function(response){
				if(response != null && response !=""){
					data = JSON.parse(response);
				subchapters = data['subChaptersDetails'];
				graphData = data['graphDetails'];
				content = data['content']
			//	$("#contentForSelectedSec").append("<p>"+content+"</p>");
				$('#contentForSelectedSec').html(content);
				$("#"+chapterDivID).append("<div class='sidebar-submenu1' style='display:block;'><ul></ul></div>");
				for (var item in subchapters) {
		            subChapterID = subchapters[item].subChapterID;
		            subChapterName = subchapters[item].subChapterName;
		            subChapterDivID = subChapterID.substring(subChapterID.lastIndexOf("/")+1,subChapterID.length);
		            hcode = '<li class="sidebar-dropdown2" id='+subChapterDivID+'><a href="javascript:show_subchaptersecgraph(\''+subChapterDivID+'\',\''+subChapterID+'\',\''+subChapterName+'\');">'+subChapterName +'</a></li>';
			           $("#"+chapterDivID+" div ul").append(hcode);
		        }
				treeData = graphData;
				root = d3.hierarchy(treeData, function(d) { return d.children; });
				root.x0 = height / 2;
				root.y0 = 0;
				// Collapse after the second level
				root.children.forEach(collapse);

				update(root);  
				
				
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
	}
	
	
	function show_subchaptersecgraph(subChapterDivID, subChapterID, subChapterName){
		
		
		URL = "/codecompilance/subChapterSecsList";
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
		data: { subChapterID: subChapterID, subChapterName: subChapterName},
			success : function(response){
				if(response != null && response !=""){
				data = JSON.parse(response);
				subchaptersecs = data['subChapterSecsDetails'];
				graphData = data['graphDetails'];
				content = data['content']
				$('#contentForSelectedSec').html(content);
				$("#"+subChapterDivID).append("<div class='sidebar-submenu2' style='display:block;'><ul></ul></div>");
				for (var item in subchaptersecs) {
					subChapterSecID = subchaptersecs[item].subChpSecID;
					subChapterSecName = subchaptersecs[item].subChpSecName;
		            subChapterSecDivID = subChapterSecID.substring(subChapterSecID.lastIndexOf("/")+1,subChapterSecID.length);
		            hcode = '<li class="sidebar-dropdown3" id='+subChapterSecDivID+'><a href="javascript:show_subchaptersecsubsecgraph(\''+subChapterSecDivID+'\',\''+subChapterSecID+'\',\''+subChapterSecName+'\');">'+subChapterSecName +'</a></li>';
			           $("#"+subChapterDivID+" div ul").append(hcode);
		        }
				
				treeData = graphData;
				root = d3.hierarchy(treeData, function(d) { return d.children; });
				root.x0 = height / 2;
				root.y0 = 0;
				// Collapse after the second level
				root.children.forEach(collapse);

				update(root);  
				
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
	}
	function show_subchaptersecsubsecgraph(subChapterSecDivID, subChapterSecID, subChapterSecName){
	//	alert(subChapterSecID+subChapterSecName+subChapterSecDivID);
		URL = "/codecompilance/subChapterSecSubSecsList";
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
		data: { subChapterSecID: subChapterSecID, subChapterSecName: subChapterSecName},
			success : function(response){
				if(response != null && response !=""){
					data = JSON.parse(response);
					subchaptersecsubsecs = data['subChapterSecSubSecsDetails'];
					graphData = data['graphDetails'];
					content = data['content']
					$('#contentForSelectedSec').html(content);
				$("#"+subChapterSecDivID).append("<div class='sidebar-submenu3' style='display:block;'><ul></ul></div>");
				for (var item in subchaptersecsubsecs) {
					subChpSecSubSecID = subchaptersecsubsecs[item].subChpSecSubSecID;
					subChpSecSubSecName = subchaptersecsubsecs[item].subChpSecSubSecName;
		            subChapterSecSubSecDivID = subChpSecSubSecID.substring(subChpSecSubSecID.lastIndexOf("/")+1,subChpSecSubSecID.length);
		            subChapterSecSubSecDivID = subChapterSecSubSecDivID.replace('.','_');
		            hcode = '<li class="sidebar-dropdown4" id='+subChapterSecSubSecDivID+'><a href="javascript:show_subchaptersecsubsubsecgraph(\''+subChapterSecSubSecDivID+'\',\''+subChpSecSubSecID+'\',\''+subChpSecSubSecName+'\');">'+subChpSecSubSecName +'</a></li>';
			           $("#"+subChapterSecDivID+" div ul").append(hcode);
		        }
				
				treeData = graphData;
				root = d3.hierarchy(treeData, function(d) { return d.children; });
				root.x0 = height / 2;
				root.y0 = 0;
				// Collapse after the second level
				root.children.forEach(collapse);

				update(root);  
				
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
	}
	
	function show_subchaptersecsubsubsecgraph(subChapterSecSubSecDivID, subChapterSecSubSecID, subChapterSecSubSecName){
	//	alert(subChapterSecSubSecDivID+subChapterSecSubSecID+subChapterSecSubSecName);
		URL = "/codecompilance/subChapterSecSubSubSecsList";
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
		data: { subChapterSecSubSecID: subChapterSecSubSecID, subChapterSecSubSecName: subChapterSecSubSecName},
			success : function(response){
				if(response != null && response !=""){
					data = JSON.parse(response);
					subchaptersecsubsubsecs = data['subChapterSecSubSubSecsDetails'];
					graphData = data['graphDetails'];
					content = data['content']
					$('#contentForSelectedSec').html(content);
				$("#"+subChapterSecSubSecDivID).append("<div class='sidebar-submenu4' style='display:block;'><ul></ul></div>");
				for (var item in subchaptersecsubsubsecs) {
					subChpSecSubSubSecID = subchaptersecsubsubsecs[item].subChpSecSubSubSecID;
					subChpSecSubSubSecName = subchaptersecsubsubsecs[item].subChpSecSubSubSecName;
		            subChapterSecSubSubSecDivID = subChpSecSubSubSecID.substring(subChpSecSubSubSecID.lastIndexOf("/")+1,subChpSecSubSubSecID.length);
		            subChapterSecSubSubSecDivID = subChapterSecSubSubSecDivID.replace('.','_');
		            hcode = '<li class="sidebar-dropdown5" id='+subChapterSecSubSubSecDivID+'><a href="javascript:show_subchaptersecsubsubsubsecgraph(\''+subChapterSecSubSubSecDivID+'\',\''+subChpSecSubSubSecID+'\',\''+subChpSecSubSubSecName+'\');">'+subChpSecSubSubSecName +'</a></li>';
			           $("#"+subChapterSecSubSecDivID+" div ul").append(hcode);
		        }
				treeData = graphData;
				root = d3.hierarchy(treeData, function(d) { return d.children; });
				root.x0 = height / 2;
				root.y0 = 0;
				// Collapse after the second level
				root.children.forEach(collapse);

				update(root);  
				
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
	}
	
	function show_subchaptersecsubsubsubsecgraph(subChapterSecSubSubSecDivID, subChapterSecSubSubSecID, subChapterSecSubSubSecName){
	//	alert(subChapterSecSubSubSecID+subChapterSecSubSubSecName+subChapterSecSubSubSecDivID);
		URL = "/codecompilance/subChapterSecSubSubSubSecsList";
		$.ajax({
			type: "POST",
			 async: false,  
			url : URL,
		data: { subChapterSecSubSubSecID: subChapterSecSubSubSecID, subChapterSecSubSubSecName: subChapterSecSubSubSecName},
			success : function(response){
				if(response != null && response !=""){
					data = JSON.parse(response);
					subchaptersecsubsubsubsecs = data['subChapterSecSubSubSubSecsDetails'];
					graphData = data['graphDetails'];
				$("#"+subChapterSecSubSubSecDivID).append("<div class='sidebar-submenu5' style='display:block;'><ul></ul></div>");
				for (var item in subchaptersecsubsubsubsecs) {
					//subChpSecSubSubSubSecID = subchaptersecsubsubsubsecs[item].subChpSecSubSubSubSecID;
					subChpSecSubSubSubSecName = subchaptersecsubsubsubsecs[item].subChpSecSubSubSubSecName;
		           // subChapterSecSubSubSubSecDivID = subChpSecSubSubSubSecID.substring(subChpSecSubSubSubSecID.lastIndexOf("/")+1,subChpSecSubSubSubSecID.length);
		           // subChapterSecSubSubSubSecDivID = subChapterSecSubSubSubSecDivID.replace('.','_');
		            hcode = '<li class="sidebar-dropdown6" id='+subChapterSecSubSubSubSecDivID+'><a href="#">'+subChpSecSubSubSubSecName +'</a></li>';
			           $("#"+subChapterSecSubSubSecDivID+" div ul").append(hcode);
		        }
				treeData = graphData;
				root = d3.hierarchy(treeData, function(d) { return d.children; });
				root.x0 = height / 2;
				root.y0 = 0;
				// Collapse after the second level
				root.children.forEach(collapse);

				update(root);  
				}
														
		},
		 error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.status + ' ' + jqXHR.responseText);
	        }
	    
	}); 
	}
function show_selectedchaptergraph(chapterId){
	
/*	URL = "/codecompilance/selectedChapterDetails";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
	data: { chapterId: chapterId},
		success : function(data){
			treeData = JSON.parse(data);
			root = d3.hierarchy(treeData, function(d) {
				dataChildren = d.children;
				return dataChildren;
				
			});
			root.x0 = height / 2;
			root.y0 = 0;
			// Collapse after the second level
			root.children.forEach(collapse);

			update(root);
			
			
	
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); */
}


</script>
<script charset="utf-8" type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
<script src="assets/js/code.js">

</script>






</body>

</html>