function MakeSelectList(name, displayList) {
    var outstring = "<select name=""#name#""";
	var defaultSelected = "";
	var valueListSTR = displayList;
	var delimiter = ",";
	var i = 1;

	if(arrayLen(arguments) gt 2) defaultSelected = arguments[3];
	if(arrayLen(arguments) gt 3) valueListSTR = arguments[4];
	if(arrayLen(arguments) gt 4) delimiter = arguments[5];
    if(arrayLen(arguments) gt 5 AND arguments[6]) outstring = outstring & " multiple";
    if(arrayLen(arguments) gt 6) outstring = outstring & " size=#arguments[7]#";
    outstring = outstring & ">";

    for (i=1; i LTE listLen(displayList,delimiter); i=i+1) {
		outstring = outstring & "<option value=""#listGetAt(valueListSTR,i,delimiter)#""";
		if(defaultSelected eq listGetAt(valueListSTR,i,delimiter)) outstring = outstring & " selected";
        outstring = outstring & ">#listGetAt(displayList,i,delimiter)#</option>";
    }

    outstring = outstring & "</select>";
	
    return outstring;
}