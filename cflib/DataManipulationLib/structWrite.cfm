function structWrite(structure, key, value) {
	var valueWritten = false;
	var allowOverwrite = false;
		
	if(arrayLen(arguments) gte 4) allowOverwrite = arguments[4];

	if ( structKeyExists( structure, key ) IMP allowOverwrite ) {
		valueWritten = structInsert( structure, key, value, allowOverwrite );
	}
	return yesNoFormat(valueWritten);
}