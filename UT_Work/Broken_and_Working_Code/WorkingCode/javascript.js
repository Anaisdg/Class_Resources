// When the boxGrow button is clicked... 
$("#button1").on("click", function() {
	// Increase the size of the box.
	$("#text/javascript").animate({height:"+=300px", width:"+=300px"}, "fast");
})

// When the textGreen button is pressed...
$("#textGreen").on("click", function() {
	// Change funText to green.
	$("#funText").css("color", "green")
})