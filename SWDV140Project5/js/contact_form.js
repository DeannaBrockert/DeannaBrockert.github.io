/*********************************************************************

*Original Author: Deanna Brockert                                   
*Date Created: 1/18/21                                      
*Version:                                                
*Date Last Modified: 1/31/21                             
*Modified by: Deanna Brockert                                         
*Modification log:   
    
    1/28/21: Added code for contact form
    1/29/21: Edited code for contact in attempts to make it work
    1/30/21: Continued to work on contact section 
    1/31/21: Continued to work on code for contact section
    2/17/21: Changed calling function for contact form. Changed name from contactform_script to contact_form. 

******************************************************************** */


"use strict";

//contact form


document.addEventListener("DOMContentLoaded", () => {

    $("#send_message").addEventListener("click", () => {

    const contact_Name = $("#contact_name");
    const contact_Email = $("#contact_email");
    const contact_Phone = $("#contact_phone");
    const contact_Message = $("#contact_message");

    //const emailPattern = /^[\w\.\-]+@[\w\.\-]+\.[a-zA-Z]+$/;
    //const phonePattern = /^\d{3}-\d{3}-\d{4}$/;

    let isValid = true;

    if (contact_Name.value == "") {
       alert("Please enter your name.");
       isValid = false;
    }

    if (contact_Email.value == "") {
        alert("Please enter a valid email address.");
        isValid = false;
    }

    if (contact_Phone.value == "") {
       alert("Please enter a phone number.");
       isValid = false;
    }

    if (contact_Message.value == "") {
        alert("Please enter a message.");
        isValid = false;
    }

    if (isValid) {
        $("#contact_form").submit();
    }
    });
});