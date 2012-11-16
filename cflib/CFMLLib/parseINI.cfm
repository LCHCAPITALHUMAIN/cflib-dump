function parseINI(string codefile) {
	var i = '';
	var codes = structNew();
	local.sections = getProfileSections(arguments.codefile);
	for(local.section IN local.sections){
		codes[local.section] = structNew();
		local.keys = local.sections[local.section];
		for(i=1;i LTE listLen(local.keys);i++){
			codes[local.section][listGetAt(local.keys,i)] = getProfileString(arguments.codefile,local.section,listGetAt(local.keys,i));
		}			
	}
	
	return codes;
}