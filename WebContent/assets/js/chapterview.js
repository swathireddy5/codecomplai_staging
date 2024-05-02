function getChapterDetails(stateId, bookId, chapterId, subChapterId){
	//alert("inside "+subChapterId);
	console.log("getBookDetails bookId -->"+bookId);
    URL = "/"+$('#siteurl').val()+"/getBookDetails?bookId="+bookId+"&stateId="+stateId+"&chapterId="+chapterId;
	$.ajax({
		type: "GET",
		async: false,  
		url : URL,
		success : function(response){
			if(response != null && response !=""){
				console.log("response.outputPage"+response);
				$("#myDiv0").load(" #myDiv0");
				$("#booktitleDiv").focus();
				$('a[href='+subChapterId+']').focus();
				//$('#'+subChapterId).attr('tabindex',-1).focus();
				//$('a[href$='+subChapterId+']').focus();
			}							
	},
	 error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        }
    
	});
	
}