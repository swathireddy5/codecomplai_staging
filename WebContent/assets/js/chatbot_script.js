const chatbotToggler = document.querySelector(".chatbot-toggler");
const closeBtn = document.querySelector(".close-btn");
const chatbox = document.querySelector(".chatbox");
const chatInput = document.querySelector(".chat-input textarea");
const sendChatBtn = document.querySelector(".chat-input span");

let userMessage = null; // Variable to store user's message
let questionCount = 0; 
//const API_KEY = "hGGKh8omXf1n1jOurGgCT3BlbkFJMcjEFjfjMUIMtO3X80dl"; // Paste your API key here
const inputInitHeight = chatInput.scrollHeight;
let randomImage = new Image();
randomImage.src = "assets/images/hglass1.png";
randomImage.alt = "Fetching information...";
let state_chatbot = null;
let year_chatbot = null;

const welcomeresponse = {
		"hi, hello, what, how": "Please enter the statename to start",
		"state": "Please enter the statename to start",
		"year" : "Please select the year for the state"
};

const createChatLi = (message, className) => {
    // Create a chat <li> element with passed message and className
    const chatLi = document.createElement("li");
    chatLi.classList.add("chat", `${className}`);
    let chatContent = className === "outgoing" ? `<p></p>` : `<span class="material-symbols-outlined">bot</span><p></p>`;
    chatLi.innerHTML = chatContent;
    chatLi.querySelector("p").textContent = message;
    return chatLi; // return chat <li> element
}

const generateResponse = (chatbox,chatElement,userMessage,state_chatbot) => {
	//const API_URL = "https://api.openai.com/v1/chat/completions";
	/*
	
	const API_URL = "/codecompilance/getChatbotCall";
    const messageElement = chatElement.querySelector("p");
    alert(messageElement);
    
    // Define the properties and message for the API request
    const requestOptions = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"                     	
        },
        body: JSON.stringify({
            //model: "gpt-3.5-turbo",
            messages: [{"query" : "What is SFRM? "}],
        })
    }
    alert("requestOptions-->"+requestOptions);
    // Send POST request to API, get response and set the reponse as paragraph text
    fetch(API_URL, requestOptions).then(res => res.json()).then(data => {
        messageElement.textContent = data.choices[0].message.content.trim();
    }).catch(() => {
        messageElement.classList.add("error");
        messageElement.textContent = "Something went wrong. Please try again test.";
    }).finally(() => chatbox.scrollTo(0, chatbox.scrollHeight));
    
	*/	
    const messageElement = chatElement.querySelector("p");
    //alert(messageElement);
    
    URL = "/codecompilance/getChatbotCall";
    //var datajson = "What is SFRM? ";
    var datajson = state_chatbot+"_"+userMessage;

  	$.ajax({
			type: "POST",
			async: false,
			url : URL,
			data: datajson,
			contentType : 'application/json; charset=utf-8',
			dataType: 'text',
			success: function (response) {
	 			console.log("response -->"+response);
	 			messageElement.textContent = "";
	 			chatbox.removeChild(randomImage);
	 			
	 			for (let i = 0; i < response.length; i++) {
	 			  setTimeout(() => {
	 				 messageElement.innerHTML += response[i];
	 				 if(response[i] == "."){
	 					 messageElement.innerHTML += "<br/>";
	 				  }
	 			  }, i * 20);
	 			}
				chatbox.scrollTo(0, chatbox.scrollHeight);
				$('#chatbox').insertAfter(chatbox.eq(chatbox.length - 1));
			},
	 		error: function (xhr, ajaxOptions, thrownError) {
	 	       console.log("error response -->"+thrownError);
	 	      }
        });
    
}


const getStates = (chatbox,chatElement,userMessage) => {
	const messageElement = chatElement.querySelector("p");
     URL = "/codecompilance/getStates?state="+userMessage;
    //var datajson = "What is SFRM? ";
    var state = userMessage;
    messageElement.textContent = "";
		
    $.ajax({
			type: "GET",
			async: false,
			url : URL,
			data: state,
			contentType : 'application/json; charset=utf-8',
			dataType: 'text',
			success: function (response) {
	 			console.log("response in getstates -->"+response);
	 			response = response.replace(/^\[(.+)\]$/,'$1');
	 			for (let i = 0; i < response.length; i++) {
	 			  setTimeout(() => {
	 				 messageElement.innerHTML += response[i];
	 				if(response[i] == ","){
	 					 messageElement.innerHTML += "<br/>";
	 				  }
	 			  }, i * 20);
	 			}
	 			chatbox.scrollTo(0, chatbox.scrollHeight);
	 		},
	 		error: function (xhr, ajaxOptions, thrownError) {
	 	       console.log("error response -->"+thrownError);
	 	      }
        });  
}


const getBooksForStateYear = (chatbox,chatElement,userMessage,state_chatbot) => {
	const messageElement = chatElement.querySelector("p");
    //var datajson = "What is SFRM? ";
    var year = userMessage;
    messageElement.textContent = "";
	URL = "/codecompilance/getBooksForStateYear?state="+state_chatbot+"&year="+userMessage;
    $.ajax({
			type: "GET",
			async: false,
			url : URL,
			data: year,state_chatbot,
			contentType : 'application/json; charset=utf-8',
			dataType: 'text',
			success: function (response) {
	 			console.log("response in getBooksForStateYear -->"+response);
	 			response = response.replace(/^\[(.+)\]$/,'$1');
	 			for (let i = 0; i < response.length; i++) {
	 			  setTimeout(() => {
	 				messageElement.innerHTML += response[i];
	 				if(response[i] == ","){
	 					 messageElement.innerHTML += "<br/>";
	 				  }
	 			  }, i * 20);
	 			}
	 			
	 			chatbox.scrollTo(0, chatbox.scrollHeight);
	 		},
	 		error: function (xhr, ajaxOptions, thrownError) {
	 	       console.log("error response -->"+thrownError);
	 	      }
        });  
}


const handleChat = () => {
    userMessage = chatInput.value.trim(); // Get user entered message and remove extra whitespace
    if(!userMessage) return;
    // Clear the input textarea and set its height to default
    chatInput.value = "";
    chatInput.style.height = `${inputInitHeight}px`;
    //alert("userMessage"+userMessage);
    // Append the user's message to the chatbox
    chatbox.appendChild(createChatLi(userMessage, "outgoing"));
    chatbox.scrollTo(0, chatbox.scrollHeight);
    const incomingChatLi = createChatLi("Fetching information...", "incoming");
    chatbox.appendChild(incomingChatLi);
    chatbox.appendChild(randomImage);
    //setTimeout(() => {
        // Display "Thinking..." message while waiting for the response
        //const incomingChatLi = createChatLi("Thinking...", "incoming");
        //chatbox.appendChild(incomingChatLi);
    	
    	/*const botResponse = chatbot(userMessage);
    	incomingChatLi.querySelector("p").textContent = botResponse; */
	//if(questionCount < 3){
		/*if(questionCount == 0){
			//chatbox.removeChild(incomingChatLi);
			chatbox.removeChild(randomImage);
			//alert("please enter state");
			incomingChatLi.querySelector("p").textContent = "please enter state";
		}*/
		if(questionCount == 0){
			chatbox.removeChild(randomImage);
			//getStates(chatbox,incomingChatLi,userMessage);
			state_chatbot = userMessage;
			incomingChatLi.querySelector("p").textContent = "Please ask the Query/Question:\n";
			//alert("select the year from the given list ");
 			chatbox.scrollTo(0, chatbox.scrollHeight);
		}
		/*if(questionCount == 1){
			chatbox.removeChild(randomImage);
			year_chatbot = userMessage;
			getBooksForStateYear(chatbox,incomingChatLi,userMessage,state_chatbot);
			//incomingChatLi.querySelector("p").textContent = "Please ask your Question/Query";
			incomingChatLi.querySelector("p").textContent = "Here is the list of collections for the selected state and year-\n Please ask your Query/Question \n";
			//alert("select the year from the given list ");
 			chatbox.scrollTo(0, chatbox.scrollHeight);
		} */
		
		if(questionCount >= 1){	
			chatbox.appendChild(randomImage);
        	generateResponse(chatbox,incomingChatLi,userMessage,state_chatbot);
		}

        	chatbox.scrollTo(0, chatbox.scrollHeight);
        	questionCount++;
        	chatbox.scrollTo(0, chatbox.scrollHeight);
        /*}
        else{
        	incomingChatLi.querySelector("p").textContent = "Sorry, you have reached the maximum question limit. Please Signup for further assistance.";
        	chatbox.removeChild(randomImage);
        	chatInput.disabled = true;
        }*/
    //}, 10);
    
}

function chatbot(userMessage) {
	userMessage = userMessage.toLowerCase(); // Convert input to lowercase for case insensitivity
	for (const key in welcomeresponse) {
	  if (userMessage.includes(key)) {
	    return welcomeresponse[key];
	  }
	}
	return "I'm sorry, I don't understand. Please ask another question.";
}

chatInput.addEventListener("input", () => {
    // Adjust the height of the input textarea based on its content
    chatInput.style.height = `${inputInitHeight}px`;
    chatInput.style.height = `${chatInput.scrollHeight}px`;
});

chatInput.addEventListener("keydown", (e) => {
    // If Enter key is pressed without Shift key and the window 
    // width is greater than 800px, handle the chat
    if(e.key === "Enter" && !e.shiftKey && window.innerWidth > 800) {
        e.preventDefault();
        handleChat();
    }
});

sendChatBtn.addEventListener("click", handleChat);
closeBtn.addEventListener("click", () => {
	//chatbox.innerHTML = "";
	location.reload(true);
	document.body.classList.remove("show-chatbot");
	});
chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));

