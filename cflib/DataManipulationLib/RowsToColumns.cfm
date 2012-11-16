function rowsToColumns(query,maxColumns,actualColumnCountVarName){
	//make an array of the columns in the incoming query for looping
	var columnArray = listToArray(query.columnlist);
	//make a new query to return based on the columns of the incoming query
	var newQuery = queryNew(query.columnlist);
	//figure out how many rows there will be
	var rows = ceiling(query.recordcount/maxColumns);
	//set up a var to count row we are on
	var onRow = 1;
	//set up a var to count the column we are on
	var onColumn = 0;
	//set up a var to hold the row we want to grab
	var getRow = 0;
	//set up a var to index the outer loop
	var ii = 1;
	//set up a var to index the inner loop
	var zz = 1;
	//if there will be extra columns, make sure no more columns than necessary.  this is necessary to ensure that if you ask for more columns than there are records to fill you know how many there really are!!
	if(ceiling(query.recordcount/rows) LT maxColumns)
		maxColumns = ceiling(query.recordcount/rows);
	//starting on row 1, loop through the recordcount of the original query, putting rows in the new query					
	for(ii = 1; ii lte evaluate(rows * maxColumns); ii = ii + 1){
		//increment the column we are now on
		onColumn = onColumn + 1;
		//get the proper row from the original query
		getRow = ((onColumn - 1) * rows) + onRow;
		//now add a row to the newQuery
		queryAddRow(newQuery);
		//loop through the columns, putting the cells into the newQuery
		for(zz = 1; zz lte arraylen(columnArray); zz = zz + 1){
			//if the row we want is lower than than the recordcount, put in the value
			if(getRow LTE query.recordcount)
				querySetCell(newQuery,columnArray[zz],query[columnArray[zz]][getRow]);
			//otherwise, just set it to a blank string
			else
				querySetCell(newQuery,columnArray[zz],"");
		} 
		//if the column we are on is the same as the maxColumns, reset the column we are on and increment the row
		if(onColumn EQ maxColumns){
			onColumn = 0;
			onRow = onRow + 1;
		}
	}
	//set the variable for the number of columns!
	setVariable(actualColumnCountVarName,maxColumns);
	//return the new query
	return newQuery;				
}