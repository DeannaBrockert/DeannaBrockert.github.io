/*********************************************************************

*Original Author: Deanna Brockert                                   
*Date Created: 2/26/21                                      
*Version:                                                
*Date Last Modified: 2/26/21                            
*Modified by: Deanna Brockert                                         
*Modification log:   
    
    2/26/21: Added script to submit Contact form. 

*********************************************************************/

"use strict";


document.addEventListener("DOMContentLoaded", () => {

    $("#send_message").addEventListener("click", () => {

    //const contact_Name = $("#contact_name");
    const contact_Email = $("#contact_email");
    const contact_Phone = $("#contact_phone");
    //const contact_Message = $("#contact_message");

    //const emailPattern = /^[\w\.\-]+@[\w\.\-]+\.[a-zA-Z]+$/;
    //const phonePattern = /^\d{3}-\d{3}-\d{4}$/;

    let isValid = true;

    if (contact_Email.value == "") {
        $("#contact_email").next().text("Please enter a valid email address.");
        isValid = false;
    }

    if (contact_Phone.value == "") {
       alert("Please enter a phone number.");
       isValid = false;
    }

    if (isValid) {
        $("#contact_form").submit();
    }
    });
});