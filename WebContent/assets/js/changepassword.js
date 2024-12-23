 function Validate() {
	var password = document.getElementById("newpassword").value;
    var confirmPassword = document.getElementById("confirmpassword").value;
    if (password != confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    return true;
}
		    
		    
function checkPasswordStrength() {
    const passwordInput = document.getElementById("newpassword").value;
    const strengthIndicator = document.getElementById("password-strength");
    const strongPasswordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
    
    if (passwordInput.length === 0) {
        strengthIndicator.textContent = "";
        return;
    }

    if (strongPasswordPattern.test(passwordInput)) {
        strengthIndicator.style.color = "green";
        strengthIndicator.textContent = "Strong password!";
    } else if (passwordInput.length >= 6) {
        strengthIndicator.style.color = "orange";
        strengthIndicator.textContent = "Moderate password. Try adding special characters and numbers.";
    } else {
        strengthIndicator.style.color = "red";
        strengthIndicator.textContent = "Weak password. Must be at least 8 characters long.";
    }
}