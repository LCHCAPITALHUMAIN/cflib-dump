function param(scope, varname) {
	var value = "";
	
	if(arrayLen(arguments) gt 2) {
		value = arguments[3];
	}
	
	if(NOT structKeyExists(arguments.scope, arguments.varname) ) {
		arguments.scope[arguments.varname] = value;
	}
	
	return arguments.scope[arguments.varname];
}