function queryToVars(q){
	//first, an array of the column names for looping
	var cols = listToArray(q.columnList);
	//a var to use as iterator
	var ii = 1;
	//by default, use no scope
	var scope = "";
	//by default, use the first row
	var row = 1;
	//if there is a second argument, use that as the scope
	if(arrayLen(arguments) GT 1)
		scope = arguments[2] & ".";
	//if there is a third argument and it is numeric, use that as the row (make sure it is a positive integer)
	if(arrayLen(arguments) GT 2 and isNumeric(arguments[3]))
		row = ceiling(abs(arguments[3]));		
	//loop over the columns, making a variables for each one
	for(ii = 1; ii lte arrayLen(cols); ii = ii + 1)
		setVariable(scope & cols[ii],q[cols[ii]][row]);
	//return nothing
	return "";	
}