function getFunctionHint(somefunction){
	if(structKeyExists(somefunction.metadata, "hint")) return deserializeJSON(serializeJSON(somefunction.metadata.hint));
	return "";
}