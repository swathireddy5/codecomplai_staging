<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>View Comments</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />	
		<link rel="stylesheet" href="assets/css/chatbot_style.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    	<script src="assets/js/chatbot_script.js" defer></script>
    </head>

    <body data-sidebar="dark">
    
   <button class="chatbot-toggler">
      <span class="material-symbols-rounded">mode_comment</span>
      <span class="material-symbols-outlined">close</span>
    </button>
    <div class="chatbot" style="z-index:9999; height:650px">
      <header>
      <input type="hidden" id='siteurl' name="siteurl" value="${siteurl}"/>
        <h2>Chatbot</h2>
        <span class="close-btn material-symbols-outlined">close</span>
      </header>
      <div>
      <ul id= "chatbox" class="chatbox">
        <li class="chat incoming" tabindex="-1">
          <span class="material-symbols-outlined">smart_toy</span>
          <p tabindex='1'>Hi there 👋<br> Please enter the state name to start</p>
        </li>        
      </ul>
      
      </div>
      <div class="chat-input">
        <textarea id="message" placeholder="Enter a message..." spellcheck="false" required autofocus="autofocus"></textarea>
        <span id="send-btn" class="material-symbols-rounded">send</span>
      </div>
    </div>
<script>

//jQuery('ul').animate({scrollTop: jQuery('.scrolltome').offset().top}, "slow");
  
const element = document.getElementById("chat incoming");

</script>

    </body>
</html>
