function queryBeanToQuery(objQueryBean) {
	var qry_return = "";
	var arrColumns = ArrayNew(1);
	var arrRows = arrayNew(1);
	var thisRow = 0;
	var thisCol = 0;
	var numRows = 0;
	var thisVal = "";
	
	if( objQueryBean.getClass() EQ "class coldfusion.xml.rpc.QueryBean" ){
		arrColumns = objQueryBean.getColumnList();
		numCols = arrayLen( arrColumns );
		arrRows = objQueryBean.getData();
		numRows = arrayLen( arrRows );
		// create the return query object
		qry_return = QueryNew( ArrayToList(arrColumns) );
		// loop round each row
		for( thisRow = 1; thisRow LTE numRows; thisRow = thisRow + 1 ){
			QueryAddRow( qry_return );
			// loop round each column
			for( thisCol = 1; thisCol LTE numCols; thisCol = thisCol + 1 ){
				// empty columns seem to give rise to undefined array elements!
				try{
					thisVal = arrRows[thisRow][thisCol];
				} 
				catch(Any e) {
					thisVal = "";
				}
				QuerySetCell( qry_return, arrColumns[thisCol], thisVal );
			}
		}
		return qry_return;
		
	} else return queryNew("");
}