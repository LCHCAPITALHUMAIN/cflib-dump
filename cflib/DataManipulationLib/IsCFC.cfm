function IsCFC(objectToCheck){
	//get the meta data of the object we're inspecting
	var metaData = getMetaData(arguments.objectToCheck);
	//if it's an object, let's try getting the meta Data
	if(isObject(arguments.objectToCheck)){
		//if it has a type, and that type is "component", then it's a component
		if(structKeyExists(metaData,"type") AND metaData.type is "component"){
			return true;
		}
	}	
	//if we've gotten here, it must not have been a contentObject			
	return false;		
}