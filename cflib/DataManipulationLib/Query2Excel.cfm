function Query2Excel(query) {
	var InputColumnList = query.columnList;
	var Headers = query.columnList;

	var AlternateColor = "FFFFFF";
	var header = "";
	var headerLen = 0;
	var col = "";
	var colValue = "";
	var colLen = 0;
	var i = 1;
	var j = 1;
	var k = 1;
	
	var HTMLData = "";
	
	if (arrayLen(arguments) gte 2) {
		Headers = arguments[2];
	}
	if (arrayLen(arguments) gte 3) {
		InputColumnList = arguments[3];
	}

	if (arrayLen(arguments) gte 4) {
		AlternateColor = arguments[4];
	}
	if (listLen(InputColumnList) neq listLen(Headers)) {
		return "Input Column list and Header list are not of equal length";
	}
	
	HTMLData = HTMLData & "<table border=1><tr bgcolor=""C0C0C0"">";
	for (i=1;i lte ListLen(Headers);i=i+1){
		header=listGetAt(Headers,i);
		headerLen=Len(header)*10;
		HTMLData = HTMLData & "<th width=""#headerLen#""><b>#header#</b></th>";
	}
	HTMLData = HTMLData & "</tr>";
	for (j=1;j lte query.recordcount;j=j+1){
		if (j mod 2) {
			HTMLData = HTMLData & "<tr bgcolor=""FFFFFF"">";
		} else {
			HTMLData = HTMLData & "<tr bgcolor=""#alternatecolor#"">";
		}
		for (k=1;k lte ListLen(InputColumnList);k=k+1) {
			col=ListGetAt(InputColumnList,k);
			colValue=query[trim(col)][j];
			colLength=Len(colValue)*10;
			if (NOT Len(colValue)) {
				colValue="&nbsp;";
			} 
			if (isNumeric(colValue) and Len(colValue) gt 10) {
				colValue="'#colValue#";
			} 
			HTMLData = HTMLData & "<td width=""#colLength#"">#colValue#</td>";
		}
	HTMLData = HTMLData & "</tr>";
	}
	HTMLData = HTMLData & "</table>";
	
	return HTMLData;
}