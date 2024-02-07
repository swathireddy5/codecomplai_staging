<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="row">
     <div class="col-xl-12">
       <div class="card border border-primary">
         <div class="card-body">
           <form class="needs-validation" novalidate>
             <div class="row">
               <div class="col-md-5">
                 <div class="mb-3">
                   <label for="validationCustom01" class="form-label">What is the average height of the highest roof surface above grade plane (ft.)? </label>
                   <c:if test="${avgHeight != null}" >
						<input id="avgHeight" type="text" name="drawingtype" value="${avgHeight}" class="form-control"/>
					</c:if>
					<c:if test="${avgHeight == null}" >
						<input id="avgHeight" type="text" name="drawingtype" class="form-control"/>
					</c:if>
                 </div>
               </div>
               <div class="col-md-7">
                 <div class="mb-3">
                   <label for="validationCustom02" class="form-label">Does your plan incorporate the sprinklered height increase or the area increase from Tables 504.3, 504.4, and 506.2?</label>
                   <c:if test="${heightOrArea != null}" >
					<select id="heightOrArea" name="drawingtype" class="form-select">
				        <option value="Height" <c:if test="${heightOrArea == 'Height'}">selected</c:if>>Height Increase</option>        
				        <option value="Area" <c:if test="${heightOrArea == 'Area'}">selected</c:if>>Area Increase</option>
					</select>
					</c:if>
					<c:if test="${heightOrArea == null}" >
						<select id="heightOrArea" name="drawingtype" class="form-select">
					        <option value="Height" selected>Height Increase</option>        
					        <option value="Area">Area Increase</option>
						</select>
					</c:if>
                 </div>
               </div>
             </div>
           </form>
         </div>
       </div>
       <!-- end card --> 
     </div>
     <div class="col-lg-12">
       <div class="card">
         <h5 class="card-header">Building Composition</h5>
         <div class="card-body">
           <div class="table-responsive">
             <table class="table table-hover mb-0">
               <thead>
                 <tr>
                   <th>WALL SEGMENT</th>
                   <th>LENGTH</th>
                   <th>WALL FACES</th>
                   <th>WALL DISTANCE TO...</th>
                   <th></th>
                   <th>PARTY WALL?</th>
                 </tr>
               </thead>
               <tbody>
               	 	<c:if test="${wallsegmentdata != null}" > 
                      	<c:forEach var="wsdata" items="${wallsegmentdata}">
                           <tr id="wallsegment">
                               <td><input class="form-control form-control-sm w-100" type="text" placeholder="Wall 1" value="${wsdata.wallSegment}"/></td>
                               <td><input class="form-control form-control-sm w-100" type="text" placeholder="ft" value="${wsdata.length}"/></td>
								<td><select name="drawingtype" class="form-control-sm w-100">
									 <option value="road_alley_public_way" <c:if test="${wsdata.wallFace == 'road_alley_public_way' }">selected</c:if>>Road / Alley / Public Way</option>
						             <option value="lot_line" <c:if test="${wsdata.wallFace == 'lot_line' }">selected</c:if>>Lot Line</option>
						             <option value="other_building_on_lot" <c:if test="${wsdata.wallFace == 'other_building_on_lot' }">selected</c:if>>Other Building on Lot</option>
						             <option value="other_wall_segment" <c:if test="${wsdata.wallFace == 'other_wall_segment' }">selected</c:if>>Other Wall Segment</option>
								</select></td>
								<td><input class="form-control form-control-sm w-100" type="text" placeholder="ft" value="${wsdata.wallDistFrom}"/></td>
								<td><input class="form-control form-control-sm w-100" type="text" placeholder="ft" value="${wsdata.wallDistTo}"/></td>
								<td><input class="form-check-input p-2" type="checkbox" <c:if test="${wsdata.partyWall == 1 }">checked</c:if>value="${wsdata.partyWall}"/></td>
								<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removewallsegment(this)"/></td>
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${wallsegmentdata == null}" > 
                                 <tr id="wallsegment">
                                 <td><input type="text" placeholder="Wall 1" class="form-control form-control-sm w-100"/></td>
                                 <td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"/></td>
								 <td>
								 	<select name="drawingtype" class="form-control-sm w-100">
									    <option value="road_alley_public_way" selected>Road / Alley / Public Way</option>
					                    <option value="lot_line">Lot Line</option>
					                    <option value="other_building_on_lot">Other Building on Lot</option>
					                    <option value="other_wall_segment">Other Wall Segment</option>
									</select></td>
								<td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"/></td>
								<td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"/></td>
								<td><input class="form-check-input p-2" type="checkbox" /></td>
								<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removewallsegment(this)"/></td>
                          		</tr>
                      	</c:if>
		                 	<!-- <tr>
		                   <td><input type="text" placeholder="Wall 1" class="form-control form-control-sm w-100"></td>
		                   <td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"></td>
		                   <td><select name="drawingtype" class="form-control-sm w-100">
		                       <option value="road_alley_public_way" selected>Road / Alley / Public Way</option>
		                       <option value="lot_line">Lot Line</option>
		                       <option value="other_building_on_lot">Other Building on Lot</option>
		                       <option value="other_wall_segment">Other Wall Segment</option>
		                     </select></td>
		                   <td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"></td>
		                   <td><input type="text" placeholder="ft" class="form-control form-control-sm w-100"></td>
		                   <td>
		                       <input class="form-check-input p-2" type="checkbox" id="formCheck1">
		                     
		                    </td>
		                 </tr> -->
               </tbody>
             </table>
             
               <button id="addwallsegment" type="button" style="align:center;" class="btn btn-primary waves-effect waves-light mt-4"> + Add Wall Segment </button>
             
           </div>
         </div>
       </div>
       <div class="card">
         <h5 class="card-header">Building Uses</h5>
         <div class="card-body">
           <div class="row">
             <div class="col-md-12">
               <div>
                 <h5 class="font-size-14 mb-0">Is the building used for any of the following purposes?</h5>
                 <p>Movie theater</p>
                 <p class="mt-0">Note:<em> Note: Some questions within this group are not relevant because of your answers to other questions and are not shown.</em></p>
                 <div id="movietheater" class="form-check mb-3">
                   <input class="form-check-input" type="radio" name="formRadios" id="movietheater" checked value="yes">
                   <label class="form-check-label" for="movietheater"> YES </label>
                 </div>
                 <div class="form-check">
                   <input class="form-check-input" type="radio" name="formRadios" id="movietheater" value="no">
                   <label class="form-check-label" for="movietheater"> No </label>
                 </div>
               </div>
               <button type="button" class="btn btn-primary btn-sm waves-effect waves-light float-end">Give a Feedback</button>
             </div>
           </div>
         </div>
       </div>
       <div class="card">
         <h5 class="card-header">Building Features </h5>
         <div class="card-body">
           <div class="row">
             <div class="col-md-12">
               <div>
                 <h5 class="font-size-14 mb-0">Does the building have any stage and platform floor areas, such as runways, ramps and side stages used for entertainment or presentations?</h5>
                 <p class="mt-0">Note:<em> Note: Some questions within this group are not relevant because of your answers to other questions and are not shown.</em></p>
                 <div id="entertainment" class="form-check mb-3">
                   <input class="form-check-input" id="entertainment" type="radio" name="formRadios" value="yes" checked>
                   <label class="form-check-label" for="entertainment"> YES </label>
                 </div>
                 <div class="form-check">
                   <input class="form-check-input" id="entertainment" type="radio" name="formRadios" value="no">
                   <label class="form-check-label" for="entertainment"> No </label>
                 </div>
               </div>
               <button type="button" class="btn btn-primary btn-sm waves-effect waves-light float-end">Give a Feedback</button>
             </div>
           </div>
         </div>
       </div>
       <div class="card">
         <h5 class="card-header">Construction</h5>
         <div class="card-body">
           <div class="row">
             <div class="col-md-12">
               <div>
                 <h5 class="font-size-14 mb-0">Is the building a tent, membrane or fabric structure?</h5>
                 <p class="mt-0">Note:<em> Note: Some questions within this group are not relevant because of your answers to other questions and are not shown.</em></p>
                 <div id="conStructure" class="form-check mb-3">
                   <input class="form-check-input" type="radio" name="formRadios" id="conStructure" value="yes" checked>
                   <label class="form-check-label" for="formRadios1"> YES </label>
                 </div>
                 <div class="form-check">
                   <input class="form-check-input" type="radio" name="formRadios" id="conStructure" value="no">
                   <label class="form-check-label" for="formRadios2"> No </label>
                 </div>
               </div>
               <button type="button" class="btn btn-primary btn-sm waves-effect waves-light float-end">Give a Feedback</button>
             </div>
           </div>
         </div>
       </div>
     </div>
</div>