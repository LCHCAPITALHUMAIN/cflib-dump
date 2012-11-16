function verityClean(input) {
	//Value to return after cleaning
	var cleanText = trim(input);
	// List of special characters to remove
	var reBadChars = "\\|@|#chr(34)#|'|<|>|\(|\)|!|=|\[|\]|\{|\}|\#chr(44)#|`|\#chr(43)#";
	// List of words to watch for
	var arProblemWords = "and,or,not";	
	var x = 1;
	var y = 1;
	var temp = "";
	
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=
	//Turn list into arrays for the loop
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=
	arProblemWords = ListToArray(arProblemWords);	
	
	//=-=-=-=-=-=-=-=-
	// Strip double spaces 
	//=-=-=-=-=-=-=-=-
	cleanText = reReplace(cleanText," {2,}"," ","all");

	//=-=-=-=-=-=-=-=-=-
	// Strip bad characters 
	//=-=-=-=-=-=-=-=-=
	cleanText = reReplace(cleanText,reBadChars," ","all");
	
	//=-=-=-=-=-=-=-=-
	// Clean up sequences of space characters
	//=-=-=-=-=-=-=-=-
	cleanText = reReplace(cleanText,"[[:space:]]+"," ","all");

	//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	// Remove dupes and start/end bad words
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	for (x = 1; x lte arraylen(arProblemWords); x = x + 1) {
	
		//remove dupes
		cleanText = trim(reReplace(cleanText,"(#arProblemWords[x]#[[:space:]]+){2,}","","all"));

		//remove arProblemWord[x] + any of the others
		temp = arProblemWords[x] & "[[:space:]]+(";
		for(y = 1; y lte arrayLen(arProblemWords); y=y+1) {
			if(x neq y) {
				temp = temp & arProblemWords[y] & "[[:space:]]+|";
			}
		}
		//remove last |
		temp = left(temp, len(temp)-1);
		//add closing )
		temp = temp & ")";
		cleanText = trim(reReplace(cleanText,temp,"","all"));
		
		//remove from beginning 
		if(
			findNoCase(arProblemWords[x],cleanText) is 1 and 
			reFind("[[:space:]]+",mid(cleanText,len(arProblemWords[x])+1,1)) and 
			mid(cleanText,1,3) NEQ "not"
		) cleanText = trim(right(cleantext,len(cleantext) - len(arProblemWords[x])));
		
		if(
			findNoCase(arProblemWords[x],cleanText) gt 0 and 
			len(cleanText) eq len(arProblemWords[x])
		) cleanText = "";
		
		//remove from end
        if(
            findNoCase(arProblemWords[x],cleanText) gt 0 and
            findNoCase(arProblemWords[x],cleanText,len(cleanText) - len(arProblemWords[x])) is (len(cleanText) - len(arProblemWords[x]) + 1)
            and
            reFind("[[:space:]]+",mid(cleanText,len(cleanText) - len(arProblemWords[x]),1))
        ) cleanText = trim(left(cleanText, len(cleanText) - len(arProblemWords[x])));					
	}	
	
	// Return the cleaned value
	return cleanText;
}