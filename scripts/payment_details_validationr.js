var nameNode = document.getElementById("name");
var emailNode = document.getElementById("email");
var contactNumberNode = document.getElementById("contact");
var paymentMethodNode = document.getElementById("payment-method")

nameNode.addEventListener("change", chkName, false);
emailNode.addEventListener("change", chkEmail, false);
contactNumberNode.addEventListener("change", chkContactNumber, false);
paymentMethodNode.addEventListener("change",chkPaymentMethod, false);