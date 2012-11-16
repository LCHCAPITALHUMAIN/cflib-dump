function splitList(orgList) {
	var ret = structNew();
	var listDel = ",";
	var i = 0;
	var listLen = "";
	var midPoint = "";
	
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	
	listLength = listLen(orgList,listDel);
	midPoint = round(listLength/2);

	ret.part1 = "";
	ret.part2 = orgList;

	for (i=1;i lte midPoint;i=i+1) ret.part2 = ListDeleteAt(ret.part2,1, listDel);
	if (listLength gt 0) ret.part1 = left(arguments.orgList,len(arguments.orgList) - Len(ret.part2));
	
	if(right(ret.part1,1) is listDel) ret.part1 = left(ret.part1, len(ret.part1)-1);
	return ret;
}