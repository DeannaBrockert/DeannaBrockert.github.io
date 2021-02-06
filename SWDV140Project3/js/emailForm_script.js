/*********************************************************************

*Original Author: Deanna Brockert                                   
*Date Created: 1/18/21                                      
*Version:                                                
*Date Last Modified: 1/31/21                             
*Modified by: Deanna Brockert                                         
*Modification log:   
    
    1/28/21: Added code for faq section. Added code for email sign up and corrected errors.
    1/29/21: Messed with faq section in attempts to make it work. 
    1/30/21: Continued to work on faq section
    1/31/21: Finished faq section

******************************************************************** */


"use strict";




//email sign up
const $ = selector => document.querySelector(selector);

document.addEventListener("DOMContentLoaded", () => {

    $("#join_list").addEventListener("click", () => {

        const email1 = $("#email_1");
        const email2 = $("#email_2");
        const name = $("#name");

        let isValid = true;

        if(email1.value == "") {
            email1.nextElementSibling.textContent = "This field is required.";
            isValid = false;
        } else {
            email1.nextElementSibling.textContent = "";
        }

        if(email2.value == "") {
            email2.nextElementSibling.textContent = "This field is required.";
            isValid = false;
        } else {
            email2.nextElementSibling.textContent = "";
        }

        if (email1.value != email2.value) {
            email2.nextElementSibling.textContent = "Email addresses must match.";
            isValid = false;
        }

        if(name.value == "") {
            name.nextElementSibling.textContent = "Name is required.";
            isValid = false;
        } else {
            name.nextElementSibling.textContent = "";
        }

        if (isValid) {
            $("#email_form").submit();
        }
    });

    $("#clear").addEventListener("click", () => {
        $("#email_1").value = "";
        $("#email_2").value = "";
        $("#name").value = "";

        $("#email_1").focus();
    });

});


