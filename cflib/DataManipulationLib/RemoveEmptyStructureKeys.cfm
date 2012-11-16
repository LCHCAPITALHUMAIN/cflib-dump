function removeEmptyStructureKeys(structure) {
	var newStructure = structNew();
	var keys = structKeyList(arguments.structure);
	var name = "";
	var i = 1;
	for (;i lte listLen(keys);i=i+1) {
		name = listGetAt(keys,i);
		if (not isSimpleValue(arguments.structure[name])) {
			newStructure[name] = arguments.structure[name];
		}
		else if (arguments.structure[name] neq "") {
			newStructure[name] = arguments.structure[name];
		}
	}
	return newStructure;
}