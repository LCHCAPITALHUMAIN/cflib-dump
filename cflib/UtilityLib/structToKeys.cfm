array function structToKeys(required struct struct, string parent=""){
	var result = [];
	for (var key in struct){
		var thisPath = listAppend(parent, key, ".");
		arrayAppend(result, thisPath);
		if (isStruct(struct[key])){
			result.addAll(structToKeys(struct[key], thisPath));
		}
	}
	return result;
}