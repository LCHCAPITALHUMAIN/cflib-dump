function IsSQLInject(input) {
	/*
	* The SQL-injection strings were used at the suggestion of Chris Anley [chris@ngssoftware.com]
	* in his paper "Advanced SQL Injection In SQL Server Applications" available for downloat at
	* http://www.ngssoftware.com/
	*/
	var listSQLInject = "select,insert,update,delete,drop,--,'";
	var arraySQLInject = ListToArray(listSQLInject);
	var i = 1;
	
	for(i=1; i lte arrayLen(arraySQLInject); i=i+1) {
		if(findNoCase(arraySQLInject[i], input)) return true;
	}
	
	return false;
}