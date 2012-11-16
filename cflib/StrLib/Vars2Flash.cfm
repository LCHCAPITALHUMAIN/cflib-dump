function vars2Flash(varList,loadVar){
	var i=1;
	var argc = ArrayLen(arguments);
	var outputString="";
        var delim = "";

	if (argc EQ 2) {
		ArrayAppend(arguments,',');
	}
	delim = arguments[3];
	for(i=1;i lte ListLen(varList);i=i+1){
		outputString="#outputString#&#ListGetAt(varList,i,delim)#=#evaluate(ListGetAt(varList,i,delim))#";
	}
	return "#outputstring#&#loadVar#=yes";
}