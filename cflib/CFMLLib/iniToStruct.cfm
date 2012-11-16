public struct function iniToStruct(array iniFiles) {
	var config = {};
	for (local.f IN iniFiles) {
		local.inifile = fileExists(f) ? f : expandPath(f);
		local.sections = getProfileSections(local.iniFile); 
		for (local.k IN sections) {
			for (local.v IN listToArray(sections[k])) {
				config[k][v] = getProfileString(local.iniFile,k,v);
			}
		}
	}
	return config;
}