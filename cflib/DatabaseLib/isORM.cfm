function isORM(item) {
	var metaItem = {};
	try {
		if(isArray(arguments.item) && arrayLen(arguments.item)){
			metaItem = getMetadata(arguments.item[1]);
		} else {
			metaItem = getMetadata(arguments.item);
		}
		if(structKeyExists(metaItem,'persistent') && metaItem.persistent){
			return true;
		} else {
			return false;
		}
	} catch(any e) {
		return false;
	}
}