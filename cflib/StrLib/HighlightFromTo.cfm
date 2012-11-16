function HighLightFromTo(str,start, end) {
	var startHi = "<span style=""background-color: yellow;"">";
	var endHi = "</span>";

	if(arrayLen(arguments) gte 4) startHi = arguments[4];
	if(arrayLen(arguments) gte 5) endHi = arguments[5];

	if(start gte (len(str) - 1)) return str;
	if(end gte len(str)) end = len(str);

	str = insert(startHi,str,start-1);
	str = insert(endHi,str,end+len(startHi));
	return str;
}