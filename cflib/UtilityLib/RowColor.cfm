function rowColor(colorList,currentRow) {
	var delimiter=",";
	var rowColor="";
	var colorIndex=1;

	if (ArrayLen(arguments) GT 2) delimiter = arguments[3];
	
	colorIndex=currentRow MOD ListLen(colorList,delimiter) + 1;
	
	rowColor=ListGetAt(colorList,colorIndex,delimiter);
	
	return rowColor;
}