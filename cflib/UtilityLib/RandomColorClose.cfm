function randomColorClose(color,closeness) {
	var redColor = "";
	var greenColor = "";
	var blueColor = "";

	redColor = InputBaseN(Mid(color,1,2),16);
	greenColor = InputBaseN(Mid(color,3,2),16);
	blueColor = InputBaseN(Mid(color,5,2),16);

	// randomize and format back to base 16. min and max functions ensure characters don't leave base 16 size.
	redColor = FormatBaseN(Min(255,Max(0,RandRange(redColor-closeness,redColor+closeness))),16);
	greenColor = FormatBaseN(Min(255,Max(0,RandRange(greenColor-closeness,greenColor+closeness))),16);
	blueColor = FormatBaseN(Min(255,Max(0,RandRange(blueColor-closeness,blueColor+closeness))),16);

	// fix formatting
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}