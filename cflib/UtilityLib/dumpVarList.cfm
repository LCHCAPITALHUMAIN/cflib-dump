function dumpVarList(variable) { 
	
	// ASSIGN THE delim
	var delim="#Chr(13)##Chr(10)#";
	var var2dump=arguments.variable;
	var label = "";
	var newdump="";
	var keyName="";
	var loopcount=0;
	
	if(arrayLen(arguments) gte 2) delim=arguments[2];
	if(arrayLen(arguments) gte 3) label=arguments[3];
	
	// THE VARIABLE IS A SIMPLE VALUE, SO OUTPUT IT
	if(isSimpleValue(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = " & variable & delim);
		else writeOutput(variable & delim);
	} else if(isArray(var2dump)){
		if(label neq "") writeOutput(uCase(label) & " = [Array]" & delim);
		else writeOutput("[Array]" & delim);
		for(loopcount=1; loopcount lte arrayLen(var2dump); loopCount=loopcount+1) {
	 		if(isSimpleValue(var2dump[loopcount])) writeOutput("[" & loopcount & "] = " & var2dump[loopcount] & delim);
			else DumpVarList(var2dump[loopcount],delim,label);
		}
	}
		// THE VARIABLE IS A STRUCT, SO LOOP OVER IT AND OUTPUT ITS KEY VALUES
	else if(isStruct(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = [Struct]" & delim);
		else writeOutput("[Struct]" & delim);
		for(keyName in var2dump) {
			if(isSimpleValue(var2dump[keyName])) {
				if(label neq "") writeOutput(uCase(label) & "." & uCase(keyname) & " = " & var2dump[keyName] & delim);
				else writeOutput(uCase(keyname) & " = " & var2dump[keyName] & delim);
			}
			else dumpVarList(var2dump[keyName],delim,keyname);
		}
	}
		// THE VARIABLE EXISTS, BUT IS NOT A TYPE WE WISH TO DUMP OUT
	else {
		if(label neq "") writeOutput(uCase(label) & " = [Unsupported type]" & delim);
		else writeOutput("[Unsupported type]" & delim);
	}

	return;
}