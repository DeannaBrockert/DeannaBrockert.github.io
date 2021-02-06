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

******************************************************************** */


"use strict";

//contact form
const $ = selector => document.querySelector(selector);

const processEntries = () => {
    const contact_Name = $("#contact_name");
    const contact_Email = $("#contact_email");
    const contact_Phone = $("#contact_phone");
    const contact_Message = $("#contact_message");

    let isValid = true;

    if (contact_Name.value == "") {
       contact_Name.placeholder.textContent = "Please enter a name.";
       isValid = false;
    } else {
        contact_Name.nodeValue.textContent = "";
    }

    if (contact_Email.value == "") {
        contact_Email.nodeValue.textContent = "Please enter an email address.";
    } else {
        contact_Email.nodeValue.textContent = "";
    }

    if (contact_Phone.value == "") {
       contact_Phone.nodeValue.textContent = "Please enter a phone number.";
    } else {
        contact_Phone.nodeValue.textContent = "";
    }

    if (contact_Message.value == "") {
        contact_Message.nodeValue.textContent = "Please enter a message.";
    } else {
        contact_Message.nodeValue.textContent = "";
    }

    if (isValid == true) {
        $("form").submit();
    }
};

document.addEventListener("DOMContentLoaded", () => {
    $("#send_messageBTN").addEventListener("click", processEntries);
});