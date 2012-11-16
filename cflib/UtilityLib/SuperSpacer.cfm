function ss() {	
	var height	= 1;
	var width	= 1;
	var border	= 0;
	var srcURL	= "s.gif";
	var alt		= "";
	var outString = "";
	if(arrayLen(arguments) gte 1) height = arguments[1];
	if(arrayLen(arguments) gte 2) width  = arguments[2];
	if(arrayLen(arguments) gte 3) border = arguments[3];
	if(arrayLen(arguments) gte 4) srcURL = arguments[4];
	if(arrayLen(arguments) gte 5) alt    = arguments[5];
	outString = "<img src=""#srcURL#"" height=""#height#"" width=""#width#"" alt=""#alt#"" border=""#border#"">";
	return outString;
}