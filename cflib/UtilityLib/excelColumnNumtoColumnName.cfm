function excelColumnNumtoColumnName(columnNumber){
	var dividend = fix(arguments.columnNumber); //make sure input is an integer
	var columnName = '';
	var modulo = 0;
	//if dividend <= 0, an empty string will be returned
	while (dividend gt 0){
		modulo = (dividend - 1) mod 26;
		columnName = "#chr(65 + modulo)##columnName#";
		dividend = fix((dividend - modulo) / 26);
	}
	return columnName;
}