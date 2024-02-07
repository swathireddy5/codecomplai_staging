<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>

  <div class="col-lg-12">
	<div id="floorrow" class="row">				  
		 <div class="card-body">
                         <div class="dropdown float-end">
                             <button id ="addrow" href="javascript:addRowFun();" type="button" class="btn btn-sm btn-primary waves-effect waves-light m-2"> Add Space <i class="ri-add-box-line align-middle ms-2"></i> </button>
                         </div>

                         <h5 class="card-header">Building Composition</h5>
                          
							
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table table-hover mb-0">
                                <thead>
                                  <tr>
                                    <th>Floor</th>
                                    <th>Story Height</th>
                                    <th>Space Name</th>
                                    <th>Occupancy</th>
                                    <th>Function of Space</th>
                                    <th>Gross</th>
                                    <th>Net</th>
                                    <th>Occupant Load</th>
                                    <th>Next Component along with Path</th>
                                  </tr>
                                </thead>
                                <tbody>
                                 
                                  <tr id="row">
                                    <td scope="row">${floorNo}</td>
                                    <td><input type="text" placeholder="ft" value="" class="form-control form-control-sm w-100"></td>
                                    <td><input type="text" value="" class="form-control form-control-sm w-100">
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="customCheck1" checked>
                                        <label class="form-check-label font-size-12" for="customCheck1"> Accessory occupancy </label>
                                      </div></td>
                                    <td><select class="form-control-sm w-100">
                                        <option value="0" selected>A-1</option>
                                        <option value="1">A-2</option>
                                        <option value="2">A-3</option>
                                        <option value="3">A-4</option>
                                      </select></td>
                                    <td><select class="form-control-sm w-100" >
                                        <option value="accessory_storage_areas_mechanical_equipment_room"> Accessory storage areas, mechanical equipment room </option>
                                        <option value="agricultural_building"> Agricultural building </option>
                                        <option value="aircraft_hangars"> Aircraft hangars </option>
                                        <option value="airport_terminal"> Airport: Airport terminal </option>
                                        <option value="baggage_claim"> Airport: Baggage claim </option>
                                        <option value="baggage_handling"> Airport: Baggage handling </option>
                                        <option value="concourses"> Airport: Concourses </option>
                                        <option value="waiting_areas"> Airport: Waiting areas </option>
                                        <option value="concentrated_chairs_only_not_fixed"> Assembly without fixed seats: Concentrated assembly (chairs only â€” not fixed) </option>
                                        <option value="standing_space"> Assembly without fixed seats: Standing space </option>
                                        <option value="unconcentrated_tables_and_chairs"> Assembly without fixed seats: Unconcentrated assembly (tables and chairs) </option>
                                        <option value="assembly_with_fixed_seats"> Assembly: Assembly with fixed seats </option>
                                        <option value="exhibit_gallery_and_museum"> Assembly: Exhibit gallery and museum </option>
                                        <option value="gaming_floors_keno_slots_etc"> Assembly: Gaming floors (keno, slots, etc.) </option>
                                        <option value="bowling_centers"> Bowling centers </option>
                                        <option value="business_areas"> Business: Business areas </option>
                                        <option value="concentrated_business_use_areas"> Business: Concentrated business use areas </option>
                                        <option value="courtrooms_other_than_fixed_seating_areas"> Courtrooms â€” other than fixed seating areas </option>
                                        <option value="day_care"> Day care </option>
                                        <option value="dormitories"> Dormitories </option>
                                        <option value="classroom_area"> Educational: Classroom area </option>
                                        <option value="shops_and_other_vocational_room_areas"> Educational: Shops and other vocational room areas </option>
                                        <option value="exercise_rooms"> Exercise rooms </option>
                                        <option value="group_h_5_fabrication_and_manufacturing_areas"> Group H-5 fabrication and manufacturing areas </option>
                                        <option value="industrial_areas"> Industrial areas </option>
                                        <option value="inpatient_treatment_areas"> Institutional areas: Inpatient treatment areas </option>
                                        <option value="outpatient_areas"> Institutional areas: Outpatient areas </option>
                                        <option value="sleeping_areas"> Institutional areas: Sleeping areas </option>
                                        <option value="kitchens_commercial"> Kitchens, commercial </option>
                                        <option value="laboratory_suite"> Laboratory: Laboratory suite </option>
                                        <option value="laboratory_educational"> Laboratory: Laboratory, educational (K-12th grade) </option>
                                        <option value="laboratory_non_educational"> Laboratory: Laboratory, non-educational </option>
                                        <option value="reading_rooms"> Library: Reading rooms </option>
                                        <option value="stack_area"> Library: Stack area </option>
                                        <option value="locker_rooms"> Locker rooms </option>
                                        <option value="mall_buildings_covered_and_open"> Mall buildings â€” covered and open </option>
                                        <option value="mercantile"> Mercantile </option>
                                        <option value="mercantile_storage_stock_shipping_areas"> Mercantile storage, stock, shipping areas </option>
                                        <option value="other"> Other </option>
                                        <option value="parking_garages"> Parking garages </option>
                                        <option value="residential"> Residential </option>
                                        <option value="rink_and_pool"> Skating rinks or swimming pools: Rink and pool </option>
                                        <option value="decks"> Skating rinks,swimming pools: Decks </option>
                                        <option value="stages_and_platforms"> Stages and platforms </option>
                                        <option value="warehouses"> Warehouses </option>
                                      </select></td>
                                    <td><input type="text" value="10000" class="form-control form-control-sm w-100"></td>
                                    <td></td>
                                    <td><input type="text" value="34" class="form-control form-control-sm w-100">OLF: 300</td>
                                    <td><select name="drawingtype"  class="form-control form-control-sm w-100">
                                        <option value="0"> Spaces</option>
                                        <option value="1"> Corridors </option>
                                        <option value="2">Exits &amp; Stairways</option>
                                      </select></td>
                                    <td><input type="text" value="10000" class="form-control form-control-sm w-100"/></td>
                                    <td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeRow()"/></td>
                                  </tr>
                                </tbody>
                              </table>                             
                            
                            </div>
                          </div>
                        </div>
					  
					  
					  <div class="card-body">
                           <div class="dropdown float-end">
                               <button id="addcorridor" type="button" class="btn btn-sm btn-primary waves-effect waves-light m-2">Add Corrodors <i class="ri-add-box-line align-middle ms-2"></i> </button>
                           </div>

                           <h5 class="card-header">CORRIDORS</h5>
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table table-hover mb-0">                                
                                <tbody>
                                  <tr id="corridors">
                                    <td><input id="textinput" name="textinput" type="text" placeholder="Unnamed Corridor" class="form-control input-md"></td>
									<td align="right">
										<select name="drawingtype" class=" form-control input-md">
											<option value="0">Spaces</option>
											<option value="1">Corridors </option>
											<option value="2">Stairways</option>
											<option value="3">Exits</option>
										</select>
									</td>
									<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeCorridor(this)"/></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
					  
					  <div class="card-body">
                           <div class="dropdown float-end">
                               <button id="stairsadd" type="button" class="btn btn-sm btn-primary waves-effect waves-light m-2">Add Stairways <i class="ri-add-box-line align-middle ms-2"></i> </button>
                           </div>
                           <h5 class="card-header">STAIRWAYS</h5>
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table table-hover mb-0">
                                <tbody>
                                  <tr id="stairways">
									<td><input id="textinput2" name="textinput2" type="text" placeholder="Stairways" class="form-control input-md"></td>
									<td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeStairways(this)"/></td>
								  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                      </div>
			  
			  <div class="card-body">
                   <div class="dropdown float-end">
                       <button id="exitadd" type="button" class="btn btn-sm btn-primary waves-effect waves-light m-2">Add Exits  <i class="ri-add-box-line align-middle ms-2"></i> </button>
                   </div>
                   <h5 class="card-header">EXITS</h5>
                   <div class="card-body">
                     <div class="table-responsive">
                       <table class="table table-hover mb-0">
                         <tbody>
                           <tr id="exits">
                              <td><input id="textinput3" name="textinput3" type="text" placeholder="Unnamed Exit" class="form-control input-md"></td>
     						 <td><img src="assets/images/close_out.svg" alt="android-complai" onclick="javascript:removeExits(this)"/></td>
                           </tr>
                         </tbody>
                       </table>
                       </div>
                   </div>
              </div>			  
	   <center>
	     <button type="button" class="btn btn-lg btn-dark waves-effect waves-light mt-4" id="flooradd" onclick= "addFloorFun(${floorNo});"> Add Floor <i class=" ri-play-list-add-line align-middle ms-2"></i> </button>
	     <p class="mt-3">Note:<em> Some questions within this group are not relevant because of your answers to other questions and are not shown.</em></p>
	   </center>
	</div>
</div>
<!-- <ul class="pager wizard twitter-bs-wizard-pager-link">
  <li class="previous"><a href="#">Previous</a></li>
  <li class="next"><a href="javascript:heightandareas();">Next</a></li>
</ul> -->

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/buildingdata.js"></script>