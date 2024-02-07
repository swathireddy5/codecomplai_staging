<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>

 						<div class="col-lg-12"> 
                        <div class="card">
                          <h5 class="card-header">General Building Information</h5>
                          <div class="card-body">
                            <h4 class="card-title">Basic Life Safety</h4>
                            <div class="row my-4">
                              <div class="col-lg-4">
                                <div class="mb-4 mb-lg-0">
                                  <label class="form-label">What type of building sprinkler system is present?</label>
                                  <c:if test="${sprinklertype != null}" >
									<select id="sprinklertype" name="drawingtype" class="form-select">
									       
									       <option value="nfpa13" <c:if test="${sprinklertype == 'nfpa13'}">selected</c:if>>NFPA 13</option>
									
									<option value="nfpa13R" <c:if test="${sprinklertype == 'nfpa13R'}">selected</c:if>>NFPA 13R</option>
									
									<option value="nfpa13D" <c:if test="${sprinklertype == 'nfpa13D'}">selected</c:if>>NFPA 13D</option>
									
									<option value="not_sprinklered" <c:if test="${sprinklertype == 'Not sprinklered'}">selected</c:if>>Not sprinklered</option>
																
									</select>
									</c:if>
									<c:if test="${sprinklertype == null}" >
									<select id="sprinklertype" name="drawingtype" class="form-select">
									       
									       <option value="nfpa13" selected>NFPA 13</option>
									       
									       <option value="nfpa13R">NFPA 13R</option>
									       
									       <option value="nfpa13D">NFPA 13D</option>
									       
									       <option value="not_sprinklered">Not sprinklered</option>
																
									</select>
									</c:if>
                                </div>
                              </div>
                              <div class="col-lg-4">
                                <div class="mb-4 mb-lg-0">
                                  <label class="form-label">What is the type of construction of the building?</label>
                                  <c:if test="${constructiontype != null}" >
										<select id="constructiontype" name="drawingtype" class="form-select">
		                                    <option value="IA" <c:if test="${constructiontype == 'IA'}">selected</c:if>>IA</option>
						        
									        <option value="IB" <c:if test="${constructiontype == 'IB'}">selected</c:if>>IB</option>
									        
									        <option value="IIA" <c:if test="${constructiontype == 'IIA'}">selected</c:if>>IIA</option>
									        
									        <option value="IIB" <c:if test="${constructiontype == 'IIB'}">selected</c:if>>IIB</option>
                                  		</select>
								</c:if>
								<c:if test="${constructiontype == null}" >
									<select id="constructiontype" name="drawingtype" class="form-select">
								        <option value="IA" selected>IA</option>
				        
										<option value="IB">IB</option>
				        
										<option value="IIA">IIA</option>
				        
										<option value="IIB">IIB</option>
																
									</select>
								</c:if>
                                </div>
                              </div>
                              <div class="col-lg-4">
                                <div class="mb-4 mb-lg-0">
                                  <label class="form-label">Is this building considered new or existing construction?</label>
                                  <c:if test="${neworexistingbuild != null}" >
	                                  <select id="neworexistingbuild" name="drawingtype" class="form-select">
	                                    <option value="new" <c:if test="${neworexistingbuild == 'new'}">selected</c:if>>New</option>
										<option value="existing" <c:if test="${neworexistingbuild == 'existing'}">selected</c:if>>Existing</option>
	                                  </select>
                                  </c:if>
                                  <c:if test="${neworexistingbuild == null}" >
                                  	<select id="neworexistingbuild" name="drawingtype" class="form-select">
	                                    <option value="new">New</option>
										<option value="existing">Existing</option>
	                                  </select>
                                  </c:if>
                                </div>
                              </div>
                            </div>
                            <!-- <a href="#" class="btn btn-primary">Give a Feedback</a>  -->
                            </div>
                        </div>
                      </div>  

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/buildingdata.js"></script>