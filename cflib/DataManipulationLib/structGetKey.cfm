function structGetKey(theStruct, theKey, defaultVal){
	if (structKeyExists(arguments.theStruct, arguments.theKey)){
		return arguments.theStruct[arguments.theKey];
	}else{
		return arguments.defaultVal;
	}
}