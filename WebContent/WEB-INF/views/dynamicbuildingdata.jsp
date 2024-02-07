<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  Start of dynamic block -->
             
               <c:forEach var="bdata" items="${buildingdata}">
                                         <div id="floorrow" class="row">
      <div class="col-xl-12">

                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Building Composition</h4>
                                
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Floor</th>
                                                <th>Story Height</th>
                                                <th>Space Name</th>
                                                <th>Occupancy</th>
                                                <th>Functon of Space</th>
                                                <th>Gross</th>
                                                <th>Net</th>
                                                <th>Occupaint Load</th>
                                                <th>Next Component along with Path</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <!-- start of tr -->
                                        <c:forEach var = "data" items = "${bdata.bList}">
                                            <tr id="row">
                                                <td>${data.floor}</td>
                                                <td><input type="text" placeholder="ft" value="${data.storyHeight}" style="width:50px;"/></td>
												<div class="card">
                                                <td><input type="text"value="${data.spaceName}" style="width:100px;"/><br><br>
												<div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
        <label style="padding-top:10px;" class="custom-control-label" for="customCheck1">Accessory occupancy</label>
      </div>


												</td>
                                                <td><select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="width:100px;">
  <option value="0" <c:if test="${data.occupancy == '0' }">selected</c:if> >A-1</option>
  <option value="1" <c:if test="${data.occupancy == '1' } ">selected</c:if> >A-2</option>
  <option value="2" <c:if test="${data.occupancy == '2' }">selected</c:if> >A-3</option>
  <option value="3" <c:if test="${data.occupancy == '3' }">selected</c:if> >A-4</option>
</select></td>
												 <td><select class="space_function" style="width:100px;">
             
                
                    <option value="accessory_storage_areas_mechanical_equipment_room" <c:if test="${data.functionOfSpace == 'accessory_storage_areas_mechanical_equipment_room'} ">selected</c:if>>
                        Accessory storage areas, mechanical equipment room
                    </option>
                
                    <option value="agricultural_building" <c:if test="${data.functionOfSpace == 'agricultural_building'} ">selected</c:if>>
                        Agricultural building
                    </option>
                
                    <option value="aircraft_hangars" <c:if test="${data.functionOfSpace == 'aircraft_hangars'} ">selected</c:if>>
                        Aircraft hangars
                    </option>
                
                    <option value="airport_terminal" <c:if test="${data.functionOfSpace == 'airport_terminal'} ">selected</c:if>>
                        Airport: Airport terminal
                    </option>
                
                    <option value="baggage_claim" <c:if test="${data.functionOfSpace == 'baggage_claim' } ">selected</c:if> >
                        Airport: Baggage claim
                    </option>
                
                    <option value="baggage_handling" <c:if test="${data.functionOfSpace == 'baggage_handling' }">selected</c:if> >
                        Airport: Baggage handling
                    </option>
                
                    <option value="concourses" <c:if test="${data.functionOfSpace == 'concourses' }">selected</c:if>>
                        Airport: Concourses
                    </option>
                
                    <option value="waiting_areas" <c:if test="${data.functionOfSpace == 'waiting_areas'} ">selected</c:if>>
                        Airport: Waiting areas
                    </option>
                
                    <option value="concentrated_chairs_only_not_fixed" <c:if test="${data.functionOfSpace == 'concentrated_chairs_only_not_fixed'} ">selected</c:if> >
                        Assembly without fixed seats: Concentrated assembly (chairs only — not fixed)
                    </option>
                
                    <option value="standing_space" <c:if test="${data.functionOfSpace == 'standing_space' }">selected</c:if> >
                        Assembly without fixed seats: Standing space
                    </option>
                
                    <option value="unconcentrated_tables_and_chairs" <c:if test="${data.functionOfSpace == 'unconcentrated_tables_and_chairs'} ">selected</c:if> >
                        Assembly without fixed seats: Unconcentrated assembly (tables and chairs)
                    </option>
                
                    <option value="assembly_with_fixed_seats" <c:if test="${data.functionOfSpace == 'assembly_with_fixed_seats' }">selected</c:if> >
                        Assembly: Assembly with fixed seats
                    </option>
                
                    <option value="exhibit_gallery_and_museum" <c:if test="${data.functionOfSpace == 'exhibit_gallery_and_museum' }">selected</c:if> >
                        Assembly: Exhibit gallery and museum
                    </option>
                
                    <option value="gaming_floors_keno_slots_etc" <c:if test="${data.functionOfSpace == 'gaming_floors_keno_slots_etc' }">selected</c:if> >
                        Assembly: Gaming floors (keno, slots, etc.)
                    </option>
                
                    <option value="bowling_centers" <c:if test="${data.functionOfSpace == 'bowling_centers' }">selected</c:if> >
                        Bowling centers
                    </option>
                
                    <option value="business_areas" <c:if test="${data.functionOfSpace == 'business_areas'} ">selected</c:if> >
                        Business: Business areas
                    </option>
                
                    <option value="concentrated_business_use_areas" <c:if test="${data.functionOfSpace == 'concentrated_business_use_areas'} ">selected</c:if> >
                        Business: Concentrated business use areas
                    </option>
                
                    <option value="courtrooms_other_than_fixed_seating_areas" <c:if test="${data.functionOfSpace == 'courtrooms_other_than_fixed_seating_areas'} ">selected</c:if> >
                        Courtrooms — other than fixed seating areas
                    </option>
                
                    <option value="day_care" <c:if test="${data.functionOfSpace == 'day_care'} ">selected</c:if> >
                        Day care
                    </option>
                
                    <option value="dormitories" <c:if test="${data.functionOfSpace == 'dormitories' }">selected</c:if> >
                        Dormitories
                    </option>
                
                    <option value="classroom_area" <c:if test="${data.functionOfSpace == 'classroom_area' }">selected</c:if> >
                        Educational: Classroom area
                    </option>
                
                    <option value="shops_and_other_vocational_room_areas" <c:if test="${data.functionOfSpace == 'shops_and_other_vocational_room_areas'} ">selected</c:if> >
                        Educational: Shops and other vocational room areas
                    </option>
                
                    <option value="exercise_rooms" <c:if test="${data.functionOfSpace == 'exercise_rooms' }">selected</c:if> >
                        Exercise rooms
                    </option>
                
                    <option value="group_h_5_fabrication_and_manufacturing_areas" <c:if test="${data.functionOfSpace == 'group_h_5_fabrication_and_manufacturing_areas'} ">selected</c:if> >
                        Group H-5 fabrication and manufacturing areas
                    </option>
                
                    <option value="industrial_areas" <c:if test="${data.functionOfSpace == 'industrial_areas'} ">selected</c:if> >
                        Industrial areas
                    </option>
                
                    <option value="inpatient_treatment_areas" <c:if test="${data.functionOfSpace == 'inpatient_treatment_areas'} ">selected</c:if> >
                        Institutional areas: Inpatient treatment areas
                    </option>
                
                    <option value="outpatient_areas" <c:if test="${data.functionOfSpace == 'outpatient_areas'} ">selected</c:if> >
                        Institutional areas: Outpatient areas
                    </option>
                
                    <option value="sleeping_areas" <c:if test="${data.functionOfSpace == 'sleeping_areas'} ">selected</c:if> >
                        Institutional areas: Sleeping areas
                    </option>
                
                    <option value="kitchens_commercial" <c:if test="${data.functionOfSpace == 'kitchens_commercial' } ">selected</c:if> >
                        Kitchens, commercial
                    </option>
                
                    <option value="laboratory_suite" <c:if test="${data.functionOfSpace == 'laboratory_suite' }">selected</c:if> >
                        Laboratory: Laboratory suite
                    </option>
                
                    <option value="laboratory_educational" <c:if test="${data.functionOfSpace == 'laboratory_educational'} ">selected</c:if> >
                        Laboratory: Laboratory, educational (K-12th grade)
                    </option>
                
                    <option value="laboratory_non_educational" <c:if test="${data.functionOfSpace == 'laboratory_non_educational' } ">selected</c:if> >
                        Laboratory: Laboratory, non-educational
                    </option>
                
                    <option value="reading_rooms" <c:if test="${data.functionOfSpace == 'reading_rooms' }">selected</c:if> >
                        Library: Reading rooms
                    </option>
                
                    <option value="stack_area" <c:if test="${data.functionOfSpace == 'stack_area'} ">selected</c:if> >
                        Library: Stack area
                    </option>
                
                    <option value="locker_rooms" <c:if test="${data.functionOfSpace == 'locker_rooms' } ">selected</c:if> >
                        Locker rooms
                    </option>
                
                    <option value="mall_buildings_covered_and_open" <c:if test="${data.functionOfSpace == 'mall_buildings_covered_and_open'} ">selected</c:if>>
                        Mall buildings — covered and open
                    </option>
                
                    <option value="mercantile" <c:if test="${data.functionOfSpace == 'mercantile' }">selected</c:if> >
                        Mercantile
                    </option>
                
                    <option value="mercantile_storage_stock_shipping_areas" <c:if test="${data.functionOfSpace == 'mercantile_storage_stock_shipping_areas' }">selected</c:if>>
                        Mercantile storage, stock, shipping areas
                    </option>
                
                    <option value="other" <c:if test="${data.functionOfSpace == 'other' }">selected</c:if> >
                        Other
                    </option>
                
                    <option value="parking_garages" <c:if test="${data.functionOfSpace == 'parking_garages' }">selected</c:if> >
                        Parking garages
                    </option>
                
                    <option value="residential" <c:if test="${data.functionOfSpace == 'residential' } ">selected</c:if> >
                        Residential
                    </option>
                
                    <option value="rink_and_pool" <c:if test="${data.functionOfSpace == 'rink_and_pool' }">selected</c:if> >
                        Skating rinks or swimming pools: Rink and pool
                    </option>
                
                    <option value="decks" <c:if test="${data.functionOfSpace == 'decks' }">selected</c:if> >
                        Skating rinks,swimming pools: Decks
                    </option>
                
                    <option value="stages_and_platforms" <c:if test="${data.functionOfSpace == 'stages_and_platforms' }">selected</c:if> >
                        Stages and platforms
                    </option>
                
                    <option value="warehouses" <c:if test="${data.functionOfSpace == 'warehouses' } ">selected</c:if> >
                        Warehouses
                    </option>
                
            </select></td>
                                                <td><input type="text" value="${data.gross}" style="width:50px;"/></td>
                                                <td> </td>
                                                <td><input type="text" value="${data.netOccupaintLoad}" style="width:50px;"/>OLF: 300</td>
                                                <td><select name="drawingtype" class=" form-select form-select-lg" style="width:100px;">
												<option value="0" <c:if test="${data.nextComponentWithPath == '0' } ">selected</c:if> > Spaces</option>
												<option value="1" <c:if test="${data.nextComponentWithPath == '1' }">selected</c:if> > Corridors </option>
												<option value="2" <c:if test="${data.nextComponentWithPath == '2' } ">selected</c:if> >Exits & Stairways</option>
												<a href="#" >123</a>
												
											</select></td>
											
												</div>
									<!-- 		 <td style="display:none;">old</td>	 -->
                                            </tr>  
                                           </c:forEach>
                                        </tbody>
                                    </table>
									<div  class="offset-md-3 col-md-2"><a style=" color:#ffbe0b !important;" id ="addrow" class="btn  btn-sm pull-left" href="javascript:addRowFun();">+ Add Space</a></div>
									<div class="clearfix"></div>
										<div class="row">
										<div class="offset-md-3 col-md-7">
									<form class="form-horizontal">
								
<fieldset>

<!-- Form Name -->
<h5 style="margin-top:20px;">CORRIDORS</h5>
		
		 <table class="table">
		 <c:forEach var="corridorData" items="${corridorData}">
		 	<c:forEach var = "cdata" items = "${corridorData.bList}">
		       <tr id="corridors">
		           <td><input id="textinput" value="${cdata.corridor}" name="textinput" type="text" placeholder="Unnamed Corridor" class="form-control input-md"></td>
		           <td align="right">  <select name=UnnamedExit" class=" form-control input-md" value="${cdata.corridorSpace}">
		             <option value="0" <c:if test="${cdata.corridorSpace == '0' } ">selected</c:if>>Spaces</option>
		    <option value="1" <c:if test="${cdata.corridorSpace == '0' } ">selected</c:if>>Corridors </option>
		    <option value="2" <c:if test="${cdata.corridorSpace == '0' } ">selected</c:if>>Stairways</option>
		    <option value="3" <c:if test="${cdata.corridorSpace == '0' } ">selected</c:if>>Exits</option>              
			</select></td>
		<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeCorridor(this)"/></td>
		                        </tr>
		    </c:forEach>
		 </c:forEach>
</table>
		</fieldset>
		  <button style="margin-top:5px; color:#ffbe0b !important;" id="addcorridor" class="btn  btn-sm  add-more button-yellow uppercase" type="button">+ Add Corridor </button> 
		  </form>
		  
		   </div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="offset-md-3 col-md-7">
					<form class="form-horizontal">
												
						<fieldset>	
								
						<!-- Form Name -->
						<h5 style="margin-top:20px;">STAIRWAYS</h5>
						
							 <table class="table">
							 <c:forEach var="stairwaysData" items="${stairwaysData}">
		 						<c:forEach var = "sdata" items = "${stairwaysData.bList}">
						        <tr id="stairways">
									<td><input id="textinput2" name="textinput2" type="text" placeholder="Stairways" value="${sdata.stairway}" class="form-control input-md"></td>
									<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeStairways(this)"/></td>
								</tr>
								</c:forEach>
							</c:forEach>
							</table>
						</fieldset>
					</form>
				
				<button style="margin-top:5px; color:#ffbe0b !important;" id="stairsadd" class="btn btn-sm  add-more button-yellow uppercase" type="button">+ Add Stairway </button> 
				</div>
			</div>
			
			
			
			<div class="clearfix"></div>
										<div class="row">
													<div class="offset-md-3 col-md-7">
												<form class="form-horizontal">
											
			<fieldset>
			
			<!-- Form Name -->
			<h5 style="margin-top:20px;">EXITS
			</h5>
			
			 <table class="table">
                    <tbody>
                    <c:forEach var="exitData" items="${exitData}">
		 						<c:forEach var = "edata" items = "${exitData.bList}">
		                        	<tr id="exits">
		                            <td><input id="textinput2" name="textinput2" type="text" value="${edata.exit}" placeholder="Unnamed Exit" class="form-control input-md"></td>
		   							<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeExits(this)"/></td>
		                            </tr>
                          </c:forEach>
                    </c:forEach>
            </table>
			</fieldset>
			
			<button style="margin-top:5px; color:#ffbe0b !important;" id="exitadd" class="btn btn-sm  add-more button-yellow uppercase" type="button">+ Add Exit </button> 
			</form>
			</div>
			</div>
			
			</div>
			</div>	
		
 <button style="margin-top:5px; color:#ffbe0b !important;" id="flooradd" onclick= "addFloorFun(${floorNo});" class="btn btn-sm  add-more button-yellow uppercase" type="button">+ Add Floor </button>	


  <div class="col-xl-12 ">
      <p class="pull-left" style="color:#ccc;">Note: Some questions within this group are not relevant because of your answers to other questions and are not shown.</p>
      <button class="btn btn-sm btn-warning pull-right"  data-toggle="modal" data-target="#Feedback" style="margin-top:20px;">Give a Feedback</button>
  </div> 
</div>
 </div>
      
    </div>
                                           </c:forEach>
<!--  End of dynamic block -->
			