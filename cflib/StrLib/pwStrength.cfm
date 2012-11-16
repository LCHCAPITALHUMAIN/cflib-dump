function pwStrength(pwString) {
	var retStruct = structNew();

	retStruct.originalString	= arguments.pwString;
	retStruct.originalLength	= len(arguments.pwString);
	retStruct.numericVals		= len(rereplace(pwString, '[^0-9]', '', 'all'));
	retStruct.alphas			= len(rereplaceNoCase(pwString, '[^a-z]', '', 'all'));
	retStruct.alphaUppers		= len(rereplace(pwString, '[^A-Z]', '', 'all'));
	retStruct.alphaLowers		= len(rereplace(pwString, '[^a-z]', '', 'all'));
	retStruct.badChars			= len(rereplace(pwString, '[\w]', '', 'all'));
	
	return retStruct;
}