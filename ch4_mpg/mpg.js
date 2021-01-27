"use strict";

const $ = selector => document.querySelector(selector);

const getRangeErrorMsg = lbl => `${lbl} must be a number greater than zero.`;
const getNumberErrorMsg = lbl => `${lbl} must be a number.`;

const focusAndSelect = selector => {
    const elem = $(selector);
    elem.focus();
    elem.select();
};

const processEntries = () => {
    const miles = parseFloat($("#miles").value);
    const gallons = parseFloat($("#gallons").value);

    //Errors for Miles Driven
    if (isNaN(miles)) {
        alert(getNumberErrorMsg("Miles driven"));
        focusAndSelect("#miles");
    }

    else if (miles <= 0){
        alert(getRangeErrorMsg("Miles driven"));
        focusAndSelect("#miles");
    }  

    //Errors for Gallons Used    
    else if (isNaN(gallons)) {
        alert(getNumberErrorMsg("Gallons of gas used"));
        focusAndSelect("#gallons");
    } 

    else if (gallons <= 0){
        alert(getRangeErrorMsg("Gallons of gas used"));
        focusAndSelect("#gallons");
    }

    //Calculation
    else {
        $("#mpg").value = (miles / gallons).toFixed(2);
    }
};

//Clear Function
const clearBoxes = () => {
    $("#miles").value = "";
    $("#gallons").value = "";
    $("#mpg").value = "";
    $("#miles").focus();
}


document.addEventListener("DOMContentLoaded", () => {
    $("#calculate").addEventListener("click", processEntries);
    $("#clear").addEventListener("click", clearBoxes);
    $("#miles").addEventListener("dbclick", clearBoxes);
    $("#miles").focus();
});