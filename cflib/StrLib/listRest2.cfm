function ListRest2(orgList) {
	var listDel = ',';
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	if (len(orgList) gt 0) return listDeleteAt(orgList,1,listDel);
	return "";
}