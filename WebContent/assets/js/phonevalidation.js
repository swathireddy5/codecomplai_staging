// Function to format phone number as the user types
function formatPhoneNumber(input) {
  let phoneNumber = input.value.replace(/[^\d]/g, ''); // Remove non-numeric characters

  // Validate the phone number format using regex
  const phoneRegex = /^(\+1\s?)?(\([2-9]{1}[0-9]{2}\)\s?|\d{3}-)\d{3}-\d{4}$/;

  // Show or hide error message based on validity
  const errorMessage = document.getElementById('error');
  if (phoneNumber.length === 10 && /^[2-9]/.test(phoneNumber[0])) {
    // Valid phone number, format it and hide the error
    input.value = formatAsPhoneNumber(phoneNumber);
    errorMessage.style.display = 'none';
  } else {
    // Invalid phone number, show the error
    errorMessage.style.display = 'block';
  }
}

// Function to format the phone number as (XXX) XXX-XXXX
function formatAsPhoneNumber(number) {
  if (number.length < 4) return number;
  if (number.length < 7) return `(${number.slice(0, 3)}) ${number.slice(3)}`;
  return `(${number.slice(0, 3)}) ${number.slice(3, 6)}-${number.slice(6, 10)}`;
}