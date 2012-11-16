function getOccurrenceCount(content, countThis) {
	var countThisDelimiter = ','; 
	var countThisLen = 1; 
	var countThisItem = ';
	var returnCount = ';
	var i = 1;
	
	if(arrayLen(Arguments) GT 2) countThisDelimiter = Left(arguments[3],1);
	countThisLen = ListLen(countThis, countThisDelimiter);
	
	if(countThisLen GT 1) {
		for(i=1; i LTE countThisLen; i=i+1){
			countThisItem = listGetAt(countThis, i, countThisDelimiter);
			returnCount = ListAppend(returnCount, val(len(content) - len(replace(content,countThisItem,"","all")))/Len(countThisItem));
		}
	}
	else{
		returnCount = val(len(content) - len(replace(content,countThis,"","all")))/Len(countThis);
	}
	return returnCount;
}