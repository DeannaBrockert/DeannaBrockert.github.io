"use strict";

const avgScore = scores => {
    const total = scores.reduce( (tot , val) => tot + val , 0);
    const avg = total/scores.length;
    return avg.toFixed(2);
};

const getScores = scores => {
    let last3Scores = [];
    const len = scores.length;
    last3Scores = (len <= 3) ? scores.slice() : scores.slice(len - 3, len);
    last3Scores.reverse();
    return last3Scores;
};

const display = scores => {
    $("#all").text(scores.join(", "));
    $("#avg").text(avgScore(scores));
    $("#last").text(last3Scores(scores).join(", "));
}

$(document).ready( () => {

    const scores = [];

    $("#add_score").click( () => {
        
        const score = parseFloat($("#score").val());
                
        if (isNaN(score) || score < 0 || score > 100) {
            $("#add_score").next().text("Score must be between 0 and 100."); 
            // $("#message").text("Score must be between 1 and 100.");
        }
        else {
            $("#add_score").next().text("");  
            // $("#message").text("");  // remove any previous error message

            // add score to scores array 
            scores.push(score);
            display(scores);
        }
        
        // get text box ready for next entry
        $("#score").val("");
        $("#score").focus(); 
    });

    $("#delete_score").click( () => {

        const index = parseInt($("#index").val());
        if (isNaN(index)) {
            $("#delete_score").next().text("Must be a whole number.");
        } else if (index < 0 || index > scores.length - 1) {
            $("#delete_score").next().text("There is no element with that index.");
        } else {
            $("#delete_score").next().text("");
        
        scores.splice(index, 1);
        display(scores);
        }

        $("#index").val("");
        $("#score").focus();

    }); 

    // set focus on initial load
    $("#score").focus();
});