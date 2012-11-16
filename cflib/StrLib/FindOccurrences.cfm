function FindOccurrences(tString,tsubString){
	if(not len(tString) OR not len(tsubString)) return 0;
	else {
		// delete all occurences of tString
		// and then calculate the number of occurences by comparing string sizes
		return ((len(tString) - len(replaceNoCase(tString, tsubString, "", "ALL"))) / len(tsubString));
	}
}