function randomColor() {
	var redColor = formatBaseN(randRange(0,255),16);
	var greenColor = formatBaseN(randRange(0,255),16);
	var blueColor = formatBaseN(randRange(0,255),16);
	
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}