function queryConvertForjQGrid( q, page, pageSize ){
	/*
	NOTE: In order for jqGrid to be able to use the result of this function
	you MUST add this to you jqGrid config:
	jsonReader : {
			repeatitems: false, 
			id: "{id}}"
		},
	Where {id} is the unique identifier for each row in the query object.
	*/
	var ret = {};
	var row = {};
	var cols = listToArray( q.columnList );
	var col = "";
	var i = 0;
	var end = arguments.page * arguments.pageSize;
	var start = end - (arguments.pagesize - 1);
	ret[ "total" ] = 0;
	ret[ "page" ] = arguments.page;
	ret[ "records" ] = arguments.q.recordcount;
	if( q.recordCount ){
		ret[ "total" ] = ceiling( arguments.q.recordcount / arguments.pageSize );
	}
	ret["rows"] = [];
	for( i=start; i LTE min(q.recordCount, end); i++ ){
		structClear( row );
		for(col in cols){
			if(isDate( q[ col ][ i ] ) ){
				row[ lcase( col ) ] = dateFormat( q[ col ][ i ], "yyyy-dd-mm" ) & " " & timeFormat( q[ col ][ i ], "HH:mm:ss" );
			}
			else{
				row[ lcase( col )] = q[ col ][ i ];
			}
		}
		arrayAppend( ret[ "rows" ], duplicate( row ) );
	}
	return ret;
}