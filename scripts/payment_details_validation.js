function validateForm() {
    // Clear previous error messages
    document.getElementById("nameError").textContent = "";
    document.getElementById("emailError").textContent = "";
    document.getElementById("contactNumberError").textContent = "";
    document.getElementById("paymentMethodError").textContent = "";

    // Validate each field
    chkName({ currentTarget: document.getElementById("name") });
    chkEmail({ currentTarget: document.getElementById("email") });
    chkContactNumber({ currentTarget: document.getElementById("contact") });
    chkPaymentMethod({ currentTarget: document.getElementsByName("payment-method") });

    // Check if any error messages are present
    const nameError = document.getElementById("nameError").textContent;
    const emailError = document.getElementById("emailError").textContent;
    const contactNumberError = document.getElementById("contactNumberError").textContent;
    const paymentMethodError = document.getElementById("paymentMethodError").textContent;

    // If any field has an error message, prevent form submission
    if (nameError || emailError || contactNumberError || paymentMethodError) {
        return false; // Prevent form submission
    }

    return true; // Allow form submission
}


function chkName(event){
    var myName = event.currentTarget;
    var pos = myName.value.search(/^[A-Z]+[a-z]+$/);
    var nameError = document.getElementById("nameError");

    if (pos != 0){
        nameError.textContent = "Invalid name, name should start with a capital letter e.g. John";
    }
    else {
        nameError.textContent = "";
    }
}

function chkEmail(event){
    var myEmail = event.currentTarget;
    var pos = myEmail.value.search(/^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,3}$/);
    var emailError = document.getElementById("emailError");

    if (pos != 0){
        emailError.textContent = "Invalid email, email should be in the form abc@xyz.com";
    }
    else {
        emailError.textContent = "";
    }
}

function chkContactNumber(event){
    var myContact = event.currentTarget.value;
    var pos = myContact.value.search(/^[\d]{8}$/);
    var contactNumberError = document.getElementById("contactNumberError");
    
    if (pos != 0){
        contactNumberError.textContent = "Invalid contact number, contact number should be 8 digits long.";
    }
    else {
        contactNumberError.textContent = "";
    }
}

function chkPaymentMethod(event) {
    var paymentMethodElements = document.getElementsByName("payment-method");
    var paymentMethodError = document.getElementById("paymentMethodError");
    var isSelected = false;

    // Check if any radio button is checked
    for (var i = 0; i < paymentMethodElements.length; i++) {
        if (paymentMethodElements[i].checked) {
            isSelected = true;
            break;
        }
    }

    // Display error message if no radio button is selected
    if (!isSelected) {
        paymentMethodError.textContent = "Please select a payment method.";
    } else {
        paymentMethodError.textContent = "";
    }
}
