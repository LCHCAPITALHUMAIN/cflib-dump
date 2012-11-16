function GetTabTextFeed(X){
	//Declare all variables used within this UDF
	var Xy = "";//This is an array that holds the lines
	var Xc = "";//this is the count for the number of lines 
 	var Yl = "";//This is a temp holder for the line
	var Yc = "";//This holds the length of the line bieng called
	var Yt = "";//this is an array that holds the line
	var i = 1;
	
	Xy = ArrayNew(1);
	Xc = ListLen(X, chr(10));
	for(i=1;i LTE Xc;i=i+1){
		Yl = ListGetAt(X, i, chr(10));
		//Now I check for missing data 
		Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
	    //I know redundant code but for some reason it does not 
		//catch all the tabs the first time through
	 	Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
		//Now we grab the size of the Line/List
		Yc = ListLen(Yl, chr(9));
		//Set Yt as the array for the line
		Yt = ArrayNew(1);
		for(ix=1;ix LTE Yc;ix=ix+1){
			//load each piece of text into an Array Dimension
			Yt[ix] = ListGetAt(Yl, ix, chr(9));
		}
		//Add the New "Array Line" to the Master Array
		Xy[i] = Yt;
	}
	return Xy;
}