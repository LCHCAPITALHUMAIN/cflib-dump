function nextN(count,numToDisplay,href) {
	var totalRecords = count; // query recordcount
	var NsListLength = ceiling(totalRecords / numToDisplay); // this will give us the number of pages needed to display the full record set
	var NextStartList = ""; // list of start numbers
	var nextStart=1; // where to start outputting record
	var content = "";
	var i = 1;
	var startMarker = "nextStart"; // name of the url var to create
	
	if(arrayLen(arguments) gte 4) startMarker = arguments[4];
	
	for ( i = 1; i lte NsListLength; i = i + 1 ) {
		NextStartlist = listAppend(NextStartlist,nextStart); 
		// this will be the next start number in our list
		nextStart = nextStart + numToDisplay;
	}

	//output the links
	if (len(NextStartList) gt 1) {
		content = "Page ";
		for (i = 1; i lte listlen(NextStartList);  i = i + 1) {
			if(isDefined("url.#startMarker#") and url[startMarker] is listGetAt(NextStartList,i)) content = content & i;
			else content = content & " <a href=""" & href & "&#startMarker#=" & listGetAt(NextStartList,i) & """>" & i & "</a> ";
		} 
	}

	return content;
}