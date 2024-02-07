<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<div class="row">
  	<div class="col-xl-12">    
       <div class="demo10">       
	       <div class="container">
	       		<button type="button" class="btn btn-warning pull-right" data-toggle="modal" data-target="#AddNewProject">Create New Project</button>
				<c:if test="${!empty projectList}">
				<div class="section-head col-sm-12">          
		          <h4 class="pull-left" style="margin-top:20px;"><span>All</span> Projects</h4>
		        </div> 
		        </c:if>
		        <c:if test="${empty projectList}">
				<div class="section-head col-sm-12">          
		          <h4 class="pull-left" style="margin-top:20px;"><span>No</span> Projects</h4>
		        </div> 
		        </c:if>
				<div class="clearfix"></div>
				<div class="row">		
				<c:forEach var="project" items="${projectList}">
					<div class="col-md-12">
				          <div v-for="tab in tabs" class="tab-item">
						  <div class="btn-group pull-right">
				  			<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Options</button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item" data-project-id="${project.projectId}" data-toggle="modal" data-target="#RenameProject" href="#RenameProject" onClick="pop_up(${userId},${project.projectId});">Rename</a>
							    <a class="dropdown-item" href="duplicateProject?userId=${userId}&projectId=${project.projectId}&projectName=${project.projectName}" onclick="return confirm('Are you sure you want to create a copy of this project?');Javascript:location.replace(this.href);Event.returnvalue=false;">Duplicate</a>
							    <a class="dropdown-item" href="deleteProject?userId=${userId}&projectId=${project.projectId}" onclick="return confirm('Are you sure you want to delete this project?');">Remove</a>  
							    <a class="dropdown-item" href="#">Manage Collaborators</a>
							    <a class="dropdown-item" href="#">Export Bookmarks(PDF)</a>
							  </div>
						</div>
				         <li>
				            <a href="viewProjectDetails?userId=${userId}&projectId=${project.projectId}" active="">${project.projectName}
				              <h3 class="tab-item__heading">${project.projectName}</h3></a>
				         </li>
				         </div>
					</div>
				</c:forEach>
		        </div>
			</div>
		</div>
	</div>
</div>

<!-- Rename Project Modal - Start -->
<div class="modal fade" id="RenameProject" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width:600px">
        <div class="modal-header">
          
          <h4 class="modal-title">Rename Project</h4>
		  <button type="button" class="close" data-dismiss="modal">x</button>
        </div>
        <div class="modal-body">
        <div class="card" style="min-width:500px">
		
							<div class="card-body">
														
								<div class="m-sm-4">
									<form action="/${siteurl}/renameProject">
										<div class="form-group">
											<input type="hidden" id='inputuserId' name="inputuserId"/>
											<input type="hidden" id='inputprojectId' name="inputprojectId"/>
											
										</div>
										<div class="form-group">
											<label>Rename Project*</label>
											<input class="form-control form-control-lg" type="text" name="projectname" placeholder="Project Name" maxlength="30" required>
										</div>
										
										
										<div class="text-center mt-3">
												<input type="submit" class="btn btn-lg btn-warning" value="Rename Project"></input>
										</div>
									</form>
								</div>
							</div>
						</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      </div>
      
    </div>
</div>
<!-- Rename Project Modal - End -->

<div class="modal fade" id="AddNewProject" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:600px">
        <div class="modal-header">
          
          <h4 class="modal-title">Create New Project</h4>
		  <button type="button" class="close" data-dismiss="modal">x</button>
        </div>
        <div class="modal-body">
        <div class="card" style="min-width:500px">
		
							<div class="card-body">
							<p>Projects allow you to save customized inputs about your building. These inputs help surface the applicable codes and requirements.</p>
								<div class="m-sm-4">
									<form action="/${siteurl}/createProjectShowBuildingData">
										<div class="form-group">
											<label>Project Name*</label>
											<input class="form-control form-control-lg" type="text" name="projectname" placeholder="Project Name" maxlength="30" required>
										</div>
										<div class="form-group">
											<label>Jurisdiction*</label><c:out value="${regionYear.regionId}"/>
											<input type="hidden" name="selectedJurisdictionLabel" id="selectedJurisdictionLabelId">
											<select id="JurisdictionId" name="Jurisdiction" class="form-control" onchange="getval(this);" required>
												<option value="0"> --Select One-- </option>
												<c:forEach var="regionYear" items="${regionCodeYear}">
												<option value=<c:out value="${regionYear.regionId}"/>>${regionYear.regionName}</option>
												</c:forEach>
        
         									</select>
										</div>
										<div class="form-group">
											<label>Code Year*</label>
											<select name="codeYear" id="codeYearId" class="form-control" required>
												<option value="0" disabled> --Select One-- </option>
										<!-- 		<option value="1"> 2019 </option>
												<option value="2">2016</option>
												 -->
											</select>
										</div>
										
										
										
										<div class="text-center mt-3">
									<!-- 		<a href="buildingdata" class="btn btn-lg btn-warning">Create New Project</a> -->
											<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
												<input type="submit" class="btn btn-lg btn-warning" value="Create New Project"></input>
										</div>
									</form>
								</div>
							</div>
						</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      </div>
      
    </div>
  </div>
  <script>
  
  function pop_up(userId,projectId){
	  
	  $("#inputuserId").val(userId);
	  $("#inputprojectId").val(projectId);
	  //$("#inputprojectName").html(projectName);
  }
  

  function getval(sel)
  {
	  console.log("selected Regionname="+sel.value);
      URL = "/codecompilance/getCodeYearsList";
  	$.ajax({
  		type: "POST",
  		 async: false,  
  		url : URL,
  	data: { "regionId" : sel.value},
  		success : function(response){
  			if(response != null && response !=""){
  				$('#codeYearId').children('option[value!="0"]').remove(); 
  				data = response.years;
  				console.log("==========data======"+data);
  				$("#selectedJurisdictionLabelId").val(sel.text);
  				// Adding text as Current for the latest year and keeping the value as it is 
  				$("#codeYearId").append($('<option>', { 
				        value: data[0][0],
				        text : "Current"
				    }));
  				for( i=1;i<data[0].length;i++){
  					console.log("==========data======"+data[0][i]);
  					$("#codeYearId").append($('<option>', { 
  				        value: data[0][i],
  				        text : data[0][i]
  				    }));
  				}
  			}
  													
  	},
  	 error: function(jqXHR, textStatus, errorThrown) {
              alert(jqXHR.status + ' ' + jqXHR.responseText);
          }
      
  }); 
  }
  
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

	  $("#close-sidebar").click(function() {
	  $(".page-wrapper").removeClass("toggled");
	  });
	  $("#show-sidebar").click(function() {
	  $(".page-wrapper").addClass("toggled");
	  });

 });
  </script>