/** created on 12-08-2021 
 * 
 */

//var floorCount = 1;
var cloneCount = 1;
function addRowFun(){
	 //   $("#addrow").click(function () {
    console.log('adding romw here.');
     a = $('#row')
      .clone(true);
     if(a[0].getElementsByTagName("td").length > 8){
     a[0].getElementsByTagName("td")[0].replaceChildren("");
     a[0].getElementsByTagName("td")[1].replaceChildren("");
     }
 //    a[0].querySelector("tr td").replaceChildren(floorCount);
     
     a.attr('id', 'row' + cloneCount++, 'class', 'row')
    .insertAfter('[id^=row]:last');
     /* 
     a[0].querySelector("tr td").replaceChildren(floorCount);
      
      a.attr('id', 'row' + cloneCount++, 'class', 'row')
     .insertAfter('[id^=row]:last'); */
      return false;
	    
	    }
function addFloorFun(floorNo){
	floorCount = floorNo;
	console.log('Adding a floor here');
    var div = document.getElementById('floorrow');
    cloneDiv = div.cloneNode(true);      
    c =cloneDiv.querySelector(".table tbody").getElementsByTagName("tr")
    cLen = c.length;
    if(cLen > 1){
    	var i =1;
    	while(i<c.length){
    		cloneDiv.querySelector(".table tbody").getElementsByTagName("tr")[i].replaceWith("");
    	}
    /* 	for(i=1;i<cLen;i++){ 
    		cloneDiv.querySelector(".table tbody").getElementsByTagName("tr")[i].replaceWith(""); 
    		} */
    	}
    URL = "/codecompilance/incrementFloorNo";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify({"floorNo": floorNo } ),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("floorNo...");
console.log(response.floorNo);
cloneDiv.querySelector(".table tbody tr#row td").replaceChildren(response.floorNo);
cloneDiv.id = 'floorrow'+cloneCount++;
$('#floorrow').after(cloneDiv);	
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
   
}

function buildingdata(){
	
	output = {}
	output = processBuildFields();
	
	 URL = "/codecompilance/beforebuildingdata";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
}

function saveprojectbuildingdata(){
	output = {}
	output = processBuildingData();	
	
	 URL = "/codecompilance/createBuildingComp";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
});	
}

function projectdetails(){
	output = {}
	output = processBuildFields();	
	
	 URL = "/codecompilance/createBuildingComp";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
});	
}

function egress(){
	output = {}
	output = processBuildFields();
	
	URL = "/codecompilance/beforeegress";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
				console.log("Success...");
				console.log(response.outputPage);
				window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
});
}


function processBuildingData(){
	output = {}
	jsonObj = [];
	CorridorJsonObj = [];
	StairwaysJsonObj = [];
	ExitJsonObj = [];
	WallJsonObj = [];
	var floorIndex = null;
	var spaceHeight = null;
	
	var array = $('.table tbody tr').toArray();
	
	for (var i = 0; i < array.length; i++) {
	rowName = array[i].id;
	rowIndex = rowName.indexOf("row");
	if(rowName.includes("row")){
		trow = array[i].children;
		item = {}
        item ["floor"] = trow[0].innerText != ""? trow[0].innerText : floorIndex;
        floorIndex = item ["floor"]; 
        item ["storyHeight"] = trow[1].firstElementChild? trow[1].firstElementChild.value: spaceHeight;
        spaceHeight =  item ["storyHeight"];
        item ["floor"] = trow[0].innerText != ""? trow[0].innerText : "";
        item ["storyHeight"] = trow[1].firstElementChild? trow[1].firstElementChild.value: "";
        item ["spaceName"] = trow[2].firstElementChild.value;
        item ["occupancy"] = trow[3].firstElementChild.value;
        item ["functionOfSpace"] = trow[4].firstElementChild.value;
        item ["gross"] = trow[5].firstElementChild.value;
        item ["netOccupaintLoad"] = trow[7].firstElementChild.value;
        item ["nextComponentWithPath"] = trow[8].firstElementChild.value;
      //  item["type"] =  trow[9].innerText;
        jsonObj.push(item);
        
	} else if(rowName.includes("corridors")){
		trow = array[i].children;
		item = {};
		//alert("corridors-->"+rowName);
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["corridor"] = trow[0].firstElementChild.value;
        item ["corridorSpace"] = trow[1].firstElementChild? trow[1].firstElementChild.value: "";
        CorridorJsonObj.push(item);
        
	} else if(rowName.includes("stairways")){
		//alert("stairways-->"+rowName);
		trow = array[i].children;
		item = {};
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["stairway"] = trow[0].firstElementChild.value;
		StairwaysJsonObj.push(item);
		
	} else if(rowName.includes("exits")){
		//alert("exits-->"+rowName);
		trow = array[i].children;
		item = {};
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["exit"] = trow[0].firstElementChild.value;
		ExitJsonObj.push(item);
		
	} else if(rowName.includes("wallsegment")){
		//alert("if row -->"+rowName);
		trow = array[i].children;
		item = {}
        item ["wallSegment"] =  trow[0].firstElementChild.value;
        item ["length"] = trow[1].firstElementChild.value;
        item ["wallFace"] = trow[2].firstElementChild.value;
        item ["wallDistFrom"] = trow[3].firstElementChild.value;
        item ["wallDistTo"] = trow[4].firstElementChild.value;
        item ["partyWall"] = trow[5].firstElementChild.value;
        WallJsonObj.push(item);
        
	}
}
		
	output["buildingComp"] = jsonObj;
	output["corridorDetails"] = CorridorJsonObj;
	output["stairwayDetails"] = StairwaysJsonObj;
	output["exitDetails"] = ExitJsonObj;
	output["wallSegmentDetails"] = WallJsonObj;
	
	console.log(JSON.stringify(output));
	//alert("output----->"+JSON.stringify(output));
	return output;
	  
}


function processBuildFields(){
	output = {}
	jsonObj = [];
	CorridorJsonObj = [];
	StairwaysJsonObj = [];
	ExitJsonObj = [];
	WallJsonObj = [];
	var floorIndex = null;
	var spaceHeight = null;
	
	var array = $('.table tbody tr').toArray();
	
	for (var i = 0; i < array.length; i++) {
	rowName = array[i].id;
	rowIndex = rowName.indexOf("row");
	if(rowName.includes("row")){
		trow = array[i].children;
		item = {}
        item ["floor"] = trow[0].innerText != ""? trow[0].innerText : floorIndex;
        floorIndex = item ["floor"]; 
        item ["storyHeight"] = trow[1].firstElementChild? trow[1].firstElementChild.value: spaceHeight;
        spaceHeight =  item ["storyHeight"];
        item ["floor"] = trow[0].innerText != ""? trow[0].innerText : "";
        item ["storyHeight"] = trow[1].firstElementChild? trow[1].firstElementChild.value: "";
        item ["spaceName"] = trow[2].firstElementChild.value;
        item ["occupancy"] = trow[3].firstElementChild.value;
        item ["functionOfSpace"] = trow[4].firstElementChild.value;
        item ["gross"] = trow[5].firstElementChild.value;
        item ["netOccupaintLoad"] = trow[7].firstElementChild.value;
        item ["nextComponentWithPath"] = trow[8].firstElementChild.value;
      //  item["type"] =  trow[9].innerText;
        jsonObj.push(item);
        
	} else if(rowName.includes("corridors")){
		trow = array[i].children;
		item = {};
		//alert("corridors-->"+rowName);
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["corridor"] = trow[0].firstElementChild.value;
        item ["corridorSpace"] = trow[1].firstElementChild? trow[1].firstElementChild.value: "";
        CorridorJsonObj.push(item);
        
	} else if(rowName.includes("stairways")){
		//alert("stairways-->"+rowName);
		trow = array[i].children;
		item = {};
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["stairway"] = trow[0].firstElementChild.value;
		StairwaysJsonObj.push(item);
		
	} else if(rowName.includes("exits")){
		//alert("exits-->"+rowName);
		trow = array[i].children;
		item = {};
		item ["floor"] = floorIndex;
        item ["storyHeight"] = spaceHeight;
		item ["exit"] = trow[0].firstElementChild.value;
		ExitJsonObj.push(item);
		
	} else if(rowName.includes("wallsegment")){
		//alert("if row -->"+rowName);
		trow = array[i].children;
		item = {}
        item ["wallSegment"] =  trow[0].firstElementChild.value;
        item ["length"] = trow[1].firstElementChild.value;
        item ["wallFace"] = trow[2].firstElementChild.value;
        item ["wallDistFrom"] = trow[3].firstElementChild.value;
        item ["wallDistTo"] = trow[4].firstElementChild.value;
        item ["partyWall"] = trow[5].firstElementChild.value;
        WallJsonObj.push(item);
        
	}
}
		
	output["buildingComp"] = jsonObj;
	output["corridorDetails"] = CorridorJsonObj;
	output["stairwayDetails"] = StairwaysJsonObj;
	output["exitDetails"] = ExitJsonObj;
	output["wallSegmentDetails"] = WallJsonObj;
	
	var sprinkler = $("#sprinklertype option:selected").text();
	output["sprinklertype"] = sprinkler;
	
	var constructiontype = $("#constructiontype option:selected").text();
	output["constructiontype"] = constructiontype;
	
	var neworexistingbuild = $("#neworexistingbuild option:selected").text();
	output["neworexistingbuild"] = neworexistingbuild;
	
	var avgheight = $("#avgHeight").val();
	output["avgHeight"] = avgheight;
	//var togglee = $("#togglebutton input[type='radio']:checked").val();
	
	var heightorarea = $("#heightOrArea option:selected").text();
	output["heightOrArea"] = heightorarea;
	
	var movieTheatre = $('input[name=movietheater]:checked').val();
	output["movieTheatre"] = movieTheatre;
	
	var entertainment = $('input[name=entertainment]:checked').val();
	output["entertainment"] = entertainment;
	
	var conStructure = $('input[name=conStructure]:checked').val();
	output["conStructure"] = conStructure;
	
	var extBalcony = $('input[name=extBalcony]:checked').val();
	output["extBalcony"] = extBalcony;
	
	var egressBalcony = $('input[name=egressBalcony]:checked').val();
	output["egressBalcony"] = egressBalcony;
	
	var roofPortionOccupiable = $('input[name=roofPortionOccupiable]:checked').val();
	output["roofPortionOccupiable"] = roofPortionOccupiable;
	
	var fireAlarm = $('input[name=fireAlarm]:checked').val();
	output["fireAlarm"] = fireAlarm;
	
	console.log(JSON.stringify(output));
	//alert("output----->"+JSON.stringify(output));
	return output;
	  
}

function heightandareas(){
	output = {}
	output = processBuildFields();
	
	 URL = "/codecompilance/beforeheightandareas";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
}

function fireratings(){
	output = {}
	output = processBuildFields();
	
	 URL = "/codecompilance/beforefireratings";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
}


function plumbing(){
	
	output = {}
	output = processBuildFields();
	
	 URL = "/codecompilance/beforeplumbing";
	$.ajax({
		type: "POST",
		 async: false,  
		url : URL,
		dataType : 'json',
	//	contentType : 'application/json',
		contentType : 'application/json; charset=utf-8',
	data: JSON.stringify(output),
// 	data: jsonObj,
		success : function(response){
			if(response != null && response !=""){
console.log("Success...");
console.log(response.outputPage);
window.location.href = response.outputPage;
			
			}
													
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
}); 
}

function toggle(button){
	  button.value = button.value == 'NO' ? 'YES' : 'NO';
	  //alert(button.value);
	  if(button.value == 'YES'){
		  this.className = "btn btn-sm btn-success active";
	  }
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


function removeRow(){
	$(this).closest("row").remove();	
}

function removeCorridor(remtr){
		
	while((remtr.nodeName.toLowerCase())!='tr')
        remtr = remtr.parentNode;

    remtr.parentNode.removeChild(remtr);
}


function removeStairways(remtr){
		
	while((remtr.nodeName.toLowerCase())!='tr')
        remtr = remtr.parentNode;

    remtr.parentNode.removeChild(remtr);
}


function removeExits(remtr){
		
	while((remtr.nodeName.toLowerCase())!='tr')
        remtr = remtr.parentNode;

    remtr.parentNode.removeChild(remtr);
}

function removewallsegment(remtr){
	
	while((remtr.nodeName.toLowerCase())!='tr')
        remtr = remtr.parentNode;

    remtr.parentNode.removeChild(remtr);
}

$("#addcorridor").click(function(){
    var cloneCount = 1;
    console.log('Add Corridor');
    $('#corridors')
      .clone(true)
      .attr('id', 'corridors' + cloneCount++, 'class', 'row')
     .insertAfter('[id^=corridors]:last');
      return false;
  });

  $("#stairsadd").click(function(){
  	var cloneCount = 1;
      console.log('Add Stairway');
      $('#stairways')
        .clone(true)
        .attr('id', 'stairways' + cloneCount++, 'class', 'row')
       .insertAfter('[id^=stairways]:last');
        return false;
  });
  
  $("#exitadd").click(function(){
     	var cloneCount = 1;
         console.log('Add Stairway');
         $('#exits')
           .clone(true)
           .attr('id', 'exits' + cloneCount++, 'class', 'row')
          .insertAfter('[id^=exits]:last');
           return false;
  });
  
  
  $("#addwallsegment").click(function(){
	  	var cloneCount = 1;
	      console.log('Add wall segment');
	      $('#wallsegment')
	        .clone(true)
	        .attr('id', 'wallsegment' + cloneCount++, 'class', 'row')
	       .insertAfter('[id^=wallsegment]:last');
	        return false;
	  });