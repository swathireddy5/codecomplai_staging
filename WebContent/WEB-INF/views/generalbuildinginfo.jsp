<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
      <div class="col-xl-12">

        <div class="card">
          <div class="card-header">
            <h3 class="card-title">General Building Information</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
		  <div >
            <ul class="">
              <li>
                <div class="custom-control custom-checkbox my-1 mr-sm-2">
				<h5>Basic Life Safety</h5>
				<div class="col-xl-6 pull-left">
				
                 <p>What is the type of construction of the building?</p>
				 </div>
				 <div class="col-xl-6 pull-right">
				 <div class="form-group">
											
					<c:if test="${constructiontype != null}" >
					<select id="constructiontype" name="drawingtype" class="form-control" style="width:100px;" >
				
						<option value=""></option>
				        
				        <option value="IA" <c:if test="${constructiontype == 'IA'}">selected</c:if>>IA</option>
				        
				        <option value="IB" <c:if test="${constructiontype == 'IB'}">selected</c:if>>IB</option>
				        
				        <option value="IIA" <c:if test="${constructiontype == 'IIA'}">selected</c:if>>IIA</option>
				        
				        <option value="IIB" <c:if test="${constructiontype == 'IIB'}">selected</c:if>>IIB</option>
												
					</select>
					</c:if>
					<c:if test="${constructiontype == null}" >
					<select id="constructiontype" name="drawingtype" class="form-control" style="width:100px;" >
				
						<option value=""></option>
				        
				        <option value="IA" selected>IA</option>
        
						<option value="IB">IB</option>
        
						<option value="IIA">IIA</option>
        
						<option value="IIB">IIB</option>
												
					</select>
					</c:if>
										</div>
				 </div>
				 <div class="col-xl-4 pull-right">
            
            </div>
                </div>
              </li>
			  
			  <li>
                <div class="custom-control custom-checkbox my-1 mr-sm-2">
				<div class="col-xl-6 pull-left">
                 <p>What type of building sprinkler system is present?</p>
				 </div>
				 <div class="col-xl-6 pull-right">
				 <div class="form-group">
											
					<c:if test="${sprinklertype != null}" >
					<select id="sprinklertype" name="drawingtype" class="form-control" style="width:100px;" >
				
						<option value=""></option>
				        
				        <option value="nfpa13" <c:if test="${sprinklertype == 'nfpa13'}">selected</c:if>>NFPA 13</option>
				        
				        <option value="nfpa13R" <c:if test="${sprinklertype == 'nfpa13R'}">selected</c:if>>NFPA 13R</option>
				        
				        <option value="nfpa13D" <c:if test="${sprinklertype == 'nfpa13D'}">selected</c:if>>NFPA 13D</option>
				        
				        <option value="not_sprinklered" <c:if test="${sprinklertype == 'Not sprinklered'}">selected</c:if>>Not sprinklered</option>
												
					</select>
					</c:if>
					<c:if test="${sprinklertype == null}" >
					<select id="sprinklertype" name="drawingtype" class="form-control" style="width:100px;" >
				
						<option value=""></option>
				        
				        <option value="nfpa13">NFPA 13</option>
				        
				        <option value="nfpa13R">NFPA 13R</option>
				        
				        <option value="nfpa13D">NFPA 13D</option>
				        
				        <option value="not_sprinklered">Not sprinklered</option>
												
					</select>
					</c:if>
					</div>
				 </div>
				
                </div>
              </li>
       
	   
	   <li>
                <div class="custom-control custom-checkbox my-1 mr-sm-2">
				<div class="col-xl-6 pull-left">
                 <p>Is this building considered new or existing construction?</p>
				 </div>
				 <div class="col-xl-6 pull-right">
				 <div class="form-group">
				 <c:if test="${neworexistingbuild != null}" >
					<select id="neworexistingbuild" name="drawingtype" class="form-control">
						<option value=""></option>
						<option value="new" <c:if test="${neworexistingbuild == 'new'}">selected</c:if>>New</option>
						<option value="existing" <c:if test="${neworexistingbuild == 'existing'}">selected</c:if>>Existing</option>
					</select>
					</c:if>
					<c:if test="${neworexistingbuild == null}" >
					<select id="neworexistingbuild" name="drawingtype" class="form-control">
						<option value=""></option>
						<option value="new" selected>New</option>
						<option value="existing">Existing</option>
					</select>
					</c:if>
				</div>
				 </div>
				 <div class="col-xl-12 pull-right">
            <button class="btn btn-sm btn-warning pull-right"  data-toggle="modal" data-target="#Feedback" style="margin-top:20px;">Give a Feedback</button>
            </div>
                </div>
              </li>
       
            </ul>
			
			 
	</div>
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">
          
          </div>
        </div>
      </div>
      
    </div>			