function getProfileStringUTF8(iniPath, section, entry) {
	var iniFile		= "";
	var line		= "";
	var inSection	= false;

	section		= "[#section#]";
	
	try {
		iniFile = fileOpen(iniPath, "read", "UTF-8");
		line	= "";
		
		// scan the file for the section
		while (!fileIsEOF(iniFile)) {
			line = FileReadLine(iniFile);

			// keep track if we've found the correct section
			if (line == section){
				inSection = true;
				continue;
			}
			
			// if we're in the correct section and we find a match, we're done: return its value
			if (inSection && listFirst(line, "=") == entry){
				return listRest(line, "=");
			}
			
			// if we get to another section, then we didn't find the match: exit
			if (inSection && reFind("^\s*\[[^\]]+\]", line)){
				return "";
			}
		}
	}
	catch (any e){
		rethrow;
	}
	finally {
		fileClose(iniFile);
	}
	// we got to the end of the file and didn't find it
	return "";
}