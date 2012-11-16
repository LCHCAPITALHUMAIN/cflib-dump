function excelColumnNameToColumnNumber( columnNamePassedIn ) {
	var columnName = UCase( Trim( arguments.columnNamePassedIn ) ); // clean up our data a bit to make some ASCII math easier...
	var colLength  = Len( Trim( columnName ) );
	var cur_Char   = "";
	var index      = colLength;
	var columnNumber = 0;
	var expBase    = 26;
	var digitPlaceHolder = 0;
	var subTotal   = 0;

	while( index gt 0 )
	{
		cur_Char     = Mid( columnName, index, 1 );
		columnNumber = ( ( Asc( cur_Char ) - 64 ) * ( expBase ^ digitPlaceHolder ) );
		subTotal    += columnNumber;

		index--;		
		digitPlaceHolder++;
	}

	return subTotal;
}