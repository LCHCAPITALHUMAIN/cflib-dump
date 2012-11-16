function getProfile(iniFile) {
	var sections = getProfileSections(iniFile);
	var sectionName = "";
	var retProfile = structNew();
	var i = "";
	var entry = "";
	
	for (sectionName in sections) {
		retProfile[sectionName] = structNew();
		for (i=1;i LTE listLen(sections[sectionName]);i=i+1) {
			entry = listGetAt(sections[sectionName],i);
			retProfile[sectionName][entry]=getProfileString(iniFile,sectionName,entry);
		}
	}
	return retProfile;		
}