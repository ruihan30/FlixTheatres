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

    // Check if any error messages are present
    const nameError = document.getElementById("nameError").textContent;
    const emailError = document.getElementById("emailError").textContent;
    const contactNumberError = document.getElementById("contactNumberError").textContent;

    // If any field has an error message, prevent form submission
    if (nameError || emailError || contactNumberError) {
        // focus and select depending on which one is wrong
        if (nameError) {
            document.getElementById("name").focus();
            document.getElementById("name").select();
        }
        if (emailError) {
            document.getElementById("email").focus();
            document.getElementById("email").select();
        }
        if (contactNumberError) {
            document.getElementById("contact").focus();
            document.getElementById("contact").select();
        }
        return false; // Prevent form submission
    }

    return true; // Allow form submission
}


function chkName(event){
    var myName = event.currentTarget;
    // allows for first instance of capital + name, followed by >1 instance of space, capital + name
    var pos = myName.value.search(/^(?:[A-Z][a-z]*(?:\s[A-Z][a-z]*)*)?$/);
    var nameError = document.getElementById("nameError");

    if (pos != 0){
        nameError.style.display = "block";
        nameError.textContent = "Invalid name, name should start with a capital letter e.g. John";
    }
    else {
        nameError.textContent = "";
    }
}

function chkEmail(event){
    var myEmail = event.currentTarget;
    // prevent 2 consecutive periods, alphanumerical + special characters (local),
    // alphanumeric + dots, hyphens (domain), ensure domain does not end with period,
    // at least 2 alphabetical for top-level domain
    var pos = myEmail.value.search(/^(?!.*\.{2})[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+(?<!\.)\.[a-zA-Z]{2,}$/);
    var emailError = document.getElementById("emailError");

    if (pos != 0){
        emailError.style.display = "block";
        emailError.textContent = "Invalid email, email should be in the form abc@xyz.com";
    }
    else {
        emailError.textContent = "";
    }
}

function chkContactNumber(event){
    var myContact = event.currentTarget;
    var pos = myContact.value.search(/^[\d]{8}$/);
    var contactNumberError = document.getElementById("contactNumberError");
    
    if (pos != 0){
        contactNumberError.style.display = "block";
        contactNumberError.textContent = "Invalid contact number, contact number should be 8 digits long.";
    }
    else {
        contactNumberError.textContent = "";
    }
}
