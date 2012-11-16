function structValueList(struct) {
	var delimiter = ",";
	var element = 0;
	var kvName = "";
	var kvValue = "";
	var returnList = "";
		
	if(arrayLen(arguments) gt 1) delimiter = arguments[2];
		
	if (isStruct(struct)) {
		for (; element lt listLen(structKeyList(struct, delimiter)) ; element=element+1) {
			kvName = listGetAt(structKeyList(struct, delimiter), element+1, delimiter);
			kvValue = "";
			if(isSimpleValue(struct[kvName])) kvValue = struct[kvName];
			returnList = listAppend(returnList, kvName & iif(len(trim(kvValue)) gt 0, de("=" & kvValue), de("")));
		}
	}
	
	return returnList;
}