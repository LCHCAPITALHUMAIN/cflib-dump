function isCFCType(objectToCheck,type){
	//get the meta data of the object we're inspecting (we use duplicate so we don't mess with the instance)
	var metaData = getMetaData(arguments.objectToCheck);
	//are we going to check for a full name, or just the end?
	var checkFullName = true;
	//which component are we checking? (used to allow traversing the "extends" for extended components)
	var metaToCheck = metaData;
	//which name shall we check?
	var nameToCheck = metaData.name;
	//if the arguments.type has no periods, don't check the full name
	if(listLen(arguments.type,".") LTE 1)
		checkFullName = false;
	//allow a third argument to force the checkFullName
	if(structCount(arguments) GT 2)
		checkFullName = arguments[3];
	//if it's an object, see if it's the right kind of component
	if(isObject(arguments.objectToCheck)){
		//if it has a type, and that type is "component", then it's a component, so we then look at the type
		if(structKeyExists(metaData,"type") AND metaData.type is "component"){	
			//do a while loop to be sure we see if this component extends the type we want
			while(structKeyExists(metaToCheck,"extends")){
				//if we are not checking the full name, then take only the last element in the full name
				if(NOT checkFullName)
					nameToCheck = listLast(metaToCheck.name,".");
				else
					nameToCheck = metaToCheck.name;
				//if the name of the component we're looking at is the type we're looking for, return true
				if(nameToCheck is arguments.type)
					return true;
				//set this to the extends of the current component to traverse the meta data tree	
				metaToCheck = metaToCheck.extends;	
			}
		}
	}	
	//if we've gotten here, it must not have been a the right kind of object
	return false;		
}