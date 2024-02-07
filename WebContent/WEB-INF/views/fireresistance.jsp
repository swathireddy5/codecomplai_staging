<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="card">
    <h5 class="card-header">Fire Safety</h5>
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
          <div>
            <h5 class="font-size-14 mb-0">Is the building equipped with a fire alarm system?</h5>
            <p class="mt-0">Note:<em> Note: Some questions within this group are not relevant because of your answers to other questions and are not shown.</em></p>
            <div class="form-check mb-3">
              <input class="form-check-input" type="radio" name="formRadios" checked>
              <label class="form-check-label" for="formRadios1"> YES </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="formRadios" >
              <label class="form-check-label" for="formRadios2"> No </label>
            </div>
          </div>
          <button type="button" class="btn btn-primary btn-sm waves-effect waves-light float-end">Give a Feedback</button>
        </div>
      </div>
    </div>
</div>