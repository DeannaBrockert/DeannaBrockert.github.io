"use strict";

$(document).ready( () => {

    $("#add_task").click( () => {   
        const textbox = $("#task");
        const task = textbox.val();
        if (task === "") {
            alert("Please enter a task.");
            textbox.focus();
        } else {
            // add task to web storage 
            let tasks = localStorage.E14tasks || "";  // "" is default
            localStorage.E14tasks = tasks.concat(task, "\n");

            let expirationTime = new Date();
            expirationTime.setDate(expirationTime.getDate() + 21);
            localStorage.expiration = expirationTime.toDateString();

            // clear task text box and re-display tasks
            textbox.val("");
            $("#task_list").val(localStorage.E14tasks);
                 
            textbox.focus();
        }
    });
    
    $("#clear_tasks").click( () => {
        localStorage.removeItem("E14tasks");
        $("#task_list").val("");
        $("#task").focus();
    }); 
    
    // display tasks on initial load
    //$("#task_list").val(localStorage.E14tasks);
   const expire = new Date(localStorage.expiration);
   const today = new Date();
   if (expire.getTime() < today.getTime()) {
       localStorage.removeItem("E14tasks");
       localStorage.removeItem("expiration");
   } else {
       $("#task_list").val(localStorage.E14tasks);
   }
   
    $("#task").focus();
});