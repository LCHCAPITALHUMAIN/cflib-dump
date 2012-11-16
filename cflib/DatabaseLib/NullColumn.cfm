function NullColumn(columnValue) {
	var dataType = "alpha";
	
	if(arrayLen(arguments) gte 2) dataType = arguments[2];
	if(trim(columnValue) eq "") return "NULL";
 	else if(dataType is "alpha") return "'" & columnValue & "'";
	else return columnValue;
}