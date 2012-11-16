function randomColorShade() {
	var contrast = "any";
	var ranges = structNew();
	var redColor = "";
	var greenColor = "";
	var blueColor = "";
	
	ranges.any = "0,255";
	ranges.dark= "0,119";
	ranges.exdark = "0,51";
	ranges.light = "136,255";
	ranges.exlight = "204,255";
	
	if(arrayLen(arguments) gte 1) contrast = arguments[1];	
	
	redColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	greenColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	blueColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;
	
	return "##" & redColor & greenColor & blueColor;
}