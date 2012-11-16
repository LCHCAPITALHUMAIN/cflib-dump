function cfparam(varname) {
	var value = "";
	
	if(arrayLen(Arguments) gt 1) value = Arguments[2];
	if(not isDefined(varname)) setVariable(varname,value);
        return evaluate(varname);
}