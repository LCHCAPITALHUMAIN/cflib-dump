function QueryReverse (qryOriginal) {
	
  // Reverse the order of qryOriginal
  // Make a new query using the same columns as qryOriginal
  var qryNew = QueryNew(qryOriginal.ColumnList);
  var row = 1;
  var column = 1;
  //Loop through qryOriginal in reverse order (last becomes first)
  for(row=qryOriginal.recordCount;row gte 1; row=row-1) {
    //Add a new row in the new query
    QueryAddRow(qryNew,1);
    //Get the values for each column in qryOriginal
    for(column=1;column lte ListLen(qryOriginal.ColumnList);column=column+1) {
      QuerySetCell(qryNew, ListGetAt(qryOriginal.ColumnList,column), qryOriginal[ListGetAt(qryOriginal.ColumnList,column)][row]);
    }
  }
  
  return qryNew;
  
}