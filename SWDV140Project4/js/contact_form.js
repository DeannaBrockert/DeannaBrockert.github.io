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
    2/18/21: Attempt to add regex but was unable to get it to work. 
    2/19/21: Continued to work on regex.

*********************************************************************/


"use strict";

//contact form


document.ready( () => {

    $("#send_message").click( evt => {

    let isValid = true;


    //validate name
		const contact_Name = $("#contact_name").val().trim();
		if (contact_Name == "") {
			$("#contact_name").next().text("This field is required.");
		} else {
			$("#contact_name").next().text("");
		}
		$("#contact_name").val(contact_Name);

    //validate email
    const emailPattern = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;

    const contact_Email = $("#contact_email").val().trim();
		if (contact_Email == "") {
			$("#contact_email").next().text("This field is required.");
			isValid = false;

		} else if ( !emailPattern.test(contact_Email) ) {
			$("#contact_email").next().text("Must be a valid email address.");
			isValid = false;

		} else {
			$("#contact_email").next().text("");
		}
		$("#contact_email").val(contact_Email);

        //validate phone
        const phonePattern = /^\d{3}-\d{3}-\d{4}$/;

        const contact_Phone = $("#contact_phone").val().trim();
        if(contact_Phone == "") {
            $("#contact_phone").next().text("This field is required.");
            isValid = false;

        }else if ( !phonePattern.test(contact_Phone)) {
            $("#contact_phone").next().text("Enter number in NNN-NNN-NNNN format.");
            isValid = false;

        } else {
            $("#contact_phone").next().text("");
        }
        $("#contact_phone").val(contact_Phone);


    if (isValid == false) {
        evt.preventDefault();
    }
});
});

