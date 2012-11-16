function QueryStringChangeVar(variable,value){
	//var to hold the final string
	var string = "";
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var ii = 1;
	var thisVar = "";
	var thisIndex = "";
	var array = "";
	var changedIt = 0;
	//if there is a third argument, use that as the query string, otherwise default to cgi.query_string
	var qs = cgi.query_string;
	if(arrayLen(arguments) GT 2)
		qs = arguments[3];

	//put the query string into an array for easier looping
	array = listToArray(qs,"&");
	//now, loop over the array and rebuild the string
	for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
		thisIndex = array[ii];
		thisVar = listFirst(thisIndex,"=");
		//if this is the var, edit it to the value, otherwise, just append
		if(thisVar is variable){
			string = listAppend(string,thisVar & "=" & value,"&");
			changedIt = 1;
		}
		else{
			string = listAppend(string,thisIndex,"&");
		}
	}
	//if it was not changed, add it!
	if(NOT changedIt)
		string = listAppend(string,variable & "=" & value,"&");
	//return the string
	return string;
}