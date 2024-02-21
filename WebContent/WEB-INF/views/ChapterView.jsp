<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="utf-8" />
        <title>Chapter View</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App favicon 
        <link rel="shortcut icon" href="assets/images/favicon.ico">
-->
        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		<!--  Include jQuery core into head section if not already present -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script src="https://visjs.github.io/vis-network/standalone/umd/vis-network.min.js"></script>
		<style>
		



/*CSS*/
html { scroll-behavior: smooth; } 

		#app {
  width: 100%;
  height: 83vh;

  font-family: Arial, Helvetica, sans-serif;
}

.resizable-x,
.resizable-y {
  display: flex;
  overflow: hidden;
}

.resizable-x {
  height: 100%;
}

.resizable-y {
  flex-direction: column;
}

.resizer-x,
.resizer-y {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  background: black;
  padding: 0px;
}

.resizer-x {
  z-index: 2;
  cursor: col-resize;
}
.resizer-x::before,
.resizer-x::after {
  content: "";
  width: 2px;
  height: 16px;
  margin: 2px;
  background: lightgray;
}

.resizer-y {
  z-index: 1;
  cursor: row-resize;
  flex-direction: column;
}
.resizer-y::before,
.resizer-y::after {
  content: "";
  width: 16px;
  height: 2px;
  margin: 2px;
  background: lightgray;
}

.div0,
.div1,
.div2 {
  overflow: auto;
		padding:0 2%;
}

.div0 {
 
	
}

.div1 {

}

.div2 {


}

.div0 p,
.div1 p,
.div2 p {
 
}
			
			
			.carda {
  margin: 1em;
  
}

.subheader {
 
}
a {
    color: #242424;
    text-decoration: none;
}
a:hover {
    color: #fea009;
    text-decoration: underline;
}
			.accordion-button:not(.collapsed) {
    color: #000000;
    background-color: #ececec;
    -webkit-box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
}
	
		
	body[data-sidebar=dark].vertical-collpsed {
    min-height: unset;
}	
		
	#accordian {
	
		
		
		color: white;
		
}

#accordian h3 {
		
}

#accordian h3 a {
		padding: 0 10px;
		font-size: 13px;
		line-height: 34px;
		display: block;
		color: #000;
		text-decoration: none;
	background: #eeeeee36;
}

#accordian h3:hover {
		
}

i {
		
}

#accordian li {
		list-style-type: none;
}
			
#accordian ol, ul{
	
	    padding-left: 1rem;
			}

#accordian ul ul li a,
#accordian h4 {
		color: #000;
		text-decoration: none;
		font-size: 13px;
		line-height: 27px;
		display: block;
		padding: 0 5px;
		transition: all 0.15s;
		position: relative;
	background: #eeeeee1f;
    margin: 2px;
}

#accordian ul ul li a:hover {
		
		background: #eeeeee4f;
}

#accordian ul ul {
		display: none;
}

#accordian li.active>ul {
		display: block;
}

#accordian ul ul ul {
		margin-left: 5px;
		border-left: 1px dotted rgba(0, 0, 0, 0.5);
}

#accordian a:not(:only-child):after {
		/*content: "\f0415";*/
		font: normal normal normal 24px/1 "Material Design Icons";
		position: absolute;
		right: 10px;
		top: 4px;
		font-size: 20px;
}

#accordian .active>a:not(:only-child):after {
		/*content: "\f0374";*/
	
}	
	
/*
html,
body {
  font: 10pt arial;
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
}
*/
#mynetwork {
  width: 100%;
  height: 100%;
}

#myDiv0.fullscreen{
    z-index: 9999; 
    width: 100%; 
    height: 100%; 
    position: fixed; 
    top: 0; 
    left: 0; 
 }
#myDiv0{background:#eff2f7;}

#myDiv.fullscreen{
    z-index: 9999; 
    width: 100%; 
    height: 100%; 
    position: fixed; 
    top: 0; 
    left: 0; 
 }
#myDiv{background:#FFFFFF;}

#myDiv2.fullscreen{
    z-index: 9999; 
    width: 100%; 
    height: 100%; 
    position: fixed; 
    top: 0; 
    left: 0; 
 }
#myDiv2{background:#FFFFFF;}
	</style>

    </head>

    <body data-sidebar="dark" class="sidebar-enable">
    
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">
        <input type="hidden" id='siteurl' name="siteurl" value="${siteurl}"/>
        
            <%@include file="header.jsp" %>

                

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content m-0">
			
                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
							
							<div id="app" class="p-0 m-0">
	
								  <div class="resizable-x">
								<div class="col-3 hidden-md-down" style="overflow: auto; background: linear-gradient(180deg, #febd12, #ff8300);">
								
									
									<div class="card-body">
										
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                 <i class="ri-apps-2-line"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end" style="">
                                                <a href="codes?statename=${selectedState}" class="dropdown-item"><i class=" ri-building-2-line"></i> Code Books</a>
                                                <!-- item-->
                                                <c:if test="${username != null}">
                                                	<a href="viewBookmarks?userId=${userId}" class="dropdown-item"><i class="ri-bookmark-3-line"></i> Bookmarks</a>
                                                	<a href="viewComments?userId=${userId}" class="dropdown-item"><i class="ri-chat-1-line"></i> Comments</a>
                                                    <a href="viewProjects" class="dropdown-item"><i class="ri-dashboard-line"></i> Projects</a>
                                                </c:if>
                                                <c:if test="${username == null}">
                                                	<a href="login" class="dropdown-item"><i class=" ri-user-settings-line"></i> Login</a>
                                                </c:if>
                                                
                                            </div>
                                        </div>									
					<div id="accordian">
						<div class="chat-leftsidebar-nav">
							<h5 class="card-title mb-4 font-size-14">${selectedBookTitle}</h5>
						</div>
						<div id ="chapterList">
						
						 	<c:out value="${chapterList}" escapeXml="false"/>
						 	
						 
						 	
							<%--
							<c:set var="chapterID" value="0"/>
							<c:set var="samechapter" value="0"/>
							<c:forEach begin="0" end="${chapterListAsJson.length() -1}" var="i">
								<c:choose>
									<c:when test="${chapterID eq 0}">
										<li id="${chapterListAsJson.getJSONObject(i).get('chapterid')}" class="active"> 
									</c:when>    
									<c:otherwise>
										<li id="${chapterListAsJson.getJSONObject(i).get('chapterid')}"> 
									</c:otherwise>
								</c:choose>
								
								<c:if test="${chapterID eq chapterListAsJson.getJSONObject(i).get('chapterid')}">
									<c:set var="samechapter" value="1"/>
								</c:if>
								
								<c:choose>
									<c:when test="${samechapter eq 0}">
										<li id="${chapterListAsJson.getJSONObject(i).get('chapterid')}" class="active">
										<h3><a href="#">${chapterListAsJson.getJSONObject(i).get('chapter_title')}</a></h3>
										<ul> 
											<li><a href="#'${chapterListAsJson.getJSONObject(i).get('subchapterid')}'">${chapterListAsJson.getJSONObject(i).get('subchapter_title')}</a></li>
										</ul>
									</c:when>    
									<c:otherwise>
										<li><a href="#'${chapterListAsJson.getJSONObject(i).get('subchapterid')}'">${chapterListAsJson.getJSONObject(i).get('subchapter_title')}</a></li> 
									</c:otherwise>
								</c:choose>   
								<c:set var="chapterID" value="${chapterListAsJson.getJSONObject(i).get('chapterid')}" />
								
							</c:forEach> --%>
						</ul>
					</div>
							
					</div>
             	</div>
			</div>
                                    
									<div class="div0" id ="myDiv0" style="flex: 50%;">
									<p><button onclick="toggleDiv('div0')" id="div0" >Full Screen</button></p>
									
									
									<div tabindex="-1" id ="bookmarkDiv" class="col-md-12 col-12 mb-4">
                                        <h5 class="font-size-18 mb-1"><c:out value="${bookmarkstatus}"/></h5>
                                    </div>
                                    
                                    
                      
									<c:set var="tmpChapterID" value="0" scope="page" />
									<c:set var="subChapterSecID" value="0" scope="page" />
									<c:set var="subChapterSecSubSecID" value="0" scope="page" />
										<c:forEach begin="0" end="${resultSetAsJson.length() -1}" var="i">
										<div class="col-sm-12 col-lg-12">
	                                    <div class="card">
										<c:choose>
										<c:when  test="${tmpChapterID != resultSetAsJson.getJSONObject(i).get('chapterid')}">
									    	<div class="card-body" id = "${resultSetAsJson.getJSONObject(i).get('subchapter_id')}">
											   <h4 class="card-title"><c:out value="${resultSetAsJson.getJSONObject(i).get('subchapter_title')}"/></h4> 
												<h3 class="card-title">   <span style="word-break: break-all;white-space: normal;"><c:out value="${resultSetAsJson.getJSONObject(i).get('subchaptersection_title')}" escapeXml="false"/> </span></h3>
												 <p class="card-text">
									 				<!-- Loading the content here. one -->
									 				<span style="word-break: break-all;white-space: normal;">
									 				<c:if test="${resultSetAsJson.getJSONObject(i).get('subchaptersubsubsection_content') != null}">
									 					<c:out value="${resultSetAsJson.getJSONObject(i).get('subchaptersubsubsection_content')}" escapeXml="false"/>
									 				</c:if>
									 				</span>
	                                            </p>
	                                            <ul class="list-inline product-review-link"><li class="list-inline-item"></li>
                                                <!-- <li class="list-inline-item">
                                                    <a href="#" title="Graph" onclick="getGraphData('${chapter.bookId}' , '${chapter.subChapterId }', '${chapter.subChapterSecSubSecId }')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-family-tree me-1"></i> Graph</a>
                                                </li> -->
                                                <li class="list-inline-item">
                                                    <a href="#" title="Graph" onclick="getGraphDataForMultiBook(${resultSetAsJson.getJSONObject(i).get('stateid')}, '${resultSetAsJson.getJSONObject(i).get('bookid')}', ${resultSetAsJson.getJSONObject(i).get('chapterid')}, '${resultSetAsJson.getJSONObject(i).get('subchapter_id')}')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-family-tree me-1"></i> Graph</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" title="Print" onclick="printDiv('${resultSetAsJson.getJSONObject(i).get('subchapter_id')}')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-printer me-1"></i> Print</a>
                                                </li>
                                                <c:if test="${username != null}">
                                                	<li class="list-inline-item">
                                                    <a href="#" title="Comment" data-bs-toggle="modal" data-bs-target="#Add_Comment" title="Add Comment" onclick="addComment(${resultSetAsJson.getJSONObject(i).get('stateid')}, ${resultSetAsJson.getJSONObject(i).get('bookid')}, ${resultSetAsJson.getJSONObject(i).get('chapterid')}, ${resultSetAsJson.getJSONObject(i).get('subchapter_id')}, ${resultSetAsJson.getJSONObject(i).get('subchaptersecid')}, ${resultSetAsJson.getJSONObject(i).get('sbchpsecsubsecid')})" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-comment me-1"></i> Comment</a>
	                                                </li>
	                                                <li class="list-inline-item">
	                                                    <a href="#" title="Bookmark" onclick="addBookmark(${resultSetAsJson.getJSONObject(i).get('stateid')}, ${resultSetAsJson.getJSONObject(i).get('bookid')}, ${resultSetAsJson.getJSONObject(i).get('chapterid')}, ${resultSetAsJson.getJSONObject(i).get('subchapter_id')}, ${resultSetAsJson.getJSONObject(i).get('subchaptersecid')}, ${resultSetAsJson.getJSONObject(i).get('sbchpsecsubsecid')}, 'bookmark','')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-bookmark me-1"></i>Bookmark</a>
	                                                </li>
                                                </c:if>
                                            </ul><br/>
	                                            
									   		${tmpChapterID = resultSetAsJson.getJSONObject(i).get('chapterid')}
									   		${subChapterSecID = resultSetAsJson.getJSONObject(i).get('subchaptersecid')}
									  		</div>
									  		
									  </c:when>
                                      <c:otherwise>
										 <div class="card-body" id="${resultSetAsJson.getJSONObject(i).get('subchapter_id')}">
										 	<c:if test="${subChapterSecID != resultSetAsJson.getJSONObject(i).get('subchaptersecid')}">
												${subChapterSecID = resultSetAsJson.getJSONObject(i).get('subchaptersecid')}
													 <h4 class="card-title">	<span style="word-break: break-all;white-space: normal;"><c:out value="${resultSetAsJson.getJSONObject(i).get('subchaptersection_title')}" escapeXml="false"/> </span></h4>
											</c:if>												   
												 <p class="card-text">	                                          		
													<!-- Loading the content here. two-->
									 				<span style="word-break: break-all;white-space: normal;">
									 				<c:if test="${resultSetAsJson.getJSONObject(i).get('subchaptersubsubsection_content') != null}">
									 					<c:out value="${resultSetAsJson.getJSONObject(i).get('subchaptersubsubsection_content')}" escapeXml="false"/>
									 				</c:if> 
									 				</span>
	                                            </p>
	                                            <ul class="list-inline product-review-link"><li class="list-inline-item"></li>
                                                <!-- <li class="list-inline-item">
                                                    <a href="#" title="Graph" onclick="getGraphData('${chapter.bookId}' , '${chapter.subChapterId }', '${chapter.subChapterSecSubSecId }')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-family-tree me-1"></i> Graph</a>
                                                </li> -->
                                                <li class="list-inline-item">
                                                    <a href="#" title="Graph" onclick="getGraphDataForMultiBook(${resultSetAsJson.getJSONObject(i).get('stateid')}, '${resultSetAsJson.getJSONObject(i).get('bookid')}' ,${resultSetAsJson.getJSONObject(i).get('chapterid')}, '${resultSetAsJson.getJSONObject(i).get('subchapter_id')}')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-family-tree me-1"></i> Graph</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" title="Print" onclick="printDiv('${resultSetAsJson.getJSONObject(i).get('subchapter_id')}')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-printer me-1"></i> Print</a>
                                                </li>
                                                <c:if test="${username != null}">
                                                	<li class="list-inline-item">
                                                    <a href="#" title="Comment" data-bs-toggle="modal" data-bs-target="#Add_Comment" title="Add Comment" onclick="addComment(${resultSetAsJson.getJSONObject(i).get('stateid')}, ${resultSetAsJson.getJSONObject(i).get('bookid')}, ${resultSetAsJson.getJSONObject(i).get('chapterid')}, ${resultSetAsJson.getJSONObject(i).get('subchapter_id')}, ${resultSetAsJson.getJSONObject(i).get('subchaptersecid')}, ${resultSetAsJson.getJSONObject(i).get('sbchpsecsubsecid')})" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-comment me-1"></i> Comment</a>
	                                                </li>
	                                                <li class="list-inline-item">
	                                                    <a href="#" title="Bookmark" onclick="addBookmark(${resultSetAsJson.getJSONObject(i).get('stateid')}, ${resultSetAsJson.getJSONObject(i).get('bookid')}, ${resultSetAsJson.getJSONObject(i).get('chapterid')}, ${resultSetAsJson.getJSONObject(i).get('subchapter_id')}, ${resultSetAsJson.getJSONObject(i).get('subchaptersecid')}, ${resultSetAsJson.getJSONObject(i).get('sbchpsecsubsecid')}, 'bookmark','')" class="btn btn-light btn-sm waves-effect waves-light"><i class="mdi mdi-bookmark me-1"></i>Bookmark</a>
	                                                </li>
                                                </c:if>
                                            </ul><br/>
	                                            
										  </div>
										  
										</c:otherwise>
										</c:choose>									     
                 							
											</div>
                                            </div>
									</c:forEach>
									
									
                                  
									</div>
									
									<div class="resizer-x"></div>
									<div id ="myDiv1" class="resizable-y" style="flex: 50%;">
									  <div class="div1" id ="myDiv" >
										<p><button onclick="toggleDiv('div1')" id="div1" >Full Screen</button></p>
										<!-- commenting new graph to use old graph code -->
										<div id="mynetwork">
										<div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    		<h4 class="mb-sm-0">Graph will load here</h4>
										</div>
									</div>
									  </div>
									  <div class="resizer-y"></div>
									  <div class="div2"id = "myDiv2" style="flex: 50%;">
										<p><button  onclick="toggleDiv('div2')" id="div2" >Full Screen</button></p>
									  </div>
									</div>
								  </div>
								</div>
                        </div>
                        <!-- end page title -->
				 <!-- 	<div class="row">

                        </div> -->
        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->
                
                 <footer class="footer" style="left: 0;">
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



<!--  Modal code - start -->
<div class="modal fade" id="Add_Comment" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="Add_CommentLabel">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">        
        <div class="modal-body">
	<form method="get" action="#">
	  <!-- 
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	  </div>
	   -->
	   <div class="form-group">
	   		<input type="hidden" id='stateid' name="stateid"/>
			<input type="hidden" id='bookId' name="bookId"/>
			<input type="hidden" id='chapterId' name="chapterId"/>
			<input type="hidden" id='subChapterId' name="subChapterId"/>
			<input type="hidden" id='subChapterSecId' name="subChapterSecId"/>
			<input type="hidden" id='subChapterSecSubSecId' name="subChapterSecSubSecId"/>
			<input type="hidden" id='actionType' name="actionType" value="comment"/>
		</div>
	    <div class="form-group">
		  	<label for="exampleInputPassword1">Add Comment</label>
		    <textarea type="text" class="form-control" name="comments" id="comments" placeholder="comment"></textarea>
	    </div><br/>
	    <div class="form-group">
			<button type="submit" class="btn btn-primary" onclick="submitComment();">Submit</button>
			<button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">Close</button>
		</div>
	</form>
        </div>        
      </div>      
    </div>
  </div>
<!--  Modal code - start -->

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <script src="assets/js/app.js"></script>
		<script type="text/javascript">

		(function () {
  "use strict";

  // horizontal direction
  (function resizableX() {
    const resizer = document.querySelector(".resizer-x");
    resizer.addEventListener("mousedown", onmousedown);
    resizer.addEventListener("touchstart", ontouchstart);

    // for mobile
    function ontouchstart(e) {
      e.preventDefault();
      resizer.addEventListener("touchmove", ontouchmove);
      resizer.addEventListener("touchend", ontouchend);
    }
    function ontouchmove(e) {
      e.preventDefault();
      const clientX = e.touches[0].clientX;
      const deltaX = clientX - (resizer._clientX || clientX);
      resizer._clientX = clientX;
      const l = resizer.previousElementSibling;
      const r = resizer.nextElementSibling;
      // LEFT
      if (deltaX < 0) {
        const w = Math.round(parseInt(getComputedStyle(l).width) + deltaX);
        l.style.flex = `0 ${w < 10 ? 0 : w}px`;
        r.style.flex = "1 0";
      }
      // RIGHT
      if (deltaX > 0) {
        const w = Math.round(parseInt(getComputedStyle(r).width) - deltaX);
        r.style.flex = `0 ${w < 10 ? 0 : w}px`;
        l.style.flex = "1 0";
      }
    }
    function ontouchend(e) {
      e.preventDefault();
      resizer.removeEventListener("touchmove", ontouchmove);
      resizer.removeEventListener("touchend", ontouchend);
      delete e._clientX;
    }

    // for desktop
    function onmousedown(e) {
      e.preventDefault();
      document.addEventListener("mousemove", onmousemove);
      document.addEventListener("mouseup", onmouseup);
    }
    function onmousemove(e) {
      e.preventDefault();
      const clientX = e.clientX;
      const deltaX = clientX - (resizer._clientX || clientX);
      resizer._clientX = clientX;
      const l = resizer.previousElementSibling;
      const r = resizer.nextElementSibling;
      // LEFT
      if (deltaX < 0) {
        const w = Math.round(parseInt(getComputedStyle(l).width) + deltaX);
        l.style.flex = `0 ${w < 10 ? 0 : w}px`;
        r.style.flex = "1 0";
      }
      // RIGHT
      if (deltaX > 0) {
        const w = Math.round(parseInt(getComputedStyle(r).width) - deltaX);
        r.style.flex = `0 ${w < 10 ? 0 : w}px`;
        l.style.flex = "1 0";
      }
    }
    function onmouseup(e) {
      e.preventDefault();
      document.removeEventListener("mousemove", onmousemove);
      document.removeEventListener("mouseup", onmouseup);
      delete e._clientX;
    }
  })();

  // vertical direction
  (function resizableY() {
    const resizer = document.querySelector(".resizer-y");
    resizer.addEventListener("mousedown", onmousedown);
    resizer.addEventListener("touchstart", ontouchstart);

    // for mobile
    function ontouchstart(e) {
      e.preventDefault();
      resizer.addEventListener("touchmove", ontouchmove);
      resizer.addEventListener("touchend", ontouchend);
    }
    function ontouchmove(e) {
      e.preventDefault();
      const clientY = e.touches[0].clientY;
      const deltaY = clientY - (resizer._clientY || clientY);
      resizer._clientY = clientY;
      const t = resizer.previousElementSibling;
      const b = resizer.nextElementSibling;
      // UP
      if (deltaY < 0) {
        const h = Math.round(parseInt(getComputedStyle(t).height) + deltaY);
        t.style.flex = `0 ${h < 10 ? 0 : h}px`;
        b.style.flex = "1 0";
      }
      // DOWN
      if (deltaY > 0) {
        const h = Math.round(parseInt(getComputedStyle(b).height) - deltaY);
        b.style.flex = `0 ${h < 10 ? 0 : h}px`;
        t.style.flex = "1 0";
      }
    }
    function ontouchend(e) {
      e.preventDefault();
      resizer.removeEventListener("touchmove", ontouchmove);
      resizer.removeEventListener("touchend", ontouchend);
      delete e._clientY;
    }

    // for desktop
    function onmousedown(e) {
      e.preventDefault();
      document.addEventListener("mousemove", onmousemove);
      document.addEventListener("mouseup", onmouseup);
    }
    function onmousemove(e) {
      e.preventDefault();
      const clientY = e.clientY;
      const deltaY = clientY - (resizer._clientY || clientY);
      resizer._clientY = clientY;
      const t = resizer.previousElementSibling;
      const b = resizer.nextElementSibling;
      // UP
      if (deltaY < 0) {
        const h = Math.round(parseInt(getComputedStyle(t).height) + deltaY);
        t.style.flex = `0 ${h < 10 ? 0 : h}px`;
        b.style.flex = "1 0";
      }
      // DOWN
      if (deltaY > 0) {
        const h = Math.round(parseInt(getComputedStyle(b).height) - deltaY);
        b.style.flex = `0 ${h < 10 ? 0 : h}px`;
        t.style.flex = "1 0";
      }
    }
    function onmouseup(e) {
      e.preventDefault();
      document.removeEventListener("mousemove", onmousemove);
      document.removeEventListener("mouseup", onmouseup);
      delete e._clientY;
    }
  })();
})();
			
$(document).ready(function() {
		$("#accordian a").click(function() {
				var link = $(this);
				var closest_ul = link.closest("ul");
				var parallel_active_links = closest_ul.find(".active")
				var closest_li = link.closest("li");
				var link_status = closest_li.hasClass("active");
				var count = 0;

				closest_ul.find("ul").slideUp(function() {
						if (++count == closest_ul.find("ul").length)
								parallel_active_links.removeClass("active");
				});

				if (!link_status) {
						closest_li.children("ul").slideDown();
						closest_li.addClass("active");
				}
		})
})

	</script>
		
<script>

	var nodes = null;
	var edges = null;
	var network = null;
	
	var LENGTH_MAIN = 350,
	LENGTH_SERVER = 150,
	LENGTH_SUB = 50,
	WIDTH_SCALE = 2,
	GREEN = "green",
	RED = "#C5000B",
	ORANGE = "orange",
	//GRAY = '#666666',
	GRAY = "gray",
	BLACK = "#2B1B17";
		
	function toggleDiv(divtype)
	{
		if(divtype == 'div0')
		{
			$('#myDiv0').toggleClass('fullscreen');
		}
		else if(divtype == 'div1')
		{
			$('#myDiv').toggleClass('fullscreen'); 
		}
		else if(divtype == 'div2')
		{
			$('#myDiv2').toggleClass('fullscreen');
		}
	}

	$('myDiv1').click(function(e){
		$('#myDiv').toggleClass('fullscreen'); 
	});

	$('myDiv2').click(function(e){
		$('#myDiv2').toggleClass('fullscreen'); 
	});
	
	 
	//initialize global variables.
	var edges;
	var nodes;
	var network; 
	var container;
	var options, data;

// This method is responsible for drawing the graph, returns the drawn network
function drawGraph(stateId, bookId, chapterId, sname, nodes, edges) {
		
	var container = document.getElementById('mynetwork');
	    
    //nodes1 = new vis.DataSet([{'id': '1008.3', 'label': 'testets', 'shape': 'dot', 'title': 'Transfer Systems.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '1002.4.7', 'label': 'test test', 'shape': 'dot', 'title': 'Companion Seats.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '203.3', 'label': '203.3', 'shape': 'dot', 'title': 'Raised Areas.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '806.2.6', 'label': '806.2.6', 'shape': 'dot', 'title': 'Turning Space.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '503.3.2', 'label': '503.3.2', 'shape': 'dot', 'title': 'Length.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '233.3.2', 'label': '233.3.2', 'shape': 'dot', 'title': 'Residential Dwelling Units for Sale.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '607.4.2.3', 'label': '607.4.2.3', 'shape': 'dot', 'title': 'Head End Wall.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}]);
    //edges1 = new vis.DataSet([{'from': '1002.4.7', 'to': '1008.3'}, {'from': '203.3', 'to': '1008.3'}, {'from': '806.2.6', 'to': '1008.3'}, {'from': '1008.3', 'to': '503.3.2'}, {'from': '1008.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '607.4.2.3'}, {'from': '612.2', 'to': '1002.4.7'}, {'from': '504.3', 'to': '1002.4.7'}, {'from': '1002.4.7', 'to': '407.4.6.1'}, {'from': '1002.4.7', 'to': '1008.3'}, {'from': '1002.4.7', 'to': '223.1.1'}, {'from': '221.3', 'to': '1002.4.7'}, {'from': '407.3.3.2', 'to': '1002.4.7'}, {'from': '206.2.14', 'to': '203.3'}, {'from': '224.4', 'to': '203.3'}, {'from': '804.2', 'to': '203.3'}, {'from': '203.3', 'to': '1008.3'}, {'from': '203.3', 'to': '1008.3.1.1'}, {'from': '408.4.6', 'to': '203.3'}, {'from': '1008.3.1.1', 'to': '806.2.6'}, {'from': '215.5', 'to': '806.2.6'}, {'from': '305.7.1', 'to': '806.2.6'}, {'from': '806.2.6', 'to': '408.4.6'}, {'from': '806.2.6', 'to': '1008.3'}, {'from': '806.2.6', 'to': '409.4.5'}, {'from': '703.7.2', 'to': '806.2.6'}, {'from': '504.4', 'to': '806.2.6'}, {'from': '604.8.2', 'to': '806.2.6'}, {'from': '505.4', 'to': '503.3.2'}, {'from': '503.3.2', 'to': '217.4.3'}, {'from': '503.3.2', 'to': '305.7.1'}, {'from': '503.3.2', 'to': '405.7.4'}, {'from': '409.4.7.2', 'to': '503.3.2'}, {'from': '1008.3', 'to': '503.3.2'}, {'from': '704.5', 'to': '503.3.2'}, {'from': '1008.2.6', 'to': '503.3.2'}, {'from': '233.3.2', 'to': '409.4.7.2'}, {'from': '233.3.2', 'to': '903.3'}, {'from': '233.3.2', 'to': '206.7.2'}, {'from': '217.4.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '233.3.2'}, {'from': '235.2.1', 'to': '233.3.2'}, {'from': '221.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '607.4.2.3'}, {'from': '607.4.2.3', 'to': '405.7'}, {'from': '607.4.2.3', 'to': '206.2.14'}, {'from': '607.4.2.3', 'to': '408.4.6'}]);
	//nodes = new vis.DataSet([{'id':'50627','label':'50627'},{'id':'49989','label':'49989'},{'id':'50134','label':'50134'},{'id':'50625','label':'50625'},{'id':'50629','label':'50629'},{'id':'50651','label':'50651'},{'id':'50626','label':'50626'},{'id':'49914','label':'49914'},{'shape':'dot','id':'49915','label':'49915','title':'graph','allowedToMoveX':'true','allowedToMoveY':'true'},{'shape':'dot','id':'49916','label':'49916','title':'graph','allowedToMoveX':'true','allowedToMoveY':'true'},{'shape':'dot','id':'49917','label':'49917','title':'graph','allowedToMoveX':'true','allowedToMoveY':'true'}]);
    //edges = new vis.DataSet([{'from':'49914','to':'49916'},{'from':'49914','to':'49915'},{'from':'49914','to':'50629'},{'from':'49914','to':'50625'},{'from':'49914','to':'50651'},{'from':'49915','to':'49916'},{'from':'49915','to':'49914'},{'from':'49915','to':'51025'},{'from':'49915','to':'51172'},{'from':'49915','to':'49988'},{'from':'49916','to':'49914'},{'from':'49916','to':'49915'},{'from':'49916','to':'50627'},{'from':'49916','to':'50626'},{'from':'49916','to':'49989'},{'from':'49917','to':'49916'},{'from':'49917','to':'49992'},{'from':'49917','to':'50134'},{'from':'49917','to':'49915'},{'from':'49917','to':'51212'}]);
    
    var nodes = new vis.DataSet(nodes);
   	// create an array with edges
   	var edges = new vis.DataSet(edges);
   	
    // adding nodes and edges to the graph
    data = {nodes: nodes, edges: edges};
    
    var options = {
    	    nodes: {
    	      scaling: {
    	        min: 16,
    	        max: 32,
    	      },
    	    },
    	    edges: {
    	      color: GRAY,
    	      smooth: false,
    	    },
    	    physics: {
    	      barnesHut: { gravitationalConstant: -30000 },
    	      stabilization: { iterations: 25000 },
    	    },
    	    groups: {
    	      switch: {
    	        shape: "square",
    	        color: "#FF9900", // orange
    	      },
    	      desktop: {
    	        shape: "dot",
    	        color: "#2B7CE9", // blue
    	      },
    	      mobile: {
    	        shape: "dot",
    	        color: "#5A1E5C", // purple
    	      },
    	      server: {
    	        shape: "triangle",
    	        color: "#C5000B", // red
    	      },
    	      internet: {
    	        shape: "dot",
    	        color: "#109618", // green
    	      },
    	    },
    	  };

var node1 = 0;
network = new vis.Network(container, data, options);
/*
*
*
* Function added to manage clicks
*
*
*/
network.on("click", function(e) {
	console.log("e.nodes[0]--->"+e.nodes[0]);
	var node1 = 0;
	node1 = e.nodes[0];
	// Hide all nodes
	for (var id in nodes._data) {
		nodes.update([{id: id, hidden: true}]);
	}

	// Hide all edges
	for (var id in edges._data) {
		edges.update([{id: id, hidden: true}]);
	}
	console.log(e);
	// Loop over IDs of edges attached to node that was clicked
	for (var id in e.edges) {
		// Get the edge object
		var edge = edges.get(e.edges[id]);

		// Unhide the edges
		edges.update([{id: edge.id, hidden: false}]);
		
		// Unhide the nodes at the ends of those edges
		nodes.update([{id: edge.from, hidden: false}]);
		nodes.update([{id: edge.to, hidden: false}]);
	};
	console.log('Got the node :' + node1);
		
	// call to get the section for the selected node
	//getSectionForNode(stateId, regionId, bookId, sname,  node1);
	if(typeof node1 != "undefined"){
		getSectionForSelectedNode(stateId, bookId, chapterId, sname, node1);
	}
});

return network;
}


 function getSectionForSelectedNode(stateId, bookId, chapterId, subchapter_id, subchaptersection_no){
	 var siteurl = $('#siteurl').val();
	 /* alert(stateId);
	 alert(subchapter_id);
	 alert(subchaptersection_no); */
	 var newBookId = 75;
	 var newStateId = 3;
	 var newChapterId = 2147;
	 /*if(newBookId == bookId && newStateId == stateId){
		 URL = "/"+siteurl+"/getBookDetails?bookId="+bookId+"&stateId="+stateId+"&chapterId="+newChapterId+"&subchaptersection_no="+subchaptersection_no;
	 }else{
		 URL = "/"+siteurl+"/getBookDetails?bookId="+newBookId+"&stateId="+newStateId+"&chapterId="+newChapterId+"&subchaptersection_no="+subchaptersection_no;
	 } */
	 
	 URL = "/"+siteurl+"/showSectionDetailsForNode?stateId="+stateId+"&bookId="+bookId+"&newBookId="+newBookId+"&newStateId="+newStateId+"&newChapterId="+newChapterId;
	 $.ajax({
		 type: "POST",
		 async: false,
		 url : URL,
		 contentType : 'application/json; charset=utf-8',
		 dataType: 'json',
		 cache: false,
 		 success: function (response) {
 			 console.log("response in showSectionDetailsForNode-->"+response);
 			 $("#chapterList").load(" #chapterList");
 			 $("#myDiv0").load(" #myDiv0");
 		 },
           error: function () {
               console.log("error in showSectionDetailsForNode"+error);
           }
       });
 }

// function showSectionDetails(chapter, section){
		 // $('#bookmarkstatus').val("");
		 // URL = "/"+$('#siteurl').val()+"/showSectionDetails?chapterId="+chapter+"&sectionId="+section;
			// $.ajax({
				// type: "GET",
				// async: false,
				// url : URL,
				// contentType : 'application/json; charset=utf-8',
				// dataType: 'json',
				// cache: false,
		 		// success: function (response) {
		 			// console.log("response in showSectionDetails-->");
		 			// $("#myDiv0").load(" #myDiv0");
		 		// },
		          // error: function () {
		              // console.log("error in showSectionDetails");
		          // }
		      // });
// }
	
	
	
function addComment(stateid, bookId, chapterId, subChapterId, subChapterSecId, subChapterSecSubSecId) {
	$("#bookId").val(bookId);
	$("#stateid").val(stateid);
	$("#chapterId").val(chapterId);
	$("#subChapterId").val(subChapterId);
	$("#subChapterSecId").val(subChapterSecId);
	$("#subChapterSecSubSecId").val(subChapterSecSubSecId);
}

function submitComment(){
	addBookmark($("#stateid").val(), $("#bookId").val(), $("#chapterId").val(), $("#subChapterId").val(), $("#subChapterSecId").val(), $("#subChapterSecSubSecId").val(), "comment", $("#comments").val());
}
  
function addBookmark(stateid, bookId, chapterId, subChapterId, subChapterSecId, subChapterSecSubSecId, actionType, comments) {
	//alert($('#siteurl').val());
	var URL = "/"+$('#siteurl').val()+"/saveCommentsAndBookmarks?stateid="+stateid+"&bookId="+bookId+"&chapterId="+chapterId+"&subChapterId="+subChapterId+"&subChapterSecId="+subChapterSecId+"&subChapterSecSubSecId="+subChapterSecSubSecId+"&actionType="+actionType+"&comments="+encodeURIComponent(comments);
	//window.location.href = URL;
	//var URL = "/codecompilance/saveCommentsAndBookmarks";
	/*var form = document.createElement("form");
	  form.setAttribute("method", "POST");
	  form.setAttribute("action", URL);
	  document.body.appendChild(form);
	  form.submit(); */
	  
	  $.ajax({
			type: "GET",
			async: false,
			url : URL,
			contentType : 'application/json; charset=utf-8',
			dataType: 'json',
			cache: false,
	 		success: function (response) {
	 			console.log("bookmarkstatus"+response.bookmarkstatus);
	 			$("#myDiv0").load(" #myDiv0");
	 			$('#bookmarkDiv').focus();
            },
            error: function () {
                console.log("error");
            }
        });  
}

function showdiv(bflag)
{
	console.log('Displaying the graph here;');
	
	if((bflag) == true)
	{
		document.getElementById('vismessage').style.display='none';
	}
	else
	{
		document.getElementById('vismessage').style.display='block';
	}
	
}

function printDiv(divName) {
	 //alert(divName);
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;
     document.body.innerHTML = printContents;
     window.print();
     document.body.innerHTML = originalContents;
}

</script>
		
		
<script type="text/javascript">

    // initialize global variables.
    var edges;
    var nodes;
    var network; 
    var container;
    var options, data;
    
    $('#mynetwork-main').scroll(function() {
        $('#FixedDiv').animate({top:$(this).scrollTop()});
    });

    //nodes = [{'id': '1008.3', 'label': '1008.3', 'shape': 'dot', 'title': 'Transfer Systems.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '1002.4.7', 'label': '1002.4.7', 'shape': 'dot', 'title': 'Companion Seats.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '203.3', 'label': '203.3', 'shape': 'dot', 'title': 'Raised Areas.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '806.2.6', 'label': '806.2.6', 'shape': 'dot', 'title': 'Turning Space.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '503.3.2', 'label': '503.3.2', 'shape': 'dot', 'title': 'Length.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '233.3.2', 'label': '233.3.2', 'shape': 'dot', 'title': 'Residential Dwelling Units for Sale.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}, {'id': '607.4.2.3', 'label': '607.4.2.3', 'shape': 'dot', 'title': 'Head End Wall.\n', 'allowedToMoveX': 'true', 'allowedToMoveY': 'true'}];
    //edges = [{'from': '1002.4.7', 'to': '1008.3'}, {'from': '203.3', 'to': '1008.3'}, {'from': '806.2.6', 'to': '1008.3'}, {'from': '1008.3', 'to': '503.3.2'}, {'from': '1008.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '607.4.2.3'}, {'from': '612.2', 'to': '1002.4.7'}, {'from': '504.3', 'to': '1002.4.7'}, {'from': '1002.4.7', 'to': '407.4.6.1'}, {'from': '1002.4.7', 'to': '1008.3'}, {'from': '1002.4.7', 'to': '223.1.1'}, {'from': '221.3', 'to': '1002.4.7'}, {'from': '407.3.3.2', 'to': '1002.4.7'}, {'from': '206.2.14', 'to': '203.3'}, {'from': '224.4', 'to': '203.3'}, {'from': '804.2', 'to': '203.3'}, {'from': '203.3', 'to': '1008.3'}, {'from': '203.3', 'to': '1008.3.1.1'}, {'from': '408.4.6', 'to': '203.3'}, {'from': '1008.3.1.1', 'to': '806.2.6'}, {'from': '215.5', 'to': '806.2.6'}, {'from': '305.7.1', 'to': '806.2.6'}, {'from': '806.2.6', 'to': '408.4.6'}, {'from': '806.2.6', 'to': '1008.3'}, {'from': '806.2.6', 'to': '409.4.5'}, {'from': '703.7.2', 'to': '806.2.6'}, {'from': '504.4', 'to': '806.2.6'}, {'from': '604.8.2', 'to': '806.2.6'}, {'from': '505.4', 'to': '503.3.2'}, {'from': '503.3.2', 'to': '217.4.3'}, {'from': '503.3.2', 'to': '305.7.1'}, {'from': '503.3.2', 'to': '405.7.4'}, {'from': '409.4.7.2', 'to': '503.3.2'}, {'from': '1008.3', 'to': '503.3.2'}, {'from': '704.5', 'to': '503.3.2'}, {'from': '1008.2.6', 'to': '503.3.2'}, {'from': '233.3.2', 'to': '409.4.7.2'}, {'from': '233.3.2', 'to': '903.3'}, {'from': '233.3.2', 'to': '206.7.2'}, {'from': '217.4.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '233.3.2'}, {'from': '235.2.1', 'to': '233.3.2'}, {'from': '221.3', 'to': '233.3.2'}, {'from': '1008.3', 'to': '607.4.2.3'}, {'from': '607.4.2.3', 'to': '405.7'}, {'from': '607.4.2.3', 'to': '206.2.14'}, {'from': '607.4.2.3', 'to': '408.4.6'}];

    //drawGraph(nodes, edges);
    //getGraphData('1008.3')
   
      
      function getGraphData(bookId, schapterid, subChpSecId) {
    	//bookid = "75";
    	//schapterid = "12340";
    	
    	URL = "/"+$('#siteurl').val()+"/getNodesAndEdges?bookid="+bookId+"&schapterid="+schapterid+"&subChpSecId="+subChpSecId;
    	$.ajax({
			type: "GET",
			async: false,
			url : URL,
			contentType : 'application/json; charset=utf-8',
			dataType: 'json',
			cache: false,
	 		success: function (response) {
	 			console.log("response -->"+response.nodes);
	 			console.log("response -->"+response.edges);
	            drawGraph(bookId, chapterId, subChpSecId, response.nodes, response.edges);
              },
              error: function () {
                  console.log("error");
              }
          });
        }

    
      function getGraphDataForMultiBook(stateId, bookId, chapterId, schapterid) {
      	
      	URL = "/"+$('#siteurl').val()+"/getNodesAndEdgesForMultiBook?bookid="+bookId+"&chapterId="+chapterId+"&schapterid="+schapterid;
      	$.ajax({
  			type: "GET",
  			async: false,
  			url : URL,
  			contentType : 'application/json; charset=utf-8',
  			dataType: 'json',
  			cache: false,
  	 		success: function (response) {
  	 			console.log("response -->"+response.nodes);
  	 			console.log("response -->"+response.edges);
  	            drawGraph(stateId, bookId, chapterId, schapterid, response.nodes, response.edges);
                },
                error: function () {
                    console.log("error");
                }
            });
      }
	  
	  

</script>

<!-- chatbot  -->
            <%@include file="chatbot.jsp" %>
    </body>
</html>