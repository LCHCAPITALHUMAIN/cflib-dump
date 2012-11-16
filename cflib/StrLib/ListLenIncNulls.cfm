function listLenIncNulls(list) {
	var delimiter = ",";
	if(arrayLen(Arguments) GT 1) delimiter = left(arguments[3],1);
	return val(len(list) - len(replace(list,delimiter,"","ALL")) + 1);
}