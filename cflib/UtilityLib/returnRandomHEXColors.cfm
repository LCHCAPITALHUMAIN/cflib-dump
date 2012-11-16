function returnRandomHEXColors(numToReturn) {
	var returnList = ""; // define a clear var to return in the end with a list of colors
	var colorTable = "A,B,C,D,E,F,0,1,2,3,4,5,6,7,8,9"; // define all possible characters in hex colors
	var i = "";
	var tRandomColor = "";
	// loop through and generate as many colors as defined by the request
	for (i=1; i LTE val(numToReturn); i=i+1){
		// clear the color list
		tRandomColor = "";
		for(c=1; c lte 6; c=c+1){
			// generate a random (6) character hex code
			tRandomColor = tRandomColor & listGetAt(colorTable, randRange(1, listLen(colorTable)));
		}
		// append it to the list to return in the end
		returnList = listAppend(returnList, tRandomColor);
	
	}
	// return the list of random colors
	return returnList;
}