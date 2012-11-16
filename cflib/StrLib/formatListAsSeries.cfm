function formatListAsSeries(theList) {
    var lastEle = "";
    var isSet = false;
    var fList = "";
    var currEle = "";
    var idx = 0;
	
	theList = listSort(theList, "numeric", "asc");
	
	for ( idx = 1; idx LTE ListLen(theList); idx = idx + 1 ) {
		currEle = ListGetAt(theList, idx);
		
		if ( Len(lastEle) EQ 0 ) {
			fList = fList & currEle;
			lastEle = currEle;
			isSet = false;
		} else if ( lastEle EQ currEle ) {
			//do nothing
		} else if ( lastEle + 1 NEQ currEle ) {
			if ( isSet ) {
				fList = fList & lastEle;
			}
			fList = fList & ", " & currEle;
			lastEle = currEle;
			isSet = false;
		} else {
		if ( NOT isSet ) {
			fList = fList & "-";
		}
		lastEle = currEle;
		isSet = true;
		}
	}

	if ( isSet ) {
		fList = fList & lastEle;
	}

	return fList;
}