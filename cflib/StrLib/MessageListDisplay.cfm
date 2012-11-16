function MessageListDisplay(emData) {
	
	var returnStr = "";
	var beginStr = "<p style=""color : red;"">";
	var endStr = "</p>";
	var s = ArrayNew(1);
	var i = 1;
	
	if (ArrayLen(Arguments) gt 1) {
	
		beginStr = Arguments[2];	
	}
	
	if (ArrayLen(Arguments) gt 2) {
	
		endStr = Arguments[3];	
	}
	
	if (IsArray(emData) and not ArrayIsEmpty(emData)) {

		i = 1;
		while (i lte ArrayLen(emData)) {
			returnStr = returnStr & beginStr & emData[i] & endStr;
			i = i + 1;
			
		}
	} 
	
	if (IsStruct(emData) and not StructIsEmpty(emData)) {

		s = StructKeyArray(emData);
		i = 1;
		while (i lte ArrayLen(s)) {
			returnStr = returnStr & beginStr & StructFind(emData, s[i]) & endStr;
			i = i + 1;
		}
	}
	
	return returnStr;
}